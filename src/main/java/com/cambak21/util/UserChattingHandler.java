package com.cambak21.util;

import java.io.IOException;

import java.util.ArrayList;

import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

import com.cambak21.service.cambakMall.ChattingService;

@Controller
@ServerEndpoint("/userChatting/{member_id}")
public class UserChattingHandler {

	// 유저들 리스트
	static List<User> sessionList = Collections.synchronizedList(new ArrayList<>());

	// 유저 객체
	private class User {
		Session session;
		String key;
	}

	// 유저 본인에게 뿌리기 위한
	// session으로 검색
	/**
	  * @Method Name : getUser
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 세션으로 검색
	  * @param session
	  * @return
	  */
	private static User getUser(Session session) {
		for (User user : sessionList) {
			if (user.session == session) {
				return user;
			}
		}

		return null;
	}

	/**
	  * @Method Name : getUser
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : key로 검색
	  * @param key
	  * @return
	  */
	private static User getUser(String key) {
		for (User user : sessionList) {
			if (user.key.equals(key)) {
				return user;
			}
		}

		return null;
	}

	/**
	  * @Method Name : handleOpen
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 웹소켓 연결 시 실행, User클래스를 이용해 key와 session을 세팅해주고 sessionList에 넣어준다
	  * @param session
	  */
	@OnOpen
	public void handleOpen(Session session, @PathParam("member_id") String member_id) {
		System.out.println("웹 소켓 연결");
		User user = new User();
		user.key = member_id;
		user.session = session;
		sessionList.add(user);

//		handleMsg("conn", user.session);
	}

	/**
	  * @Method Name : handleMsg
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 유저페이지에서 메시지를 보낼 시, admin 웹소켓서버로 메시지 전송
	  * @param msg
	  * @param session
	  */
	@OnMessage
	public void handleMsg(String msg, Session session) {
		User findUser = getUser(session);
		
		if (findUser != null) {
			if(AdminChattingHandler.getSession() != null) {
				System.out.println("널이 아님!");
				try {
					// 운영자한테 메시지 전송
					AdminChattingHandler.sendMsg(findUser.key, msg);
					// 유저 자기자신한테 메시지 전송
					findUser.session.getBasicRemote().sendText(msg);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				System.out.println("널임!");
				try {
					// 유저 자기자신한테 메시지 전송
					findUser.session.getBasicRemote().sendText(msg);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		}
	}

	/**
	  * @Method Name : sendMsg
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : AdminChattingHandler.java에서 사용하기 위한 메서드, key로 검색해 해당 key를 가진 유전 세션으로 메시지 전송
	  * @param msg
	  * @param key
	  */
	public static void sendMsg(String msg, String key) {
		User findUser = getUser(key);

		if (findUser != null) {
			try {
				// 운영자가 보낸 메시지
				findUser.session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	  * @Method Name : handleClose
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 유저가 채팅 종료시 실행되는 메서드, sessionList에서 해당 유저세션을 제거해준다
	  * @param session
	  */
	@OnClose
	public void handleClose(Session session) {
		System.out.println("웹소켓 닫힘");

		User user = getUser(session);

		if (user != null) {
			// 웹소켓이 닫히면 리스트에서 제거
			sessionList.remove(user);
		}

	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}

}

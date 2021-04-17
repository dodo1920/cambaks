package com.cambak21.util;

import java.io.IOException;
import java.util.ArrayList;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/userChatting")
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
	private static User getUser(Session session) {
		for (User user : sessionList) {
			if (user.session == session) {
				return user;
			}
		}

		return null;
	}

	// 운영자한테 보내기 위한
	// key로 검색
	private static User getUser(String key) {
		for (User user : sessionList) {
			if (user.key.equals(key)) {
				return user;
			}
		}

		return null;
	}
	
	
	
	
	

	// 웹 소켓 연결시 호출
	@OnOpen
	public void handleOpen(Session session) {
		System.out.println("웹 소켓 연결");

		User user = new User();
		user.key = UUID.randomUUID().toString();
		user.session = session;
		sessionList.add(user);

		for (User users : sessionList) {
			System.out.println("접속한 유저 key : " + users.key.toString());
			System.out.println("접속한 유자 UUID : " + users.session.toString());
		}
	}

	
	
	
	
	
	
	// 웹소켓 메시지 수신시 호출, admin한테 보냄
	@OnMessage
	public void handleMsg(String msg, Session session) {
		System.out.println("유저가 보낸 메시지 : " + msg);
		User findUser = getUser(session);
		if(findUser != null) {
			AdminChattingHandler.sendMsg(findUser.key, msg);
		}
	}
	
	
	

	// 본인 유저에게 보내기 위한 함수
	public static void sendMsg(String msg, String key) {
		User findUser = getUser(key);
		
		
		if (findUser != null) {
			try {
				findUser.session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 웹 소켓이 닫힐 때 세션 제거
	@OnClose
	public void handleClose(Session session) {
		System.out.println("웹소켓 닫힘");

		// 웹소켓이 닫히면 리스트에서 제거
		sessionList.remove(session);
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}

}

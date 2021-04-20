package com.cambak21.util;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/admingChatting")
public class AdminChattingHandler {

	private static Session admin = null;

	/**
	  * @Method Name : handleOpen
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : admin이 채팅 페이지에 접속했을 시 실행
	  * @param adminSession
	  */
	@OnOpen
	public void handleOpen(Session adminSession) {
		// 운영자 계정이 1개임을 가정
		if (admin != null) {
			try {
				admin.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		admin = adminSession;
	}

	/**
	  * @Method Name : sendMsg
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : UserChattingHandler.java에서 사용하기 위한 메서드
	  * @param key
	  * @param msg
	  */
	public static void sendMsg(String key, String msg) {
		if (admin != null) {
			try {
				// 유저가 보내온 메시지
				admin.getBasicRemote().sendText(msg + ":" + key);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	  * @Method Name : handleMsg
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : admin이 메시지를 보낼 시 실행되는 함수, UserChattingHandler에 있는 sendMsg를 호출해서 유저 세션으로 메시지를 보낸다
	  * @param session
	  * @param msg
	  */
	@OnMessage
	public void handleMsg(Session session, String msg) {
		// 운영자가 메시지를 보낼 때, 유저의 key값과 msg를 보낸다
		String[] split = msg.split(":", 2);
		// 메시지
		String message = split[0];
		// key
		String key = split[1];
		
		System.out.println("어드민, 메시지 : " + message);
		System.out.println("어드민, key : " + key);

		// key와 msg를 보내면 UserChattingHandler에서 key값에 맞는 유저한테 메시지를 전송
		// 일대일 채팅
		UserChattingHandler.sendMsg(message, key);

		try {
			// 운영자 자기자신한테도 msg 내용 보내기
			admin.getBasicRemote().sendText(msg + ":" + key);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@OnClose
	public void handleClose(Session session) {
		System.out.println("웹소켓 닫힘");
		admin = null;
	}

	public static Session getSession() {
		return admin;
	}
}

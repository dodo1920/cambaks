package com.cambak21.util;

import java.io.IOException;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/admingChatting")
public class AdminChattingHandler {
	
	private static Session admin = null;
	
	@OnOpen
	public void handleOpen(Session adminSession) {
		if(admin != null) {
			try {
				admin.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		admin = adminSession;
		
		
	}

	
	
	// 어드민 페이지에 메시지 보내기
	public static void sendMsg(String key, String msg) {
		System.out.println("어드민, 유저가 보낸 메시지 확인 : " + msg);
		System.out.println("어드민, 유저가 보낸 key 확인 : " + key);
		if(admin != null) {
			try {
				admin.getBasicRemote().sendText(msg + ":" + key);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	// 유저 페이지에 메시지 보내기
	@OnMessage
	public static void handleMsg(Session session, String msg) {
		
		String[] split = msg.split(":", 2);
		// 뒤 정보는 메시지
		String message = split[0];
		// 앞은 key 데이터
		String key = split[1];
		// 일반 유저의 key로 탐색후 메시지 전송
		UserChattingHandler.sendMsg(key, message);
		
		System.out.println("운영자가 보낸 메시지 : " + message);
		System.out.println("운영자가 보낸 key : " + key);
	}
	
	
	
	
	

}

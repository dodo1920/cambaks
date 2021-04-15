package com.cambak21.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	
	/**
	  * @Method Name : afterConnectionEstablished
	  * @작성일 : 2021. 4. 14.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 클라이언트가 연결되었을때 실행
	  * @param session : 유저
	  * @throws Exception
	  */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		
		System.out.println("참여자 : " + session.getPrincipal().getName());
	}

	/**
	  * @Method Name : handleTextMessage
	  * @작성일 : 2021. 4. 14.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 ㅅ실행
	  * @param session : 유저
	  * @param message : 메시지
	  * @throws Exception
	  */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("~로부터 ~받음 : " + session.getId() + ", "+ message.getPayload());
	}

	/**
	  * @Method Name : afterConnectionClosed
	  * @작성일 : 2021. 4. 14.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 클라이언트가 연결을 끊었을 때
	  * @param session : 유저
	  * @param status : 
	  * @throws Exception
	  */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("status : " + status.toString());
		System.out.println("status code : " + status.getCode());
		System.out.println("session : " + session.getId());
	}
	
}

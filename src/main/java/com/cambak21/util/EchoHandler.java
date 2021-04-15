package com.cambak21.util;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {

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
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
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
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
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
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
	
	
	
}

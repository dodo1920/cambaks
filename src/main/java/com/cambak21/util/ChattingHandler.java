package com.cambak21.util;

import java.io.IOException;
import java.util.ArrayList;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.bind.annotation.SessionAttribute;

@ServerEndpoint("/chatting/{member_id}")
public class ChattingHandler {

	static List<Session> sessionList = Collections.synchronizedList(new ArrayList<>());

	// 웹 소켓 연결시 호출
	@OnOpen
	public void handleOpen(Session session, @PathParam("member_id") String member_id) {
		System.out.println("웹 소켓 연결");
		sessionList.add(session); // 웹 소켓 연결시 세션리스트에 추가

		System.out.println("로그인한 유저 아이디:" + member_id);

		sendMsg(member_id, session);
	}

	// 웹소켓 메시지 수신시 호출
	@OnMessage
	public void handleMessage(String msg) {
		System.out.println("수신 된메시지 : " + msg.toString());
	}

	// 웹 소켓이 닫힐 때 세션 제거
	@OnClose
	public void handleClose(Session session) {
		System.out.println("웹소켓 닫힘");
		sessionList.remove(session);
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}

	// 메세지 보내기 메서드
	public void sendMsg(String msg, Session session) {
		
		// 세션리스트에게 데이터를 보낸다.
		Iterator<Session> iterator = sessionList.iterator();
		while (iterator.hasNext()) {
			try {
				iterator.next().getBasicRemote().sendText(msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}

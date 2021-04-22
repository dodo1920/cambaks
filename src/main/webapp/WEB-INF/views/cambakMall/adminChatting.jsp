<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 제이쿼리 -->
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	//웹소켓 전역 변수 생성
	let webSocket;
	let member_id = "${param.id}";

	$(document).ready(function() {
		// 웹 소켓 초기화
		webSocketInit();
		
	})

	function webSocketInit() {
		// 해당 주소로 웹소켓 객체 생성
		webSocket = new WebSocket("ws://localhost:8081/admingChatting/" + member_id);

		webSocket.onopen = function(event) {
			socketOpen(event);
		};
		webSocket.onclose = function(event) {
			socketClose(event);
		};
		webSocket.onmessage = function(event) {
			socketMessage(event);
		};
		webSocket.onerror = function(event) {
			socketError(event);
		};
	}

	//웹소켓 연결
	function socketOpen(event) {
		console.log("연결 완료");
		
		$.ajax({
			type : "post",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/isRead/admin/" + member_id, // 서블릿 주소
			success : function(data) {
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}

	//웹소켓 닫힘
	function socketClose(event) {
		// 웹소켓이 닫히면 연결을 재시도함
		webSocketInit();
	}

	//메시지를 보내는 메서드
	function socketMsgSend() {
		// 메시지 포맷
		let msg = $(".chatting-content").val();
		
		// 운영자가 보내는 메시지 DB에 저장
		$.ajax({
			type : "post",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/fromAdmin/" + msg + "/" + member_id, // 서블릿 주소
			success : function(data) {
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});

		// 해당 유저에게 메시지를 보낸다.
		webSocket.send(msg + ":" + member_id);
		
		// 메시지 출력
		$(".msgOutput:last").append("<div class='msgOutput'>"+msg+"</div>");
	}

	//메시지 받는 메서드
	function socketMessage(event) {
		let fromUserData = event.data.split(":");

		// 유저가 보낸 메시지
		let msg = fromUserData[0];

		$(".msgOutput:last").append("<div class='msgOutput'>"+msg+"</div>");

	}

	//웹소켓 에러
	function socketError(event) {
		alert("에러가 발생하였습니다.");
	}

	//웹소켓 종료
	function disconnect() {
		webSocket.close();
	}
	
</script>

<style type="text/css">
.template {
	float: left;
	border: 1px solid black;
}
</style>
<body>

	<div class="msg-wrap">
		<div class="template">
			<input type="text" class="chatting-content"> <input type="button" id="btnSend" value="전송하기" onclick="socketMsgSend()">
			
			<c:forEach var="item" items="${chatting }">
				<div class="msgOutput">${item.chatting_content }</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>
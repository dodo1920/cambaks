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

<!-- 웹소켓 CDN -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<!-- 제이쿼리 -->
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

	let sock = new SockJS("http://localhost:8081/echo");

	sock.onmessage = onMessage;
	sock.onclose = onClose;

	$(document).ready(function() {
		$("#sendBtn").click(function() {
			sendMsg();
		});
		
	});


	function sendMsg() {
		console.log($("#msg").val());

		sock.send($("#msg").val());

		console.log(sock);
	}

	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		let data = msg.data;
		console.log(data);
		$("#messageArea").append(data + "<br/>");
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		console.log("evt : " + evt);
		$("#messageArea").append("연결 끊김");

	}
</script>

</head>
<body>

	<input type="text" id="msg">
	<button id="sendBtn">전송</button>

	<div id="messageArea"></div>
</body>
</html>
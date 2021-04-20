<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>캠박몰 :: 채팅</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="../../resources/mallMain/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/elegant-icons.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/magnific-popup.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../../resources/mallMain/css/style.css"
	type="text/css">

<script src="../../../resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	

	//웹소켓 전역 변수 생성
	let webSocket;
	
	let member_id = "${loginMember.member_id}";

	$(document).ready(function() {
		// 웹 소켓 초기화
		webSocketInit();
		
		$("#main-sidebar").attr("style", "display:block");
		$(".top").attr("style", "display:block");
		$("#btnGoChatting").attr("style", "margin-left: 50px; display:block");
	})

	function webSocketInit() {
		// 해당 주소로 웹소켓 객체 생성
		webSocket = new WebSocket("ws://localhost:8081/userChatting/" + member_id);

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
	}

	//웹소켓 닫힘
	function socketClose(event) {
		console.log("웹소켓이 닫혔습니다.");
		
		// 웹소켓이 닫히면 연결을 재시도함
		webSocketInit();
	}

	//메시지를 보내는 메서드
	function socketMsgSend() {
		// 메시지 포맷
		let msg = $("#msg").val();
		
		// 메시지 DB저장		
		$.ajax({
			type : "post",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/fromUser/" + msg, // 서블릿 주소
			success : function(data) {
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
		
		// 운영자한테 메시지 전송
		webSocket.send(msg)
		
		
	}

	//메시지 받는 메서드
	function socketMessage(event) {
		
		let data = event.data.split("-"); // 메시지를 유저가 보냈는지 어드민이 보냈는지 구분하기위한 ...
		let msg = data[0]; // 메시지 내용
		let who = data[1]; // user Or admin
		
		let output = "";
		if(who == "user") { //css를 다르게 하기위한 ...
			output += '<div class="msgOutput user-msg-wrap">';
			output += '<span class="msg-date">'+new Date().getHours() + ":" + new Date().getMinutes()+'</span>';
			output += '<span class="user-msg">'+msg+'</span></div>';
		} else {
			output += '<div class="msgOutput admin-msg-wrap">';
			output += '<span class="msg-date">'+new Date().getHours() + ":" + new Date().getMinutes()+'</span>';
			output += '<span class="admin-msg">'+msg+'</span></div>';
		}
		
		$(".chatting-content").append(output);
		
		// 채팅하면 스크롤 자동으로 맨밑
		let textBox = $(".chatting-content");
		$(".chatting-content").scrollTop(textBox[0].scrollHeight);
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
.chatting-wrap {
    display: flex;
    justify-content: center;
}

.chatting-container {
    width: 600px;
    margin: 50px 0;
}

.chatting-content {
    overflow: auto;
    max-height: 770px;
    background-color: #9bbbd4;
}
/* 메시지 하나하나 감싸는 부분 */
.msgOutput {
    margin: 10px 0;
}
/* 어드민 메시지 */
span.admin-msg {
    background-color: white;
    border-radius: 5px;
    padding: 5px;
    margin-left: 10px;
}
/* 유저 메시지 */
span.user-msg {
    background-color: #fef01b;
    border-radius: 5px;
    padding: 5px;
    margin-right: 10px;
}
/* 메시지 하나하나 감싸는 부분에서 유저만 */
.user-msg-wrap {
    display: flex;
    justify-content: flex-end;
}
/* 메시지 하나하나 감싸는 부분에서 어드민만 */
.admin-msg-wrap {
    display: flex;
    justify-content: flex-start;
}
/* 메시지 시간 */
span.msg-date {
    padding: 8px;
    font-size: 13px;
    color: dimgrey;
}
/* 메시지 입력창, 버튼 */
.msgText-wrap {
    display: flex;
}
/* input창 */
input.textInput {
    border-radius: 5px;
    border: 1px solid gray;
}
</style>
</head>

<body>
	<%@include file="mallHeader.jsp"%>
	<div class="chatting-wrap">
		<div class="chatting-container">
			<div class="chatting-content">
			<div class="msgOutput"></div>
			<c:forEach var="item" items="${chatting }">
				<c:if test="${item.member_id != 'admin' }">
					<div class="msgOutput user-msg-wrap"><span class="msg-date"><fmt:formatDate value="${item.chatting_date }" pattern="HH:mm" type="DATE" /></span><span class="user-msg">${item.chatting_content }</span></div>
				</c:if>
				<c:if test="${item.member_id == 'admin' }">
					<div class="msgOutput admin-msg-wrap"><span class="admin-msg">${item.chatting_content }</span><span class="msg-date"><fmt:formatDate value="${item.chatting_date }" pattern="HH:mm" type="DATE" /></span></div>
				</c:if>
			</c:forEach>
			</div>
			<div class="msgText-wrap">
   				<input class="textInput" type="text" style="width:85%" placeholder="메시지를 입력해 주세요">
   				<button type="button" id="btnSend" class="btn btn-primary" onclick="socketMsgSend()">전송하기</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//스크롤 자동으로 맨밑
		let textBox = $(".chatting-content");
		$(".chatting-content").scrollTop(textBox[0].scrollHeight);
	</script>
	
	<%@include file="mallFooter.jsp"%>

	<!-- modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" id="modalText"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="piece">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>
	<!-- Js Plugins -->
<script src="../../resources/mallMain/js/jquery-3.3.1.min.js"></script>
<script src="../../resources/mallMain/js/bootstrap.min.js"></script>
<script src="../../resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="../../resources/mallMain/js/jquery-ui.min.js"></script>
<script src="../../resources/mallMain/js/mixitup.min.js"></script>
<script src="../../resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="../../resources/mallMain/js/jquery.slicknav.js"></script>
<script src="../../resources/mallMain/js/owl.carousel.min.js"></script>
<script src="../../resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="../../resources/mallMain/js/main.js"></script>
</body>

</html>
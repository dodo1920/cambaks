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
	//웹소켓 전역 변수 생성
	let webSocket;

	$(document).ready(function() {
		// 웹 소켓 초기화
		webSocketInit();
	})

	function webSocketInit() {
		// 해당 주소로 웹소켓 객체 생성
		webSocket = new WebSocket("ws://localhost:8081/admingChatting");

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
	function socketMsgSend(userKey) {
		// 메시지 포맷
		let msg = "";
		let key = userKey;
		
		$(".userKey").each(function(index, item) {
			// input hidden에 숨겨진 value(key)값 가져오기
			let findKey = $(item).attr("value");
			
			if(userKey == findKey) {
				let classKey = ".text-" + findKey;
				msg = $(classKey).val();
			}
		})

		// 해당 유저에게 메시지를 보낸다.
		webSocket.send(msg + ":" + key);
	}

	//메시지 받는 메서드
	function socketMessage(event) {
		let fromUserData = event.data.split(":");

		// 유저가 보낸 메시지
		let msg = fromUserData[0];

		// 유저 key값
		let key = fromUserData[1];
		
		// 유저가 채팅방에 접속했다면 ...
		if (msg == "conn") {
			let output = '<div class="template">';
			output += '<input type="text" class="text-'+key+'"> <input type="button" id="btnSend" value="전송하기" onclick="socketMsgSend(\''+key+'\')">';
			output += '<div class="msgOutput-'+key+'"></div>';
			output += '<input type="hidden" class="userKey" value="'+key+'">';
			output += '</div>';
			
			$(".msg-wrap").append(output);
		} else {
			// 메시지를 보냈다면...
			$(".userKey").each(function(index, item) {
				let findKey = $(item).attr("value");
				
				if(key == findKey) {
					let msgOutput = "." + "msgOutput-" + findKey; 
					
					//여기 누적으로 수정
					$(msgOutput).text(msg);
				}
			})
		}

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
.template{
	float: left;
	border: 1px solid black;
}
</style>
<body>

	<div class="msg-wrap">

	</div>
	
</body>
</html>
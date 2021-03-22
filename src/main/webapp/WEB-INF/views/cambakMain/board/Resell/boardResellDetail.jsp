<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>Cambark's</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/resources/cambak21/js/skel.min.js"></script>
	<script src="/resources/cambak/21js/skel-panels.min.js"></script>
	<script src="/resources/cambak21/js/init.js"></script>

	<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
	
	<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
	<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
	
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	<style>
		@import url(/resources/cambak21/css/SHWtamplet.css);
		
		.\34 u {
			width : 100%;
			margin : 0px;
		}
		.imageBox{
			display: inline-block;
			width: 230px;
			height:200px;
			margin : 0 40px 0 0;
			float: left;
		}
	</style>
	
	<script>
	
	function showReplyBox() {
		$("#inputReplyBox").show();
	}
	
	function callReplyList() {

		let bno = ${board.resellBoard_no};
		$("#replyBox").empty();
		$.getJSON("/utile/reply/all/" + bno, function(data) {
			let output = "<ul class='list-group'>";
			console.log(data);
			$(data).each(
					function(index, item) {
						output += "<li class='list-group-item'>"
						output += "<div>작성자 : " + item.member_id + "</div>"
						output += "<div>" + item.resellReplyBoard_content + "</div>"
						output += "<div>작성날짜 : "
								+ new Date(item.resellReplyBoard_updateDate).toLocaleString()
								+ "</div>"
						output += "</li>"
						output += '<li class="list-group-item"><span id="' + item.no 
						+ '" onclick="goModify(' + item.resellReplyBoard_no + ')">댓글 수정</span>';
						output += "<span  onclick='godelete(" + item.resellReplyBoard_no + ");' style='margin-left: 20px'>댓글 삭제</span></li>";
						
					})
			output += "</ul>";

			$("#replyBox").html(output);
		});

	}
	$(function() {
		callReplyList();
	});
	function addReply() {
		let member_id = $("#newReplyWriter").val();
		let resellReplyBoard_content = $("#newReplyText").val();
		let resellBoard_no = ${param.no};
		console.log(member_id+" : "+resellReplyBoard_content+" : "+resellBoard_no)
		$.ajax({
			method : "post",
			url : "/utile",
			dataType : "text", // 응답 받는 데이터 타입
			data : JSON.stringify({ // 요청하는 데이터
				resellBoard_no : resellBoard_no,
				member_id : member_id,
				resellReplyBoard_content : resellReplyBoard_content
			}),
			success : function(result) {
				if (result == 'Success') {
					//alert('댓글 등록 완료!');
					callReplyList(); // 댓글 다시 호출
				}
				
			
			}
		});
		
	}
	</script>
</head>

<body>
    <%@include file="../../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">
			
			<!-- 사이드바 템플릿 -->
			<%@include file="../../cambak21BoardAside.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<div class="imageBox"><img class="imageBox" src="/resources/mallMain/img/shop/shop-5.jpg"/></div>
					<div>
						<div>
							<div style="padding-bottom: 14px">
							<div style="margin-bottom: 15px"> <h1 style="font-size: 25px;color: black;">${board.resellBoard_title}</h1></div> 
							<div><span style="font-size: 22px;color: black;">${board.resellBoard_price}원</span></div>
							</div>
							<hr style="margin: 5px;padding: 0;"/>
							<div style="margin-bottom: 15px"><span>좋아요수 :${board.resellBoard_likeCnt}</span><span style="margin-left: 20px">조회수 : ${board.resellBoard_viewCnt}</span></div>
							<div><span style="word-break:normal;margin-bottom: 15px">${board.resellBoard_content	}</span></div>
							<div><span style="margin-bottom: 15px">${board.resellBoard_addr }</span></div>
						</div>
		
						</div style="margin-bottom: 15px">
						<div>
								<button type="button" class="btn btn-success" id="rewriteBoard"
									onclick="location.href='/board/resell/modi?no=${board.resellBoard_no}'">수정하기</button>
								<button type="button" class="btn btn-info" id="deleteBoard"
									onclick="location.href='/board/resell/remove?no=${board.resellBoard_no}'">삭제하기</button>
								<button type="button" class="btn btn-primary"
									onclick="location.href='/board/resell/list?page=${param.page}'">리스트페이지로</button>
								<button type="button" class="btn btn-primary"
									onclick="showReplyBox();">댓글달기</button>
					</div>
					<div id="inputReplyBox"
					style="padding: 15px; border: 1px dotted gray; display: none;">
					
						작성자 : <input type="text" name="replyer" id="newReplyWriter" "/> 
						댓글 입력 : <input type="text" name="replytext" id="newReplyText" />

						<button id="replyAddBtn" onclick="addReply();">ADD Reply</button>
					
					</div>
					<div id="replyBox"
						style="padding: 10px; border-bottom: 1px solid gray;">
						
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

    <%@include file="../../cambak21Footer.jsp"%>
	
</body>

</html>
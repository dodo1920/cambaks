<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Cambark's</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak/21js/skel-panels.min.js"></script>
<script src="/resources/cambak21/js/init.js"></script>

<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />

<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<style>
@import url(/resources/cambak21/css/SHWtamplet.css);
</style>

<script>
	$(document).ready(function() {
		// 말 줄임 ...
		textLimit();

		// 공지사항 롤링
		rolling();

		// 댓글 리스트 출력
		replyList();
	
	});
	
	// 댓글 리스트 ajax 호출
	function replyList() {
		$.ajax({
			type : "get",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/board/cs/reply/all/" + ${board.board_no}, // 서블릿 주소
			success : function(data) {
				listOutput(data);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 댓글 리스트 출력 함수
	function listOutput(data) {
		let output = "";
		let step = 50;
		
		$.each(data, function(index, item) {
			
			if(item.replyBoard_step >= 1) {
				let step = 20 * item.replyBoard_step;
				output += "<li id="+index+" style='margin-left:"+step+"px'>";
			} else {
				output += "<li id="+index+">";
			}
			
			output += "<p class='comment-id'>"+item.member_id+"</p>";
			output += "<p class='comment-content'>"+item.replyBoard_content+"</p>";
			
			let writeDate = new Date(item.replyBoard_writeDate);
			output += "<p>" + date_to_str(writeDate); + "</p>";
			output += "</li>";
	
			$(".detail-bottom-comment").html(output);
	
		});
		
		
	}
	
	// Date format
	function date_to_str(format) {
		var year = format.getFullYear();
		var month = format.getMonth() + 1;
		if (month < 10) month = '0' + month;
		var date = format.getDate();
		if (date < 10) date = '0' + date;
		var hour = format.getHours();
		if (hour < 10) hour = '0' + hour;
		var min = format.getMinutes();
		if (min < 10) min = '0' + min;
		var sec = format.getSeconds();
		if (sec < 10) sec = '0' + sec;

		return year + "-" + month + "-" + date + " " + hour + ":" + min + ":" + sec;
	};

	
</script>
</head>

<body>
	<%@include file="cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- 사이드바 템플릿 -->
				<%@include file="cambak21Aside2.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>고객센터</h2>
							<span class="byline" id="rollNot"><a href="#">공지가 들어갈
									자리입니다.</a></span>
						</header>
						<!-- 검색창, 글쓰기 버튼 템플릿 -->
						<%@include file="cambak21Search&Write.jsp"%>
					</section>

					<!-- 컨텐츠 시작 -->
					<div class="detail-wrap">
						<div class="detail-top">
							<div class="detail-top-title">
								<p>${board.board_title }</p>
								<p>
									<fmt:formatDate value="${board.board_writeDate }"
										pattern="yyyy-MM-dd HH:mm:ss" type="DATE" />
								</p>
							</div>
							<div class="detail-top-author">
								<p>${board.member_id }</p>
								<p class="view">
									조회수 <span>${board.board_viewCnt }</span>
								</p>
								<p class="like">
									추천수 <span>${board.board_likeCnt }</span>
								</p>
								<p class="reply">
									댓글 <span>${board.replyCnt }</span>
								</p>
							</div>
						</div>
						<div class="detail-content">${board.board_content }</div>
						<div class="recommend-btn">
							<button type="button" class="btn btn-danger">추천</button>
						</div>
						<div class="detail-bottom-comment-write">
							<p>댓글 작성</p>
							<!-- 댓글 작성 Ajax -->
							<div class="form-group">
								<input type="text" class="form-control" placeholder="댓글을 입력해주세요">
								<button type="button" class="btn btn-success" onclick="">댓글
									작성</button>
							</div>
						</div>
						<div class="detail-bottom">
							<div class="detail-bottom-comment-wrap">
								<ul class="detail-bottom-comment">
								</ul>
							</div>

						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
	<!-- /Main -->

	<%@include file="cambak21Footer.jsp"%>
</body>

</html>
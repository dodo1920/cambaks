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
	});
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
								<p><fmt:formatDate value="${board.board_writeDate }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></p>
							</div>
							<div class="detail-top-author">
								<p>${board.member_id }</p>
								<p>
									조회수 <span>${board.board_viewCnt }</span>
								</p>
								<p>
									추천수 <span>${board.board_likeCnt }</span>
								</p>
								<p>
									댓글 <span>${board.replyCnt }</span>
								</p>
							</div>
						</div>
						<div class="detail-content">${board.board_content }</div>
						<div class="recommend-btn">
							<button type="button" class="btn btn-warning">추천</button>
						</div>
						<div class="detail-bottom">
							<div class="detail-bottom-comment-wrap">
								<ul class="detail-bottom-comment">
									<li>
										<p class="comment-id">큰형님이다</p>
										<p class="comment-content">정말 부러워요 저도 삼겹살 먹고싶어요!</p>
									</li>
									<li>
										<p class="comment-id">아들둘아빠</p>
										<p class="comment-content">삼겹살에 소주한잔 좋죠!</p>
									</li>
									<li>
										<p class="comment-id">종진아부지</p>
										<p class="comment-content">부러워요! 오늘 저녁은 삼겹살 먹어야겠어요</p>
									</li>
									<li>
										<p class="comment-id">막내태훈쓰</p>
										<p class="comment-content">오늘저녁은 삼겹살이다!</p>
									</li>
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
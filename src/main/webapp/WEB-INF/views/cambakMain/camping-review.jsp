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

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<style>
@import url(/resources/cambak21/css/SHWtamplet.css);

#searchSelect {
	width: 70px;
	height: 30px;
}

#searchbar {
	width: 74%;
}

input[type=submit] {
	float: right;
	margin-right:51px;
}

div#contentheader.searchbartopheader {
	width: 822px;
	height: 698.59px;
	background-color: lightgrey;
}

div#content.searchResults {
	width: 722px;
	height: 600px;
	background-color: #bfff00;
}

section.btwtitlecontent {
	margin-bottom: 1em;
}


</style>



</head>

<body>
	<%@include file="cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- 사이드바 템플릿 -->
				<%@include file="cambak21Aside.jsp"%>

				<!-- Content -->
				<div id="contentheader" class="searchbartopheader">
					<section class="btwtitlecontent">
						<header>
							<h2.5>캠핑 후기 게시판~</h2.5>
							<span class="subtitle">캠핑 후기 게시판~입니다~</span>
						</header>
						<form action="" method="get">
							<select id="searchSelect">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select> <input type="search" id="searchbar" placeholder="키워드를 입력하세요">
							<input type="submit" id="searchSubmit" value="검색하기">
						</form>

					</section>
					<div id="content" class="searchResults">
						<p>test</p>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

	<%@include file="cambak21Footer.jsp"%>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script src="/resources/cambak21/js/rolling.js"></script>
<style>
@import url(/resources/cambak21/css/SHWtamplet.css);

.\34 u {
	width: 100%;
	margin: 0px;
}

.pageBtn {
	justify-content: center;
	display: flex;
}

th.board-title {
	width: 60%;
}

p.category-title {
	font-weight: bold;
	text-align: center;
	font-size: 20px;
}
</style>
</head>
<body>
	<%@include file="../../cambak21Header.jsp"%>
	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- 사이드바 템플릿 -->
				<%@include file="../../cambak21Aside2.jsp"%>
				
				<!-- Content -->
				<h1>게시판 수정 페이지</h1>
		<hr />
	
		<form action="/cambakMain/board/humor/modi" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2" for="writer">글번호 :</label>
			<div class="col-sm-10"><input type="text" name="board_no" value="${board.board_no }" readonly="readonly"/></div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="writer">작성자 :</label>
			<div class="col-sm-10">${board.member_id }</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="writer">조회수 :</label>
			<div class="col-sm-10">${board.board_viewCnt }</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="writer">작성일 :</label>
			<div class="col-sm-10">
				<fmt:formatDate value="${board.board_writeDate }" type="both"
					pattern="yyyy-MM-dd HH:mm:ss" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="title">제 목 :</label>
			<div class="col-sm-10"><input type="text" name="board_title" value="${board.board_title }"/></div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="content">내 용 :</label>
			<div class="col-sm-10"><input type="text" name=board_content value="${board.board_content }"/></div>
		</div>

		<div class="box-footer">
			
         <button type="submit" class="btn btn-success" id="modiBoardPost">수정하기</button>
        
         <button type="button" class="btn btn-primary" onclick="">리스트페이지로</button>
		</div>
	</form>
				
			</div>
		</div>
	</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>
</body>
</html>
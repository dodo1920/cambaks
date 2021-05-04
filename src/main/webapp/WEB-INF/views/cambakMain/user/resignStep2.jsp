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
		/* function checkPw() {
			
			let chkPw = document.getElementById('chkPw').value;
			if (chkPw.length < 8 || chkPw.length > 20) { // 잘못된 패스워드
				document.getElementById("checkPwMessage").innerHTML = "잘못된 패스워드 양식입니다.";
				document.getElementById("chkPw").focus()
			} 
		} */
		
		function checkPw() {
			let member_id = $("#member_id").val();
			let member_password = #("#member_password").val();
			
			$.ajax({
				type : "post",
				dataType : "text", // 받을 데이터
				//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
				url : "/user/resignStep3",// 서블릿 주소
				data : {member_id : member_id, member_password : member_password},
				success : function(result) {
					
				}, // 통신 성공시
				error : function(result) {
					
				}, // 통신 실패시
				complete : function(result) {
					console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
					console.log(result);
//					if(result != null){
						
//					}
					
					
				} // 통신 완료시
			});		
			return false;
		}
	</script>

<body>

	<!-- Header -->
	<div id="header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="http://zinsimi.cafe24.com/1_project/Do_main5.html">Logo</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">MENU<span
									class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="glory-login.html" id="loginBtn">로그인
									</a></li>
								<li><a href="Do_bbsList.html">게시판</a></li>
								<li><a href="SHW_myCamping.html">마이페이지</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>


		<div class="container">

			<!-- Logo -->
			<div id="logo">
				<h1>캠박이일</h1>
				<span class="tag">We are specialized in camping</span>
			</div>
		</div>
	</div>
	<!-- Header -->

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">
			
				

				<!-- Content -->
				<div id="content" class="8u skel-cell-important" style="padding-bottom: 200px;">
				<c:choose>
				<c:when test="${loginMember != null }">
					<section>
						<header>
							
							<h2>비밀번호 재확인</h2>
							<span class="byline">${loginMember.member_id }님</span>
							<span class="byline">안전한 홈페이지 이용을 위해 비밀번호를 다시 한 번 입력해주세요.</span>
						</header>
						<div>
						<form action="/user/resignStep4" method="POST" onsubmit="return checkPw();">
							<input type="hidden" name="member_id" id="member_id" value = "${loginMember.member_id }"/>
							<input type="password" name="member_password" id="member_password" size="25">
							<input type="submit" value="확인">
							<span id="checkPwMessage"></span>
						</form>
					</div>

					</section>
					</c:when>
					<c:otherwise>
						<h2>로그인이 필요한 서비스입니다</h2>
						<input type="button" onclick="location.href='/user/login/yet'" value="로그인페이지로 이동하기">
					</c:otherwise>
					</c:choose>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

	
	<!-- Footer -->
	<%@include file="../cambak21Footer.jsp"%>
	<!-- /Footer -->
</body>
</html>
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
				<!-- Sidebar -->
				<div>
					<div class="profile">
						<div>
							<div class="profileSize">
								<a href=></a><img src="img/profileDefualt.png" class="userProfileImg"></a>
								<h4>서효원</h4>
								<div class="profileEmail">hyoniki@gmail.com</div>
							</div>
							<div class="profileCategory">
								<ul>
									<li class="profileMenu1"><a href="SHW_accountInfo.html" class="profileMenu">회원 정보
											수정</a></li>
									<li class="profileMenu2"><a href="#" class="profileMenu">캠핑장 찜 리스트</a></li>
									<li class="profileMenu2"><a href="#" class="profileMenu">좋아요 표시한 게시글</a></li>
								</ul>
							</div>
						</div>
					</div>



					<!-- Sidebar -->
					<div id="sidebar" class="4u">
						<div class="sidebar">
							<h3 class="myPage">MY PAGE</h3>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="SHW_myCamping.html" id="categoryFont">마이캠핑</a></li>
								<li><a href="buggo_checkBox.html" id="categoryFont">여행계획</a></li>
								<li><a href="glory_diarylist.html" id="categoryFont">여행일기</a></li>
								<li><a href="#" id="categoryFont">작성한 게시글</a></li>
								<li class="active"><a href="KJM_userOut1.html" id="categoryFont">회원 탈퇴</a></li>
								
							</ul>
						</div>
					</div>
				</div>

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
						<form action="/user/resignStep3" method="POST">
							<input type="hidden" name="member_id" value = "${loginMember.member_id }"/>
							<input type="password" name="member_password" id="chkPw" size="25" onblur="checkPw();">
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

	<!-- Tweet -->
	<div id="tweet">
		<div class="container">
			<section>
				<blockquote>&ldquo;진정한 여행은 새로운 풍경을 보러가는 것이 아니라, <br />세상을 바라보는 또 하나의 눈을 얻어오는 것이다.&rdquo;</blockquote>
			</section>
		</div>
	</div>
	<!-- /Tweet -->

	<!-- Footer -->
	<footer class="text-center" id="foot">
		<div id="contact" class="container">
			<h3 class="text-center">Contact</h3>
			<p class="text-center"><em>We love our fans!</em></p>

			<div class="row">
				<div class="col-md-4">
					<p>Feel free to contact us:)</p>
					<p><span class="glyphicon glyphicon-map-marker"></span>서울, 대한민국</p>
					<p><span class="glyphicon glyphicon-phone"></span>Phone: +00 1515151515</p>
					<p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p>
					<p><span class="glyphicon glyphicon-envelope"></span>SNS</p>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-sm-6 form-group">
							<input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
						</div>
						<div class="col-sm-6 form-group">
							<input class="form-control" id="email" name="email" placeholder="Email" type="email"
								required>
						</div>
					</div>
					<textarea class="form-control" id="comments" name="comments" placeholder="Comment"
						rows="5"></textarea>
					<br>
					<div class="row">
						<div class="col-md-12 form-group">
							<button class="btn pull-right" type="submit">Send</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 위로 가기 버튼-->
			<a href="#" class="top"><img src="images/top.png" class="topMove"></a>
			<!-- 위로 가기 버튼-->
	</footer>
	<!-- /Footer -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>

<meta charset="utf-8" />
<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<title>Cambark's</title>

<!-- jquery -->
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="/resources/cambak21/css/SHWtamplet.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<!-- 게시판 공통 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>



<script>
   $(document).ready(function() {
	  

      
   });
   

   
</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap');

#content {
	font-family: 'Gothic A1', sans-serif;
}

.userInfo {
	width: 160px;
	text-align: center;
	font-size: 15px;
	padding: 15px;
	background-color: #f3f3f3;
}

.userWrite {
	padding-left: 10px;
	width: 570px;
	font-size: 13px;
	border-bottom: 1px solid #f3f3f3;
}

.userInfoRewrite {
	text-align: center;
	padding: 10px 0px 0px 0px;
}

.userAccount {
	border-top: 1px solid #909090;
	border-bottom: 1px solid #909090;
}

.nickNameRewrite {
	margin-left: 10px;
}

#errPw {
	color: red;
	padding-left: 10px;
}

#errPw2 {
	color: red;
	padding-left: 10px;
}

#errNick {
	color: red;
	padding-left: 10px;
}

</style>

</head>

<body>
	<%@include file="../cambak21Header.jsp"%>

	<div id="main">
		<div class="container">
			<div class="row" style="width: 900px; margin-left: 210px;">
				<div id="content" class="8u skel-cell-important" style="padding-left: 0px;">
					<div>
						<h3 style="text-align: center; font-size: 23px;">회원 가입</h3>
					</div>
					<div style="padding-top: 50px; border-top: 1px solid #dbdbdb;">
						<div>
							<h3 style="display: inline-block;">기본 정보 입력</h3>
							<span style="float: right; color: #ab3e55;">* 표시의 정보는 필수로 입력바랍니다.</span>
						</div>
						<table class="userAccount">
							<tr>
								<td class="userInfo">아이디</td>
								<td class="userWrite">hyoniki</td>
							</tr>
							<tr>
								<td class="userInfo">이름</td>
								<td class="userWrite">서효원</td>
							</tr>
							<tr>
								<td class="userInfo">닉네임</td>
								<td class="userWrite" id="nicknameInput">효니키<input type="button" value="변경"
										class="nickNameRewrite" onclick="nickName();"></td>
							</tr>
							<tr>
								<td class="userInfo">비밀번호</td>
								<td class="userWrite"><input type="password" name="password" onblur="tou2(this)"><span
										id="errPw"></span></td>
							</tr>
							<tr>
								<td class="userInfo">비밀번호확인</td>
								<td class="userWrite"><input type="password" name="password" onblur="tou3(this)"><span
										id="errPw2"></span></td>
							</tr>
							<tr>
								<td class="userInfo">E-mail</td>
								<td class="userWrite">hyoniki@gmail.com</td>
							</tr>
							<tr>
								<td class="userInfo">휴대전화</td>
								<td class="userWrite" style="border-bottom: 1px solid #909090;">010-1234-5678</td>
							</tr>
						</table>
						<div class="userInfoRewrite">
							<input type="button" value="취소" onclick="goBack();" style="margin-right: 10px;">
							<input type="submit" value="수정" onclick="check();">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>
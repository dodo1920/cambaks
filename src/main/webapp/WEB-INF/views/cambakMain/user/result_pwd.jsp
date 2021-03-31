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
	<script>
		function checkPwd() {
			let newPwd = $("#newPassword").val();
			let checkNewPwd = $("#checkNewPassword").val();
			
			console.log(newPwd, checkNewPwd);
			
			if(newPwd == checkNewPwd) {
				return true;
			}
			
			$("#result").html("새로운 비밀번호가 다릅니다")
			
			return false;
		}
	</script>
</head>

<body>
    <%@include file="../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>비밀번호 찾기</h2>
							<span class="byline">비밀번호 찾기 결과</span>
						</header>
						<div>
						  <form action="/user/reset_pwd" method="post">
						    <div class="form-group">
						      <label for="member_name">새로운 비밀번호 :</label>
						      <input type="text" class="form-control" id="newPassword" placeholder="Enter new password" name="member_password">
						      <input type="hidden" name="member_id" value="${memberInfo.member_id }" />
						    </div>
						    <div class="form-group">
						      <label for="email" class="email">새로운 비밀번호 확인 :</label>
						      <input type="text" class="form-control" id="checkNewPassword" placeholder="Enter new password">
						      <span id="result"></span>
						    </div>
						    <button type="submit" class="btn btn-default" onclick="return checkPwd();">저장</button>
						    <button type="button" class="btn btn-default">취소</button>
						  </form>
						</div>
					</section>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

    <%@include file="../cambak21Footer.jsp"%>
	
</body>

</html>
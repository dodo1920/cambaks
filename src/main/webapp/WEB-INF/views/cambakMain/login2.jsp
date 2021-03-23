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
	
	<link rel="icon" type="image/png" href="../../resources/cambak21/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="../../resources/cambak21/css/loginUtil.css">
	<link rel="stylesheet" type="text/css" href="../../resources/cambak21/css/login.css">
	
	
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../../resources/cambak21/js/skel.min.js"></script>
	<script src="../../resources/cambak/21/js/skel-panels.min.js"></script>
	<script src="../../resources/cambak21/js/init.js"></script>

	<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
	
	<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
	<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
	
	<script src="../../resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="../../resources/cambak21/js/SHWtamplet.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		alert("아이디와 비밀번호를 확인해주세요");
	});
	function loginOK(){
		if(document.getElementById('chkCookie').checked){
			alert("자동 로그인 기능은 공공장소에서는 사용하지 마세요!");
			return true;
		}
	}
	</script>
	<style>
		@import url(../../resources/cambak21/css/SHWtamplet.css);
	</style>



</head>

<body>
    <%@include file="cambak21Header.jsp"%>

	
    <!-- Main -->
    <div class="limiter" >
      <div class="container-login100">
        <div class="wrap-login100">
          <form class="login100-form validate-form" action="/user/login" method="post">
            <span class="login100-form-title p-b-34">
              Account Login
            </span>
            
            <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
              <input id="first-name" class="input100" type="text" name="member_id" placeholder="아이디">
              <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
              <input class="input100" type="password" name="member_password" placeholder="비밀번호">
              <span class="focus-input100"></span>
            </div>
            
            <div class="container-login100-form-btn">
              <input type="submit" class="login100-form-btn" value="로그인" onclick="loginOK"><br/>
              <input type="checkbox" name="member_cookie" id="chkCookie" />자동 로그인  <br/>
            </div>
  
            <div class="w-full text-center p-t-27 p-b-239">
              <span class="txt1">
                
              </span>
  
              <a href="buggo_FindPassword.html" class="txt2">
                아이디 / 비밀번호 찾기
              </a>
            </div>
  
            <div class="w-full text-center">
              <a href="buggo_signUp.html" class="txt3">
                회원 가입
              </a>
            </div>
          </form>
  
          <div class="login100-more" style="background-image: url('../../resources/img/logFront.png');"></div>
        </div>
      </div>
    </div>
	<!-- /Main -->

    <%@include file="cambak21Footer.jsp"%>
	
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak21/js/skel-panels.min.js"></script>
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

<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script>

<script type="text/javascript">
	function displayWarn(){
		if(document.getElementById('chkCookie').checked){
			alert("자동 로그인 기능은 공공장소에서는 사용하지 마세요!");
			return true;
		}
	}

	$(function(){
		
	    let boardUri = searchUriAddress();
	    asideBarDraw(boardUri);
	});
	
	
	
	
	
	
</script>



</head>
<body>
	<%@include file="../cambakMain/cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- 사이드바 템플릿 -->
				<%@include file="../cambakMain/cambak21Aside2.jsp"%>

				<c:if test="${loginMember == null}">

	<form action="/user/login" method="post">
		아이디 : <input type="text" name="member_id" /> <br />
		비밀번호 : <input type="text" name="member_password" /> <br />
		<input type="checkbox" name="member_cookie" id="chkCookie" />Remember Me :  <br/>
		<input type="submit" value="로그인" onclick="return displayWarn();" />
		
	</form>
	</c:if>
	
	<c:if test="${loginMember != null}">
		
			<form action="" method="post">
			<div> ${loginMember.member_id }님 반갑습니다.! 
			회원등급 : ${loginMember.grade_name }
			멤버이름 : ${loginMember.member_name }
			멤버성별 : ${loginMember.member_gender }
			
			<input type="submit" value="로그아웃" />	</div>
			</form>
		</c:if>
	
				
				
				
				

			</div>
		</div>
	</div>
	


	<%@include file="../cambakMain/cambak21Footer.jsp"%>
	

	
</body>
</html>
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
	<style>
		@import url(/resources/cambak21/css/SHWtamplet.css);
		hr {
			margin : 0px;
			padding : 0px;
		}
		
		#email {
			display : block;
		}
		
		#id_member_email {
			width : 80%;
			display : inline-block;
			margin-right : 2%;
			margin-bottom : 3%;
		}
		
		#userUUID {
			width : 30%;
			display : inline-block;
			margin-right : 2%;
		}
	</style>
	<script>
		function showCheckbox() {
			$("#hiddenCheckbox").show();
		}
		
		function sendMail() {
			let userName = $("#id_member_name").val()
			let userEmail = $("#id_member_email").val()
			
			console.log(userName, userEmail);
			
			if(userName.length == 0 || userEmail.length == 0) {
				alert("이름 또는 이메일을 입력해주세요");
			} else {
				showCheckbox(); 
				
				$.ajax({
					url: '/user/find_idPwd',
					headers: {	// 요청 하는 데이터의 헤더에 전송
						"Content-Type" : "application/json"
							},
					data : JSON.stringify({	// 요청하는 데이터
						member_name : userName,
						member_email : userEmail,
						}),
					dataType : 'text', // 응답 받을 형식
					type : 'post',
					processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
					contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
					success : function(result) {
						console.log(result);
						$("#hiddenUUID").html(result);	
					},
					fail : function(result) {
						alert(result);
					}
				});		
			}
			
		}
		
		function checkUuid() {
			let uuid = $("#hiddenUUID").text();
			let userUUID = $("#userUUID").val();
			
			console.log(uuid, userUUID);
			
			if(userUUID.length == 0) {
				alert("인증번호를 입력해주세요");
			} else {
				if(uuid == userUUID) {
					alert("인증이 완료되었습니다");
					$("#status").val("success");
				} else {
					alert("인증번호가 다릅니다. 이메일 인증을 다시 시도해 주세요")
				}
			}
					
		}
		
		function findId() {
			let status = $("#status").val();
			
			if(status == "success") {
				location.href = 
			}
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
							<h2>아이디/비밀번호 찾기</h2>
							<span class="byline">아이디 찾기</span>
						</header>
						<div>
						  <form action="/find_id" method="post">
						    <div class="form-group">
						      <label for="member_name">이름 :</label>
						      <input type="text" class="form-control" id="id_member_name" placeholder="Enter name" name="member_name">
						    </div>
						    <div class="form-group">
						      <label for="email" id="email">이메일 :</label>
						      <input type="email" class="form-control" id="id_member_email" placeholder="Enter email" name="member_email">
						      <input type="button" id="checkEmail" value="인증" onclick="sendMail();" />
						      <div id="hiddenCheckbox" style="display:none">
						      	<input type="text" id="userUUID" class="form-control" />
						      	<input type="button" id="checkUUID" value="확인" onclick="checkUuid();" />
						      	<input type="hidden" id="hiddenUUID" />
						      	<input type="hidden" id="status" />
						      </div>
						    </div>
						    <button type="submit" class="btn btn-default" onclick="findId();">찾기</button>
						    <button type="button" class="btn btn-default">취소</button>
						  </form>
						</div>
					</section>
					<hr/>
					<section>
						<header>
							<span class="byline">비밀번호 찾기</span>
						</header>
						<div>
						  <form action="/action_page.php">
						    <div class="form-group">
						      <label for="member_id">아이디 :</label>
						      <input type="text" class="form-control" id="pwd_member_name" placeholder="Enter name" name="member_id">
						    </div>
						    <div class="form-group">
						      <label for="email">이메일 :</label>
						      <input type="email" class="form-control" id="pwd_member_email" placeholder="Enter email" name="member_email">
						    </div>
						    <button type="submit" class="btn btn-default">찾기</button>
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
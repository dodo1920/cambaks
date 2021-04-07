<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		$(function() {
			//아이디 체크
			$("#userNameCheck").on("click",function() {
				let userId = $("#userId").val()
				let ko_pattern = /([^가-힣\x20])/i; 
				let special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
				let number_pattern = /[0-9]/;
				console.log(ko_pattern.test(userId));
		        if (!userId) { // 아이디가 입력되지 않음.
		        	document.getElementById("errId").innerHTML = "공백으로는 변경 불가능합니다.";
		        	document.getElementById("userId").focus();
		        	
		        }else if(special_pattern.test(userId) || number_pattern.test(userId)){
		        	document.getElementById("errId").innerHTML = "한글또는 영문만 사용 가능합니다";
		        	document.getElementById("userId").focus();
		        }else if(ko_pattern.test(userId)){
		        	document.getElementById("errId").innerHTML = "한글입력도중 모음,자음이 부족합니다.";
		        	document.getElementById("userId").focus();
		        }
		        else if (userId.length < 2 || userId.length > 16) {
		        	document.getElementById("errId").innerHTML = "아이디는 2자이상 15자이하입니다";
		        	document.getElementById("userId").focus();
				}else {
					document.getElementById("errId").innerHTML = "";
				}
			});
			
			//비밀번호 체크
			$("#userPasswordCheck").on("click",function() {
				let password = $("#userNameCheck").val()
				let koCheck_pattern  = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		        if (!password) { // 아이디가 입력되지 않음.
		        	document.getElementById("errPwd").innerHTML = "공백으로는 변경 불가능합니다.";
		        	document.getElementById("userNameCheck").focus();
		        	
		        }else if(koCheck_pattern.test(password)){
		        	document.getElementById("errPwd").innerHTML = "비밀번호에는 한글이 들어갈 수 없습니다";
		        	document.getElementById("userNameCheck").focus();
		        }else if (password.length < 3 || password.length > 101) {
		        	document.getElementById("errPwd").innerHTML = "비밀번호는 4자이상 100자이하입니다";
		        	document.getElementById("userNameCheck").focus();
           		}   
		        else {
					document.getElementById("errPwd").innerHTML = "";
				}
			});
			//생년월일 체크
			$("#userBrithCheck").on("click",function() {
				let brith = $("#userPasswordCheck").val()
		        if (!brith) { // 아이디가 입력되지 않음.
		        	document.getElementById("errBirth").innerHTML = "공백으로는 변경 불가능합니다.";
		        	
		        }else if(Number($("#userPasswordCheck").val().substring(0,4))< 1900){
		        	document.getElementById("errBirth").innerHTML = "날짜는 1900년도 이상부터 입력하여 주세요";
		        }else {
					document.getElementById("errBirth").innerHTML = "";
				}
            
			});
			//주소 체크
			$("#userAddresCheck").on("click",function() {
				let addr = $("#userBrithCheck").val()
		        if (!addr) { // 아이디가 입력되지 않음.
		        	document.getElementById("errAddr").innerHTML = "공백으로는 변경 불가능합니다.";
		        	document.getElementById("userBrithCheck").focus();
		        	
		        }  else {
					document.getElementById("errAddr").innerHTML = "";
				}
			});
            //e-Mail주소 체크
            $("#userEmailCheck").on("click",function() {
				let email = $("#userAddresCheck").val()
		        if (!email) { // 아이디가 입력되지 않음.
		        	document.getElementById("errEmail").innerHTML = "공백으로는 변경 불가능합니다.";
		        	document.getElementById("userAddresCheck").focus();
		        	
		        }else if(email.indexOf("@") == -1 || email.indexOf(".") == -1 || (email.split("."))[1].length < 2){
		        	document.getElementById("errEmail").innerHTML = "이메일이 유효하지 않습니다.";
		        	document.getElementById("userAddresCheck").focus();
		        }else {
					document.getElementById("errEmail").innerHTML = "";
				}
			});
          //휴대전화 체크
          $(".userMobileCheck").on("focusout",function(){
        	  let mobile = $(".userMobileCheck").val();
        	  let regExp = /^01(?:0|1|[6-9])-(?:\d{3}   |\d{4})-\d{4}$/;
        	  if (!mobile) { // 아이디가 입력되지 않음.
		        	document.getElementById("errMobile").innerHTML = "공백으로는 변경 불가능합니다.";
		        	$(".userMobileCheck").focus();
		        	
        	  }else if(!regExp.test(mobile)){
        		  document.getElementById("errMobile").innerHTML = "휴대폰 형식이 아닙니다.";
		        	$(".userMobileCheck").focus();
        	  }else {
      			document.getElementById("errMobile").innerHTML = "";
      		}
        	  
          });})
   //최종체크
	function check() {
		let valid = true; 
		//아이디 체크
		let userId = $("#userId").val().replace()
        if (!userId) { // 아이디가 입력되지 않음.
        	document.getElementById("errId").innerHTML = "공백으로는 변경 불가능합니다.";
        	document.getElementById("userId").focus();
        	 valid = false;
        	
        }else if (userId.length < 4 || userId.length > 16) {
        	document.getElementById("errId").innerHTML = "아이디는 4자이상 15자이하입니다";
            document.getElementById("userId")[0].focus();
            valid = false;
		}
		//비밀번호 체크
		let password = $("#userNameCheck").val()
        if (!password) { // 아이디가 입력되지 않음.
        	document.getElementById("errPwd").innerHTML = "공백으로는 변경 불가능합니다.";
        	document.getElementById("userNameCheck").focus();
        	 valid = false;
        	
        }else if(!isNaN(password)){
        	document.getElementById("errPwd").innerHTML = "문자로는 비밀번호가 불가능합니다";
        	document.getElementById("userNameCheck").focus();
        }else if (password.length < 3 || password.length > 101) {
        	document.getElementById("errPwd").innerHTML = "아이디는 4자이상 100자이하입니다";
            document.getElementById("userId")[0].focus();
            valid = false;
   		}
        else {
			document.getElementById("errId").innerHTML = "";
		}
		//생년월일 체크
		let brith = $("#userPasswordCheck").val()
		if (!brith) { // 아이디가 입력되지 않음.
			document.getElementById("errBirth").innerHTML = "공백으로는 변경 불가능합니다.";
        	document.getElementById("member_birth").focus();
        	 valid = false;
        }else {
			document.getElementById("errBirth").innerHTML = "";
		}
		//주소 체크
		let addr = $("#userBrithCheck").val()
        if (!addr) { // 아이디가 입력되지 않음.
        	document.getElementById("errAddr").innerHTML = "공백으로는 변경 불가능합니다.";
        	document.getElementById("userBrithCheck").focus();
        	 valid = false;
        }else {
			document.getElementById("errAddr").innerHTML = "";
		}
		//e-Mail주소 체크
		let email = $("#userAddresCheck").val()
        if (!email) { // 아이디가 입력되지 않음.
        	document.getElementById("errEmail").innerHTML = "공백으로는 변경 불가능합니다.";
        	document.getElementById("userAddresCheck").focus();
        	return valid = false;
        }else if(email.indexOf("@") == -1 || email.indexOf(".") == -1 || (email.split("."))[1].length < 2){
        	document.getElementById("errEmail").innerHTML = "이메일이 유효하지 않습니다.";
        	document.getElementById("userAddresCheck").focus();	
        	 valid = false;
        }else {
			document.getElementById("errEmail").innerHTML = "";
		}
		//휴대폰 체크
	  let mobile = $(".userMobileCheck").val();
  	  let regExp = /^01(?:0|1|[6-9])-(?:\d{3}   |\d{4})-\d{4}$/;
  	  if (!mobile) { // 아이디가 입력되지 않음.
       	document.getElementById("errMobile").innerHTML = "공백으로는 변경 불가능합니다.";
       	$(".userMobileCheck").focus();
        valid = false;
  	  }else if(!regExp.test(mobile)){
  		document.getElementById("errMobile").innerHTML = "휴대폰 형식이 아닙니다.";
       	$(".userMobileCheck").focus();
        valid = false;
  	  }else {
  		document.getElementById("errMobile").innerHTML = "";
  	}
		return valid
	}
	</script>
	<style type="text/css">	
		.textArray{
			width: 100px;	
			height: 30px;
			display: inline-block;
		}
		.inputArray{
			width: 500px;
			height: 30px;
			text-align: center;
			border: none;
		}
		.inputArray:focus{
		outline: none;
		border:none
		}
		.totalArray{
			border: solid 1px black;
		}
		.erroArray{
			width: auto;
			height: auto;
			display: inline-block;
			color: red;
		}
	</style>
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
							<h2>회원정보 수정</h2>
						</header>
						<div>
							<form>
							  <table>
							  	<tr>
							  		<td class="totalArray" ><span class="textArray">이름 : </span><input class="inputArray" id="userId"  name="member_name" type="text" value="${member.member_name }"/><span class="erroArray"id="errId"></span></td>
							  	</tr>
							  	<tr>
							  		<td class="totalArray" ><span class="textArray">비밀번호 : </span><input class="inputArray" name="member_password"  id="userNameCheck" type="text" value="${member.member_password }"/><span class="erroArray"id="errPwd"></span></td>
							  	</tr>
							  	<tr>
									<td class="totalArray"><span class="textArray">생일 : </span><input class="inputArray" name="member_birth"  id="userPasswordCheck"  type="date" value='<fmt:formatDate value="${member.member_birth }" type="both" pattern="yyyy-MM-dd" />'/><span class="erroArray"id="errBirth"></span></td>
							  	</tr>
							  	<tr>
							  		<td class="totalArray"><span class="textArray">주소 : </span><input class="inputArray" name="member_addr"  id="userBrithCheck" type="text" value="${member.member_addr }"/><span class="erroArray"id="errAddr"></span></td>
							  	</tr>
							  	<tr>
							  		<td class="totalArray"><span class="textArray">이메일 : </span><input class="inputArray"name="member_email"   id="userAddresCheck" type="email" value="${member.member_email }"/><span class="erroArray"id="errEmail"></span></td>
							  	</tr>
							  	<tr>
							  		<td class="totalArray"><span class="textArray">휴대폰 번호 : </span><input class="inputArray  userMobileCheck" name="member_mobile"  id="userEmailCheck" type="text" value="${member.member_mobile }"/><span class="erroArray"id="errMobile"></span></td>
							  	</tr>
							  
							  </table>
					          <br>
					          <hr>
					          <div style="margin: auto;display: table">
					          <input type="button" value="수정완료" onclick="check()" style="margin-right: 20px"/> <input type="button" value="취소" onclick="location.reload()">
					          </div>
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
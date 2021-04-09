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

<!-- 다음 지도 api js -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/cambak21/js/registerDaumPost.js"></script>


<script src="https://www.google.com/recaptcha/api.js"></script>

<script>
   let capchaResult = "FAIL";
   
   $(document).ready(function() {

	   
   });
   
   function userEmailChk() {
	   
	   googleCapchaChk();
	   
	   if (capchaResult == "OK") {
		   
		   alert("이메일 보냈삼");
	   } else if (capchaResult == "FAIL") {
		   alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
	   }
	   
   }
   
   function sendEamil() {
	   
		$.ajax({
            url: '/user/register/sendRegisterEmail',
            type: 'post',
            dataType: "text",
            async: false,
            data: { recaptcha: $("#g-recaptcha-response").val() },
            success: function(data) {
            	if (data == "success") {
            		capchaResult = "OK";
            	} else if (data == "fail") {
            		alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
            	} else if (data == "error") {
            		alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다.");
                }
            }
        });
		
   }

   function googleCapchaChk() {
	   
		$.ajax({
            url: '/user/register/checkRecaptcha',
            type: 'post',
            dataType: "text",
            async: false,
            data: { recaptcha: $("#g-recaptcha-response").val() },
            success: function(data) {
            	if (data == "success") {
            		capchaResult = "OK";
            	} else if (data == "fail") {
            		alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
            	} else if (data == "error") {
            		alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다.");
                }
            }
            
        });
				
   }
   
   
   
   
</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap');

#content {
	font-family: 'Gothic A1', sans-serif;
}

.contentPlace{
	margin: 0 auto;
	width: 900px;
}

.registerTitle {
	border-bottom: 1px solid #dbdbdb;
}

.registerTitleHead {
	display: inline-block;
	font-size: 28px;
	font-weight: bold;
	padding-bottom: 10px;
}

.registerTitleBody {
	display: inline-block;
	font-size: 18px;
	float: left;
	padding-bottom: 5px;
}

.registerBtn {
	position: relative;
    background: #fff;
    color: #333;
    margin-top: 0;
    height: 62px;
    line-height: 60px;
    border: 1px solid #888;
    font-size: 17px;
    margin-bottom: 40px;
    display: block;
    text-align: center;
    background-color: #fafafa;
}

.kakaoRegisterBtn {
	position: relative;
    background: #fff;
    color: #333;
    margin: 12px 0 0;
    height: 62px;
    line-height: 60px;
    border: 1px solid #888;
    font-size: 17px;
    display: block;
    text-align: center;
    background-color: #fafafa;
}

.kakaoInfo {
    margin: 15px 0 0;
    padding: 0 0 0 19px;
    color: #999;
    line-height: 20px;
}

.modal-header, h4, .close {
  background-color: #8b9fc6;
  color:white !important;
  text-align: center;
  font-size: 25px;
}
.modal-footer {
  background-color: #f9f9f9;
}


</style>

</head>

<body>
	<%@include file="../cambak21Header.jsp"%>


	<div id="main">
		<div id="content" class="container">
			<div class="contentPlace">
				<div>
					<div class="registerTitle">
							<h2 class="registerTitleHead">회원가입</h2>
					</div>
					<div style="width: 579px; margin: 0 auto; padding: 60px 0;">
						<div style="margin: 17px 0 0; padding: 53px 54px 59px; border: 1px solid #dcdcdc;">
							<a class="registerBtn" data-toggle="modal" data-target="#myModal">캠박's 통합 회원가입</a>
							<a class="kakaoRegisterBtn">Daum Kakao 아이디 회원가입</a>
							<p class="kakaoInfo">
								카카오톡 로그인 할 끼니?
							</p>
							
							<!-- Modal -->
							<div class="modal fade" id="myModal" role="dialog">
							  <div class="modal-dialog">
							  
								<!-- Modal content-->
								<div class="modal-content">
								  <div class="modal-header" style="padding:35px 50px;">
								    <button type="button" class="close" data-dismiss="modal">&times;</button>
								    <h4><span class="glyphicon glyphicon-lock"></span> 회원가입-이메일 본인 인증</h4>
								  </div>
								  <div class="modal-body" style="padding:40px 50px;">
								    <form role="form">
								      <div class="form-group">
								        <label for="usrname"><span class="glyphicon glyphicon-user"></span> </label>
								        <input type="text" class="form-control" id="usrname" placeholder="Enter email">
								      </div>
									  <div class="g-recaptcha" data-sitekey="6LcPSqIaAAAAAH_msgzY3LP3lNJ207FQ4ujognJW"></div>
								      <button type="button" id="join_button" style="margin-top: 15px;" class="btn btn-block" onclick="userEmailChk();"><span class="glyphicon glyphicon-off"></span> 이메일 인증 요청</button>
								    </form>
								  </div>
								  <div class="modal-footer">
								    <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
								    <p>Not a member? <a href="#">Sign Up</a></p>
								    <p>Forgot <a href="#">Password?</a></p>
								  </div>
								</div>
							    
							  </div>
							</div>
							
						</div>
						<div style="text-align: center;">
							<p style="padding: 15px 0 0; color: #666; font-size: 12px;">
								이미 캠박's 회원이세요?
								<a href="/user/login/yet" style="color: #3e3d3c; text-decoration: underline;">로그인</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>
</html>


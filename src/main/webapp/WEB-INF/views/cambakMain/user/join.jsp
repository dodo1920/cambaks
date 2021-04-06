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

.tableTitleSize {
    padding: 20px 10px 0 20px;
    border-bottom: 1px solid #dbdbdb;
    background: #f9f9f9;
}

.tableContentSize {
    padding: 12px 20px;
    border-bottom: 1px solid #dbdbdb;
}

.contentPlace{
	margin-left: 330px;
	margin-right: 200px;
	width: 900px;
}

.registerTitle {
	border-bottom: 1px solid #dbdbdb;
	margin-bottom: 40px;
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

.registerEtc {
	float: right;
	padding-bottom: 5px;
	font-size: 12px;
	color: #ea2940;
}

.registerTable {
	width: 900px;
	border-top: 1px solid;
}

.textBarInfo {
	font-size: 12px;
	font-weight: bold;
}

.genderSideMan {
	margin-right: 20px;
	margin-left: 5px;
}

.genderSideWoman {
	margin-left: 5px;
}

.birthYear {
	width: 88px;
	margin-right: 5px;
}

.birthMonth {
	height: 31px;
	width: 82px;
	margin-right: 5px;
	margin-left: 5px;
}

.birthDate {
	width: 88px;
	margin-left: 5px;
}

.phoneFirst {
	height: 31px;
	width: 82px;
	margin-right: 5px;
}

.phoneSecond {
	width: 88px;
	margin-left: 5px;
	margin-right: 5px;
}

.phoneThird {
	width: 88px;
	margin-left: 5px;
}

.registerBtn {
	padding-right: 296px;
	padding-left: 300px;
	margin-top: 30px;
}

.registerBtnCancle {
	width: 150px;
	height: 55px;
	line-height: 50px;
	font-size: 14px;
	border: 1px solid #3e3d3c;
	color: #3e3d3c;
	font-weight: 900;
}

.registerBtnSubmit {
	width: 150px;
	height: 55px;
	line-height: 50px;
	font-size: 14px;
	background: #3e3d3c;
	border: 1px solid #3e3d3c;
	color: #fff;
	font-weight: 900;
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
						<div>
						<h3 class="registerTitleBody">기본 정보</h3>
						<span class="registerEtc">* 아래의 항목을 모두 작성바랍니다.</span>
						</div>
					</div>
					<form>
						<table class="registerTable">
							<tr>
								<th class="tableTitleSize">아이디</th>
								<td class="tableContentSize">
									<div>
									<input type="text" name="" maxlength="40" size="40" />
									<span class="textBarInfo">(영문소문자/숫자, 4~20자)</span>
									</div>
									<div>
									<span id="">ㅇㄴㄹㅇ</span>
									</div>
								</td>
							</tr>
	
							<tr>
								<th class="tableTitleSize">비밀번호</th>
								<td class="tableContentSize">
									<div>
									<input type="password" name="" maxlength="40" size="40" />
									<span class="textBarInfo">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</span>
									</div>
									<div>
									<span id="">ㅇㄴㄹㅇ</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">비밀번호 확인</th>
								<td class="tableContentSize">
									<div>
									<input type="password" name="" maxlength="40" size="40" />
									</div>
									<div>
									<span id="">ㅇㄴㄹㅇ</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">이름</th>
								<td class="tableContentSize">
									<div>
									<input type="text" name="" maxlength="40" size="40" />
									</div>
									<div>
									<span id="">ㅇㄴㄹㅇ</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">성별</th>
								<td class="tableContentSize">
									<div>
									<input type="radio" name="gender" value="M" checked/><span class="genderSideMan">남</span>
									<input type="radio" name="gender" value="F" /><span class="genderSideWoman">여</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">생년월일</th>
								<td class="tableContentSize">
									<div>
										<span>
											<input type="text" maxlength="4" placeholder="년(4자)" class="birthYear"/>-
										</span>
										<span>
											<select class="birthMonth">
												<option value="empty">월</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
										</span>
										<span>
											-<input type="text" maxlength="4" placeholder="일" class="birthDate"/>
										</span>
									</div>
									<div>
									<span id="">ㅇㄴㄹㅇ</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">이메일</th>
								<td class="tableContentSize">
									<div>
									<input type="text" name="" size="40" placeholder="qwe@nd.co" readonly/>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">휴대전화</th>
								<td class="tableContentSize">
									<div>
										<span>
											<select class="phoneFirst">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
										</span>
										<span>
											-<input type="text" maxlength="4" class="phoneSecond"/>-
										</span>
										<span>
											<input type="text" maxlength="4" class="phoneThird"/>
										</span>
									</div>
									<div>
									<span id="">ㅇㄴㄹㅇ</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">주소</th>
								<td class="tableContentSize">
	
									<input type="text" id="sample2_postcode" placeholder="우편번호">
									<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" id="sample2_address" placeholder="주소"><br>
									<input type="text" id="sample2_detailAddress" placeholder="상세주소">
									<input type="text" id="sample2_extraAddress" placeholder="참고항목">
									<div id="layer"
										style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
											style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1"
											onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">프로필사진</th>
								<td class="tableContentSize">
									<input type="checkbox" id="agree" />약관에 동의합니다.
									<button type="button" data-toggle="modal" data-target="#myModal">이용약관 확인하기</button>
								</td>
							</tr>
						</table>
						<div class="registerBtn">
							<button class="registerBtnCancle">취소</button>
							<button class="registerBtnSubmit">회원가입</button>
						</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>
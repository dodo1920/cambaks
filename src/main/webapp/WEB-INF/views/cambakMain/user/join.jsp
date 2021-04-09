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

<script>
	let idJ = /^[a-z0-9]{4,20}$/; // 아이디 정규표현식
	let koreanJ = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //  한글 정규표현식
	let numberJ = /[0-9]/; // 숫자 정규표현식
	let StringJ = /[a-zA-Z]/; // 문자 정규표현식
	let specialJ = /[.,/~!@#$%^&*()_+|<>?:{}]/; // 특수문자 정규표현식
	let nameJ = /^[가-힣]{2,17}$/; // 이름 정규표현식

   $(document).ready(function() {
	   
   });
   
   	function checkAllContent() {
   		let result = true;
   		
   		// 아이디 체크
   		let userId = $("#userId").val();
   		
   		if (userId.length == 0) {
   			alert("아이디를 입력해주세요.");
   			result = false;
   			return;
   		} else if (!idJ.test(userId)) {
   			alert("입력하신 아이디는 사용할 수 없습니다.");
   			result = false;
   			return;
   		}
   		
   		// 아이디 중복 확인
	    $.ajax({
			   method: "POST",
			   url: "/user/register/checkId",
			   dataType: "text",
			   async: false,
			   data : {member_id : userId},
			   success : function(data) {
					 if(data == "fail") {
					  alert("입력하신 아이디는 사용할 수 없습니다.");
					  result = false;
					  return;
				  }
			   }
			 }); 
   		
   		
   		// 비밀번호 체크
	    let userPwd = $("#member_password").val(); // 비밀번호
	    let userPwdChk = $("#reCheckPwd").val(); // 비밀번호 확인
   		
	    if (userPwd.length < 8 || userPwd.length > 16) { // 비밀번호 길이가 유효하지 않을 경우
	    	alert("입력하신 비밀번호는 사용할 수 없습니다.");
	   		result = false;
	   		return;
	    } else if (!numberJ.test(userPwd) && !StringJ.test(userPwd)) {
	    	alert("입력하신 비밀번호는 사용할 수 없습니다.");
	   		result = false;
	   		return;
	    } else if (!numberJ.test(userPwd) && !specialJ.test(userPwd)) {
	    	alert("입력하신 비밀번호는 사용할 수 없습니다.");
	   		result = false;
	   		return;
	    } else if (!specialJ.test(userPwd) && !StringJ.test(userPwd)) {
	    	alert("입력하신 비밀번호는 사용할 수 없습니다.");
	   	    result = false;
	   		return;
	    } else if (userPwd.length == 0) {
	    	alert("비밀번호를 입력해주세요.");
	   		result = false;
	   		return;
	    } else if (userPwd != userPwdChk) {
	    	alert("비밀번호와 비밀번호 확인을 동일하게 입력해주세요.");
	   		result = false;
	   		return;
	    }
   		
	    
	 	// 이름 체크
	 	let userName = $("#member_name").val();
	 	
	 	if (userName.length == 0) {
			alert("이름을 입력해주세요.");
	   		result = false;
	   		return;
		} else if (!nameJ.test(userName)) {
	    	alert("이름을 확인바랍니다.(한글만 작성 가능)");
	   		result = false;
	   		return;
		} else if (userName.length < 1 && userName.length > 18) { // 이름이 2~17과 다를 경우
			alert("입력하신 이름은 사용할 수 없습니다.");
	   		result = false;
	   		return;
		}
	    
	 	// 생년월일 체크 및 submit 가능하도록 input 태그에 값 넣기
	    let userBirthYear = $("#userBirthYear").val();
	    let userBirthMonth = $("#userBirthMonth").val();
	    let userBirthDate = $("#userBirthDate").val();
	    
	    if (userBirthYear.length == 0 || userBirthYear < 1920 || userBirthYear > 2021 || userBirthDate.length == 0 || userBirthDate < 1 
	    		|| userBirthDate > 31 || !numberJ.test(userBirthYear) || userBirthMonth == "empty") {
			alert("생년월일을 확인해주세요.");
	   		result = false;
	   		return;
	    }
	    
	    // submit 실행 시 생년월일이 전달될 수 있도록 value에 넣기
	    $("#member_birth").val(userBirthYear + "-" + userBirthMonth + "-" + userBirthDate);
	    
	    
	 	// 휴대전화 번호 체크 및 submit 가능하도록 input 태그에 값 넣기
	    let phoneFirst = $("#phoneFirst").val();
	    let phoneSecond = $("#phoneSecond").val();
	    let phoneThird = $("#phoneThird").val();
	    
	    if (phoneSecond.length == 0 || phoneThird.length == 0 || phoneSecond.length < 3 || phoneThird.length < 4 || !numberJ.test(phoneSecond) || !numberJ.test(phoneThird)) {
			alert("휴대전화 번호를 확인해주세요.");
	   		result = false;
	   		return;
	    }
	    
	    // submit 실행 시 휴대폰 번호가 전달될 수 있도록 value에 넣기
	    $("#member_mobile").val(phoneFirst + "-" + phoneSecond + "-" + phoneThird);
	    
	    
	 	// 주소 체크 및 submit 가능하도록 input 태그에 값 넣기
	    let address = $("#sample6_address").val();
	    
	    if (address.length == 0) {
			alert("주소를 입력해주세요.");
	   		result = false;
	   		return;
	    }

	    // 유효성 검사 완료 시 submit
   		if (result) {
   			$("#saveNewMember").submit();
   		}
	}
	
   	
	function onlyNumberChk(obj) { // 숫자 입력 창 유효성 검사
		let inputId = $(obj).attr("id");
		let userInput = $("#" + inputId).val();
		
		if (!numberJ.test(userInput)) { // 숫자 외의 문자 작성 시 작성한 글자 삭제
		    $("#" + inputId).val($("#" + inputId).val().replace(StringJ,""));
		    $("#" + inputId).val($("#" + inputId).val().replace(koreanJ,""));
		    $("#" + inputId).val($("#" + inputId).val().replace(specialJ,""));
	    }
		
	}
	
	
	function checkUserName() {
		let userName = $("#member_name").val();
		
		if (!nameJ.test(userName)) {
		    $("#userNameBar").css("display", "inline-block");
		    $("#userNameCheck").attr("class", "changeTextBarMsg");
		    $("#userNameCheck").text("이름은 한글만 작성 가능합니다.");
		} else if (userName.length < 1 && userName.length > 18) { // 이름이 2~17과 다를 경우
		    $("#userNameBar").css("display", "inline-block");
		    $("#userNameCheck").attr("class", "changeTextBarMsg");
		    $("#userNameCheck").text("이름을 정확히 작성바랍니다.");
		} else if (nameJ.test(userName)) {
			$("#userNameBar").css("display", "none");
		} 
		
		if (userName.length == 0) {
			$("#userNameBar").css("display", "none");
		}
		
	}
	
	function reconfirmUserPwd() {
		let userPwd = $("#member_password").val();
		let userPwdChk = $("#reCheckPwd").val(); // 비밀번호 확인 작성한 내용
		
	    if (userPwd != userPwdChk) {
		    $("#pwdChkBar2").css("display", "inline-block");
		    $("#pwdReChkContent").attr("class", "changeTextBarMsg");
		    $("#pwdReChkContent").text("비밀번호가 서로 다릅니다.")
	    } else if (userPwd == userPwdChk) {
	 	    $("#pwdChkBar2").css("display", "none");
	    } else if (userPwd.length == 0) {
		    $("#pwdChkBar2").css("display", "inline-block");
		    $("#pwdReChkContent").attr("class", "changeTextBarMsg");
		    $("#pwdReChkContent").text("비밀번호가 서로 다릅니다.")
	    } else if (userPwdChk.length == 0) {
	    	$("#pwdChkBar2").css("display", "none");
	    }
		
	}
	
	function checkUserPwdSize() {
	   let userPwd = $("#member_password").val();
	   let userPwdChk = $("#reCheckPwd").val(); // 비밀번호 확인 작성한 내용
	   let result = true;
	   
	   if (userPwdChk == "") {
		   if (userPwd.length < 8) { // 비밀번호 길이가 유효하지 않을 경우
			    $("#pwdChkBar1").css("display", "inline-block");
			    $("#pwdChkContent").attr("class", "changeTextBarMsg");
		   		$("#pwdChkContent").text("최소 8자 이상으로 입력해 주세요.");
		   		result = false;
		   } else if (userPwd.length > 16) {
			   $("#pwdChkBar1").css("display", "inline-block");
			   $("#pwdChkContent").attr("class", "changeTextBarMsg");
		   	   $("#pwdChkContent").text("최소 16자 이하로 입력해 주세요.");
		   	   result = false;
		   } else if (!numberJ.test(userPwd) && !StringJ.test(userPwd)) {
			   $("#pwdChkBar1").css("display", "inline-block");
			   $("#pwdChkContent").attr("class", "changeTextBarMsg");
		   	   $("#pwdChkContent").text("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합하여 작성바랍니다.");
		   	   result = false;
		   } else if (!numberJ.test(userPwd) && !specialJ.test(userPwd)) {
			   $("#pwdChkBar1").css("display", "inline-block");
			   $("#pwdChkContent").attr("class", "changeTextBarMsg");
		   	   $("#pwdChkContent").text("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합하여 작성바랍니다.");
		   	   result = false;
		   } else if (!specialJ.test(userPwd) && !StringJ.test(userPwd)) {
			   $("#pwdChkBar1").css("display", "inline-block");
			   $("#pwdChkContent").attr("class", "changeTextBarMsg");
		   	   $("#pwdChkContent").text("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합하여 작성바랍니다.");
		   	   result = false;
		   }
		   
		   if (userPwd.length == 0) {
			   $("#pwdChkBar1").css("display", "none");
			   result = false;
		   }
		   
		   if (result) {
			   $("#pwdChkContent").attr("class", "serviceable");
		   	   $("#pwdChkContent").text("사용 가능한 비밀번호입니다.");
		   }
		   
	   } else { // 비밀번호 확인이 작성 되어있을 경우
		   
		   if (userPwd != userPwdChk) {
			   $("#pwdChkBar2").css("display", "inline-block");
			   $("#pwdReChkContent").attr("class", "changeTextBarMsg");
			   $("#pwdReChkContent").text("비밀번호가 서로 다릅니다.")
		   } else {
			   $("#pwdChkBar2").css("display", "none");
		   }
		   
	   }
	   

   }

   function userIdCheck() {
		  
		   let userId = $("#userId").val();
		   
		   if (event.keyCode == '32') {
			   alert("아이디는 공백 작성 불가합니다.");
			   $("#userId").val(userId.replace(/ /g,""));
		   } else if (koreanJ.test(userId)) {
			   $("#userId").val($("#userId").val().replace(koreanJ,""));
		   } else if (userId.length > 19) {
			   $("#userId").val($("#userId").val().substring(0, 20));
		   } else if (userId.length == 0) {
			   $("#idChkBar").css("display", "none");
		   }
		   
		   if (userId.length >= 4 && userId.length <= 20) { // 작성한 아이디 길이 체크
			   
			   if (idJ.test(userId)) { // 작성한 아이디 정규식 체크
				   
				   $.ajax({
						  method: "POST",
						  url: "/user/register/checkId",
						  dataType: "text",
						  data : {member_id : userId},
						  success : function(data) {
							 
							 if (data == "success") {
								 $("#idChkBar").css("display", "inline-block");
								 $("#idChkResult").attr("class", "serviceable");
								 $("#idChkResult").text("사용 가능한 아이디입니다.");
							 } else if(data == "fail") {
								 $("#idChkBar").css("display", "inline-block");
								 $("#idChkResult").attr("class", "changeTextBarMsg");
								 $("#idChkResult").text("이미 등록된 아이디입니다. 다른 아이디를 입력해 주세요.");
							 }
							 
						  }, error : function(data) {
							  
				          }
						  
						}); 
				   
			   } else {
				   $("#idChkBar").css("display", "inline-block");
				   $("#idChkResult").attr("class", "changeTextBarMsg");
				   $("#idChkResult").text("아이디는 영문소문자/숫자로 최대 20자까지만 사용가능합니다.");
			   } // 아이디 정규식 체크
			   
		   } else if (userId.length > 20) { // 작성한 아이디의 길이가 20자 이상일 때
			   $("#idChkBar").css("display", "inline-block");
			   $("#idChkResult").attr("class", "changeTextBarMsg");
			   $("#idChkResult").text("아이디는 영문소문자/숫자로 최대 20자까지만 사용가능합니다.");
		   } // 아이디 길이 체크
		   
	   }
	   
   
   
   
   
   
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
	margin: 0 auto;
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
	font-weight: bold;
}

.registerTable {
	width: 900px;
	border-top: 1px solid;
}

.textBarInfo {
	font-size: 12px;
	font-weight: bold;
    margin-left: 5px;
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

.changeTextBarMsg {
	color: #ea2940;
    font-size: 12px;
    font-weight: bold;
}

.serviceable {
    font-size: 12px;
    font-weight: bold;
}

.searchPost {
	height: 33px;
    border: 1px solid #dbdbdb;
    font-size: 13px;
    background-color: #f9f9f9;
    margin-left: 5px;
    margin-bottom: 5px;
}

.resultPost {
	margin-top: 5px;
    margin-bottom: 10px;
    font-size: 13px;
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
					<form action="" id="saveNewMember">
						<table class="registerTable">
							<tr>
								<th class="tableTitleSize">아이디</th>
								<td class="tableContentSize">
									<div>
									<input type="text" id="userId" name="member_id" maxlength="40" size="40" onkeyup="userIdCheck();" />
									<span class="textBarInfo">(영문소문자/숫자, 4~20자)</span>
									</div>
									<div id="idChkBar">
									<span class="serviceable" id="idChkResult"></span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">비밀번호</th>
								<td class="tableContentSize">
									<div>
									<input type="password" name="member_password" id="member_password" maxlength="40" size="40" onblur="checkUserPwdSize();"/>
									<span class="textBarInfo">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span>
									</div>
									<div id="pwdChkBar1">
									<span class="changeTextBarMsg" id="pwdChkContent"></span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">비밀번호 확인</th>
								<td class="tableContentSize">
									<div>
									<input type="password" id="reCheckPwd" maxlength="40" size="40" onblur="reconfirmUserPwd();"/>
									</div>
									<div id="pwdChkBar2">
									<span class="changeTextBarMsg" id="pwdReChkContent"></span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">이름</th>
								<td class="tableContentSize">
									<div>
									<input type="text" name="member_name" id="member_name" maxlength="40" size="40" onblur="checkUserName();"/>
									</div>
									<div id="userNameBar">
									<span class="changeTextBarMsg" id="userNameCheck"></span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">성별</th>
								<td class="tableContentSize">
									<div>
									<input type="radio" name="member_gender" value="남" checked/><span class="genderSideMan">남</span>
									<input type="radio" name="member_gender" value="여" /><span class="genderSideWoman">여</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">생년월일</th>
								<td class="tableContentSize">
									<div>
										<input type="hidden" name="member_birth" id="member_birth" />
										<span>
											<input type="text" maxlength="4" placeholder="년(4자)" id="userBirthYear" class="birthYear" onkeyup="onlyNumberChk(this)"/>-
										</span>
										<span>
											<select class="birthMonth" id="userBirthMonth">
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
											-<input type="text" maxlength="2" placeholder="일" id="userBirthDate" class="birthDate" onkeyup="onlyNumberChk(this)"/>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">이메일</th>
								<td class="tableContentSize">
									<div>
										<input type="text" size="40" name="member_email" value="qwe@nd.com" readonly/>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">휴대전화</th>
								<td class="tableContentSize">
									<div>
										<input type="hidden" name="member_mobile" id="member_mobile" />
										<span>
											<select class="phoneFirst" id="phoneFirst">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
										</span>
										<span>
											-<input type="text" maxlength="4" id="phoneSecond" class="phoneSecond" onkeyup="onlyNumberChk(this)"/>-
										</span>
										<span>
											<input type="text" maxlength="4" id="phoneThird" class="phoneThird" onkeyup="onlyNumberChk(this)"/>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">주소</th>
								<td class="tableContentSize">
									<input type="text" id="sample6_postcode" name="member_postCode" style="font-size: 13px;" readonly>
									<input type="button" onclick="sample6_execDaumPostcode();" class="searchPost" value="우편번호 찾기">
									<br>
									<input type="text" class="resultPost" id="sample6_address" name="member_addr" size="55" readonly>
									<span class="textBarInfo">기본주소</span>
									<br>
									<input type="text" id="sample6_detailAddress" name="member_addrDetail" size="55" style="font-size: 13px;">
									<span class="textBarInfo">나머지주소 (선택입력가능)</span>
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
							<button type="button" class="registerBtnSubmit" onclick="checkAllContent();">회원가입</button>
						</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>
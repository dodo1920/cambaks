<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function displayWarn(){
		if(document.getElementById('chkCookie').checked){
			alert("자동 로그인 기능은 공공장소에서는 사용하지 마세요!");
			return true;
		}
	}

</script>



</head>
<body>

	<h3>Login Page</h3>

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
	



	
</body>
</html>
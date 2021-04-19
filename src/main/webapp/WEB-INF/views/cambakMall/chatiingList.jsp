<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 제이쿼리 -->
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<body>

	<c:forEach var="item" items="${ChattingList }">
		<div>${item.member_id }</div>
		<div><a href="../adminChatting?id=${item.member_id }">${item.chatting_content }</a></div>
		<hr>
	</c:forEach>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../resources/mallMain/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/mallMain/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/mallMain/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../resources/mallMain/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/mallMain/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../resources/mallMain/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/mallMain/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/mallMain/css/style.css" type="text/css">
  
  <script src="../resources/plugins/jquery/jquery.min.js"></script>  
  
  <script>
  	
  	
  </script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<div class="content-wrapper">
		<h1>체크</h1>
		
		<!-- 
		<c:choose>
			<c:when test="${boardList != null}">
				<table class="table table-condensed">
                  <thead>
                     <tr>
                        <th>글번호</th>
                        <th>글제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>좋아요</th>
                     </tr>
                  </thead>
                  <c:forEach var="board" items="${boardList }" varStatus="status">
                  	<c:choose>
                  		<c:when test="${board.prodReview_isDelete == 'Y' }">
                  			<tr>
                        <td><strike>${board.prodReview_no }</strike></td>
                        <td>
                        
                        <strike>${board.prodReview_title}</strike>
                        </td>
                        <td><strike>${board.member_id }</strike></td>
                        <td><strike><span class="sendTime" id="${status.count }"><fmt:formatDate
                                 value="${board.prodReview_postDate }" type="both"
                                 pattern="yyyy-MM-dd HH:mm:ss" /></span></strike></td>
                     </tr>
                  		</c:when>
                  	
                  	<c:otherwise>
                     <tr>
                        <td>${board.prodReview_no }</td>
                        <td>
                        
                        
                        <a href="/board/read?no=${board.prodReview_no }">
                         
                           ${board.prodReview_title }
                        
                        </a></td>
                        <td>${board.member_id }</td>
                        <td><span class="sendTime" id="${status.count }"><fmt:formatDate
                                 value="${board.prodReview_postDate }" type="both"
                                 pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
                     </tr>
                     </c:otherwise>
                     </c:choose>
                  </c:forEach>
               </table>
               
               <div>
                  <button type="button" class="btn btn-info"
                     onclick="location.href='/board/register'">글쓰기</button>
               </div>
               
               
			</c:when>
		<c:otherwise>
			게시물이 존재하지 않거나, 데이터를 얻어오지 못했습니다.
		</c:otherwise>
		</c:choose>
		 -->
	</div>
	
</body>
</html>
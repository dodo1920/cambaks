<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CambakMall</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../../resources/mallMain/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/style.css" type="text/css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
	@media (min-width: 768px) {
		.col-sm-2  {
			width : 8.5%;
			}
	}		
</style>
<body>

<%@include file="mallHeader.jsp" %>

 		<div class="content-wrapper">
    		<div class="container">
		      <h1>게시판 글쓰기 페이지</h1><hr />
		
		         <form action="/mall/prodDetail/prodQAForm?prodId=${param.prodId }" method="post">
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="member_id">작성자 :</label>
		               <div class="col-sm-10">
		                  <input type="text" class="form-control" id="member_id" name="member_id" value="${loginMember.uid}">
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_title">분 류 :</label>
		               <div class="col-sm-10">
		                  <select id="prodQA_category" name="prodQA_category" class="form-control">
		                  	<option value="product">상품</option>
		                  	<option value="delivery">배송</option>
		                  	<option value="refund">환불</option>
		                  	<option value="exchange">교환</option>
		                  	<option value="ect">기타</option>
		                  </select>
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_title">제 목 :</label>
		               <div class="col-sm-10">
		                  <input type="text" class="form-control" id="prodQA_title" name="prodQA_title">
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_content">내 용 :</label>
		               <div class="col-sm-10">
		                  <textarea rows="10" cols="30" class="form-control" id="prodQA_content" name="prodQA_content"></textarea>
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="file1">파 일1 :</label>
		               <div class="col-sm-10">
		                  <input type="file" class="form-control" id="file1" name="file1">
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="file2">파 일2 :</label>
		               <div class="col-sm-10">
		                  <input type="file" class="form-control" id="file2" name="file2">
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="file3">파 일3 :</label>
		               <div class="col-sm-10">
		                  <input type="file" class="form-control" id="file3" name="file3">
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_secretPassword">비밀번호 :</label>
		               <div class="col-sm-10">
		                  <input type="password" class="form-control" id="prodQA_secretPassword" name="prodQA_secretPassword">
		               </div>
		            </div>
		           	<div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_isSecret">비밀글 :</label>
		               <div class="col-sm-10">
		                  <input type="checkbox" class="form-control" id="prodQA_isSecret" name="prodQA_isSecret">
		               </div>
		            </div>
		            <div class="form-group">
		               <div class="col-sm-offset-2 col-sm-10">
		                  <button type="submit" class="btn btn-success">저장</button>
		                  <button type="button" class="btn btn-danger" onclick="location.href='/mall/prodDetail/main?prodId=' + ${param.no}">취소</button>
		               </div>
		            </div>
		         </form>
		      </div>
		</div>

<%@include file="mallFooter.jsp" %>


<!-- Js Plugins -->
<script src="resources/mallMain/js/jquery-3.3.1.min.js"></script>
<script src="resources/mallMain/js/bootstrap.min.js"></script>
<script src="resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="resources/mallMain/js/jquery-ui.min.js"></script>
<script src="resources/mallMain/js/mixitup.min.js"></script>
<script src="resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="resources/mallMain/js/jquery.slicknav.js"></script>
<script src="resources/mallMain/js/owl.carousel.min.js"></script>
<script src="resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="resources/mallMain/js/main.js"></script>


</body>
</html>
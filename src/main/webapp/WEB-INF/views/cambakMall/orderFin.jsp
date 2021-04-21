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
<body>
<%@include file="mallHeader.jsp" %>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Breadcrumb Begin -->
  
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Women’s </a>
                        <span>Essential structured blazer</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
      <section class="shop-cart spad">
      <div class="container">
      <!-- 본문 시작 -->
      <!-- 주문완료 안내 start -->
      <h2>주문이 성공적으로 완료되었습니다.</h2>
      <div>주문번호 : ㅇㅇㅇㅇㅇㅇ</div>
     
      <!-- 주문완료 안내 end -->
      <!-- 배송지 정보 start -->
       <div>
    
    <div class="tbl_wrap" style="margin-top:50px">
    
    	<table class="table table-bordered">
    	<colgroup>
    		<col style="width:160px;">
    		<col>
    	</colgroup>
    	<tbody id="table_in">
    	<tr>
    		<th colspan="2" >배송지 정보</th>
    	</tr>
    	
    		
    		<tr>
    			<td>이름</td>
    			<td id="user_name">배송지 선택 버튼을 클릭해주세요</td>
    			
    		</tr>
    		<tr>
    			<td>연락처</td>
    			<td id="user_number">배송지 선택 버튼을 클릭해주세요</td>
    		</tr>
    		<tr>
    			<td>주소</td>
    			<td id = "user_dest">배송지 선택 버튼을 클릭해주세요</td>
    			
    		</tr>
    		<tr>
    			<th colspan="2">결제정보</th>
    			
    		</tr>
    		<tr>
    			<td>결제 수단</td>
    			<td id="user_name">카드</td>
    			
    		</tr>
    		<tr>
    			<td>결제시간</td>
    			<td id="user_number">몇월 몇일 몇시</td>
    		</tr>
    		
    		<tr>
    		<th colspan="2" >금액정보</th>
    	</tr>
    	<tr>
    			<td>금액</td>
    			<td>얼마얼마 얼마</td>
    		</tr>
    		
    	</tbody>
    	</table>
    	<input type="hidden" name="destination_no" value="" id="destination_no">
    </div>
     <div style="text-align:right">
      	<a href="localhost:8081" class="btn btn-info" role="button">메인화면으로</a>
      </div>
    </div>
    <!-- 배송지 선택 테이블 end -->
    
      <div>
   
  
    </div>
      
      
      
      
      <!-- 본문 END  -->
      
      
      </div>
	</section>
	   <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->
	<%@include file="mallFooter.jsp" %>
	<!-- Js Plugins -->
<script src="../../resources/mallMain/js/jquery-3.3.1.min.js"></script>
<script src="../../resources/mallMain/js/bootstrap.min.js"></script>
<script src="../../resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="../../resources/mallMain/js/jquery-ui.min.js"></script>
<script src="../../resources/mallMain/js/mixitup.min.js"></script>
<script src="../../resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="../../resources/mallMain/js/jquery.slicknav.js"></script>
<script src="../../resources/mallMain/js/owl.carousel.min.js"></script>
<script src="../../resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="../../resources/mallMain/js/main.js"></script>
<script src="../../resources/mallMain/js/cambakMallCommon.js"></script>

</body>
</html>
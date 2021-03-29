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
.tbl_wrap{
	vertical-align: middle;
}
</style>
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
      
    <!-- 배송지 선택 테이블 start -->
    <form>
    <div>
    <h2>배송지 정보</h2>
    <div class="tbl_wrap">
    
    	<table class="table">
    	<colgroup>
    		<col style="width:160px;">
    		<col>
    	</colgroup>
    	<tbody>
    		<tr>
    			<th>배송지 선택</th>
    			<td>
    			<select style="width:100px;">
    				<option>배송지1</option>
    				<option>배송지2</option>
    				<option>배송지3</option>
    			</select>
    			<button type="button" class="btn btn-info">배송지 관리</button>
    			<button type="button" class="btn btn-info">+새로운 주소</button>
    			</td>
    		</tr>
    		<tr>
    			<th>이름</th>
    			<td>이름 출력</td>
    		</tr>
    		<tr>
    			<th>연락처</th>
    			<td>연락처 출력</td>
    		</tr>
    		<tr>
    			<th>주소</th>
    			<td>주소 출력란 인천광역시 부평구 부개로 58 어쩌구저꺼추 어쩌구 저쩌구 어쩌구 저쩌구</td>
    			
    		</tr>
    		<tr>
    			<th>배송메모</th>
    			<td>
    			<select>
    				<option>부재시 경비실에 맡겨주세요</option>
    				<option>부재시 문앞에 놔주세요</option>
    				<option>부재시 핸드폰으로 연락주세요</option>
    				<option>배송전 반드시 연락주세요</option>
    				<option>배송전 반드시 연락주세요</option>
    			</select>
    			</td>
    		</tr>
    	</tbody>
    	</table>
    </div>
    </div>
    <!-- 배송지 선택 테이블 end -->
    <!-- 주문 상품 정보 테이블 start -->
    <div style="margin-top:50px">
    <h2>주문상품 정보</h2>
    <table class="table">
    	<thead>
    	<tr>
    		<th colspan="2">상품정보</th>
    		<th>상품금액</th>
    		<th>할인금액</th>
    		<th>배송비</th>
    		<th>주문금액</th>
    	</tr>
    	</thead>
    	<tbody>
    	<tr>
    		<td><img alt="" src="../../resources/img/test.jpg" style="width:100px"> </td>
    		<td>컵누들</td>
    		<td>10,000<i>원</i></td>
    		<td>0<i>원</i></td>
    		<td>2500<i>원</i></td>
    		<td>12,500<i>원</i></td>
    	</tr>
    	</tbody>
    	<tfoot>
    		<tr>
    			<td colspan="6">
    				<div>
    					<ul style="float:right; margin-right:80px; font-style:normal; list-style:none;">
    						<li>
    							<em style="margin-right:10px; margin-bottom:10px;font-style:NORMAL">상품 금액</em>
    							<span>
    							<em>3,000</em><i>원</i>
    							</span>
    						</li>
    						<li>
    							<em style="margin-right:10px;margin-bottom:10px;font-style:NORMAL">할인 금액</em>
    							<span><em>3,000</em><i>원</i></span>
    						</li>
    						<li>
    							<em style="margin-right:10px;margin-bottom:10px;font-style:NORMAL">배송 금액</em>
    							<span><em>2,500</em><i>원</i></span>
    						</li>	
    					</ul>
    				</div>
    			</td>
    			</tr>
    			<tr>
    			<td colspan="6">
    				<div>
    					<em>적립 예정 금액</em>
    					<span style="float:right;margin-right:80px"><em>1,000</em><i>원</i></span>
    				</div>
    			</td>
    			</tr>
    			<tr>
    			<td colspan="6">
    				<div>
    					<em>총 주문금액</em>
    					<span style="float:right;margin-right:80px"><em>11,000</em><i>원</i></span>
    				</div>
    			</td>
    			</tr>
    	</tfoot>
    	
    </table>
    
    
    </div>
    <!-- 주문 상품 정보 테이블 end -->
    <!-- 결제 방법테이블 테이블 start -->
    <div>
    	<h2>결제 방법 선택</h2>
    	<div>
			<div>
				 <table class="table">
					<thead>
						<tr>
							<th>결제방법</th>
							<th>
							<label class="radio-inline"><input type="radio" name="optradio" value="무통장입금" checked>무통장입금</label>
							<label class="radio-inline"><input type="radio" name="optradio" value="카드">카드</label>
							<label class="radio-inline"><input type="radio" name="optradio" value="계좌이체">계좌이체</label>
							</th>
							</tr>
							<tr>
							
							
							
						</tr>
					</thead>
				</table>
			</div>    
   		</div>
    </div>
    
    <!-- 결제 방법테이블 테이블 end -->
    <!-- 약관동의 테이블 start -->
    <div>
    	<h2>약관동의</h2>
    	<div>
    		<div>
    			<dl>
    				<dt>
    					 <label><input type="checkbox" value="">Option 1</label>
    				</dt>
    			</dl>
    		</div>
    	</div>
    </div>
    </form>
    <!-- 약관동의 테이블 end -->


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

</body>
</html>
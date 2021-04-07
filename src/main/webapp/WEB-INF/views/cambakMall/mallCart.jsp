<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ashion | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="../../resources/mallMain/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/elegant-icons.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/magnific-popup.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../../resources/mallMain/css/style.css"
	type="text/css">
	
<style type="text/css">
button.btn.btn-default.cntCh {
    background: lightgrey;
}

.cntChBtn-wrap {
    padding-left: 7px;
}

.totCnt-wrap {
    margin-left: 86%;
    margin-bottom: 20px;
    font-size: 20px;
    font-weight: 600;
}

.col-lg-6.col-md-6.col-sm-6.cart-btn {
    margin-left: 51%;
}
</style>
</head>

<body>
	<%@include file="mallHeader.jsp"%>

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <span>Shopping
							cart</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Cart Section Begin -->
	<section class="shop-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shop__cart__table">
						<table>
							<thead>
								<tr>
									<th>Product</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
								<!-- --------------------------------------------------------------- -->
								<tr>
									<td class="cart__product__item"><img
										src="../../resources/mallMain/img/shop-cart/cp-1.jpg" alt="">
										<div class="cart__product__item__title">
											<h6>활활 화로</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
										</div></td>
									<td class="cart__price">￦ 6,000</td>
									<td class="cart__quantity">
										<div class="pro-qty">
											<input type="text" value="10">
										</div>
										<div class="cntChBtn-wrap">
											<button type="button" class="btn btn-default cntCh">수량 변경</button>
										</div>
									</td>
									<td class="cart__total">￦ 60,000</td>
									<td class="cart__close"><span class="icon_close"></span></td>
								</tr>
								<!-- --------------------------------------------------------------- -->
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="totCnt-wrap">합계 : ￦ 50,000</div>
			</div>
			
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 cart-btn">
					<div class="cart__btn update__btn">
						<button type="button" class="btn btn-default cntCh">계속 쇼핑하기</button>
						<button type="button" class="btn btn-default cntCh">주문하기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Cart Section End -->

	<!-- Instagram Begin -->
	<!--     <div class="instagram"> -->
	<!--         <div class="container-fluid"> -->
	<!--             <div class="row"> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-1.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-2.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-3.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-4.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-5.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-6.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--             </div> -->
	<!--         </div> -->
	<!--     </div> -->
	<!-- Instagram End -->

	<%@include file="mallFooter.jsp"%>

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
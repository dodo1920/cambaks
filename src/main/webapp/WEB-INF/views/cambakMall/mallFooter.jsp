
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<head>
 <meta charset="UTF-8">
 
 <script>
 
 $(window).on("scroll", function(){
	if($(window).scrollTop() > 1000){
		
		$(".top").css("display","block")
	}else{
		$(".top").css("display","none")

	} 
	 
	 
 });
 
 
 
 
 
 $(function(){
	
// 	  $(html).scroll(function(){
// 		  var scrollTop = $(this).scrollTop();
// 	      var innerHeight = $(this).innerHeight();
// 	      var scrollHeight = $(this).prop('scrollHeight');
	      
// 	      if (scrollTop + innerHeight >= scrollHeight - 100) {
// 	    		alert("!");
	    		
// 	    		console.log(scrollTop);
// 	    		console.log(innerHeight);
// 	    		console.log(scrollHeight);
// 	      } 
// 	});
	  
	 
 });
 
 
 
 </script>
 
 
 <style>
 
 .top{
    left: 90%;
    width: 40px;
    position: fixed;
    bottom: 80px;
    display: none;
 }
 
 #main-sidebar{
 	left: 90%;
    width: 110px;
    position: fixed;
    top: 150px;
    display: block;
 
 }
 
 .recently-viewed-products, side-cart{
     background-color: darkolivegreen;
 }
 
  #main-sidebar strong{
		color:white;
		
 }
 .recently-viewed-page{
 
 }
 
 </style>
 
 
 
</head>

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-7">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#" style="font-size: 38px;color: black;font-weight: bold;">캠박몰</a>
                    </div>
                    <p>김도연, 장원영, 김대기, 김정민, 이영광, 서효원, 백승권, 김태훈, 박종진</p>
              
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-5">
                <div class="footer__widget">
                    <h6>빠른 메뉴</h6>
                    <ul>
                        <li><a href="#">상품 전체 보기</a></li>
                        <li><a href="#">1:1문의</a></li>
                        <li><a href="#">캠박이일</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-4">
                <div class="footer__widget">
                    <h6>마이 페이지</h6>
                    <ul>
                        <li><a href="#">게시판 관리</a></li>
                        <li><a href="#">주문 현황</a></li>
                        <li><a href="#">결제 내역</a></li>
                        <li><a href="#">배송지 관리</a></li>
                    </ul>
                </div>
            </div>
		</div>
		
		
		
		<section id="main-sidebar">
	        <div class="side-cart"><a href="#" title="장바구니"><strong>장바구니</strong><em class="cart-count">0</em></a></div>
		        <div class="recently-viewed-products" >
		            <strong>최근본상품</strong>
		            <em class="total-element">0</em>
		        </div>
		        <div class="recently-viewed-list">
		            <ul class="recently-viewed-page" data-href="" style="display: block;"><li class="no-item">최근본 상품이<br>없습니다.</li></ul>
		           
	        </div>
   		 </section>
	  
	  
        <a onclick="window.scrollTo(0,0);" id="sideTop" class="top" title="맨 위로 가기" >
		<img src="/resources/img/pageUp.png" />
		</a>
		

        
        
		
		
        <div class="row">
            <div class="col-lg-12">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <div class="footer__copyright__text">
                    <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> 서울특별시 구로구 시흥대로163길 33 2층, 3층 캠박몰 사무실<i class="fa fa-heart" aria-hidden="true"></i> by <a href="#" target="_blank">캠박이일</a></p>
                </div>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

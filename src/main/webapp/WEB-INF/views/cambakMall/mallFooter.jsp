<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<<<<<<< HEAD
 <meta charset="UTF-8">
 
 <script>
 
 
	
 $(window).on("scroll", function(){
	if($(window).scrollTop() > 800){
		$(".top").css("display","block");
		$("#main-sidebar").css("display","block");
// 		$(".radios").css("display","block");
	}else{
		$(".top").css("display","none");
		$("#main-sidebar").css("display","none");
// 		$(".radios").css("display","none");
	} 
	  
 });
 
 
 
 $(function(){
	
	 getRecentlyProduct();
	 
// 	 if(${loginMember.member_id != null}){
// 		 console.log("접속한 유저가 있다");
// 		 getChkListYet();	 
// 	 }	
	 
 });
 
 function getRecentlyProduct(){
		
		let recentlyOutput = "";	
	 $.getJSON("/mall/main/getRecentlyProduct", function(data){
		
	
			$("#RecentlySection").html("");
	        isdata = data.length;
	        console.log(isdata + "is data는");
	   		$(data).each(function(index, item){
				recentlyOutput += '<a href="/mall/prodDetail/main?prodId=' + this.product_id + '"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/' + this.product_img1 + '"/><span>' + this.product_name + '<br/>' + this.product_sellPrice + '</span></li></a>';
		});
			recentlyOutput += '</ul>';
			$("#RecentlySection").html(recentlyOutput);
			$("#recentlyCntOutput").text(isdata);
	 });
	 
	
 
 }
		
	
//  function getChkListYet(){
// 	 	let member_id = "${loginMember.member_id}";
// 	 	console.log(member_id);
// 		$.ajax({
// 			method: "get",
// 			url: "/mall/main/getChkListYet",
// 			dataType: "text", // 응답 받는 데이터 타입
// 			data : {"member_id" : member_id
// 			},
// 			success : function(result){
					
// 					$("#CheckListCnt").html("체크리스트 (" + result + ")개");
				
// 			}
// 		});
	
//  }
 
 
// 	 function viewCheckList(){
		 
// 		 console.log($("#chklistIframe").css("display"));
// 				if($("#chklistIframe").css("display") == "none"){
// 					 console.log("체크리스트 열리기");
// 					 $("#chklistIframe").css("display","block");
// 					 $("#CheckListCnt").html("체크리스트 닫기");
// 					 $(".radios").css("background-color","greenyellow");
			
// 				}else{
// 					 $("#chklistIframe").css("display","none");
// 					console.log("체크리스트 닫히기");
// 					getChkListYet();
// 					 $(".radios").css("background-color","#fff");
// 				} 
// 		 }
 

 
 </script>
 
 
 <style>
 
 .top{
    left: 90%;
    width: 40px;
    position: fixed;
    bottom: 80px;
    display: none;
    cursor: pointer;
 }
 
 #main-sidebar{
 	left: 88%;
    width: 110px;
    position: fixed;
    top: 150px;
    display: none;
 
 }
 
 .recently-viewed-products, .side-cart{
    background-color: indigo;
    padding: 7px;
    font-size: 13px;
 }
 
  #main-sidebar strong{
		color:white;
 }

  #main-sidebar em{
		color:YELLOW;
 }


 .recently-viewed-page{
 	
 	border: solid 1px darkgray;
    font-size: 12px;
    display: block;
    font-weight: bold;
    list-style: none;
    min-height: 335px;
 }
 
 .no-item{
 text-align: center;
 padding: 150px 0px 0px;
 
 }
 
 .recently-item{
 padding: 3px;
 text-align: center;
 margin-top: 15px;
 }
 
 .radios{
    left: 77%;
    bottom: 75px;
    width: 165px;
	display: inline-block;
    position: fixed;
    right: 13px;
    height: 50px;
    padding: 0 20px 0 20px;
    border-radius: 25px;
    border: 1px solid #555;
    background-color: #fff;
    -webkit-box-shadow: 0 5px 14px 0 rgb(0 0 0 / 10%);
    box-shadow: 0 5px 14px 0 rgb(0 0 0 / 10%);
    font-size: 14px;
    line-height: 48px;
    letter-spacing: -.3px;
    color: #333;
    -webkit-transition: right .4s;
    transition: right .4s;
    z-index: 10;
    display:none;
    
 }
 

 
 </style>
 
 
 
=======
<script>
$(window).on("scroll", function(){
	if($(window).scrollTop() > 1000){
		$(".top").css("display","block")
	}else{
		$(".top").css("display","none")
	} 
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
>>>>>>> 3c4ad411fb08fba013ee77f2122666164f2ee964
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
	            <div class="recently-viewed-products" >
		            <strong>최근본상품</strong>
		            <em class="total-element" id="recentlyCntOutput"> 0 </em>
		        </div>
		        <div class="recently-viewed-list">
		            <ul class="recently-viewed-page" id="RecentlySection" style="display: block;">
<%-- 		            <c:if test="${para.viewRecently0 == null }"> --%>
						 <li class="no-item">최근본 상품이<br>없습니다.</li>
<%-- 				    </c:if> --%>
				    
<%-- 				    <c:if test="${para.viewRecently0 != null }"> --%>
<%-- 						 <a href="/mall/prodDetail/main?prodId=${para.viewRecently0.product_id }"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/${para.viewRecently0.product_img1 }"/><span>${para.viewRecently0.product_name }<br/><fmt:formatNumber value="${para.viewRecently0.product_sellPrice }" pattern="#,###원" /></span></li></a> --%>
<%-- 				    </c:if> --%>
<%-- 				    <c:if test="${para.viewRecently1 != null }"> --%>
<%-- 						 <a href="/mall/prodDetail/main?prodId=${para.viewRecently1.product_id }"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/${para.viewRecently1.product_img1 }"/><span>${para.viewRecently1.product_name }<br/><fmt:formatNumber value="${para.viewRecently1.product_sellPrice }" pattern="#,###원" /></span></li></a> --%>
<%-- 				    </c:if> --%>
<%-- 				    <c:if test="${para.viewRecently2 != null }"> --%>
<%-- 						 <a href="/mall/prodDetail/main?prodId=${para.viewRecently2.product_id }"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/${para.viewRecently2.product_img1 }"/><span>${para.viewRecently2.product_name }<br/><fmt:formatNumber value="${para.viewRecently2.product_sellPrice }" pattern="#,###원" /></span></li></a> --%>
<%-- 				    </c:if> --%>
				           
<!-- 		         </ul> -->
		           
	        </div>
   		 </section>
	  
<!-- 	  	<div class="radios" id="checkListCntContainer" style="cursor:pointer;" onclick="viewCheckList();"> -->
<!-- 	  		<div id="chklistIframe"  style=" position: fixed; display:none; left:29%; top:20%; width:600px; height: -webkit-fill-available; overflow:hidden; max-height: 747px;"> -->
	  		
<!--   			<iframe style="border: none; width: 100%;height:-webkit-fill-available; "src="../../../myPage/checkList"></iframe> -->
  			
<!--   			</div> -->
<!-- 	  		<span id="CheckListCnt" style="margin-left: 15px; ">체크리스트(회원 전용)</span> -->
<!-- 	  	</div> -->
	  
	  
	  
        <a onclick="window.scrollTo(0,0);" id="sideTop" class="top" title="맨 위로 가기" >
		<img src="/resources/img/pageUp.png" />
		</a>
<<<<<<< HEAD
		

		
		<div class="row">
=======
        <div class="row">
>>>>>>> 3c4ad411fb08fba013ee77f2122666164f2ee964
            <div class="col-lg-12">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <div class="footer__copyright__text">
                    <p>Copyright © <script>document.write(new Date().getFullYear());</script>2021 All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                </div>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </div>
        </div>
        
    </div>
</footer>
<!-- Footer Section End -->

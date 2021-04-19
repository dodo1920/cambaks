<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>캠박몰</title>

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
 
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<script>

let loginUser = '${loginMember.member_id}';

 $(document).ready(function() {

	
 });

 
//******** 종진 메인페이지 장바구니 기능 *************//

	 
// 	 function goCheckBuckets(data) {
	
// 			if(loginUser == ""){
// 				alert("로그인 후 이용가능합니다.");
// 			}else{

// 				let product_id = parseInt(data);
// 				console.log(typeof(product_id));
// 				console.log(loginUser);
// 				$.ajax({
// 		 			method: "get",
// 		 			url: "/mall/main/insertBucekt",
// 		 			dataType: "text", // 응답 받는 데이터 타입
// 		 			data : {"member_id" : loginUser,
// 	 					"product_id" : product_id
// 		 			},
// 		 			success : function(result){
							
// 		 					alert("성공");
// 		 			}
// 		 		});
				
// 			}
// 		}
	 
 
//******** 종진 메인페이지 장바구니 기능 *************//



 
 // ******** 종진 메인페이지 검색 기능 *************//
 function getShearchPage(){	
	 
	 let searchVal = $("#search-input").val();
	 if(searchVal == null){
		 alert("검색 값을 입력해주세요.");
	 }else{
		 location.href="/mall/Search?keyword=" + searchVal + "?page=1";
	 }
	 
 }
 
 function enterkeysearchProduct(searchval){
	
	 if (window.event.keyCode == 13) {
		 let searchgoValue = searchval.value;
		 	
			 if(searchgoValue == ""){
				 alert("검색 값을 입력해주세요.");
			 }else{
				 location.href="/mall/Search?keyword=" + searchgoValue + "?page=1";
			 }
	
	 	}
 }
 
//******** 종진 메인페이지 검색 기능 *************//
 
 

 
</script>



<style>
	.middleCategory_Title{
		margin-left:15px;
	}
	.filerCategory_Middle{
    	margin-left: 135px;
	}

	.noneReivews{
	    font-size: 10px;
	    font-weight: bold;
	    color: lightsteelblue;
	}


</style>


</head>
<body>


	<%@include file="mallHeader.jsp" %>


    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 p-0">
                    <div class="categories__item categories__large__item set-bg" data-setbg="https://media.istockphoto.com/photos/caravan-on-the-road-picture-id945563108?k=6&m=945563108&s=612x612&w=0&h=e_6c9bZppoxZL3mGm_SkiCBObSEyom0M-QT3Tw0rFeE=">
<!--                     <div class="categories__item categories__large__item set-bg" data-setbg="https://media.istockphoto.com/photos/family-vacation-travel-rv-holiday-trip-in-motorhome-picture-id1063280128?k=6&m=1063280128&s=612x612&w=0&h=hIPDvolZtkXuHG1yXHHOcNVsu1ttLQhD5yrsc5S38PQ="> -->
                    <div class="categories__text">
                        <h1 style="color:white;"> 전체 상품 </h1>
                        <p style="color:white;">#텐트 #타프 #침낭 #매트 #경량 테이블 #체어 #랜턴 #담요 #쿨러/아이스박스 #착화제 #화로대 #수납 #설거지용품 #식기/일반 #버너</p>
                        <a style="color:white;" href="#">Shop now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="https://cdn.pixabay.com/photo/2017/08/17/08/08/camp-2650359__340.jpg">
                            <div class="categories__text">
                                <h4 style="color:white;">텐트/타프</h4>
                                <p style="color:white;"> ${para.total[0].totcount} items</p>
                                <a style="color:white;" href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="https://cdn.pixabay.com/photo/2017/08/06/08/36/travel-2590326__340.jpg">
<!--                         <div class="categories__item set-bg" data-setbg="https://cdn.pixabay.com/photo/2016/03/31/18/27/blue-1294371__340.png"> -->
                            <div class="categories__text">
                                <h4 style="color:white;">침낭/매트</h4>
                                <p style="color:white;" >${para.total[1].totcount} items</p>
                                <a style="color:white;" href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="https://cdn.pixabay.com/photo/2019/09/16/19/58/table-4481942__340.jpg">
                            <div class="categories__text">
                                <h4 style="color:white;">테이블/체어/배트</h4>
                                <p  style="color:white;">${para.total[2].totcount} items</p>
                                <a style="color:white;" href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="https://media.istockphoto.com/photos/vintage-lantern-on-the-log-in-the-evening-picture-id1190263200?k=6&m=1190263200&s=612x612&w=0&h=DN4Xj1Pep50FRII3IwYFL8HzCkGxKHjn0k3TrqARphs=">
                            <div class="categories__text">
                                <h4 style="color:white;">화로/히터</h4>
                                <p style="color:white;">${para.total[0].totcount} items</p>
                                <a style="color:white;" href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->


<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="middleCategory_Title">
            
        
            <input type="text" id="search-input"  onkeydown="enterkeysearchProduct(this);" style="width: 620px; margin-left:200px; margin-bottom: 30px; text-align:center; font-size: 25px; border: none; border-bottom: 2px solid #dddddd; background: 0 0;  color: #999;" placeholder="상품명 검색하기. . . . ."  autocomplete="off" />
       		<button type="button" onclick="getShearchPage();" class="btn btn-danger">Search</button>
        
                <div class="section-title">
                    <h4>New product</h4>
                </div>
            </div>
            <div class="filerCategory_Middle">
                <ul class="filter__controls">
                    <li class="active" data-filter="*">전체</li>
                    <li data-filter=".tent">텐트/타프</li>
                    <li data-filter=".sleepmatt">침낭/매트</li>
                    <li data-filter=".table">테이블/체어/배트</li>
                    <li data-filter=".light">랜턴</li>
                    <li data-filter=".accessories">액세서리</li>
                    <li data-filter=".heater">화로/히터</li>
                    <li data-filter=".case">수납/케이스</li>
                    <li data-filter=".kitchen">키친/취사용품</li>
                </ul>
            </div>
        </div>
        <div class="row property__gallery">
          	
        <c:forEach var="NewProduct1" items="${para.NewProduct1 }" varStatus="status">
			     <div class="col-lg-3 col-md-4 col-sm-6 mix tent">
	                <div class="product__item">
	                    <div class="product__item__pic set-bg" data-setbg="${NewProduct1.product_img1 }">
	                        <div class="label new">New</div>
	                        <ul class="product__hover">
	                            <li><a onclick="goCheckBuckets(${NewProduct1.product_id});" ><span class="icon_bag_alt"></span></a></li>
	                        </ul>
	                    </div>
	                    <div class="product__item__text">
	                        <h6><a href="/mall/prodDetail/main?prodId=${NewProduct1.product_id }">${NewProduct1.product_name }</a></h6>
	                        
	                   <div class="rating">
	                   
			              			<c:if test="${NewProduct1.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
								    
								    <c:if test="${NewProduct1.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
								    
				              		<c:if test="${NewProduct1.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct1.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct1.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct1.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
	                        
	                        <div class="product__price"><fmt:formatNumber value="${NewProduct1.product_sellPrice}" pattern="#,###원" /></div>
	                    </div>
	                </div>
	             </div>
			</c:forEach>
        
        	
        <c:forEach var="NewProduct2" items="${para.NewProduct2 }" varStatus="status">
			     <div class="col-lg-3 col-md-4 col-sm-6 mix sleepmatt">
	                <div class="product__item">
	                    <div class="product__item__pic set-bg" data-setbg="${NewProduct2.product_img1 }">
	                        <div class="label new">New</div>
	                        <ul class="product__hover">
	                            <li><a onclick="goCheckBuckets(${NewProduct2.product_id});"><span class="icon_bag_alt"></span></a></li>
	                        </ul>
	                    </div>
	                    <div class="product__item__text">
	                        <h6><a href="/mall/prodDetail/main?prodId=${NewProduct2.product_id }">${NewProduct2.product_name }</a></h6>
	                        
	                             <div class="rating">
                              		<c:if test="${NewProduct2.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
				              		<c:if test="${NewProduct2.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct2.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct2.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct2.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct2.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
	                        
	                        <div class="product__price"><fmt:formatNumber value="${NewProduct2.product_sellPrice}" pattern="#,###원" /></div>
	                    </div>
	                </div>
	             </div>
			</c:forEach>
			
        <c:forEach var="NewProduct3" items="${para.NewProduct3 }" varStatus="status">
			     <div class="col-lg-3 col-md-4 col-sm-6 mix table">
	                <div class="product__item">
	                    <div class="product__item__pic set-bg" data-setbg="${NewProduct3.product_img1 }">
	                        <div class="label new">New</div>
	                        <ul class="product__hover">
	                            <li><a onclick="goCheckBuckets(${NewProduct3.product_id});"><span class="icon_bag_alt"></span></a></li>
	                        </ul>
	                    </div>
	                    <div class="product__item__text">
	                        <h6><a href="/mall/prodDetail/main?prodId=${NewProduct3.product_id }">${NewProduct3.product_name }</a></h6>
	                        
	                            <div class="rating">
	                            
	                                <c:if test="${NewProduct3.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    								    
				              		<c:if test="${NewProduct3.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct3.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct3.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct3.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct3.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
	                        <div class="product__price"><fmt:formatNumber value="${NewProduct3.product_sellPrice}" pattern="#,###원" /></div>
	                    </div>
	                </div>
	             </div>
			</c:forEach>
        
        <c:forEach var="NewProduct4" items="${para.NewProduct4 }" varStatus="status">
			     <div class="col-lg-3 col-md-4 col-sm-6 mix light">
	                <div class="product__item">
	                    <div class="product__item__pic set-bg" data-setbg="${NewProduct4.product_img1 }">
	                        <div class="label new">New</div>
	                        <ul class="product__hover">
	                            <li><a onclick="goCheckBuckets(${NewProduct4.product_id});"><span class="icon_bag_alt"></span></a></li>
	                        </ul>
	                    </div>
	                    <div class="product__item__text">
	                        <h6><a href="/mall/prodDetail/main?prodId=${NewProduct4.product_id }">${NewProduct4.product_name }</a></h6>
	                        
	                   <div class="rating">
	                   
	                   				<c:if test="${NewProduct4.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
				              		<c:if test="${NewProduct4.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct4.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct4.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct4.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct4.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
	                        
	                        <div class="product__price"><fmt:formatNumber value="${NewProduct4.product_sellPrice}" pattern="#,###원" /></div>
	                    </div>
	                </div>
	             </div>
			</c:forEach>
        
        <c:forEach var="NewProduct5" items="${para.NewProduct5 }" varStatus="status">
			     <div class="col-lg-3 col-md-4 col-sm-6 mix accessories">
	                <div class="product__item">
	                    <div class="product__item__pic set-bg" data-setbg="${NewProduct5.product_img1 }">
	                        <div class="label new">New</div>
	                        <ul class="product__hover">
	                            <li><a onclick="goCheckBuckets(${NewProduct5.product_id});"><span class="icon_bag_alt"></span></a></li>
	                        </ul>
	                    </div>
	                    <div class="product__item__text">
	                        <h6><a href="/mall/prodDetail/main?prodId=${NewProduct5.product_id }">${NewProduct5.product_name }</a></h6>
	                        
	                   <div class="rating">
	                   
	              				     <c:if test="${NewProduct5.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
								    
				              		<c:if test="${NewProduct5.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct5.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct5.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct5.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct5.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
	                        <div class="product__price"><fmt:formatNumber value="${NewProduct5.product_sellPrice}" pattern="#,###원" /></div>
	                    </div>
	                </div>
	             </div>
			</c:forEach>
        
        <c:forEach var="NewProduct6" items="${para.NewProduct6 }" varStatus="status">
			     <div class="col-lg-3 col-md-4 col-sm-6 mix heater">
	                <div class="product__item">
	                    <div class="product__item__pic set-bg" data-setbg="${NewProduct6.product_img1 }">
	                        <div class="label new">New</div>
	                        <ul class="product__hover">
	                            <li><a onclick="goCheckBuckets(${NewProduct6.product_id});"><span class="icon_bag_alt"></span></a></li>
	                        </ul>
	                    </div>
	                    <div class="product__item__text">
	                        <h6><a href="/mall/prodDetail/main?prodId=${NewProduct6.product_id }">${NewProduct6.product_name }</a></h6>
	                        
	                  <div class="rating">
	                  
	                				<c:if test="${NewProduct6.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
				              		<c:if test="${NewProduct6.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct6.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct6.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct6.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct6.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
	                        <div class="product__price"><fmt:formatNumber value="${NewProduct6.product_sellPrice}" pattern="#,###원" /></div>
	                    </div>
	                </div>
	             </div>
			</c:forEach>
        
        <c:forEach var="NewProduct7" items="${para.NewProduct7 }" varStatus="status">
			     <div class="col-lg-3 col-md-4 col-sm-6 mix case">
	                <div class="product__item">
	                    <div class="product__item__pic set-bg" data-setbg="${NewProduct7.product_img1 }">
	                        <div class="label new">New</div>
	                        <ul class="product__hover">
	                            <li><a onclick="goCheckBuckets(${NewProduct7.product_id});"><span class="icon_bag_alt"></span></a></li>
	                        </ul>
	                    </div>
	                    <div class="product__item__text">
	                        <h6><a href="/mall/prodDetail/main?prodId=${NewProduct7.product_id }">${NewProduct7.product_name }</a></h6>
	                        
	                  <div class="rating">
	               				    <c:if test="${NewProduct7.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
				              		<c:if test="${NewProduct7.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct7.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct7.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct7.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct7.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
	                        <div class="product__price"><fmt:formatNumber value="${NewProduct7.product_sellPrice}" pattern="#,###원" /></div>
	                    </div>
	                </div>
	             </div>
			</c:forEach>
        
        <c:forEach var="NewProduct8" items="${para.NewProduct8 }" varStatus="status">
			     <div class="col-lg-3 col-md-4 col-sm-6 mix kitchen">
	                <div class="product__item">
	                    <div class="product__item__pic set-bg" data-setbg="${NewProduct8.product_img1 }">
	                        <div class="label new">New</div>
	                        <ul class="product__hover">
	                            <li><a onclick="goCheckBuckets(${NewProduct8.product_id});"><span class="icon_bag_alt"></span></a></li>
	                        </ul>
	                    </div>
	                    <div class="product__item__text">
	                        <h6><a href="/mall/prodDetail/main?prodId=${NewProduct8.product_id }">${NewProduct8.product_name }</a></h6>
	                        
	                   <div class="rating">
	              				    <c:if test="${NewProduct8.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
				              		<c:if test="${NewProduct8.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct8.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct8.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct8.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${NewProduct8.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
	                        <div class="product__price"><fmt:formatNumber value="${NewProduct8.product_sellPrice}" pattern="#,###원" /></div>
	                    </div>
	                </div>
	             </div>
			</c:forEach>
        
                 
        </div>
    </div>
</section>
<!-- Product Section End -->



<!-- Banner Section Begin -->
<!-- <section class="banner set-bg" data-setbg="../../resources/mallMain/img/banner/banner-1.jpg"> -->
<!--     <div class="container"> -->
<!--         <div class="row"> -->
<!--             <div class="col-xl-7 col-lg-8 m-auto"> -->
<!--                 <div class="banner__slider owl-carousel"> -->
<!--                     <div class="banner__item"> -->
<!--                         <div class="banner__text"> -->
<!--                             <span>The Chloe Collection</span> -->
<!--                             <h1>The Project Jacket</h1> -->
<!--                             <a href="#">Shop now</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="banner__item"> -->
<!--                         <div class="banner__text"> -->
<!--                             <span>The Chloe Collection</span> -->
<!--                             <h1>The Project Jacket</h1> -->
<!--                             <a href="#">Shop now</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="banner__item"> -->
<!--                         <div class="banner__text"> -->
<!--                             <span>The Chloe Collection</span> -->
<!--                             <h1>The Project Jacket</h1> -->
<!--                             <a href="#">Shop now</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </section> -->
<!-- Banner Section End -->

<!-- Trend Section Begin -->
<section class="trend spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>인기순</h4>
	         	
                    </div>
                     
        <c:forEach var="topSelling" items="${para.topSelling }" varStatus="status">
			           <a href="/mall/prodDetail/main?prodId=${topSelling.product_id }">
			           <div class="trend__item">
                        <div class="trend__item__pic">
                            <img style="width:90px; height: 90px;" src="${topSelling.product_img1 }" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>${topSelling.product_name }</h6>
                             <div class="rating">
                             
                             		<c:if test="${topSelling.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
				              		<c:if test="${topSelling.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${topSelling.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${topSelling.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${topSelling.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${topSelling.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
                           <div class="product__price"><fmt:formatNumber value="${topSelling.product_sellPrice}" pattern="#,###원" /></div>
                        </div>
                    </div></a>
			</c:forEach>
				
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>평점순</h4>
                    </div>
                       <c:forEach var="topReview" items="${para.topReview }" varStatus="status">
			             <a href="/mall/prodDetail/main?prodId=${topReview.product_id }"><div class="trend__item">
                        <div class="trend__item__pic">
                            <img style="width:90px; height: 90px;" src="${topReview.product_img1 }" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>${topReview.product_name }</h6>
                         <div class="rating">
                         
                         			<c:if test="${topReview.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
				              		<c:if test="${topReview.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${topReview.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${topReview.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${topReview.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${topReview.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
                            <div class="product__price"><fmt:formatNumber value="${topReview.product_sellPrice}" pattern="#,###원" /></div>
                        </div>
                    </div></a>
					</c:forEach>
						           
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>리뷰순</h4>
                    </div>
                    
                      <c:forEach var="countReviews" items="${para.countReviews }" varStatus="status">
			            <a href="/mall/prodDetail/main?prodId=${countReviews.product_id }"><div class="trend__item">
                        <div class="trend__item__pic">
                            <img style="width:90px; height: 90px;" src="${countReviews.product_img1 }" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>${countReviews.product_name }</h6>
                         <div class="rating">
                         
                     			    <c:if test="${countReviews.star == 0 }">
											 <span class="noneReivews">평가 없음</span>
								    </c:if>
								    
				              		<c:if test="${countReviews.star == 1 }">
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${countReviews.star == 2 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${countReviews.star == 3 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${countReviews.star == 4 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
				              		<c:if test="${countReviews.star == 5 }">
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
											 <i class="fa fa-star"></i>
								    </c:if>
                            </div>
                            <div class="product__price"><fmt:formatNumber value="${countReviews.product_sellPrice}" pattern="#,###원" /></div>
                        </div>
                    </div></a>
					</c:forEach>
					
			
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Trend Section End -->


<!-- Discount Section Begin -->
<section class="discount">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 p-0">
                <div class="discount__pic">
                    <img src="../../resources/mallMain/img/discount.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6 p-0">
                <div class="discount__text">
                    <div class="discount__text__title">
                        <span>Goot6 C반 화이팅</span>
                        <h2>2020.10.26 ~ 21.05.11</h2>
                        <h5><span>종강일까지 남은시간</span></h5>
                    </div>
                    <div class="discount__countdown" id="countdown-time">
                        <div class="countdown__item">
                            <span>11</span>
                            <p>Days</p>
                        </div>
                        <div class="countdown__item">
                            <span>18</span>
                            <p>Hour</p>
                        </div>
                        <div class="countdown__item">
                            <span>46</span>
                            <p>Min</p>
                        </div>
                        <div class="countdown__item">
                            <span>05</span>
                            <p>Sec</p>
                        </div>
                    </div>
                    <a href="#">코딩하러가기</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Discount Section End -->


<!-- Services Section Begin -->
<section class="services spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-car"></i>
                    <h6>저렴한 배송비</h6>
                    <p>기본 2,500원</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-money"></i>
                    <h6>등급별 포인트 차등 적립</h6>
                    <p>A등급:10% <br/>B등급:5%<br/>C등급: 없음</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-support"></i>
                    <h6>관리자 상시 대기</h6>
                    <p>조장 : 김도연</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-headphones"></i>
                    <h6>구매확정 전 교환/취소 가능</h6>
                    <p>구매 후 7일 자동 구매 확정</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Services Section End -->




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
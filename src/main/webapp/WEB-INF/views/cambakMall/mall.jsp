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

 
 
 function goCheckBuckets(data){
	 	 
	 
	 console.log(data);
	 
	 
	 
	 
 }
 
 
 
 

 
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
                    <div class="categories__item categories__large__item set-bg" data-setbg="../../resources/mallMain/img/categories/category-1.jpg">
                    <div class="categories__text">
                        <h1> 전체 상품 </h1>
                        <p>#텐트 #타프 #침낭 #매트 #경량 테이블 #체어 #랜턴 #담요 #쿨러/아이스박스 #착화제 #화로대 #수납 #설거지용품 #식기/일반 #버너</p>
                        <a href="#">Shop now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="../../resources/mallMain/img/categories/category-1.jpg">
                            <div class="categories__text">
                                <h4>텐트/타프</h4>
                                <p>${para.total[0].totcount} items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="../../resources/mallMain/img/categories/category-1.jpg">
                            <div class="categories__text">
                                <h4>침낭/매트</h4>
                                <p>${para.total[1].totcount} items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="../../resources/mallMain/img/categories/category-1.jpg">
                            <div class="categories__text">
                                <h4>테이블/체어/배트</h4>
                                <p>${para.total[2].totcount} items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="../../resources/mallMain/img/categories/category-5.jpg">
                            <div class="categories__text">
                                <h4>화로/히터</h4>
                                <p>${para.total[0].totcount} items</p>
                                <a href="#">Shop now</a>
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
            
           <form class="search-model-form" action="mall/main">
            <input type="text" id="search-input" style="width: 620px; margin-left:200px; margin-bottom: 30px; text-align:center; font-size: 25px; border: none; border-bottom: 2px solid #dddddd; background: 0 0;  color: #999;" placeholder="상품명 검색하기. . . . ."  autocomplete="off" />
       		<button type="button" class="btn btn-danger">Search</button>
        </form>
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
	                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-1.jpg">
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
	                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-1.jpg">
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
	                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-1.jpg">
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
	                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-1.jpg">
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
	                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-1.jpg">
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
	                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-1.jpg">
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
	                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-1.jpg">
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
	                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-1.jpg">
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
			           <a href="/mall/prodDetail/main?prodId=${topSelling.product_id }"><div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/ht-1.jpg" alt="">
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
                            <img src="../../resources/mallMain/img/trend/bs-1.jpg" alt="">
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
                            <img src="../../resources/mallMain/img/trend/bs-1.jpg" alt="">
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
                    <p>A등급:10% <br/>B등급:5%<br/>C등급:3%</p>
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
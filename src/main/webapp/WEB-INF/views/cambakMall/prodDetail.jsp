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
<script type="text/javascript">
	
	$(function() {
		let prodId = $("#product_id").val();
		console.log(prodId);
		
		let page = $("#page").val();
		console.log(page);
		
		prodQAListAll(prodId, page);
	    prodQAPagingParam(prodId, page);
	});
	
	function prodQAListAll(prodId, page, flag, no) {
	    $.getJSON("/mall/prodDetail/prodQAList?prodId=" + prodId + "&page=" + page, function(data){
	    	if(data.length == 0) {
	    		console.log("데이터 없음")
	    	} else {
	    		console.log(data);
	    		
	    		let output = '<table class="table table-hover">';
	    		output += ' <thead><tr><th>분류</th>';
	    		output += '<th>글제목</th>';
	    		output += '<th>작성자</th>';
	    		output += '<th>작성일</th>';
	    		output += '<th>좋아요</th>';
	    		output += '<th>조회수</th></tr></thead><tbody>';
	    		
		        $(data).each(function(index, item){
		        	let date = new Date(item.prodQA_date);
		        	let dateFormat = date.toLocaleString();
		        		
		        	output += '<tr id="prodQA' + item.prodQA_no + '"><td><input type="hidden" id="produQA_no" value="' + item.prodQA_no + '"/>' + item.prodQA_category + '</td>';
	                output += '<td><div id="' + item.prodQA_no + '" onclick="showContent(this,' + item.prodQA_no + ');">' + item.prodQA_title + '</div></td>';
	                output += '<td>' + item.member_id + '</td>';
	                output += '<td>' + dateFormat + '</td>';
	                output += '<td>' + item.prodQA_likeCnt + '</td>';
	                output += '<td>' + item.prodQA_viewCnt + '</td></tr>';
	                    
	                output += '<tr id="content' + item.prodQA_no + '" style="display: none">';
	                output += '<td colspan="6"><div>' + item.prodQA_content + '</div>';
	                
	                output += '<div><input type="button" id="modi" value="수정" onclick="location.href=\'/mall/prodDetail/prodQAModiForm?prodId=' + prodId + '&page=' + page + '&no=' + item.prodQA_no +'\'"/>';
	                output += '<input type="button" id="del" onclick="showHiddenSecret(this);" value="삭제"/>';
	                output += '<span id="likeCnt' + item.prodQA_no + '"><img src="../../resources/img/emptyHeart.png" width="50==40px" height="40px" onclick="updateLike(' + item.prodQA_no + ');"/></span>';
	                output += '<div class="hiddenSecretDiv" id="' + item.prodQA_no + '"><input type="password" class="hiddenSecret" id="secretPwdBox"  placeholder="비밀번호"/>'; 
	                output += '<input type="button" class="hiddenSecret" id="checkSecretPwd" onclick="chcekSecretPwd(this);" value="확인"/></div></div></td></tr>';
		        });	
		        
		        output+= '</tbody></table>';
		        
		        $("#prodQATb").html(output);    
		        
		        if(flag == 1) {
		        	$("#content" + no).show();
		        } else if(flag == 2) {
		        	$("#content" + no).show();
		        	$("#likeCnt" + no).html('<img src="../../resources/img/heart.png" width="50==40px" height="40px" onclick="deleteLike(' + no + ');"/>');
		        } else {
		        	$("#content" + no).show();
		        	$("#likeCnt" + no).html('<img src="../../resources/img/emptyHeart.png" width="50==40px" height="40px" onclick="updateLike(' + no + ');"/>')
		        }
	    	}
	     });
	}
	
	function prodQAPagingParam(prodId, page) {
		$.getJSON("/mall/prodDetail/prodQAPP?prodId=" + prodId , function(data){
	    	if(data.length == 0) {
	    		console.log("데이터 없음")
	    	} else {
	    		let prev = Number(page) - 1;
	    		let next = Number(page) + 1;
	    		
	    		let output = '<ul class="pagination">';
	    		
	    		if(page > 1) {
	    			output += '<li><a href="?prodId=' + prodId + '&page=' + prev + '"> < </a></li>';
	    		}
	    		
	    		for(let i = 1; i < data.endPage + 1; i++) {
	    			output += '<li><a href="?prodId=' + prodId + '&page=' + i + '">' + i + '</a></li>';
	    		}
	    		
	    		if(page < data.endPage) {
	    			output += '<li><a href="?prodId=' + prodId + '&page=' + next + '"> > </a></li>';
	    		}
	    		
	    		output += '</ul><button type="button" class="btn btn-info" style="float: right;" onclick="location.href=\'/mall/prodDetail/prodQAForm?prodId=' + prodId + '&page=' + page + '\';">글쓰기</button>';
	    		
	    		$("#pagingParamTb").html(output);

	    	}
	     });
	}
	
	function showContent(obj, no) {
		let contentId = $(obj).attr("id");
		$("#content" + contentId).show();
		
		console.log(no);
		
		$(".prodQA" + no).show();
		
		updateView(no);
	}
	
	function updateView(prodQA_no) {
		let prodId = $("#product_id").val();
		console.log(prodId);
		
		let page = $("#page").val();
		console.log(page);
		
		$.ajax({
			url: '/mall/prodDetail/updateViewCnt',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: prodQA_no,
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				prodQAListAll(prodId, page, 1, prodQA_no);
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	function updateLike(prodQA_no) {
		let prodId = $("#product_id").val();
		console.log(prodId);
		
		let page = $("#page").val();
		console.log(page);
		
		let member_id = 'fff';
		
		$.ajax({
			url: '/mall/prodDetail/updateLikeCnt',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: prodQA_no,
				member_id: member_id
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				prodQAListAll(prodId, page, 2, prodQA_no);
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	function deleteLike(prodQA_no) {
		let prodId = $("#product_id").val();
		console.log(prodId);
		
		let page = $("#page").val();
		console.log(page);
		
		let member_id = 'fff';
		
		$.ajax({
			url: '/mall/prodDetail/deleteLike',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: prodQA_no,
				member_id: member_id
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				prodQAListAll(prodId, page, 3, prodQA_no);
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	function showHiddenSecret(obj) {
		let hiddenSecretAddr = $(obj).next().next();
		console.log(hiddenSecretAddr);
		$(hiddenSecretAddr).show()
	}
	
	function chcekSecretPwd(obj) {
		let prodId = $("#product_id").val();
		console.log(prodId);
		
		let page = $("#page").val();
		console.log(page);
		
		let checkSecretPwd = $(obj).prev().val();
		console.log(checkSecretPwd);
		
		let no = $(obj).prev().parent().attr("id");
		console.log(no);
		
		$.ajax({
			url: '/mall/prodDetail/checkSecretPwd',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: no,
				prodQA_secretPassword : checkSecretPwd
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				prodQAListAll(prodId, page);
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	
	
</script>
<style>
	.hiddenSecretDiv {
		display : none;
	}
	
	.nav-tabs {
		border-bottom : none;
	}
	
	.nav-tabs .nav-item {
		background-color: white;
		z-index : 999;
	}
	
	.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
		border : none;
		color : #ca1515;
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

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__left product__thumb nice-scroll">
                            <a class="pt active" href="#product-1">
                                <img src="../../resources/mallMain/img/product/details/thumb-1.jpg" alt="">
                            </a>
                            <a class="pt" href="#product-2">
                                <img src="../../resources/mallMain/img/product/details/thumb-2.jpg" alt="">
                            </a>
                            <a class="pt" href="#product-3">
                                <img src="../../resources/mallMain/img/product/details/thumb-3.jpg" alt="">
                            </a>
                            <a class="pt" href="#product-4">
                                <img src="../../resources/mallMain/img/product/details/thumb-4.jpg" alt="">
                            </a>
                        </div>
                        <div class="product__details__slider__content">
                            <div class="product__details__pic__slider owl-carousel">
                                <img data-hash="product-1" class="product__big__img" src="../../resources/mallMain/img/product/details/product-1.jpg" alt="">
                                <img data-hash="product-2" class="product__big__img" src="../../resources/mallMain/img/product/details/product-3.jpg" alt="">
                                <img data-hash="product-3" class="product__big__img" src="../../resources/mallMain/img/product/details/product-2.jpg" alt="">
                                <img data-hash="product-4" class="product__big__img" src="../../resources/mallMain/img/product/details/product-4.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product__details__text">
                        <h3>Essential structured blazer <span>Brand: SKMEIMore Men Watches from SKMEI</span></h3>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <span>( 138 reviews )</span>
                        </div>
                        <div class="product__details__price">$ 75.0 <span>$ 83.0</span></div>
                        <p>Nemo enim ipsam voluptatem quia aspernatur aut odit aut loret fugit, sed quia consequuntur
                        magni lores eos qui ratione voluptatem sequi nesciunt.</p>
                        <div class="product__details__button">
                            <div class="quantity">
                                <span>Quantity:</span>
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                            <a href="#" class="cart-btn"><span class="icon_bag_alt"></span> 주문하기 </a>
                            <ul>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__details__widget">
                            <ul>
                                <li>
                                    <span>Availability:</span>
                                    <div class="stock__checkbox">
                                        <label for="stockin">
                                            In Stock
                                            <input type="checkbox" id="stockin">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>Available color:</span>
                                    <div class="color__checkbox">
                                        <label for="red">
                                            <input type="radio" name="color__radio" id="red" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="black">
                                            <input type="radio" name="color__radio" id="black">
                                            <span class="checkmark black-bg"></span>
                                        </label>
                                        <label for="grey">
                                            <input type="radio" name="color__radio" id="grey">
                                            <span class="checkmark grey-bg"></span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>Available size:</span>
                                    <div class="size__btn">
                                        <label for="xs-btn" class="active">
                                            <input type="radio" id="xs-btn">
                                            xs
                                        </label>
                                        <label for="s-btn">
                                            <input type="radio" id="s-btn">
                                            s
                                        </label>
                                        <label for="m-btn">
                                            <input type="radio" id="m-btn">
                                            m
                                        </label>
                                        <label for="l-btn">
                                            <input type="radio" id="l-btn">
                                            l
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>Promotions:</span>
                                    <p>Free shipping</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-1" role="tab">상품 상세</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">상품평( 2 )</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-3" role="tab"><span onclick="showProdQA();">상품 문의</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">배송/교환/반품 안내</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane " id="tabs-1" role="tabpanel">
                                <h6>상품 상세</h6>
                                <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed
                                    quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt loret.
                                    Neque porro lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim ipsam
                                    voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed quia ipsu
                                    consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Nulla
                                consequat massa quis enim.</p>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget
                                    dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
                                    nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium
                                quis, sem.</p>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <h6>상품평</h6>
                                <!-- *********아래부터 상품평 내용 넣는 곳 *************************************************************-->
                                <div>
                                
                                </div>
                                <!-- ******************************************************************************************** -->
                            </div>
                            <div class="tab-pane active" id="tabs-3" role="tabpanel">
                                <h6>상품 문의</h6>
                                <!-- *********아래부터 상품문의 내용 넣는 곳 *************************************************************-->
						     	<input type="hidden" id="product_id" value="${param.prodId }"/>
						     	<input type="hidden" id="page" value="${param.page }" />
						     	
						     	<div class="container" id="prodQATb">
						               
								</div>
								<div class="container" id="pagingParamTb">
									
						    	</div>
                                <!-- ******************************************************************************************** -->
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <h6>배송/교환/반품 안내</h6>
                                <!-- *********아래부터 배송/교환/반품 안내 내용 넣는 곳 *************************************************************-->
                                <div>
                                
                                </div>
                                <!-- ******************************************************************************************** -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="related__title">
                        <h5>RELATED PRODUCTS</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-1.jpg">
                            <div class="label new">New</div>
                            <ul class="product__hover">
                                <li><a href="../../resources/mallMain/img/product/related/rp-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Buttons tweed blazer</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-2.jpg">
                            <ul class="product__hover">
                                <li><a href="../../resources/mallMain/img/product/related/rp-2.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Flowy striped skirt</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 49.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-3.jpg">
                            <div class="label stockout">out of stock</div>
                            <ul class="product__hover">
                                <li><a href="../../resources/mallMain/img/product/related/rp-3.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Cotton T-Shirt</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-4.jpg">
                            <ul class="product__hover">
                                <li><a href="../../resources/mallMain/img/product/related/rp-4.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Slim striped pocket shirt</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

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
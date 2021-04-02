<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="../../resources/mallMain/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/style.css" type="text/css">
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
                                <p>358 items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="../../resources/mallMain/img/categories/category-1.jpg">
                            <div class="categories__text">
                                <h4>침낭/매트</h4>
                                <p>273 items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="../../resources/mallMain/img/categories/category-1.jpg">
                            <div class="categories__text">
                                <h4>테이블/체어/배트</h4>
                                <p>159 items</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                        <div class="categories__item set-bg" data-setbg="../../resources/mallMain/img/categories/category-5.jpg">
                            <div class="categories__text">
                                <h4>화로/히터</h4>
                                <p>792 items</p>
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
            <div class="col-lg-4 col-md-4">
                <div class="section-title">
                    <h4>New product</h4>
                </div>
            </div>
            <div class="col-lg-8 col-md-8">
                <ul class="filter__controls">
                    <li class="active" data-filter=".tent">텐트/타프</li>
                    <li data-filter=".women">침낭/매트</li>
                    <li data-filter=".men">테이블/체어/배트</li>
                    <li data-filter=".kid">랜턴</li>
                    <li data-filter=".accessories">액세서리</li>
                    <li data-filter=".cosmetic">화로/히터</li>
                    <li data-filter=".cosmetic">수납/케이스</li>
                    <li data-filter=".cosmetic">키친/취사용품</li>
                </ul>
            </div>
        </div>
        <div class="row property__gallery">
            <div class="col-lg-3 col-md-4 col-sm-6 mix women">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-1.jpg">
                        <div class="label new">New</div>
                        <ul class="product__hover">
                            <li><a href="../../resources/mallMain/img/product/product-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
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
            <div class="col-lg-3 col-md-4 col-sm-6 mix men">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-2.jpg">
                        <ul class="product__hover">
                            <li><a href="../../resources/mallMain/img/product/product-2.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
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
            <div class="col-lg-3 col-md-4 col-sm-6 mix accessories">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-3.jpg">
                        <div class="label stockout">out of stock</div>
                        <ul class="product__hover">
                            <li><a href="../../resources/mallMain/img/product/product-3.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
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
            <div class="col-lg-3 col-md-4 col-sm-6 mix cosmetic">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-4.jpg">
                        <ul class="product__hover">
                            <li><a href="../../resources/mallMain/img/product/product-4.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
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
            <div class="col-lg-3 col-md-4 col-sm-6 mix kid">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-5.jpg">
                        <ul class="product__hover">
                            <li><a href="../../resources/mallMain/img/product/product-5.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Fit micro corduroy shirt</a></h6>
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
            <div class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-6.jpg">
                        <div class="label sale">Sale</div>
                        <ul class="product__hover">
                            <li><a href="../../resources/mallMain/img/product/product-6.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Tropical Kimono</a></h6>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product__price">$ 49.0 <span>$ 59.0</span></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-7.jpg">
                        <ul class="product__hover">
                            <li><a href="../../resources/mallMain/img/product/product-7.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Contrasting sunglasses</a></h6>
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
            <div class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/product-8.jpg">
                        <div class="label">Sale</div>
                        <ul class="product__hover">
                            <li><a href="../../resources/mallMain/img/product/product-8.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Water resistant backpack</a></h6>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product__price">$ 49.0 <span>$ 59.0</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->


<!-- Banner Section Begin -->
<section class="banner set-bg" data-setbg="../../resources/mallMain/img/banner/banner-1.jpg">
    <div class="container">
        <div class="row">
            <div class="col-xl-7 col-lg-8 m-auto">
                <div class="banner__slider owl-carousel">
                    <div class="banner__item">
                        <div class="banner__text">
                            <span>The Chloe Collection</span>
                            <h1>The Project Jacket</h1>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                    <div class="banner__item">
                        <div class="banner__text">
                            <span>The Chloe Collection</span>
                            <h1>The Project Jacket</h1>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                    <div class="banner__item">
                        <div class="banner__text">
                            <span>The Chloe Collection</span>
                            <h1>The Project Jacket</h1>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/ht-1.jpg" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>Chain bucket bag</h6>
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
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/ht-2.jpg" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>Pendant earrings</h6>
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
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/ht-3.jpg" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>Cotton T-Shirt</h6>
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
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>평점순</h4>
                    </div>
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/bs-1.jpg" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>Cotton T-Shirt</h6>
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
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/bs-2.jpg" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>Zip-pockets pebbled tote <br />briefcase</h6>
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
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/bs-3.jpg" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>Round leather bag</h6>
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
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>리뷰순</h4>
                    </div>
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/f-1.jpg" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>Bow wrap skirt</h6>
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
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/f-2.jpg" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>Metallic earrings</h6>
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
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <img src="../../resources/mallMain/img/trend/f-3.jpg" alt="">
                        </div>
                        <div class="trend__item__text">
                            <h6>Flap cross-body bag</h6>
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
                    <p>전세계 어디든 동일한 가격</p>
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
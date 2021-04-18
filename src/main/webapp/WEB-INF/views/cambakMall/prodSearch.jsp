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
<title>Cambak's Mall</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

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
let engJ = /[a-zA-Z]/;  // 영문 정규표현식
let koreanJ = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //  한글 정규표현식
let specialJ = /[.,/~!@#$%^&*()_+|<>?:{}]/; // 특수문자 정규표현식

let mainCategory_id = '${param.mainCategory_id}';
let middleCategory_id = '${param.middleCategory_id}';
let prodRankOrder = '${param.prodRankOrder}';
let priceRangeOrder = '${param.priceRangeOrder}';
let maxPrice = '${param.maxPrice}';
let minPrice = '${param.minPrice}';
let ratingSorter = '${param.ratingSorter}';
let prodScore = '${param.prodScore}';
let page = '${param.page}';
let perPageNum = '${param.perPageNum}';
let keyword = '${param.keyword}';

$(document).ready(function() {
	filterCheck(); // 페이지 로딩 시 파라메터 확인하여 체크박스 체크
	pageBtnChange(); // 현재 페이지번호의 버튼 색상 변경
});

function pageBtnChange() {
	// 현재 페이지번호의 버튼 색상 변경
	let thisPage = '${param.page}';
	
	$("#pageNum" + thisPage).attr("class", "thisPagination");
	$("#pageNum" + thisPage).attr("onclick", "");
}

function filterCheck() {
	// 페이지 로딩 시 파라메터 확인하여 체크박스 체크
	
	// 상품 표시 필터 체크
	if (prodRankOrder == "" || prodRankOrder == "cmRank") {
		$("#cmRank").prop("checked", "true");
	} else if (prodRankOrder == "rwPd") {
		$("#rowPriceRank").prop("checked", "true");
	} else if (prodRankOrder == "hhPd") {
		$("#highPriceRank").prop("checked", "true");
	} else if (prodRankOrder == "datePd") {
		$("#salesRank").prop("checked", "true");
	} else {
		$("#cmRank").prop("checked", "true");
	}
	
	// 상품 정렬 개수 체크
	if (perPageNum == "" || perPageNum == "12") {
		$("#prodAlignment1").prop("checked", "true");
	} else if (perPageNum == "21") {
		$("#prodAlignment2").prop("checked", "true");
	} else if (perPageNum == "30") {
		$("#prodAlignment3").prop("checked", "true");
	} else if (perPageNum == "60") {
		$("#prodAlignment4").prop("checked", "true");
	} else {
		alert("잘못된 접근입니다.");
		history.back();
	}
	
	// 가격 체크
	if (priceRangeOrder == "" || priceRangeOrder == "all") {
		// 체크하지 않아도 됨
	} else if (priceRangeOrder == "less") {
		$("#priceOrder1").prop("checked", "true");
	} else if (priceRangeOrder == "great") {
		$("#priceOrder5").prop("checked", "true");
	} else if (priceRangeOrder == "avg" && maxPrice == "30000") {
		$("#priceOrder2").prop("checked", "true");
	} else if (priceRangeOrder == "avg" && maxPrice == "60000") {
		$("#priceOrder3").prop("checked", "true");
	} else if (priceRangeOrder == "avg" && maxPrice == "100000") {
		$("#priceOrder4").prop("checked", "true");
	} else if (priceRangeOrder == "avgInput" && maxPrice != "" && minPrice != "") {
		$("#maxPrice").val(parseInt(maxPrice));
		$("#minPrice").val(parseInt(minPrice));
	}
	
	// 별점 체크
	if (ratingSorter == "" || ratingSorter == "false") {
		// 체크하지 않아도 됨
	} else if (ratingSorter == "true" && prodScore == "4") {
		$("#pdScoreFour").prop("checked", "true");
	} else if (ratingSorter == "true" && prodScore == "3") {
		$("#pdScoreThree").prop("checked", "true");
	} else if (ratingSorter == "true" && prodScore == "2") {
		$("#pdScoreTwo").prop("checked", "true");
	} else if (ratingSorter == "true" && prodScore == "1") {
		$("#pdScoreOne").prop("checked", "true");
	}
}

function pageNumMove(movePage) {
	// 페이지 번호 클릭하여 이동
	
	// 카테고리 번호가 없을 시
	if (mainCategory_id == "") {
		mainCategory_id = "1"
	}
	if (middleCategory_id == "") {
		middleCategory_id = "1";
	}
	
	// 상품 표시 필터가 없을 시
	if (prodRankOrder == "") {
		prodRankOrder = "cmRank";
	}
	
	// 상품 가격 필터가 없을 시
	if (priceRangeOrder == "") {
		priceRangeOrder = "all";
	}
	
	// 상품 정렬 개수가 없을 시
	if (perPageNum == "") {
		perPageNum = "12";
	}
	
	// 상품 별점순 필터가 없을 시
	if (ratingSorter == "") {
		ratingSorter = "false";
	}
	// 페이지 이동
	location.href="/mall/Search?prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRangeOrder + "&maxPrice=" + maxPrice + "&minPrice=" + minPrice + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=" + movePage + "&perPageNum=" + perPageNum + "&keyword=" + keyword;
}

function prodScoreViewMove(sorter, score) {
	// 별점 체크박스 클릭하여 페이지 이동 시 파라메터 확인
	
	// 카테고리 번호가 없을 시
	if (mainCategory_id == "") {
		mainCategory_id = "1"
	}
	if (middleCategory_id == "") {
		middleCategory_id = "1";
	}
	
	// 상품 가격 필터가 없을 시
	if (priceRangeOrder == "") {
		priceRangeOrder = "all";
	}
	
	// 상품 정렬 개수가 없을 시
	if (perPageNum == "") {
		perPageNum = "12";
	}
	
	// 상품 표시 필터가 없을 시
	if (prodRankOrder == "") {
		prodRankOrder = "cmRank";
	}
	
	// 페이지 이동
	scoreInt = parseInt(score);
	
	if (scoreInt < 0 || scoreInt > 5) {
		alert("잘못된 접근입니다.");
		history.back();
	} else if (scoreInt >= 0 || scoreInt <= 5) {
		location.href="/mall/Search?prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRangeOrder + "&maxPrice=" + maxPrice + "&minPrice=" + minPrice + "&ratingSorter=" + sorter + "&prodScore=" + score + "&page=1&perPageNum=" + perPageNum + "&keyword=" + keyword;
	}
	
}

function priceViewMove(priceRange, min, max) {
	// 상품 가격 필터 체크박스 클릭하여 페이지 이동 시 파라메터 확인
	
	// 카테고리 번호가 없을 시
	if (mainCategory_id == "") {
		mainCategory_id = "1"
	}
	if (middleCategory_id == "") {
		middleCategory_id = "1";
	}
	
	// 상품 표시 필터가 없을 시
	if (prodRankOrder == "") {
		prodRankOrder = "cmRank";
	}
	
	// 페이지 번호가 없을 시
	if (page == "") {
		page = "1";
	}
	
	// 상품 정렬 개수가 없을 시
	if (perPageNum == "") {
		perPageNum = "12";
	}
	
	// 상품 가격순 필터가 없을 시
	if (ratingSorter == "") {
		ratingSorter = "false";
	}
	
	// 페이지 이동
	if (priceRange == "all") {
		location.href="/mall/Search?prodRankOrder=" + prodRankOrder + "&priceRangeOrder=all&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum + "&keyword=" + keyword;
	} else if (priceRange == "less" || priceRange == "great") {
		location.href="/mall/Search?prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRange + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum + "&keyword=" + keyword;
	} else if (priceRange == "avg") {
		location.href="/mall/Search?prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRange + "&minPrice=" + min + "&maxPrice=" + max + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum + "&keyword=" + keyword;
	} else if (priceRange == "avgInput") {
		max = $("#maxPrice").val();
		min = $("#minPrice").val();
		
		if (specialJ.test(max) || specialJ.test(min) || engJ.test(max) || engJ.test(min) || koreanJ.test(max) || koreanJ.test(min)) {
			alert("가격 입력 창에는 숫자만 입력가능합니다.");
			return;
		} else if (parseInt(min) > parseInt(max)) {
			alert("입력하신 가격 범위는 최대 가격이 최소 가격보다 적습니다.");
			return;
		} else {
			location.href="/mall/Search?prodRankOrder=" + prodRankOrder + "&priceRangeOrder=avgInput&minPrice=" + min + "&maxPrice=" + max + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum + "&keyword=" + keyword;
		}
		
	} else {
		alert("잘못된 접근입니다.");
		history.back();
	}
}

function prodNumViewMove(prodsNumber) {
	// 상품 정렬 개수 체크박스 클릭하여 페이지 이동 시 파라메터 확인
	
	// 카테고리 번호가 없을 시
	if (mainCategory_id == "") {
		mainCategory_id = "1"
	}
	if (middleCategory_id == "") {
		middleCategory_id = "1";
	}
	
	// 상품 가격 필터가 없을 시
	if (priceRangeOrder == "") {
		priceRangeOrder = "all";
	}
	
	// 상품 표시 필터가 없을 시
	if (prodRankOrder == "") {
		prodRankOrder = "cmRank";
	}
	
	// 페이지 번호가 없을 시
	if (page == "") {
		page = "1";
	}
	
	// 별점순 필터가 없을 시
	if (ratingSorter == "") {
		ratingSorter = "false";
	}
	// 페이지 이동
	location.href="/mall/Search?prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRangeOrder + "&maxPrice=" + maxPrice + "&minPrice=" + minPrice + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + prodsNumber + "&keyword=" + keyword;
}

function productViewMove(prodsRank) {
	// 상품 표시 체크박스 클릭하여 페이지 이동 시 파라메터 확인
	
	// 카테고리 번호가 없을 시
	if (mainCategory_id == "") {
		mainCategory_id = "1"
	}
	if (middleCategory_id == "") {
		middleCategory_id = "1";
	}
	
	// 상품 가격 필터가 없을 시
	if (priceRangeOrder == "") {
		priceRangeOrder = "all";
	}
	
	// 페이지 번호가 없을 시
	if (page == "") {
		page = "1";
	}
	
	// 상품 정렬 개수가 없을 시
	if (perPageNum == "") {
		perPageNum = "12";
	}
	
	// 상품 별점순 필터가 없을 시
	if (ratingSorter == "") {
		ratingSorter = "false";
	}
	// 페이지 이동
	location.href="/mall/Search?prodRankOrder=" + prodsRank + "&priceRangeOrder=" + priceRangeOrder + "&maxPrice=" + maxPrice + "&minPrice=" + minPrice + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum + "&keyword=" + keyword;
}

function categoryMove(main, middle) {
	// 상품 카테고리 클릭하여 페이지 이동 시 파라메터 확인
	location.href="/mall/categories?mainCategory_id=" + main + "&middleCategory_id=" + middle + "&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12";
}

</script>
<style>
.writePriceInput {
	width: 70px;
    height: 30px;
    padding: 0 5px;
    border: 1px solid #eee;
    border-radius: 2px;
    font-size: 14px;
}

.starScoreReviewNum {
	font-size: 11px;
    color: #777777;
}

.thisPagination {
    cursor: pointer !important;
    background: #0d0d0d !important;
    border-color: #0d0d0d !important;
    color: #ffffff !important;
    display: inline-block !important;
    height: 40px !important;
    width: 40px !important;
    border: 1px solid #f2f2f2 !important;
    border-radius: 50% !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 40px !important;
    text-align: center !important;
    -webkit-transition: all, 0.3s !important;
    margin-right: 6px !important;
}

.searchForm {
    display: inline-block;
    top: 48px;
    right: 0;
    border: 0;
    border-bottom: 2px solid #f32952;
    background: #ffffff;
    z-index: 110;
}

.searhcInput {
	background: none;
	border: none 0;
	vertical-align: top;
	font-size: 15px;
}

</style>


</head>
<body>
<!-- Header Section Begin -->
<header class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-3 col-lg-2">
                <div class="header__logo">
                    <a href="#" style="font-size: 38px; color: black; font-weight: bold;">캠박몰</a></div>
            </div>
            <div class="col-xl-6 col-lg-7">
                <nav class="header__menu">
                    <ul>
                        <li><a href="#">텐트/타프</a>
                          <ul class="dropdown">
                                <li><a href="#">텐트</a></li>
                                <li><a href="#">타프</a></li>
                            </ul></li>
                        <li><a href="#">침낭/매트</a>
                           <ul class="dropdown">
                                <li><a href="#">침낭</a>
                                <li><a href="#">매트</a></li>
                            </ul></li>
                        <li><a href="#">테이블/체어/배트</a>
                         <ul class="dropdown">
                                <li><a href="#">경랑 테이블</a></li>
                                <li><a href="#">체어</a></li>
                            </ul></li>
                        <li><a href="#">랜턴</a></li>
                        <li><a href="#">액세서리</a>
                           <ul class="dropdown">
                                <li><a href="#">담요</a></li>
                                <li><a href="#">쿨러/아이스박스</a></li>
                            </ul></li>
                        <li><a href="#">화로/히터</a>
                           <ul class="dropdown">
                                <li><a href="#">착화재</a></li>
                                <li><a href="#">화로대</a></li>
                            </ul></li>
                        <li><a href="#">수납/케이스</a></li>
                        <li><a href="#">키친/취사용품</a>
                       <ul class="dropdown">
                            <li><a href="#">설거지용품</a></li>
                            <li><a href="#">식기/일반</a></li>
                            <li><a href="#">버너</a></li>
                        </ul></li>
                        <li><a href="#">기타</a></li>
         		    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__right">
                	<c:if test="${loginMember == null}">
	                    <div class="header__right__auth">
	                        <a href="/user/login/yet">Login</a>
	                        <a href="/user/register">Register</a>
	                    </div>
	                    <ul class="header__right__widget">
	                        <li style="margin-right: 10px;"><span class="icon_search search-switch"></span></li>
	                        <li style="margin-right: 20px;"><a href="#"><span class="icon_bag_alt"></span></a></li>
	                    </ul>
                    </c:if>
                	<c:if test="${loginMember != null}">
	                    <div class="header__right__auth">
	                        <a href="/user/login/yet">Login</a>
	                        <a href="/user/register">Register</a>
	                    </div>
	                    <ul class="header__right__widget">
	                        <li style="margin-right: 10px;"><span class="icon_search search-switch"></span></li>
	                        <li style="margin-right: 20px;"><a href="#"><span class="icon_bag_alt"></span>
	                            <span class="tip">2</span>
	                        </a></li>
	                    </ul>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="canvas__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End --> 

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
	                <a href="/mall/main/"><i class="fa fa-home"></i> Cambak's Mall</a>
	                <span>상품 검색</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<%@include file="prodSearchAside.jsp" %>

<!-- Instagram Begin -->
<div class="instagram">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-1.jpg">
                    <div class="instagram__text">
                        <i class="fa fa-instagram"></i>
                        <a href="#">@ ashion_shop</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-2.jpg">
                    <div class="instagram__text">
                        <i class="fa fa-instagram"></i>
                        <a href="#">@ ashion_shop</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-3.jpg">
                    <div class="instagram__text">
                        <i class="fa fa-instagram"></i>
                        <a href="#">@ ashion_shop</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-4.jpg">
                    <div class="instagram__text">
                        <i class="fa fa-instagram"></i>
                        <a href="#">@ ashion_shop</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-5.jpg">
                    <div class="instagram__text">
                        <i class="fa fa-instagram"></i>
                        <a href="#">@ ashion_shop</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-6.jpg">
                    <div class="instagram__text">
                        <i class="fa fa-instagram"></i>
                        <a href="#">@ ashion_shop</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Instagram End -->

<%@include file="mallFooter.jsp" %>

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form" method="get">
            <input type="text" id="search-input" name="keyword" placeholder="검색어를 입력해주세요">
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
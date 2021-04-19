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

$(document).ready(function() {
	categoryOpen(); // 카테고리 파라메터로 css 설정
	filterCheck(); // 페이지 로딩 시 파라메터 확인하여 체크박스 체크
	pageBtnChange(); // 현재 페이지번호의 버튼 색상 변경
	searchSiteControll(); // 사이트 헤더에 있는 검색 창 열고 닫기 css 변경
	
});

function pageBtnChange() {
	// 현재 페이지번호의 버튼 색상 변경
	let thisPage = '${param.page}';
	
	$("#pageNum" + thisPage).attr("class", "thisPagination");
	$("#pageNum" + thisPage).attr("onclick", "");
}

function categoryOpen() {
	// 카테고리 파라메터로 css 설정
	let mainCategory_id = '${param.mainCategory_id}';
	let middleCategory_id = '${param.middleCategory_id}';
	
	if (mainCategory_id == "" && middleCategory_id == "") {
		$("#collapse1").attr("class", "collapse show");
	} else if (mainCategory_id == "") {
		$("#collapse1").attr("class", "collapse show");
	} else {
		$("#collapse" + mainCategory_id).attr("class", "collapse show");
	}
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
	} else if (priceRangeOrder == "avg" && maxPrice == "200000") {
		$("#priceOrder2").prop("checked", "true");
	} else if (priceRangeOrder == "avg" && maxPrice == "600000") {
		$("#priceOrder3").prop("checked", "true");
	} else if (priceRangeOrder == "avg" && maxPrice == "1000000") {
		$("#priceOrder4").prop("checked", "true");
	} else if (priceRangeOrder == "avgInput" && maxPrice != "" && minPrice != "") {
		$("#maxPrice").val(parseInt(maxPrice));
		$("#minPrice").val(parseInt(minPrice));
	}
	
	// 별점 체크
	if (ratingSorter == "" || ratingSorter == "false") {
		// 체크하지 않아도 됨
	} else if (ratingSorter == "true" && prodScore == "5") {
		$("#pdScoreFive").prop("checked", "true");
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
	location.href="/mall/categories?mainCategory_id=" + mainCategory_id + "&middleCategory_id=" + middleCategory_id + "&prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRangeOrder + "&maxPrice=" + maxPrice + "&minPrice=" + minPrice + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=" + movePage + "&perPageNum=" + perPageNum;
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
		location.href="/mall/categories?mainCategory_id=" + mainCategory_id + "&middleCategory_id=" + middleCategory_id + "&prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRangeOrder + "&maxPrice=" + maxPrice + "&minPrice=" + minPrice + "&ratingSorter=" + sorter + "&prodScore=" + score + "&page=1&perPageNum=" + perPageNum;
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
		location.href="/mall/categories?mainCategory_id=" + mainCategory_id + "&middleCategory_id=" + middleCategory_id + "&prodRankOrder=" + prodRankOrder + "&priceRangeOrder=all&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum;
	} else if (priceRange == "less" || priceRange == "great") {
		location.href="/mall/categories?mainCategory_id=" + mainCategory_id + "&middleCategory_id=" + middleCategory_id + "&prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRange + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum;
	} else if (priceRange == "avg") {
		location.href="/mall/categories?mainCategory_id=" + mainCategory_id + "&middleCategory_id=" + middleCategory_id + "&prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRange + "&minPrice=" + min + "&maxPrice=" + max + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum;
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
			location.href="/mall/categories?mainCategory_id=" + mainCategory_id + "&middleCategory_id=" + middleCategory_id + "&prodRankOrder=" + prodRankOrder + "&priceRangeOrder=avgInput&minPrice=" + min + "&maxPrice=" + max + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum;
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
	location.href="/mall/categories?mainCategory_id=" + mainCategory_id + "&middleCategory_id=" + middleCategory_id + "&prodRankOrder=" + prodRankOrder + "&priceRangeOrder=" + priceRangeOrder + "&maxPrice=" + maxPrice + "&minPrice=" + minPrice + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + prodsNumber;
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
	location.href="/mall/categories?mainCategory_id=" + mainCategory_id + "&middleCategory_id=" + middleCategory_id + "&prodRankOrder=" + prodsRank + "&priceRangeOrder=" + priceRangeOrder + "&maxPrice=" + maxPrice + "&minPrice=" + minPrice + "&ratingSorter=" + ratingSorter + "&prodScore=" + prodScore + "&page=1&perPageNum=" + perPageNum;
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
    display: none;
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

.searchIconBtn {
	height: 18px;
}

.modal-header, .modalTitle, .close {
  background-color: #b3bcc5;
  color:white !important;
  text-align: center;
  font-size: 25px;
}
.modal-footer {
  background-color: #f9f9f9;
}

</style>


</head>
<body>
<%@include file="head.jsp" %>

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                <c:choose>
                   	<c:when test="${param.mainCategory_id != null && param.middleCategory_id != null }">
	                    <a href="/mall/main/"><i class="fa fa-home"></i> Cambak's Mall</a>
	                    <a><span>${prodList[0].mainCategory_content }</span></a>
	                    <span>${prodList[0].middleCategory_content }</span>
	                </c:when>
	            </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<%@include file="prodListAside.jsp" %>

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
<script src="../../resources/mallMain/js/cambakMallCommon.js"></script>


</body>
</html>
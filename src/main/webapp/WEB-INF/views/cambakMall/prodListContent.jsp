<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true" %>
<!-- Shop Section Begin -->
<section class="shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="shop__sidebar">
                    <div class="sidebar__categories">
                        <div class="section-title">
                            <h4>카테고리</h4>
                        </div>
                        <div class="categories__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading active">
                                        <a onclick="categoryMove(0, 0);" data-toggle="collapse" data-target="#collapse" class="allProdBtn">전체 상품</a>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapse1">텐트/타프</a>
                                    </div>
                                    <div id="collapse1" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <ul>
                                                <li><a onclick="categoryMove(1, 1);" style="cursor: pointer;">텐트</a></li>
                                                <li><a onclick="categoryMove(1, 2);" style="cursor: pointer;">타프</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapse2">침낭/매트</a>
                                    </div>
                                    <div id="collapse2" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <ul>
                                                <li><a onclick="categoryMove(2, 1);" style="cursor: pointer;">침낭</a></li>
                                                <li><a onclick="categoryMove(2, 2);" style="cursor: pointer;">매트</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapse3">테이블/체어/배트</a>
                                    </div>
                                    <div id="collapse3" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <ul>
                                                <li><a onclick="categoryMove(3, 1);" style="cursor: pointer;">경량 테이블</a></li>
                                                <li><a onclick="categoryMove(3, 2);" style="cursor: pointer;">체어</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapse4">랜턴</a>
                                    </div>
                                    <div id="collapse4" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <ul>
                                                <li><a onclick="categoryMove(4, 1);" style="cursor: pointer;">랜턴</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapse5">액세서리</a>
                                    </div>
                                    <div id="collapse5" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <ul>
                                                <li><a onclick="categoryMove(5, 1);" style="cursor: pointer;">담요</a></li>
                                                <li><a onclick="categoryMove(5, 2);" style="cursor: pointer;">쿨러/아이스박스</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapse6">화로/히터</a>
                                    </div>
                                    <div id="collapse6" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <ul>
                                                <li><a onclick="categoryMove(6, 1);" style="cursor: pointer;">착화재</a></li>
                                                <li><a onclick="categoryMove(6, 2);" style="cursor: pointer;">화로대</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapse7">수납/케이스</a>
                                    </div>
                                    <div id="collapse7" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <ul>
                                                <li><a onclick="categoryMove(7, 1);" style="cursor: pointer;">수납/케이스</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapse8">키친/취사용품</a>
                                    </div>
                                    <div id="collapse8" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <ul>
                                                <li><a onclick="categoryMove(8, 1);" style="cursor: pointer;">식기/일반</a></li>
                                                <li><a onclick="categoryMove(8, 2);" style="cursor: pointer;">설거지용품</a></li>
                                                <li><a onclick="categoryMove(8, 3);" style="cursor: pointer;">버너</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapse9">기타</a>
                                    </div>
                                    <div id="collapse9" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <ul>
                                                <li><a onclick="categoryMove(9, 1);" style="cursor: pointer;">기타</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar__sizes">
                        <div class="section-title">
                            <h4>상품 표시</h4>
                        </div>
                        <div class="size__list">
                            <label for="cmRank">
                                캠박몰 랭킹순
                                <input type="checkbox" id="cmRank" onclick="productViewMove('cmRank')">
                                <span class="checkmark"></span>
                            </label>
                            <label for="rowPriceRank">
                                낮은가격순
                                <input type="checkbox" id="rowPriceRank" onclick="productViewMove('rwPd')">
                                <span class="checkmark"></span>
                            </label>
                            <label for="highPriceRank">
                                높은가격순
                                <input type="checkbox" id="highPriceRank" onclick="productViewMove('hhPd')">
                                <span class="checkmark"></span>
                            </label>
                            <label for="salesRank">
                                신상품순
                                <input type="checkbox" id="salesRank" onclick="productViewMove('datePd')">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                    
                    <div class="sidebar__sizes">
                        <div class="section-title">
                            <h4>상품 정렬 개수</h4>
                        </div>
                        <div class="size__list">
                            <label for="prodAlignment1">
                                12개씩 보기
                                <input type="checkbox" id="prodAlignment1" onclick="prodNumViewMove(12);">
                                <span class="checkmark"></span>
                            </label>
                            <label for="prodAlignment2">
                                21개씩 보기
                                <input type="checkbox" id="prodAlignment2" onclick="prodNumViewMove(21);">
                                <span class="checkmark"></span>
                            </label>
                            <label for="prodAlignment3">
                                30개씩 보기
                                <input type="checkbox" id="prodAlignment3" onclick="prodNumViewMove(30);">
                                <span class="checkmark"></span>
                            </label>
                            <label for="prodAlignment4">
                                60개씩 보기
                                <input type="checkbox" id="prodAlignment4" onclick="prodNumViewMove(60);">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                    
                    <div class="sidebar__sizes">
                        <div class="section-title">
                            <h4>가격</h4>
                        </div>
                        <div class="size__list">
                            <label for="priceOrderAll" style="padding-left: 0px;">
                                    <a id="priceOrderAll" style="cursor: pointer;" onclick="priceViewMove('all', 0, 0)"><span style="color: #0073e9; font-weight: bold;">가격 전체</span></a>
                            </label>
                            <label for="priceOrder1">
                                    5만원 이하
                                <input type="checkbox" id="priceOrder1" onclick="priceViewMove('less', 0, 0)">
                                <span class="checkmark"></span>
                            </label>
                            <label for="priceOrder2">
                                   5만원 ~ 20만원
                                <input type="checkbox" id="priceOrder2" onclick="priceViewMove('avg', 50000, 200000)">
                                <span class="checkmark"></span>
                            </label>
                            <label for="priceOrder3">
                                    20만원 ~ 60만원
                                <input type="checkbox" id="priceOrder3" onclick="priceViewMove('avg', 200000, 600000)">
                                <span class="checkmark"></span>
                            </label>
                            <label for="priceOrder4">
                                    60만원 ~ 100만원
                                <input type="checkbox" id="priceOrder4" onclick="priceViewMove('avg', 600000, 1000000)">
                                <span class="checkmark"></span>
                            </label>
                            <label for="priceOrder5">
                                    100만원 이상
                                <input type="checkbox" id="priceOrder5" onclick="priceViewMove('great', 0, 0)">
                                <span class="checkmark"></span>
                            </label>
                            <div>
                                <span><input type="text" maxlength="10" class="writePriceInput" id="minPrice"></span>
                                <span>~</span>
                                <span><input type="text" maxlength="10" class="writePriceInput" id="maxPrice"></span>
                                <span style="font-size: 13px;">원</span>
                                <span><button type="button" class="btn btn-info btn-xs" id="priceRangeBtn" onclick="priceViewMove('avgInput', 0, 0)">검색</button></span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="sidebar__sizes">
                        <div class="section-title">
                            <h4>별점</h4>
                        </div>
                        <div class="size__list">
                            <label for="pdScoreAll" style="padding-left: 0px;">
                                    <a id="productAll" style="cursor: pointer;" onclick="prodScoreViewMove('false', 0);"><span style="color: #0073e9; font-weight: bold;">별점 전체</span></a>
                            </label>
                            <label for="pdScoreFive">
                                    <span style="margin-right: 10px;">
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    </span>
                                    5점
                                <input type="checkbox" id="pdScoreFive" onclick="prodScoreViewMove('true', 5);">
                                <span class="checkmark"></span>
                            </label>
                            <label for="pdScoreFour">
                                    <span style="margin-right: 10px;">
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    </span>
                                    4점
                                <input type="checkbox" id="pdScoreFour" onclick="prodScoreViewMove('true', 4);">
                                <span class="checkmark"></span>
                            </label>
                            <label for="pdScoreThree">
                                    <span style="margin-right: 10px;">
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    </span>
                                    3점
                                <input type="checkbox" id="pdScoreThree" onclick="prodScoreViewMove('true', 3);">
                                <span class="checkmark"></span>
                            </label>
                            <label for="pdScoreTwo">
                                    <span style="margin-right: 10px;">
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    </span>
                                    2점
                                <input type="checkbox" id="pdScoreTwo" onclick="prodScoreViewMove('true', 2);">
                                <span class="checkmark"></span>
                            </label>
                            <label for="pdScoreOne">
                                    <span style="margin-right: 10px;">
                                    <i class="fa fa-star" style="color: #e3c01c; margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    <i class="fa fa-star" style="margin-right: -4px;"></i>
                                    </span>
                                    1점
                                <input type="checkbox" id="pdScoreOne" onclick="prodScoreViewMove('true', 1);">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:useBean id="referDate" class="java.util.Date" />
			<jsp:setProperty name="referDate" property="time" value="${referDate.time - 60*60*24*1000*7}"/>
            <c:choose>
            <c:when test="${fn:length(prodList) != 0}">
            <div class="col-lg-9 col-md-9">
                <div class="row">
                    <c:forEach var="item" items="${prodList }">
                    <div class="col-lg-4 col-md-6">
                        <c:choose>
                        <c:when test="${item.product_totQty == 0 }">
                        	<div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="${item.product_img1 }" style="cursor: pointer;" onclick="location.href='/mall/prodDetail/main?prodId=${item.product_id }'">
                            	<div class="label stockout stockblue">일시품절</div>
                            </div>
                        </c:when>
                        <c:when test="${item.product_totQty != 0 && item.product_popularProduct == 'Y' }">
                        	<div class="product__item sale">
                            <div class="product__item__pic set-bg" data-setbg="${item.product_img1 }" style="cursor: pointer;" onclick="location.href='/mall/prodDetail/main?prodId=${item.product_id }'">
                            	<div class="label">HOT</div>
                            </div>
                        </c:when>
                        <c:when test="${item.product_date > referDate }">
                        	<div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="${item.product_img1 }" style="cursor: pointer;" onclick="location.href='/mall/prodDetail/main?prodId=${item.product_id }'">
                            <div class="label new">New</div>
                            </div>
                        </c:when>
                        <c:otherwise>
                        	<div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="${item.product_img1 }" style="cursor: pointer;" onclick="location.href='/mall/prodDetail/main?prodId=${item.product_id }'">
                            </div>
                        </c:otherwise>
                        </c:choose>
                            <div class="product__item__text">
                                <h6 class="prodName"><a href="/mall/prodDetail/main?prodId=${item.product_id }">${item.product_name }</a></h6>
                                <c:if test="${item.product_prodAvgScore != 0 }">
	                                <c:if test="${item.product_prodAvgScore == 1 }">
		                                <div class="rating">
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                </div>
	                                </c:if>
	                                <c:if test="${item.product_prodAvgScore == 2 }">
		                                <div class="rating">
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                </div>
	                                </c:if>
	                                <c:if test="${item.product_prodAvgScore == 3 }">
		                                <div class="rating">
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                </div>
	                                </c:if>
	                                <c:if test="${item.product_prodAvgScore == 4 }">
		                                <div class="rating">
		                                    <span>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star" style="color: #777777;"></i>
		                                    </span>
		                                    <c:forEach var="reviewNum" items="${reviewNum }">
		                                    	<c:if test="${item.product_id == reviewNum.product_id }">
		                                    		<span class="starScoreReviewNum">(${reviewNum.prouctReview_count })</span>
		                                    	</c:if>
		                                    </c:forEach>
		                                </div>
	                                </c:if>
	                                <c:if test="${item.product_prodAvgScore == 5 }">
		                                <div class="rating">
		                                	<span>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    <i class="fa fa-star"></i>
		                                    </span>
		                                    <span class="starScoreReviewNum">(3)</span>
		                                </div>
	                                </c:if>
                                </c:if>
                                <div class="product__price"><fmt:formatNumber value="${item.product_sellPrice }" pattern="#,###" /><span>원</span></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="col-lg-12 text-center">
                        <div class="pagination__option" style="border-top: 1px solid #eee; padding-top: 15px;">
                            <c:if test="${paging.prev }">
                            	<a onclick="pageNumMove(${param.page - 1});" style="cursor: pointer;"><i class="fa fa-angle-left"></i></a>
                            </c:if>
                            <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNo">
                            	<a onclick="pageNumMove(${pageNo});" id="pageNum${pageNo }" style="cursor: pointer;">${pageNo }</a>
                            </c:forEach>
                            <c:if test="${paging.next }">
                            	<a onclick="pageNumMove(${param.page + 1});" style="cursor: pointer;"><i class="fa fa-angle-right"></i></a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            </c:when>
            <c:otherwise>
            	<div class="listNoItem">
            	<img src="../../resources/mallMain/img/default/noProductInfoIcon.png" style="height: 160px; margin-bottom: 20px;"/>
            	<p style="margin-bottom: 0px; font-size: 16px; color: #444; font-weight: bold;">상품 준비 중입니다.</p>
            	<p style="color: #444;">빠른 시일 내에 좋은 상품으로 찾아 뵙겠습니다.</p>
            	</div>
            </c:otherwise>
        </c:choose>
        </div>
    </div>
</section>
<!-- Shop Section End -->
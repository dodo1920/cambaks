<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>Cambark's</title>

<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/SHWtamplet.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageAside.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageTemplet.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>

<script type="text/javascript">

function check_date(date, idNum) {
	
	
	let dateArr = date.split('-');
	let today = new Date();
	let buyDate = new Date(dateArr[0], dateArr[1] -1, dateArr[2]);
	let dayAgo = (today - buyDate) / 86400000;
	
	console.log(dayAgo);
	
	if(dayAgo > 7){
		let output = '<div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button>';
		output += '<h2 class="modal-title">교환 환불 신청</h2></div><div class="modal-body">7일이 지난 상품은 교환 환불이 불가능 합니다.</div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div></div>';
		
		$("#modalChange"+idNum).html(output);
	}

}

function purchaseSubmit(serialNo, payment_date) {
	
	$.ajax({
		type : "get",
		dataType : "json", // 받을 데이터
		//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
		url : "myOrder/purchaseSubmit",// 서블릿 주소
		data : {serialNo : serialNo, payment_date : payment_date},
		success : function(result) {
			console.log(result);
			
		}, // 통신 성공시
		error : function(result) {
			
		}, // 통신 실패시
		complete : function(result) {
			console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			console.log(result);
//			if(result != null){
				
//			}
			
			
		} // 통신 완료시
	});
}

$(document).ready(function(){
	
	
	});

</script>


<style type="text/css">
.emptySpace{
	margin:20px;
}

.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>
</head>

<body>
  <%@include file="../cambak21Header.jsp"%>

<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">


<div>

			<!--  효원이 디자인 시작 -->
				<div class="profile">
						<div>
							<div class="profileSize">
								<a href=""></a><img src="../../resources/cambak21/img/trip.jpg" class="userProfileImg">
								<h4>${loginMember.member_id }</h4>
								<div class="profileEmail">${loginMember.member_email }</div>
							</div>
							<div class="profileCategory">
								<ul>
									<li class="profileMenu1"><a href="#" class="profileMenu">마이 페이지</a></li>
									<li class="profileMenu2"><a href="#" class="profileMenu">회원 정보 수정</a></li>
								</ul>
							</div>
						</div>
					</div>
		<!--  효원이 디자인 끝  -->

	<!-- Sidebar top -->
	<div id="sidebar" class="4u">
		<div class="sidebar">
			<div class="panel panel-success">
				<div class="panel-heading">
					<p class="category-title" id="category-title" style="margin-bottom: 0px;">나의 캠박이일</p>
				</div>
			</div>
			<ul class="nav nav-pills nav-stacked">
				<li id="myPost"><a href="/myPage/myPost?member_id=${loginMember.member_id }&page=1">내가 쓴 글</a></li>
				<li id="humorAside"><a href="#">내 댓글</a></li>
				<li id="QnAAside"><a href="#">내 좋아요 글</a></li>
				<li id="resellAside"><a href="#">나의 문의</a></li>
		
			</ul>
		</div>
	</div>

	<!-- Sidebar -->
	<div id="sidebar" class="4u">
		<div class="sidebar">
			<div class="panel panel-success">
				<div class="panel-heading">
					<p class="category-title" id="category-title"  style="margin-bottom: 0px;">캠박몰</p>
				</div>
			</div>
			<ul class="nav nav-pills nav-stacked">
				<li id="#"><a href="#">적립금 관리</a></li>
				<li id="#"><a href="#">주문 목록</a></li>
				<li id="#"><a href="#">취소 / 반품</a></li>
				<li id="#"><a href="#">구매 목록</a></li>
			</ul>
		</div>
	</div>




</div>
			
		
		<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>주문 목록</h2>
							<span class="byline" id="rollNot"><a href="/board/notice/listCri">공지사항 상세페이지</a></span>
						</header>
				
				
    <!-- 요 안에 작성하시오 Main -->
	<div>
		<div>
			<div>
				
				<div><form action="/myMall/searchOrder" method="post"><input type="text" name="searchWord" style="width:80%;" placeholder="주문한상품을 검색할 수 있어요"><input type="submit" class="btn btn-info" value="검색"></form></div>
			<!-- 	<div class="emptySpace"></div> -->
									<div class="btn-group">
								<!-- 	<div style="font-size:20px;font-weight: bold;">검색기간</div> -->
									<!-- <div class="emptySpace"></div>
										<button type="button" class="btn btn-default">1개월</button>
										<button type="button" class="btn btn-default">3개월</button>
										<button type="button" class="btn btn-default">6개월</button>
										<button type="button" class="btn btn-default">1년</button>
										<button type="button" class="btn btn-default">3년</button> -->
									</div>
									<div class="emptySpace"></div>
									<div id="output">
									
									<c:forEach var="order" items="${order }">
									
									
										<c:choose>
											<c:when test="${order.payment_isComit == '결제완료' }">
											<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left; margin: 10px;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">${order.payment_serialNo }</strong></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
																<img
																	src= ${order.product_img1 }
																	width="100" height="100" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 ${order.buyProduct_totPrice }<em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<div class="btn-group-vertical"
																style="float: right; margin-left: 60px; margin-bottom: 35px">
																<button type="button" class="btn btn-info" onclick="location.href='detail/${order.payment_serialNo }'">주문상세
																	보기</button>
																<button type="button" id="check_date${order.buyProduct_no }" onclick="check_date('${order.payment_date}',${order.buyProduct_no } )" class="btn btn-info" data-toggle="modal" data-target="#myModal${order.buyProduct_no }">교환
																	반품 신청</button>
																
																	<button type="button" class="btn btn-info" onclick="purchaseSubmit(${order.payment_serialNo },${order.payment_date });">구매확정</button>
																	<button type="button" class="btn btn-info" onclick="location.href='http://localhost:8081/cambakMall/writingProdReviews?payment_serialNo=${order.payment_serialNo }'">리뷰작성하기</button>
																
																

															</div>
														</td>
													</tr>

												</tbody>
											</table>
											
												<!-- Modal -->
												<div class="modal fade" id="myModal${order.buyProduct_no }" role="dialog">
													<div class="modal-dialog" id="modalChange${order.buyProduct_no }">

														<!-- Modal content-->
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h2 class="modal-title">교환 환불 신청</h2>
															</div>
															<div class="modal-body">
																<p>교환 환불 선택</p>
																<select>
																	<option value="교환신청">교환</option>
																	<option value="환불신청">환불</option>
																</select>
																<p>사유를 선택해 주세요</p>
																<input type="radio" value="단순변심" checked="checked">단순변심
																<input type="radio" value="배송문제">배송문제
																<input type="radio" value="상품문제">상품문제
																
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</div>

													</div>
												</div>
											</div>
											</c:when>
											<c:when test="${order.payment_isComit == '주문취소' }">
												<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left; margin: 10px;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">주문 취소</strong></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
																<img
																	src= ${order.product_img1 }
																	width="110" height="110" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 ${order.buyProduct_totPrice }<em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<div class="btn-group-vertical"
																style="float: right; margin-left: 60px; margin-bottom: 35px">
																<button type="button" class="btn btn-info" onclick="location.href='detail/${order.payment_serialNo }'">주문상세
																	보기</button>
																

															</div>
														</td>
													</tr>

												</tbody>
											</table>
											
												
											</div>
											</c:when>
											<c:when test="${order.payment_isComit == '환불요청'}">
												<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left; margin: 10px;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">환불 상품</strong></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
																<img
																	src= ${order.product_img1 }
																	width="110" height="110" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 ${order.buyProduct_totPrice }<em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<div class="btn-group-vertical"
																style="float: right; margin-left: 60px; margin-bottom: 35px">
																<button type="button" class="btn btn-info" onclick="location.href='detail/${order.payment_serialNo }'">주문상세
																	보기</button>
																

															</div>
														</td>
													</tr>

												</tbody>
											</table>
											
												
											</div>
											</c:when>
										
										<c:when test="${order.payment_isComit == '교환요청'}">
										<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left; margin: 10px;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">환불 상품</strong></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
																<img
																	src= ${order.product_img1 }
																	width="110" height="110" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 ${order.buyProduct_totPrice }<em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<div class="btn-group-vertical"
																style="float: right; margin-left: 60px; margin-bottom: 35px">
																<button type="button" class="btn btn-info" onclick="location.href='detail/${order.payment_serialNo }'">주문상세
																	보기</button>
																
																
															</div>
														</td>
													</tr>

												</tbody>
											</table>
											
											</div>
										</c:when>
										</c:choose>
									</c:forEach>
									</div>
								</div>	
								<div class="pageBtn">
							<ul class="pagination">
							<c:choose>
							<c:when
								test="${param.searchType == null && param.searchWord == null }">
							<c:if test="${pagingParam.prev }">
									<li class="page-item"><a class="page-link"
										href="myOrder?page=${param.page -1}">prev</a></li>
								</c:if>
								<c:forEach begin="${pagingParam.startPage }"
									end="${pagingParam.endPage }" var="pageNo">
									<li class="page-item"><a class="page-link"
										href="myOrder?page=${pageNo}">${pageNo }</a></li>
								</c:forEach>
							<c:if test="${pagingParam.next }">
									<li class="page-item"><a class="page-link"
										href="myOrder?page=${param.page +1}">next</a></li>
								</c:if>
								</c:when>
								<c:otherwise>
								<c:if test="${pagingParam.prev }">
									<li class="page-item"><a class="page-link"
										href="search?page=${param.page -1}&searchWord=${param.searchWord}">prev</a></li>
								</c:if>
								<c:forEach begin="${pagingParam.startPage }"
									end="${pagingParam.endPage }" var="pageNo">
									<li class="page-item"><a class="page-link"
										href="search?page=${pageNo}&searchWord=${param.searchWord}">${pageNo }</a>
									</li>
								</c:forEach>

								<c:if test="${pagingParam.next }">
									<li class="page-item"><a class="page-link"
										href="search?page=${param.page +1}&searchWord=${param.searchWord}">next</a>
									</li>
								</c:if>
							</c:otherwise>
							
								</c:choose>
							</ul>
						</div>	
		</div>
	</div>

	<!-- 요 까지 작성하시오 /Main -->
				
				
				
        </section>   
    
   
      </div>
  
	</div>
	</div>
	</div>
	
    <%@include file="../cambak21Footer.jsp"%>
	
</body>
</html>
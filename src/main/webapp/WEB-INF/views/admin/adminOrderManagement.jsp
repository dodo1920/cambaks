<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- 화면 너비 자동반응 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<title>Cambak's - Admin Pages</title>

<!-- css -->
<link href="../resources/adminDist/css/bootstrap.min.css" type="text/css">
<link href="../resources/adminDist/css/font-awesome.min.css" type="text/css">
<link href="../resources/adminDist/css/elegant-icons.css" type="text/css">
<link href="../resources/adminDist/css/jquery-ui.min.css" type="text/css">
<link href="../resources/adminDist/css/magnific-popup.css" type="text/css">
<link href="../resources/adminDist/css/owl.carousel.min.css" type="text/css">
<link href="../resources/adminDist/css/slicknav.min.css" type="text/css">
<link href="../resources/adminDist/css/style.css" type="text/css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/quill/dist/quill.snow.css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">

<!-- js -->
<script src="../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<script src="../resources/adminAssets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="../resources/adminAssets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../resources/adminAssets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../resources/adminAssets/extra-libs/sparkline/sparkline.js"></script>
<script src="../resources/adminDist/js/waves.js"></script>
<script src="../resources/adminDist/js/sidebarmenu.js"></script>
<script src="../resources/adminDist/js/custom.min.js"></script>
<script src="../resources/adminAssets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="../resources/adminDist/js/pages/mask/mask.init.js"></script>
<script src="../resources/adminAssets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="../resources/adminAssets/libs/select2/dist/js/select2.min.js"></script>
<script src="../resources/adminAssets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
<script src="../resources/adminAssets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
<script src="../resources/adminAssets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
<script src="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
<script src="../resources/adminAssets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/adminAssets/libs/quill/dist/quill.min.js"></script>

<script>

$(document).ready(function() {
	
});





</script>
<style>

</style>
</head>
<body>
<div class="preloader">
	<div class="lds-ripple">
		<div class="lds-pos"></div>
		<div class="lds-pos"></div>
	</div>
</div>
<div id="main-wrapper">
<%@ include file="adminTop.jsp"%>
<%@ include file="adminAside.jsp"%>
<div class="page-wrapper">
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">주문목록</h4>
				<div class="ml-auto text-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">홈</a></li>
							<li class="breadcrumb-item active" aria-current="page">주문목록</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<div class="form-group row">
							<label class="col-md-1 m-t-15">검색어</label>
							<div class="col-md-1">
								<select class="select form-control" name="checkOption" style="height:36px;">
									<optgroup label="-검색항목선택-">
										<option value="orderNum">주문번호</option>
										<option value="PurchaseName">주문자명</option>
										<option value="PurchaseId">주문자 아이디</option>
										<option value="PurchaseEmail">회원 이메일</option>
										<option value="PurchasePhone">주문자 휴대전화</option>
									</optgroup>
									<optgroup label="---------------">
										<option value="RecipientName">수령자명</option>
										<option value="RecipientPhone">수령자 휴대전화</option>
										<option value="RecipientAddr">배송지 주소</option>
									</optgroup>
								</select>
							</div>
							<div class="col-md-3">
							    <input type="text" class="form-control" name="checkOptionSearch">
							</div>
							<div class="col-md-7"></div>
						</div>
						<div class="form-group row">
						    <label class="col-md-1">주문일</label>
						    <div class="col-md-7">
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">오늘</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">어제</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">3일</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">7일</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">15일</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">1개월</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">3개월</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 10px;" onclick="">6개월</button>
							    <input type="date" id="checkLowDate" onchange="" />
							    <span>~</span>
							    <input type="date" id="checkHighDate" onchange="" />
							    <div id="checkOrderDate">
								    <input type="hidden" value="" name="checkDate"/>
								    <input type="hidden" value="" name="checkLowDate"/>
								    <input type="hidden" value="" name="checkHighDate"/>
							    </div>
						    </div>
						    <div class="col-md-4"></div>
						</div>
						<div class="form-group row">
							<label class="col-md-1 m-t-15">상품</label>
							<div class="col-md-1">
								<select class="select form-control" name="productInfo" style="height:36px;">
										<option value="">상품명</option>
										<option value="">제조사</option>
								</select>
							</div>
							<div class="col-md-3">
							    <input type="text" name="productInfoSearch" class="form-control">
							</div>
							<div class="col-md-7"></div>
						</div>
						<div class="form-group row">
							<label class="col-md-1 m-t-15">주문상태</label>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" name="orderStatusTotal" id="orderStatusTotal">
								    <label class="custom-control-label" for="orderStatusTotal">전체</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" name="orderDeliveryReady" id="orderDeliveryReady">
								    <label class="custom-control-label" for="orderDeliveryReady">배송준비중</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" name="orderOnDeliver" id="orderOnDeliver">
								    <label class="custom-control-label" for="orderOnDeliver">배송중</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" name="orderDeliverCompleted" id="orderDeliverCompleted">
								    <label class="custom-control-label" for="orderDeliverCompleted">배송완료</label>
								</div>
							</div>
							<div class="col-md-9"></div>
						</div>
						<div class="form-group row">
							<label class="col-md-1 m-t-15">CS주문상태</label>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" name="csStatusTotal" id="csStatusTotal">
								    <label class="custom-control-label" for="csStatusTotal">전체</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" name="csStatusCancel" id="csStatusCancel">
								    <label class="custom-control-label" for="csStatusCancel">취소</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" name="csStatusChange" id="csStatusChange">
								    <label class="custom-control-label" for="csStatusChange">교환</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" name="csStatusReturn" id="csStatusReturn">
								    <label class="custom-control-label" for="csStatusReturn">반품</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" name="csStatusRefund" id="csStatusRefund">
								    <label class="custom-control-label" for="csStatusRefund">환불</label>
								</div>
							</div>
							<div class="col-md-6"></div>
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
							<span style="margin-right: 5px;">
							<button type="submit" class="btn btn-primary">검색</button>
							</span>
							<span style="margin-left: 5px;">
							<button type="button" class="btn btn-light" onclick="location.href='/admin/orderManagement?page=1'">초기화</button>
							</span>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-striped table-bordered dataTable" style="font-size: 13px;">
										<thead>
											<tr role="row">
												<th style="font-weight: bold; width: 100px;">주문번호</th>
												<th style="font-weight: bold; width: 150px;">주문일(결제일)</th>
												<th style="font-weight: bold; width: 75px;">주문자</th>
												<th style="font-weight: bold; width: 180px;">상품명</th>
												<th style="font-weight: bold; width: 85px;">받는사람</th>
												<th style="font-weight: bold; width: 130px;">배송지 연락처</th>
												<th style="font-weight: bold; width: 102px;">사용 포인트</th>
												<th style="font-weight: bold; width: 102px;">결제수단</th>
												<th style="font-weight: bold; width: 102px;">총 주문금액</th>
												<th style="font-weight: bold; width: 90px;">배송 상태</th>
												<th style="font-weight: bold; width: 100px;">교환, 환불 여부</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="orderList" items="${order.orderList }">
											<tr role="row">
												<td>${orderList.payment_no }</td>
												<td><fmt:formatDate value="${orderList.payment_date }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
												<td>${orderList.member_name }<br/>(${orderList.member_id })</td>
												<td>
													<c:choose>
													<c:when test="${orderList.orderProductNum != 0 }">
														${orderList.product_name }
														<br />
														<strong>외 ${orderList.orderProductNum }건</strong>
													</c:when>
													<c:otherwise>
														${orderList.product_name }
													</c:otherwise>
													</c:choose>
												</td>
												<td>${orderList.destination_toUser }</td>
												<td>${orderList.destination_mobile }</td>
												<td><fmt:formatNumber value="${orderList.point_usedPoint }" pattern="#,###" /></td>
												<td>${orderList.payInfo_way }</td>
												<td><fmt:formatNumber value="${orderList.buyProduct_totPrice }" pattern="#,###" /></td>
												<td>${orderList.delivery_status }</td>
												<td>${orderList.payment_isComit }</td>
											</tr>
											</c:forEach>
										</tbody>
                                    </table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-5"></div>
									<div class="col-sm-12 col-md-7">
										<div>
											<ul class="pagination">
												<c:if test="${order.paging.prev }">
												<li class="page-item">
													<a class="page-link" href="#" aria-label="Previous">
														<span aria-hidden="true">«</span>
														<span class="sr-only">Previous</span>
													</a>
												</li>
												</c:if>
												<c:forEach begin="${order.paging.startPage }" end="${order.paging.endPage }" var="pageNo">
												<li class="page-item active">
													<a href="#" class="page-link">${pageNo }</a>
												</li>
												</c:forEach>
												<c:if test="${order.paging.next }">
												<li class="page-item">
													<a class="page-link" href="#" aria-label="Next">
														<span aria-hidden="true">»</span>
														<span class="sr-only">Next</span>
													</a>
												</li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="adminFooter.jsp"%>
</div>
</body>
</html>
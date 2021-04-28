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

<script>

$(document).ready(function() {

datwpicker();
pageNumColor();
   
});

function searchDataChk() {
	let checkLowDate = $("#checkLowDate").val();
	let checkHighDate = $("#checkHighDate").val();
	let result = true;
	
	if (checkLowDate != "" && checkHighDate == "") {
		alert("검색할 주문일을 확인바랍니다.");
		result = false;
	} else if (checkLowDate == "" && checkHighDate != "") {
		alert("검색할 주문일을 확인바랍니다.");
		result = false;
	}
	
	if (result) {
		$("#orderManageSearch").submit();
	}
	
}

function csStatusCheck() {
   let cancelRequest = $("#csCancelRequest").prop("checked");
   let cancelCompleted = $("#csCancelCompleted").prop("checked");
   let changeRequest = $("#csChangeRequest").prop("checked");
   let changeCompleted = $("#csChangeCompleted").prop("checked");
   let returnRequest = $("#csReturnRequest").prop("checked");
   let returnCompleted = $("#csReturnCompleted").prop("checked");
   let refundRequest = $("#csRefundRequest").prop("checked");
   let refundCompleted = $("#csRefundCompleted").prop("checked");
   
   if (cancelRequest && cancelCompleted && changeRequest && changeCompleted && returnRequest && returnCompleted && refundRequest && refundCompleted) {
      $("#csStatusTotal").prop("checked", true);
   } else {
      $("#csStatusTotal").prop("checked", false);
   }
   
}

function csStatusTotalCheck() {
   
   if ($("#csStatusTotal").prop("checked")) {
      $("#csCancelRequest").prop("checked", true);
      $("#csCancelCompleted").prop("checked", true);
      $("#csChangeRequest").prop("checked", true);
      $("#csChangeCompleted").prop("checked", true);
      $("#csReturnRequest").prop("checked", true);
      $("#csReturnCompleted").prop("checked", true);
      $("#csRefundRequest").prop("checked", true);
      $("#csRefundCompleted").prop("checked", true);
   } else {
      $("#csCancelRequest").prop("checked", false);
      $("#csCancelCompleted").prop("checked", false);
      $("#csChangeRequest").prop("checked", false);
      $("#csChangeCompleted").prop("checked", false);
      $("#csReturnRequest").prop("checked", false);
      $("#csReturnCompleted").prop("checked", false);
      $("#csRefundRequest").prop("checked", false);
      $("#csRefundCompleted").prop("checked", false);
   }
   
}

function orderStatusCheck() {
   let ready = $("#orderDeliveryReady").prop("checked");
   let on = $("#orderOnDelivery").prop("checked");
   let completed = $("#orderDeliveryCompleted").prop("checked");
   
   if (ready && on && completed) {
      $("#orderStatusTotal").prop("checked", true);
   } else {
      $("#orderStatusTotal").prop("checked", false);
   }
   
}

function orderStatusTotalCheck() {
   
   if ($("#orderStatusTotal").prop("checked")) {
      $("#orderDeliveryReady").prop("checked", true);
      $("#orderOnDelivery").prop("checked", true);
      $("#orderDeliveryCompleted").prop("checked", true);
   } else {
      $("#orderDeliveryReady").prop("checked", false);
      $("#orderOnDelivery").prop("checked", false);
      $("#orderDeliveryCompleted").prop("checked", false);
   }
   
}

function purchaseStatusCheck() {
   let Before = $("#purchaseConfirmationBefore").prop("checked");
   let confirmation = $("#purchaseConfirmation").prop("checked");
   
   if (Before && confirmation) {
      $("#purchaseStatusAll").prop("checked", true);
   } else {
      $("#purchaseStatusAll").prop("checked", false);
   }
   
}

function purchaseStatusAllCheck() {
   
   if ($("#purchaseStatusAll").prop("checked")) {
      $("#purchaseConfirmationBefore").prop("checked", true);
      $("#purchaseConfirmation").prop("checked", true);
   } else {
      $("#purchaseConfirmationBefore").prop("checked", false);
      $("#purchaseConfirmation").prop("checked", false);
   }
   
}

function calendarSearch(change) {
   
   for (let i = 1; i < 8; i++) {
      $("#orderDate" + i).css("background-color", "");
      $("#orderDate" + i).css("border-color", "");
      $("#orderDate" + i).css("font-weight", "");
   }
   
   if (change == "start") {
      let startDate = $("#startDate").val().split("/");
      $("#checkLowDate").val(startDate[2] + "-" + startDate[0] + "-" + startDate[1]);
      
   } else if (change == "end") {
      let endDate = $("#endDate").val().split("/");
      $("#checkHighDate").val(endDate[2] + "-" + endDate[0] + "-" + endDate[1]);
   }
   
   $("#checkDate").val(0);
}

function searchDate(order, date) {
   $("#checkDate").val(date);
   $("#checkLowDate").val("");
   $("#checkHighDate").val("");
   
   for (let i = 1; i < 8; i++) {
      $("#orderDate" + i).css("background-color", "");
      $("#orderDate" + i).css("border-color", "");
      $("#orderDate" + i).css("font-weight", "");
   }
   
   $("#orderDate" + order).css("background-color", "#eeeeee");
   $("#orderDate" + order).css("border-color", "#eeeeee");
   $("#orderDate" + order).css("font-weight", "bold");
   $("#startDate").val("");
   $("#endDate").val("");
   
}

function pageNumColor() {
   let page = '${param.page}';
   $("#pageNum" + page).attr("class", "page-item active");
}

function datwpicker() {
/*datwpicker*/
$('#startDate').datepicker({
   autoclose: true,
   todayHighlight: true,

});

/*datwpicker*/
$('#endDate').datepicker({
   autoclose: true,
   todayHighlight: true,
});
}
   
</script>
<style>

.custom-control-label{
	cursor: pointer;
}

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
            <form action="/admin/orderManagement/search" id="orderManageSearch">
            <div class="card">
               <div class="card-body">
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">검색어</label>
                     <div class="col-md-2">
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
                         <input type="text" class="form-control" name="checkOptionSearch" autocomplete="off">
                     </div>
                     <div class="col-md-6"></div>
                  </div>
                  <div class="form-group row">
                      <label class="col-md-1">주문일</label>
                      <div class="col-md-3">
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate1" onclick="searchDate(1, 1);">오늘</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate2" onclick="searchDate(2, 3);">3일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate3" onclick="searchDate(3, 7);">7일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate4" onclick="searchDate(4, 15);">15일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate5" onclick="searchDate(5, 30);">1개월</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate6" onclick="searchDate(6, 90);">3개월</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 10px;" id="orderDate7" onclick="searchDate(7, 180);">6개월</button>
                         <div id="checkOrderDate">
                            <input type="hidden" value="" id="checkDate" name="checkDate" />
                            <input type="hidden" value="" id="checkLowDate" name="checkLowDate" />
                            <input type="hidden" value="" id="checkHighDate" name="checkHighDate" />
                         </div>
                      </div>
                      <div class="col-md-2">
                        <div class="input-group">
                           <input type="text" class="form-control" id="startDate" onchange="calendarSearch('start');" placeholder="월 / 일 / 년" autocomplete="off">
                           <div class="input-group-append">
                              <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                           </div>
                        </div>
                     </div>
                     <span>~</span>
                     <div class="col-md-2">
                        <div class="input-group">
                           <input type="text" class="form-control" id="endDate" onchange="calendarSearch('end');" placeholder="월 / 일 / 년" autocomplete="off">
                           <div class="input-group-append">
                              <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">상품</label>
                     <div class="col-md-1">
                        <select class="select form-control" name="productInfo" style="height:36px;">
                              <option value="prodName">상품명</option>
                              <option value="manufacturer">제조사</option>
                        </select>
                     </div>
                     <div class="col-md-3">
                         <input type="text" name="productInfoSearch" class="form-control" autocomplete="off">
                     </div>
                     <div class="col-md-7"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">구매확정</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="purchaseStatusAll" id="purchaseStatusAll" onchange="purchaseStatusAllCheck();" checked>
                            <label class="custom-control-label" for="purchaseStatusAll">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="purchaseConfirmationBefore" id="purchaseConfirmationBefore" onchange="purchaseStatusCheck();" checked>
                            <label class="custom-control-label" for="purchaseConfirmationBefore">구매확정전</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="purchaseConfirmation" id="purchaseConfirmation" onchange="purchaseStatusCheck();" checked>
                            <label class="custom-control-label" for="purchaseConfirmation">구매확정완료</label>
                        </div>
                     </div>
                     <div class="col-md-9"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">주문상태</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="orderStatusTotal" onchange="orderStatusTotalCheck();" checked>
                            <label class="custom-control-label" for="orderStatusTotal">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="orderDeliveryReady" id="orderDeliveryReady" onchange="orderStatusCheck();" checked>
                            <label class="custom-control-label" for="orderDeliveryReady">배송전</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="orderOnDelivery" id="orderOnDelivery" onchange="orderStatusCheck();" checked>
                            <label class="custom-control-label" for="orderOnDelivery">배송중</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="orderDeliveryCompleted" id="orderDeliveryCompleted" onchange="orderStatusCheck();" checked>
                            <label class="custom-control-label" for="orderDeliveryCompleted">배송완료</label>
                        </div>
                     </div>
                     <div class="col-md-9"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">CS주문상태</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="csStatusTotal" onchange="csStatusTotalCheck();" checked>
                            <label class="custom-control-label" for="csStatusTotal">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="csCancelRequest" id="csCancelRequest" onchange="csStatusCheck();" checked>
                            <label class="custom-control-label" for="csCancelRequest">주문취소요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="csCancelCompleted" id="csCancelCompleted" onchange="csStatusCheck();" checked>
                            <label class="custom-control-label" for="csCancelCompleted">주문취소완료</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="csChangeRequest" id="csChangeRequest" onchange="csStatusCheck();" checked>
                            <label class="custom-control-label" for="csChangeRequest">교환요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="csChangeCompleted" id="csChangeCompleted" onchange="csStatusCheck();" checked>
                            <label class="custom-control-label" for="csChangeCompleted">교환완료</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="csReturnRequest" id="csReturnRequest" onchange="csStatusCheck();" checked>
                            <label class="custom-control-label" for="csReturnRequest">반품요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="csReturnCompleted" id="csReturnCompleted" onchange="csStatusCheck();" checked>
                            <label class="custom-control-label" for="csReturnCompleted">반품완료</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="csRefundRequest" id="csRefundRequest" onchange="csStatusCheck();" checked>
                            <label class="custom-control-label" for="csRefundRequest">환불요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="csRefundCompleted" id="csRefundCompleted" onchange="csStatusCheck();" checked>
                            <label class="custom-control-label" for="csRefundCompleted">환불완료</label>
                        </div>
                     </div>
                     <div class="col-md-5"></div>
                  </div>
               </div>
               <div class="border-top">
                  <div class="card-body">
                     <span style="margin-right: 5px;">
                     <button type="button" class="btn btn-primary" onclick="searchDataChk();">검색</button>
                     </span>
                     <span style="margin-left: 5px;">
                     <button type="button" class="btn btn-light" onclick="location.href='/admin/orderManagement?page=1'">초기화</button>
                     </span>
                  </div>
               </div>
            </div>
            </form>
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
                                       <a class="page-link" href="/admin/orderManagement?page=${param.page - 1 }" aria-label="Previous">
                                          <span aria-hidden="true">«</span>
                                          <span class="sr-only">Previous</span>
                                       </a>
                                    </li>
                                    </c:if>
                                    <c:forEach begin="${order.paging.startPage }" end="${order.paging.endPage }" var="pageNo">
                                    <li class="page-item" id="pageNum${pageNo }">
                                       <a href="/admin/orderManagement?page=${pageNo }" class="page-link">${pageNo }</a>
                                    </li>
                                    </c:forEach>
                                    <c:if test="${order.paging.next }">
                                    <li class="page-item">
                                       <a class="page-link" href="/admin/orderManagement?page=${param.page + 1 }" aria-label="Next">
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
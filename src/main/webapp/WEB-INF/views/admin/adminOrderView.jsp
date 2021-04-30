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
<link href="../../resources/adminDist/css/bootstrap.min.css" type="text/css">
<link href="../../resources/adminDist/css/font-awesome.min.css" type="text/css">
<link href="../../resources/adminDist/css/elegant-icons.css" type="text/css">
<link href="../../resources/adminDist/css/jquery-ui.min.css" type="text/css">
<link href="../../resources/adminDist/css/magnific-popup.css" type="text/css">
<link href="../../resources/adminDist/css/owl.carousel.min.css" type="text/css">
<link href="../../resources/adminDist/css/slicknav.min.css" type="text/css">
<link href="../../resources/adminDist/css/style.css" type="text/css">
<link href="../../resources/adminDist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/adminAssets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="../../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css" href="../../resources/adminAssets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link href="../../resources/adminDist/css/style.min.css" rel="stylesheet">

<!-- js -->
<script src="../../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<script src="../../resources/adminAssets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="../../resources/adminAssets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../../resources/adminAssets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../../resources/adminAssets/extra-libs/sparkline/sparkline.js"></script>
<script src="../../resources/adminDist/js/waves.js"></script>
<script src="../../resources/adminDist/js/sidebarmenu.js"></script>
<script src="../../resources/adminDist/js/custom.min.js"></script>
<script src="../../resources/adminAssets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="../../resources/adminDist/js/pages/mask/mask.init.js"></script>
<script src="../../resources/adminAssets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="../../resources/adminAssets/libs/select2/dist/js/select2.min.js"></script>
<script src="../../resources/adminAssets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
<script src="../../resources/adminAssets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
<script src="../../resources/adminAssets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
<script src="../../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
<script src="../../resources/adminAssets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

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
            <form action="/admin/orderManagement/search" id="orderManageSearch">
            <div class="card">
               <div class="card-body">
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">검색어</label>
                     <div class="col-md-2" style="padding: 0px;">
                        <select class="select form-control" name="checkOption" style="height:36px;" id="checkOption">
                           <optgroup label="-검색항목선택-">
                              <option id="orderNum" value="orderNum">주문번호</option>
                              <option id="PurchaseName" value="PurchaseName">주문자명</option>
                              <option id="PurchaseId" value="PurchaseId">주문자 아이디</option>
                              <option id="PurchaseEmail" value="PurchaseEmail">회원 이메일</option>
                              <option id="PurchasePhone" value="PurchasePhone">주문자 휴대전화</option>
                           </optgroup>
                           <optgroup label="---------------">
                              <option id="RecipientName" value="RecipientName">수령자명</option>
                              <option id="RecipientPhone" value="RecipientPhone">수령자 휴대전화</option>
                              <option id="RecipientAddr" value="RecipientAddr">배송지 주소</option>
                           </optgroup>
                        </select>
                     </div>
                     <div class="col-md-3">
                         <input type="text" class="form-control" name="checkOptionSearch" id="checkOptionSearch" autocomplete="off">
                     </div>
                     <div class="col-md-6"></div>
                  </div>
                  <div class="form-group row">
                      <label class="col-md-1">주문일</label>
                      <div class="col-md-3" style="padding: 0px;">
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate1" onclick="searchDate(1, 1);">오늘</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate2" onclick="searchDate(2, 3);">3일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate3" onclick="searchDate(3, 7);">7일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate4" onclick="searchDate(4, 15);">15일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate5" onclick="searchDate(5, 30);">1개월</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate6" onclick="searchDate(6, 90);">3개월</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 10px;" id="orderDate7" onclick="searchDate(7, 180);">6개월</button>
                         <div id="checkOrderDate">
                            <input type="hidden" value="0" id="checkDate" name="checkDate" />
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
                     <div class="col-md-1" style="padding: 0px;">
                        <select class="select form-control" name="productInfo" id="productInfo" style="height:36px;">
                              <option id="prodName" value="prodName">상품명</option>
                              <option id="manufacturer" value="manufacturer">제조사</option>
                        </select>
                     </div>
                     <div class="col-md-3">
                         <input type="text" name="productInfoSearch" id="productInfoSearch" class="form-control" autocomplete="off">
                     </div>
                     <div class="col-md-7"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">구매확정</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="purchaseStatus" id="purchaseStatusAll" value="purchaseStatusAll" required>
                            <label class="custom-control-label" for="purchaseStatusAll">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="purchaseStatus" id="purchaseConfirmationBefore" value="purchaseConfirmationBefore">
                            <label class="custom-control-label" for="purchaseConfirmationBefore">구매확정전</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="purchaseStatus" id="purchaseConfirmation" value="purchaseConfirmation">
                            <label class="custom-control-label" for="purchaseConfirmation">구매확정완료</label>
                        </div>
                     </div>
                     <div class="col-md-9"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">주문상태</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="orderStatus" name="orderStatus" value="orderStatus" required>
                            <label class="custom-control-label" for="orderStatus">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="orderStatus" id="orderDeliveryReady" value="orderDeliveryReady">
                            <label class="custom-control-label" for="orderDeliveryReady">배송전</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="orderStatus" id="orderOnDelivery" value="orderOnDelivery">
                            <label class="custom-control-label" for="orderOnDelivery">배송중</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="orderStatus" id="orderDeliveryCompleted" value="orderDeliveryCompleted">
                            <label class="custom-control-label" for="orderDeliveryCompleted">배송완료</label>
                        </div>
                     </div>
                     <div class="col-md-9"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">CS주문상태</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="csStatusTotal" name="csStatus" value="csStatusTotal" required>
                            <label class="custom-control-label" for="csStatusTotal">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csCancelRequest" value="csCancelRequest">
                            <label class="custom-control-label" for="csCancelRequest">주문취소요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csCancelCompleted" value="csCancelCompleted">
                            <label class="custom-control-label" for="csCancelCompleted">주문취소완료</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csChangeRequest" value="csChangeRequest">
                            <label class="custom-control-label" for="csChangeRequest">교환요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csChangeCompleted" value="csChangeCompleted">
                            <label class="custom-control-label" for="csChangeCompleted">교환완료</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csRefundRequest" value="csRefundRequest">
                            <label class="custom-control-label" for="csRefundRequest">환불요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csRefundCompleted" value="csRefundCompleted">
                            <label class="custom-control-label" for="csRefundCompleted">환불완료</label>
                        </div>
                     </div>
                     <div class="col-md-5">
                     	<input type="hidden" name="page" value="1"/>
                     </div>
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
                        <form action="/admin/orderManagement/search" id="orderManageSearch">
            <div class="card">
               <div class="card-body">
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">검색어</label>
                     <div class="col-md-2" style="padding: 0px;">
                        <select class="select form-control" name="checkOption" style="height:36px;" id="checkOption">
                           <optgroup label="-검색항목선택-">
                              <option id="orderNum" value="orderNum">주문번호</option>
                              <option id="PurchaseName" value="PurchaseName">주문자명</option>
                              <option id="PurchaseId" value="PurchaseId">주문자 아이디</option>
                              <option id="PurchaseEmail" value="PurchaseEmail">회원 이메일</option>
                              <option id="PurchasePhone" value="PurchasePhone">주문자 휴대전화</option>
                           </optgroup>
                           <optgroup label="---------------">
                              <option id="RecipientName" value="RecipientName">수령자명</option>
                              <option id="RecipientPhone" value="RecipientPhone">수령자 휴대전화</option>
                              <option id="RecipientAddr" value="RecipientAddr">배송지 주소</option>
                           </optgroup>
                        </select>
                     </div>
                     <div class="col-md-3">
                         <input type="text" class="form-control" name="checkOptionSearch" id="checkOptionSearch" autocomplete="off">
                     </div>
                     <div class="col-md-6"></div>
                  </div>
                  <div class="form-group row">
                      <label class="col-md-1">주문일</label>
                      <div class="col-md-3" style="padding: 0px;">
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate1" onclick="searchDate(1, 1);">오늘</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate2" onclick="searchDate(2, 3);">3일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate3" onclick="searchDate(3, 7);">7일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate4" onclick="searchDate(4, 15);">15일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate5" onclick="searchDate(5, 30);">1개월</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate6" onclick="searchDate(6, 90);">3개월</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 10px;" id="orderDate7" onclick="searchDate(7, 180);">6개월</button>
                         <div id="checkOrderDate">
                            <input type="hidden" value="0" id="checkDate" name="checkDate" />
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
                     <div class="col-md-1" style="padding: 0px;">
                        <select class="select form-control" name="productInfo" id="productInfo" style="height:36px;">
                              <option id="prodName" value="prodName">상품명</option>
                              <option id="manufacturer" value="manufacturer">제조사</option>
                        </select>
                     </div>
                     <div class="col-md-3">
                         <input type="text" name="productInfoSearch" id="productInfoSearch" class="form-control" autocomplete="off">
                     </div>
                     <div class="col-md-7"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">구매확정</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="purchaseStatus" id="purchaseStatusAll" value="purchaseStatusAll" required>
                            <label class="custom-control-label" for="purchaseStatusAll">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="purchaseStatus" id="purchaseConfirmationBefore" value="purchaseConfirmationBefore">
                            <label class="custom-control-label" for="purchaseConfirmationBefore">구매확정전</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="purchaseStatus" id="purchaseConfirmation" value="purchaseConfirmation">
                            <label class="custom-control-label" for="purchaseConfirmation">구매확정완료</label>
                        </div>
                     </div>
                     <div class="col-md-9"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">주문상태</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="orderStatus" name="orderStatus" value="orderStatus" required>
                            <label class="custom-control-label" for="orderStatus">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="orderStatus" id="orderDeliveryReady" value="orderDeliveryReady">
                            <label class="custom-control-label" for="orderDeliveryReady">배송전</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="orderStatus" id="orderOnDelivery" value="orderOnDelivery">
                            <label class="custom-control-label" for="orderOnDelivery">배송중</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="orderStatus" id="orderDeliveryCompleted" value="orderDeliveryCompleted">
                            <label class="custom-control-label" for="orderDeliveryCompleted">배송완료</label>
                        </div>
                     </div>
                     <div class="col-md-9"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">CS주문상태</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="csStatusTotal" name="csStatus" value="csStatusTotal" required>
                            <label class="custom-control-label" for="csStatusTotal">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csCancelRequest" value="csCancelRequest">
                            <label class="custom-control-label" for="csCancelRequest">주문취소요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csCancelCompleted" value="csCancelCompleted">
                            <label class="custom-control-label" for="csCancelCompleted">주문취소완료</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csChangeRequest" value="csChangeRequest">
                            <label class="custom-control-label" for="csChangeRequest">교환요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csChangeCompleted" value="csChangeCompleted">
                            <label class="custom-control-label" for="csChangeCompleted">교환완료</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csRefundRequest" value="csRefundRequest">
                            <label class="custom-control-label" for="csRefundRequest">환불요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csRefundCompleted" value="csRefundCompleted">
                            <label class="custom-control-label" for="csRefundCompleted">환불완료</label>
                        </div>
                     </div>
                     <div class="col-md-5">
                     	<input type="hidden" name="page" value="1"/>
                     </div>
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
                        <form action="/admin/orderManagement/search" id="orderManageSearch">
            <div class="card">
               <div class="card-body">
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">검색어</label>
                     <div class="col-md-2" style="padding: 0px;">
                        <select class="select form-control" name="checkOption" style="height:36px;" id="checkOption">
                           <optgroup label="-검색항목선택-">
                              <option id="orderNum" value="orderNum">주문번호</option>
                              <option id="PurchaseName" value="PurchaseName">주문자명</option>
                              <option id="PurchaseId" value="PurchaseId">주문자 아이디</option>
                              <option id="PurchaseEmail" value="PurchaseEmail">회원 이메일</option>
                              <option id="PurchasePhone" value="PurchasePhone">주문자 휴대전화</option>
                           </optgroup>
                           <optgroup label="---------------">
                              <option id="RecipientName" value="RecipientName">수령자명</option>
                              <option id="RecipientPhone" value="RecipientPhone">수령자 휴대전화</option>
                              <option id="RecipientAddr" value="RecipientAddr">배송지 주소</option>
                           </optgroup>
                        </select>
                     </div>
                     <div class="col-md-3">
                         <input type="text" class="form-control" name="checkOptionSearch" id="checkOptionSearch" autocomplete="off">
                     </div>
                     <div class="col-md-6"></div>
                  </div>
                  <div class="form-group row">
                      <label class="col-md-1">주문일</label>
                      <div class="col-md-3" style="padding: 0px;">
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate1" onclick="searchDate(1, 1);">오늘</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate2" onclick="searchDate(2, 3);">3일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate3" onclick="searchDate(3, 7);">7일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate4" onclick="searchDate(4, 15);">15일</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate5" onclick="searchDate(5, 30);">1개월</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="orderDate6" onclick="searchDate(6, 90);">3개월</button>
                         <button type="button" class="btn btn-light btn-sm" style="margin-right: 10px;" id="orderDate7" onclick="searchDate(7, 180);">6개월</button>
                         <div id="checkOrderDate">
                            <input type="hidden" value="0" id="checkDate" name="checkDate" />
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
                     <div class="col-md-1" style="padding: 0px;">
                        <select class="select form-control" name="productInfo" id="productInfo" style="height:36px;">
                              <option id="prodName" value="prodName">상품명</option>
                              <option id="manufacturer" value="manufacturer">제조사</option>
                        </select>
                     </div>
                     <div class="col-md-3">
                         <input type="text" name="productInfoSearch" id="productInfoSearch" class="form-control" autocomplete="off">
                     </div>
                     <div class="col-md-7"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">구매확정</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="purchaseStatus" id="purchaseStatusAll" value="purchaseStatusAll" required>
                            <label class="custom-control-label" for="purchaseStatusAll">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="purchaseStatus" id="purchaseConfirmationBefore" value="purchaseConfirmationBefore">
                            <label class="custom-control-label" for="purchaseConfirmationBefore">구매확정전</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="purchaseStatus" id="purchaseConfirmation" value="purchaseConfirmation">
                            <label class="custom-control-label" for="purchaseConfirmation">구매확정완료</label>
                        </div>
                     </div>
                     <div class="col-md-9"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">주문상태</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="orderStatus" name="orderStatus" value="orderStatus" required>
                            <label class="custom-control-label" for="orderStatus">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="orderStatus" id="orderDeliveryReady" value="orderDeliveryReady">
                            <label class="custom-control-label" for="orderDeliveryReady">배송전</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="orderStatus" id="orderOnDelivery" value="orderOnDelivery">
                            <label class="custom-control-label" for="orderOnDelivery">배송중</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="orderStatus" id="orderDeliveryCompleted" value="orderDeliveryCompleted">
                            <label class="custom-control-label" for="orderDeliveryCompleted">배송완료</label>
                        </div>
                     </div>
                     <div class="col-md-9"></div>
                  </div>
                  <div class="form-group row">
                     <label class="col-md-1 m-t-15">CS주문상태</label>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="csStatusTotal" name="csStatus" value="csStatusTotal" required>
                            <label class="custom-control-label" for="csStatusTotal">전체</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csCancelRequest" value="csCancelRequest">
                            <label class="custom-control-label" for="csCancelRequest">주문취소요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csCancelCompleted" value="csCancelCompleted">
                            <label class="custom-control-label" for="csCancelCompleted">주문취소완료</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csChangeRequest" value="csChangeRequest">
                            <label class="custom-control-label" for="csChangeRequest">교환요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csChangeCompleted" value="csChangeCompleted">
                            <label class="custom-control-label" for="csChangeCompleted">교환완료</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csRefundRequest" value="csRefundRequest">
                            <label class="custom-control-label" for="csRefundRequest">환불요청</label>
                        </div>
                     </div>
                     <div class="col-ms" style="margin-right: 15px;">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="csStatus" id="csRefundCompleted" value="csRefundCompleted">
                            <label class="custom-control-label" for="csRefundCompleted">환불완료</label>
                        </div>
                     </div>
                     <div class="col-md-5">
                     	<input type="hidden" name="page" value="1"/>
                     </div>
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
         </div>
      </div>
   </div>
</div>
<%@ include file="adminFooter.jsp"%>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 화면 너비 자동반응 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- 아이콘 및 타이틀 -->
<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<title>Cambak's - Admin Pages</title>
<!-- Custom CSS -->
<link href="../resources/adminAssets/libs/flot/css/float-chart.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<style>
#content {
	min-height: 750px;
	padding: 0 40px 40px;
	box-sizing: border-box;
	vertical-align: top;
}

input, select, textarea {
	font-size: 14px;
	color: #2e3039;
	vertical-align: middle;
	font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana',
		sans-serif;
}

.headingArea {
	position: relative;
	margin: 0 0 38px;
}

html:lang(ko) .headingArea {
	padding-top: 20px;
}

.mTitle {
	position: relative;
	margin: 40px 0 14px;
}

.mBreadcrumb {
	position: absolute;
	right: 0px;
	top: 10px;
}

html:lang(ko) .headingArea .mBreadcrumb {
	top: 20px;
	left: 0;
}

.mTab.typeNav {
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: -ms-flex;
	display: -moz-flex;
	display: flex;
	background-color: #f5f7fb;
}

.section {
	margin: 0 0 30px;
	padding: 30px 20px;
	border-radius: 2px;
	border: 1px solid #ddd;
	background: #fff;
	-webkit-box-shadow: 0 2px 1px 0 rgb(205, 211, 222);
	-moz-box-shadow: 0 2px 1px 0 rgba(205, 211, 222, 1);
	box-shadow: 0 2px 1px 0 rgb(205, 211, 222);
}

element.style {
	display: none;
	width: auto;
	position: absolute;
	z-index: 200;
	left: 780px;
	top: 180px;
}

.mBreadcrumb li {
	position: relative;
	display: inline-block;
	margin: 0 0 0 6px;
	color: #969daa;
	font-size: 13px;
	line-height: 19px;
}

.mTab.typeNav>ul {
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: -ms-flex;
	display: -moz-flex;
	display: flex;
	position: relative;
	width: 100%;
	border: 1px solid #c9ced9;
}

.mTab.typeNav>ul>li.selected {
	background-color: #55a0ff;
}

.mTab.typeNav>ul>li {
	min-width: 180px;
	text-align: center;
	border-right: 1px solid #c9ced9;
}

.mButton.gCenter {
	position: relative;
	text-align: center;
}

.mButton {
	margin: 20px 0;
	padding: 0 4px 0 0;
	text-align: right;
}

.section .mTitle:first-child {
	margin-top: 0;
}

.mTitle {
	position: relative;
	margin: 40px 0 14px;
}

.mState {
	margin: 10px 0;
	line-height: 20px;
}

.mState .gLeft {
	float: left;
}

.mState .total {
	float: left;
	margin: 0 8px 0 0;
	color: #97989b;
}

.mCtrl.setting {
	padding-right: 52px;
	min-height: 22px;
}

.mCtrl.typeHeader {
	position: relative;
	z-index: 1;
	margin-bottom: -1px;
}

.mCtrl {
	padding: 7px 15px;
	border: 1px solid #dedede;
	line-height: 21px;
	text-align: center;
	background: #fff;
}

.mCtrl .gLeft .txtLess {
	vertical-align: middle;
}

.txtLess {
	font-size: 13px;
}

.mCtrl .gLeft {
	float: left;
	text-align: left;
}

.btnNormal {
	height: 28px;
	padding: 0 10px;
	color: #1c1c1c;
	font-size: 13px;
	font-weight: normal;
	line-height: 26px;
	border: 1px solid #98989b;
	background-color: #fff;
	-webkit-transition: .2s ease-out;
	transition: .2s ease-out;
}

[class^="btn"] {
	cursor: pointer;
}

.fSelect {
	padding: 0 30px 0 10px;
	background: #fff
		url(//img.echosting.cafe24.com/ec/mode/influencer/common/ico_select.png)
		no-repeat right 10px center;
}

.fSelect {
	display: inline;
	height: 32px;
	margin: 0;
	padding: 0 6px;
	border: 1px solid #d4d4d4;
	color: #2e3039;
	font-size: 14px;
	line-height: 30px;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
}

option {
	font-weight: normal;
	display: block;
	white-space: nowrap;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}

.mState .gRight {
	float: right;
}

.mBoard.typeSearch th[scope*='row']+td {
	padding: 4px 20px;
}

.mBoard th[scope*='row']+td {
	height: 32px;
}

.mBoard.gSmall td {
	width: auto;
}

tbody>tr>td {
	border-top-width: 0;
}

.mBoard tbody td {
	border: 1px solid #dedede;
}

.mBoard td {
	padding: 10px 15px;
	line-height: 24px;
	vertical-align: top;
}

th, td {
	border: 0;
	word-wrap: break-word;
}

.btnIcon.icoCal {
	width: 19px;
	height: 19px;
	vertical-align: text-top;
	background-position: -50px -500px;
}

a.btnIcon, button.btnIcon, span.btnIcon, .btnIcon:before {
	display: inline-block;
	overflow: hidden;
	width: 28px;
	height: 28px;
	font-size: 0;
	line-height: 0;
	vertical-align: middle;
	white-space: nowrap;
	background:
		url(//img.echosting.cafe24.com/ec/mode/influencer/common/sfix_icon_button.png)
		0 0 no-repeat;
	box-sizing: border-box;
}

[class^="btn"] {
	cursor: pointer;
}

.btnDate {
	min-width: 46px;
	height: 28px;
	padding: 5px 8px;
	font-size: 13px;
	line-height: 26px;
	color: #2e3039;
	border: 1px solid #98989b;
	background-color: #fff;
	-webkit-transition: .2s ease-out;
	transition: .2s ease-out;
}

.mBreadcrumb li.now {
	color: #2a3954;
	text-decoration: underline;
}

.mBoard .mBoard.gSmall th, .mBoard.gSmall th {
	width: 150px;
}

.mBoard tbody th {
	border: 1px solid #dedede;
	text-align: left;
	word-break: keep-all;
}

.mBoard th {
	padding: 11px 15px 10px;
	vertical-align: top;
	color: #2e3039;
	background-color: #f3f3f3;
}

[class^="btn"] {
	cursor: pointer;
}

.btnDate+.btnDate {
	position: relative;
	z-index: 1;
	margin-left: -5px;
	/*     border-right: 0; */
}

.mBoard tfoot>tr>th, .mBoard tbody>tr>td {
	border-top-width: 0;
}

.fText.gDate {
	/*     width: 100px; */
	text-align: center;
}

.fText {
	height: 32px;
	line-height: 14px;
}

.fText, .fTextarea {
	max-width: 100%;
	padding: 0 9px 2px;
	box-sizing: border-box;
	border: 1px solid #d4d4d4;
	font-size: 14px;
	line-height: 26px;
	color: #686b6d;
	outline: 0 none;
	transition: border .2s ease-out;
}

.mBoard table {
	line-height: 1.5;
	background-color: #fff;
	border-top: 1px solid #dedede;
}

table {
	table-layout: fixed;
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}

.mTitle h2 {
    display: inline-block;
    height: 22px;
    padding: 0 5px 0 0;
    font-size: 16px;
    line-height: 18px;
    color: #2e3039;
    font-weight: normal;
    vertical-align: middle;
}
.mState .total strong {
    color: #ff4311;
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
		<!-- 헤더 -->
		<%@ include file="adminTop.jsp"%>
		<!-- 어사이드 -->
		<%@ include file="adminAside.jsp"%>

		<div class="page-wrapper">
			<div id="content">
				<form name="frm" id="frm" method="post"
					action="./board_admin_bulletin_l.php" target="_self">
					<input type="hidden" name="mode" value=""> <input
						type="hidden" id="EC_SDE_SHOP_NUM" value="1"> <input
						type="hidden" id="isFloatingNumber" value="F"> <input
						type="hidden" id="sNewboardAnd12rFlag" value="T"> <input
						type="hidden" id="sIsUse12R" value="T"> <input
						type="hidden" id="MALL_ID" value="neomart"> <input
						type="hidden" id="PRODUCT_VER" value="2"> <input
						type="hidden" id="hiddenToday" value="2021-04-26"> <input
						type="hidden" name="period" value="30"> <input
						type="hidden" id="navi_hide" name="navi_hide" value="">

					<div class="headingArea">
						<div class="mTitle">
							<h1>게시물 관리</h1>
							<div class="cTip" code="BR.BO.BA.110"></div>
							<span style="display: none;" class="cManual" code="BR.BO.BA"
								href="brd/brd1010001"></span>

						</div>
						<div class="mBreadcrumb">
							<ol>
								<li class="home">홈</li>
								<li>게시판관리</li>
								<li class="now" title="현재 페이지">게시물 관리</li>
							</ol>
						</div>
					</div>

					<div class="mTab typeNav" style="display: none;">
						<ul>
							<li class="selected"><a href="#none">전체 게시물 보기</a></li>
							<li><a href="board_admin_bulletin_comment_l.php">전체 댓글
									보기</a></li>
						</ul>
					</div>

					<div class="section">
						<div class="mBoard gSmall typeSearch">
							<table border="1" summary="">
							
								<tbody>
									<tr>
										<th scope="row">기간</th>
										<td colspan="3"><a href="#none" class="btnDate" title="0"><span>오늘</span></a>
											<a href="#none" class="btnDate" title="3"><span>3일</span></a>
											<a href="#none" class="btnDate" title="7"><span>7일</span></a>
											<a href="#none" class="btnDate selected" title="30"><span>1개월</span></a>
											<input type="date" id="startDate" class="fText gDate"
											name="start_date" value="2021-03-27"> ~ <input
											type="date" id="endDate" class="fText gDate" name="end_date"
											value="2021-04-26"></td>
									</tr>
									<tr>
										<th scope="row">게시판 선택</th>
										<td colspan="3"><select class="fSelect" id="sel_board_no"
											name="sel_board_no">
												<option value="">전체목록</option>
												<option value="1">공지사항</option>
												<option value="4">상품 사용후기</option>
												<option value="6">상품 Q&amp;A</option>
												<option value="5">자유게시판</option>
												<option value="8">갤러리</option>
												<option value="2">뉴스/이벤트</option>
												<option value="3">이용안내 FAQ</option>
												<option value="9">1:1 맞춤상담</option>
												<option value="3001">자유게시판3</option>
												<option value="101">상품자유게시판</option>
												<option value="1002">자유게시판2</option>
												<option value="7">자료실</option>
												<option value="1001">한줄메모</option>
										</select> <select class="fSelect" id="board_category"
											name="board_category" style="display: none;">
												<option value="">카테고리 전체</option>
										</select></td>

									</tr>
									<tr>
										<th scope="row">게시글 찾기</th>
										<td colspan="3"><select id="search" name="searchboard"
											class="fSelect">
												<option value="subject">제목</option>
												<option value="content">내용</option>
												<option value="writer_name">작성자</option>
										</select> <input type="text" id="search_key" name="search_key" value=""
											class="fText" style="width: 400px;"> <span
											style="display: none;"> <a
												href="javascript:view_board('submit');" class="btnSearch"><span>검색</span></a>
										</span> </td>
									</tr>
										<tr>
										<th scope="row">댓글 찾기</th>
										<td colspan="3"><select id="search" name="searchReply"
											class="fSelect">
												<option value="subject">제목</option>
												<option value="content">내용</option>
												<option value="writer_name">작성자</option>
										</select> <input type="text" id="search_key" name="search_key" value=""
											class="fText" style="width: 400px;"> <span
											style="display: none;"> <a
												href="javascript:view_board('submit');" class="btnSearch"><span>검색</span></a>
										</span> </td>
									</tr>
																
								</tbody>
							</table>
						</div>
						<div class="mButton gCenter">
							<a id="eBtnSearch" href="javascript:view_board('submit');"
								class="btnSearch"><span>검색</span></a>
							
						</div>
					</div>

					<div class="section">
						<div class="mTitle">
							<h2>전체 게시물 목록</h2>
						</div>
						<div class="mState">
							<div class="gLeft">
								<p class="total">
									[오늘 등록된 새 글 <strong>1</strong>건] 검색결과 <strong>1</strong> 건 <span
										id="admngDebug"><script id="admngEffectScript"
											type="text/javascript" charset="utf-8"
											src="https://ad.cafe24.com/adManager/util/javascript/adMngEffect.js?ver=1.0.0"></script>
										<script id="cookieScript" type="text/javascript"
											charset="utf-8"
											src="https://ad.cafe24.com/adManager/util/javascript/adMngCookie.js?ver=1.0.0"></script>
										<script id="admngLayerScript" type="text/javascript"
											charset="utf-8"
											src="https://ad.cafe24.com/adManager/util/javascript/adMngLayer.js?ver=1.0.0"></script>
										<link id="admngCSS" type="text/css" rel="stylesheet"
											href="https://ad.cafe24.com/adManager/util/javascript/admngCSS.css?ver=1.0.0">
										<script id="admngURLLog" type="text/javascript"
											src="https://ad.cafe24.com/adManager/controller/ConclusionURLAD.php?siteType=malladmin&amp;url=https%3A%2F%2Fneomart.cafe24.com%2Fadmin%2Fphp%2Fshop1%2Fb%2Fboard_admin_bulletin_l.php"></script>
										<script type="text/javascript"
											src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=malladmin&amp;userID_ADParam=neomart&amp;ckStr=&amp;ckAllStr=&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1619409121628&amp;contentURLFull=https%3A%2F%2Fneomart.cafe24.com%2Fadmin%2Fphp%2Fshop1%2Fb%2Fboard_admin_bulletin_l.php"></script></span>
									<script type="text/javascript" charset="utf-8"
										src="//ad.cafe24.com/adManager/util/javascript/adMngLayer.js"></script>
									<script id="admng" charset="utf-8" type="text/javascript"
										src="//ad.cafe24.com/adManager/logic/WebAnalysis.js?siteType=malladmin&amp;userID=neomart"></script>
									<span id="admngSide_1"></span>
								</p>
							</div>
							<div class="gRight">
								<select class="fSelect" id="eSearchSort" name="searchSort"
									onchange="view_board('submit');" align="absmiddle">
									<option value="" selected="selected">기본정렬</option>
									<option value="H">조회수많은순</option>
								</select> <select class="fSelect" id="list_limit" name="list_limit"
									onchange="view_board('submit');" align="absmiddle">
									<option value="10" selected="">10개씩보기</option>
									<option value="20">20개씩보기</option>
									<option value="30">30개씩보기</option>
									<option value="50">50개씩보기</option>
									<option value="100">100개씩보기</option>
								</select>
							</div>
						</div>
						
							<div class="gLeft">
								<span class="txtLess"><blank></blank></span> <a href="#none"
									class="btnNormal"
									onclick="javascript:delete_choice('delete', '삭제할 게시물을 선택해 주세요.', 'P');"><span><em
										class="icoDel"></em> 삭제</span></a>
								</div>
						
						<div class="mBoard gScroll gCell typeList">
							<table border="1" summary="" class="eChkTr">
								<caption>전체 게시물 목록</caption>
								<colgroup>
									<col class="chk">
									<col style="width: 70px;">
									<col style="width: 120px;">
									<col class="COLUMN_product_name"
										style="width: 200px; display: none;">
									<col style="width: 100px; display: none;">
									<col style="width: 300px;">
									<col style="width: 120px;">
									<col style="width: 95px;">
									<col style="width: 95px;">
									<col style="width: 140px;">
									<col style="width: 100px;">
									<col class="date">
									<col style="width: 80px;">
									<col style="width: 110px;">
									<col class="date COLUMN_order_date" style="display: none;">
									<col class="date COLUMN_refund_request_date"
										style="display: none;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><input type="checkbox" class="allChk"></th>
										<th scope="col">번호</th>
										<th scope="col">분류</th>
										<th class="COLUMN_product_name" style="display: none;"
											scope="col">상품명</th>
										<th scope="col" style="display: none;">카테고리</th>
										<th scope="col">제목</th>
										<th scope="col">답변상태</th>
										<th scope="col">미리보기</th>
										<th scope="col">답변하기</th>
										<th scope="col">작성자</th>
										<th scope="col">메일/SMS/메모</th>
										<th scope="col">작성일</th>
										<th scope="col">조회수</th>
										<th scope="col">적립금</th>
										<th class="COLUMN_order_date" style="display: none;"
											scope="col">주문일</th>
										<th class="COLUMN_refund_request_date" style="display: none;"
											scope="col">환불신청일</th>
									</tr>
								</thead>
								<tbody class="center">
									<tr>
										<td><input type="checkbox" name="bbs_no[]" value="1"
											class="rowChk"> <input type="hidden" name="no[]"
											value="1"> <input type="hidden" id="iBoardNo_1"
											value="1"> <input type="hidden" id="iBoardGroup_1"
											value="1"> <input type="hidden" id="eIsDeleted_1"
											value="F"> <input type="hidden" id="`iBoardGroup_1"
											value="1"> <input type="hidden" id="iNotice_1"
											value="F"> <input type="hidden" id="iFixed_1"
											value="F"></td>
										<!-- 번호 -->
										<td>1</td>
										<!-- 분류명 -->
										<td><a href="javascript:open_board1('1','1');"
											class="txtLink"> 공지사항 </a></td>
										<!-- 상품명 -->
										<td class="COLUMN_product_name" style="display: none;">
											<div class="gGoods gMedium">

												<p>
													<a href="#none" class="txtLink"></a>
												</p>
											</div>
										</td>

										<!-- 카테고리 -->

										<td style="display: none;"></td>
										<!-- 제목 -->
										<td class="left"><a
											href="javascript:open_detail_view('1','1','1');"
											class="txtLink"> 몰 오픈을 축하합니다. </a> <!-- 게시함여부 --> <!-- 노출설정 -->

										</td>
										<!-- 답변상태 -->
										<td id="reply_status_msg_1">-</td>
										<!-- 미리보기 -->
										<td><a href="#layerPreview"
											class="layerPreviewPopup btnNormal eLayerClick"
											data-board-no="1" data-no="1" data-board-group="1"
											data-save-btn="F" namelayer="layer_0" bindstatus="true"><span>미리보기</span></a>
										</td>
										<!-- 답변하기 -->
										<td>-</td>
										<!-- 작성자 -->
										<td><input type="hidden" id="writer_type_1" value="">
											EC Hosting <br> (비회원)</td>
										<!-- 메일 / SMS / 메모 -->
										<td></td>
										<!-- 작성일 -->
										<td>2021-04-26 07:12:00</td>
										<!-- 조회 -->
										<td class="right">0</td>
										<!-- 적립금 -->
										<td>
											<div id="mileage_icon_1"></div>
											<div class="COLUMN_mileage_date" style="display: none;"></div>
										</td>

										<!-- 주문일 -->

										<td class="COLUMN_order_date" style="display: none;"></td>

										<!-- 환불신청일 -->

										<td class="COLUMN_refund_request_date" style="display: none;"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="mCtrl typeFooter">
							<div class="gLeft">
								<span class="txtLess"><blank></blank></span> <a href="#none"
									class="btnNormal"
									onclick="javascript:delete_choice('delete','삭제할 게시물을 선택해 주세요.', 'P');"><span><em
										class="icoDel"></em> 삭제</span></a> <a href="#none" class="btnCtrl"
									onclick="chkMileageSupplyLayer();"><span>적립금 일괄 적용</span></a> <a
									href="#none" class="btnNormal eNoticeBulletinRegist"><span>공지등록</span></a>
								<a href="#none" class="btnNormal eNoticeBulletinCancel"><span>공지해제</span></a>
								<a href="#none" class="btnNormal eFixedBulletinRegist"><span>글고정
										지정</span></a> <a href="#none" class="btnNormal eFixedBulletinCancel"><span>글고정
										해제</span></a> <a href="#none" class="btnNormal"
									onclick="chkErrorValidition('before');" style="display: none;"><span>게시글
										노출시간 설정</span></a>
							</div>
							<div class="gRight">
								<a href="#none" class="btnNormal"
									onclick="SpamMoveInit('move','스팸신고할 게시물을 선택해 주세요.')"
									style="display: none;"><span>스팸신고</span></a> <a href="#none"
									class="btnNormal"
									onclick="SpamMoveInit('cancel','스팸해제할 게시물을 선택해 주세요');"
									style="display: none;"><span>스팸해제</span></a>
							</div>
						</div>
						<div class="mPaginate">
							<a
								href="/admin/php/shop1/b/board_admin_bulletin_l.php?&amp;sel_board_no=&amp;sel_spam_view=in&amp;list_limit=10&amp;navi_hide=&amp;search=&amp;search_key=&amp;start_date=2021-03-27&amp;end_date=2021-04-26&amp;period=30&amp;is_reply=&amp;is_comment=&amp;real_filename=&amp;mem_type=&amp;search_channel=&amp;searchSort=&amp;no_member_article=&amp;board_category=&amp;page=1"
								class="first"><span>첫 페이지</span></a> <a href="#none"
								class="prev"><span>이전 10 페이지</span></a>
							<ol>
								<li><strong title="현재페이지">1</strong></li>
							</ol>
							<a href="#none" class="next"><span>다음 10 페이지</span></a> <a
								href="/admin/php/shop1/b/board_admin_bulletin_l.php?&amp;sel_board_no=&amp;sel_spam_view=in&amp;list_limit=10&amp;navi_hide=&amp;search=&amp;search_key=&amp;start_date=2021-03-27&amp;end_date=2021-04-26&amp;period=30&amp;is_reply=&amp;is_comment=&amp;real_filename=&amp;mem_type=&amp;search_channel=&amp;searchSort=&amp;no_member_article=&amp;board_category=&amp;page=1"
								class="last"><span>마지막 페이지</span></a>
						</div>
					</div>


				</form>

				<div id="memo_view_cafe24"
					style="position: absolute; visibility: hidden;">
					<table class="table_white" cellpadding="3" cellspacing="3"
						border="0" style="border: 1px solid;" width="300" height="100">
						<tbody>
							<tr>
								<td
									style="padding-top: 5px; BACKGROUND: white; FILTER: alpha(opacity = 85);"
									valign="top">
									<!--ECHOSTING-330543 : padding 추가 -->
									<div id="memo_view_detail_cafe24" style="padding: 10px;"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="mBox typeBg" style="display: none;">
					<div class="gLeft">
						<ul class="mList typeMore">
							<li>게시판에서 삭제된 글 확인/복원 가능한 기능입니다.</li>
							<li><span class="txtWarn">삭제된 글은 삭제일로 부터 30일 동안만 저장되고
									30일이 경과한 게시글은 영구 삭제되어 복원 불가능합니다.</span></li>
						</ul>
					</div>
					<div class="gRight">
						<a href="#none" class="btnSubmit"
							onclick="window.open('board_admin_bulletin_del_list.php','board_admin_bulletin_del_list','width=800,height=900,scrollbars=yes');"><span>삭제된
								글 보기</span></a>
					</div>
				</div>

				<!--미리보기-->
				<div class="mLayer ui-draggable ui-resizable"
					style="display: none; width: auto;" id="layerPreview">
					<h2>게시글 내용 미리보기</h2>
					<div class="wrap" style="width: 400px; height: 400px;"
						id="eBulletinContentWrap">
						<iframe id="eBulletinContent" frameborder="0" width="400px"
							height="400px" marginwidth="0" marginheight="0" scrolling="auto"></iframe>
					</div>
					<div class="footer">
						<a href="#none" class="btnNormal eClose"><span>닫기</span></a>
					</div>
					<button type="button" class="btnClose eClose"
						id="layerPreviewClose">닫기</button>
					<div class="ui-resizable-handle ui-resizable-e"
						style="z-index: 90;"></div>
					<div class="ui-resizable-handle ui-resizable-s"
						style="z-index: 90;"></div>
					<div
						class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se"
						style="z-index: 90;"></div>
				</div>
			</div>
			<!-- 본문 작성  -->
			<div class="container-fluid">
				<H3>DAD S마넝</H3>
			</div>
			<!-- 본문 작성 끝  -->
			<%@ include file="adminFooter.jsp"%>
			<%@ include file="adminJs.jsp"%>
		</div>

	</div>

</body>
</html>
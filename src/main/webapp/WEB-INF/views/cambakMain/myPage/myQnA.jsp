<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>Cambark's</title>

<link rel="icon" type="image/x-icon"
	href="../../resources/cambak21/assets/favicon.ico" />

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet"
	href="../../resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet"
	href="../../resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet"
	href="../../../resources/cambak21/css/SHWtamplet.css" />
<link rel="stylesheet"
	href="../../../resources/cambak21/css/myPageAside.css" />
<link rel="stylesheet"
	href="../../../resources/cambak21/css/myPageTemplet.css" />
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>

<script>

</script>

<style type="text/css">
.myLikePageBtn:hover {
	cursor: pointer;
}
</style>

</head>
<body>
	<%@include file="../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<%@include file="myPageAside.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<div class="welcome-wrap">
						<div class="welcome">
							<span class="bsk-owner">${loginMember.member_id } </span>
							<c:if test="${loginMember.grade_name == 'M'}">
								<img alt="" src="../../resources/cambak21/img/admin.png"
									class="gradeImg">
							</c:if>
							<c:if test="${loginMember.grade_name == 'A'}">
								<img alt="" src="../../resources/cambak21/img/gold.png"
									class="gradeImg">
							</c:if>
							<c:if test="${loginMember.grade_name == 'B'}">
								<img alt="" src="../../resources/cambak21/img/silver.png"
									class="gradeImg">
							</c:if>
							<c:if test="${loginMember.grade_name == 'C'}">
								<img alt="" src="../../resources/cambak21/img/bronze.png"
									class="gradeImg">
							</c:if>
						</div>
					</div>
					<div class="myActivity-wrap">
						<div class="myActivity">
							<p class="myPost">
								보유 포인트 : <a href="" class="myPostCnt">0 </a>Point
							</p>
							<p class="myPost">
								주문 목록 : <a href="" class="myPostCnt">0</a> 개
							</p>
							<p class="myPost">
								취소 / 반품 : <a href="" class="myPostCnt">0</a> 개
							</p>
							<p class="myPost">
								상품 문의 : <a href="" class="myPostCnt">0</a> 개
							</p>
						</div>
						<!-- 위에 카테고리 -->
						<div class="small-category">
							<nav class="navbar navbar-default" id="bsk-nav">
								<div class="container-fluid" id="bsk-smallCat">
									<ul class="nav navbar-nav">
										<li class="catagory-name"><a class="mini-category" href="../myMall/myQnA">상품
												문의</a></li>
									</ul>
								</div>
							</nav>
						</div>
						<!-- 메인 컨텐츠 -->
						<div class="main-wrap">
							<div class="main-content">
								<table class="table table-hover">
									<thead>
										<tr>
											<th class="myPageThead">상품번호</th>
											<th class="myPageThead">상품명</th>
											<th class="myPageThead" style="width: 370px">문의 내용</th>
											<th class="myPageThead">작성일</th>
											<th class="myPageThead">답변</th>
										</tr>
									</thead>
									<tbody class="list-content">
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">답변완료</th>
										</tr>
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">미완료</th>
										</tr>
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">답변완료</th>
										</tr>
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">답변완료</th>
										</tr>
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">답변완료</th>
										</tr>
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">답변완료</th>
										</tr>
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">답변완료</th>
										</tr>
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">답변완료</th>
										</tr>
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">답변완료</th>
										</tr>
										<tr class="myPageBoard">
											<th class="myPageThead">1231231</th>
											<th class="myPageThead">활활화로</th>
											<th class="myPageThead" style="width: 370px">삼겹살 몇초컷
												가능인가요 ?</th>
											<th class="myPageThead">2020-01-01</th>
											<th class="myPageThead">답변완료</th>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
						<!-- 페이징 -->
						<div class="myPagePagingBtn">
							<ul class="pagination">

							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">알림</h4>
				</div>
				<div class="modal-body" id="modalText"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>
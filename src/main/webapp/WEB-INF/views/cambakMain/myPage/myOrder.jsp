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

<style type="text/css">
.emptySpace{
	margin:20px;
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
				
				<div><input type="text" style="width:80%;" placeholder="주문한상품을 검색할 수 있어요"><Button type="button" class="btn btn-info" >검색</Button></div>
			<!-- 	<div class="emptySpace"></div> -->
									<div class="btn-group">
								<!-- 	<div style="font-size:20px;font-weight: bold;">검색기간</div> -->
									<div class="emptySpace"></div>
										<button type="button" class="btn btn-default">1개월</button>
										<button type="button" class="btn btn-default">3개월</button>
										<button type="button" class="btn btn-default">6개월</button>
										<button type="button" class="btn btn-default">1년</button>
										<button type="button" class="btn btn-default">3년</button>
									</div>
									<div class="emptySpace"></div>
									<div id="output">
									
									<c:forEach var="order" items="${order }">
										<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">${order.buyProduct_no }</strong></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
																<img
																	src="http://th2.tmon.kr/thumbs/image/bff/b03/84e/0a872d274_320x320_95_FIT.jpg"
																	width="110" height="110" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<a href="#"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
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
																<button type="button" class="btn btn-info">주문상세
																	보기</button>
																<button type="button" class="btn btn-info">교환
																	반품 신청</button>


															</div>
														</td>
													</tr>

												</tbody>
											</table>
										</div>
										</c:forEach>
									</div>
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
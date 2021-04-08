<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<div style="padding-left: 150px;">
			<!--  효원이 디자인 시작 -->
				<div class="profile">
						<div>
							<div class="profileSize">
								<a href=""></a><img src="../../resources/cambak21/img/trip.jpg" class="userProfileImg">
								<h4>${loginMember.member_id }</h4>
								<div class="profileEmail">${loginMember.member_email }</div>
							</div>
							<div class="profileCategory">
									<li class="profileMenu1"><a href="#" class="profileMenu">마이 페이지</a></li>
									<form action="/user/Modify/${loginMember.member_id}" method="post"  ><li class="profileMenu2"><input type="submit" value="회원 정보 수정" class="profileMenu" style="color: #80BA8E;background: none;border: none;"> </li></form>
									<li class="profileMenu3"><a href="/myPage/checkList" class="profileMenu">체크리스트</a></li>
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
						<li id="myPostAside"><a href="/myPage/myPost">내가 쓴글</a></li>
						<li id="myReplyAside"><a href="/myPage/myReply">내 댓글</a></li>
						<li id="myLikeAside"><a href="/myPage/myLike">내 좋아요 글</a></li>
						<li id="myResellAside"><a href="/myPage/myPageResell">나의 중고거래</a></li>
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
						<li id="#"><a href="/myMall/myRefund">취소 / 반품</a></li>
						<li id="#"><a href="/myMall/myQnA?page=1">상품 문의</a></li>
					</ul>
				</div>
			</div>
			</div>
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

<script>
let member_id = '${loginMember.member_id}'; // 페이지 로딩 시 로그인 아이디 가져오기
$(document).ready(function() {
	
	readMyReplyList(); // 로딩 시 전체 댓글 리스트 출력
	
});

// 로딩 시 전체 댓글 리스트 출력
function readMyReplyList() {
	
	let page = 1;
	let perPageNum = 5;
	let board_category = "total";
	
	$.ajax({
		method: "POST",
		url: "/myPage/myReplyList.mp",
		dataType: "json",
		data : {member_id : member_id, board_category : board_category, page : page, perPageNum : perPageNum},
		success : function(data) {
			
			let myReplyList = data.myReplyList;
			let paging = data.paging
			
			console.log(myReplyList);
			console.log(paging);
			
			for (let i = 0; i < myReplyList.length; i++) {
				
				let output = '<tr class="myPageBoard">' + 
				'<td>' + myReplyList[i].board_no + '</td>' + 
				'<td>' + myReplyList[i].board_category + '</td>' + 
				'<td>' + myReplyList[i].replyBoard_content + '</td>' + 
				'<td>' + myReplyList[i].replyBoard_writeDate + '</td></tr>';
				
				$("#myPageBoardList").append(output);
			}
			
			let pagingBtn = '<ul class="pagination">';
			
			if(paging.prev) {
				pagingBtn += '<li><a href="#">이전</a></li>';
			}
			
			for (let j = 1; j < paging.endPage; j++) {
				pagingBtn += '<li><a href="#">' + j + '</a></li>';
			}
			
			if (paging.next) {
				pagingBtn += '<li><a href="#">이전</a></li>';
			}
			
			pagingBtn += '</ul>';
			$(".replyPagingBtn").append(pagingBtn);
			
		}, error : function(data) {
			
		}
		});
	
}





</script>
<style>


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
							<span class="bsk-owner">${loginMember.member_name } </span>
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
								작성한 게시글 : <a href="" class="myPostCnt">0</a>개
							</p>
							<p class="myPost">
								작성한 댓글 : <a href="" class="myPostCnt">0</a>개
							</p>
							<p class="myPost">
								좋아요 누른 글 : <a href="" class="myPostCnt">0</a>개
							</p>
							<p class="myPost">
								나의 문의 : <a href="" class="myPostCnt">0</a>개
							</p>
						</div>
						<!-- 위에 카테고리 -->
						<div class="small-category">
							<nav class="navbar navbar-default" id="bsk-nav">
								<div class="container-fluid" id="bsk-smallCat">
									<ul class="nav navbar-nav">
										<li class="bsk-focus catagory-name"><a href="#">전체보기</a></li>
										<li class="catagory-name"><a href="#">캠핑 후기</a></li>
										<li class="catagory-name"><a href="#">유머</a></li>
										<li class="catagory-name"><a href="#">Q&A</a></li>
										<li class="catagory-name"><a href="#">중고거래</a></li>
										<li class="catagory-name"><a href="#">캠핑Tip</a></li>
										<li class="catagory-name"><a href="#">공지사항</a></li>
										<li class="catagory-name"><a href="#">고객센터</a></li>
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
											<th class="myPageThead">글번호</th>
											<th class="myPageThead">게시판</th>
											<th class="myPageThead">댓글</th>
											<th class="myPageThead">작성일</th>
										</tr>
									</thead>
									<tbody id="myPageBoardList">
										<tr class="myPageBoard">
											<td>1</td>
											<td>공지사항</td>
											<td>인왕산 후기 입니다 + 썰 포함</td>
											<td>2020-03-30</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 페이징 -->
						<div class="myPagePagingBtn" id="replyPagingBtn"></div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>
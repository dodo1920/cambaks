<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	function getList(obj) {
		let category = $(obj).text();
		
		$.ajax({
			type : "post",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/board/myPage/myLike/" + encodeURI(encodeURIComponent(category)), // 서블릿 주소
			success : function(data) {
				alert(data);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
</script>

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
										<li class="bsk-focus catagory-name" onclick="getList(this);"><a>전체보기</a></li>
										<li class="catagory-name" onclick="getList(this);"><a href="#">캠핑 후기</a></li>
										<li class="catagory-name" onclick="getList(this);"><a href="#">유머</a></li>
										<li class="catagory-name" onclick="getList(this);"><a href="#">QnA</a></li>
										<li class="catagory-name" onclick="getList(this);"><a href="#">중고거래</a></li>
										<li class="catagory-name" onclick="getList(this);"><a href="#">캠핑Tip</a></li>
										<li class="catagory-name" onclick="getList(this);"><a href="#">공지사항</a></li>
										<li class="catagory-name" onclick="getList(this);"><a href="#">고객센터</a></li>
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
											<th class="myPageThead">제목</th>
											<th class="myPageThead">작성자</th>
											<th class="myPageThead">작성일</th>
											<th class="myPageThead">좋아요 누른 날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${LikeBoardList }">
											<tr class="myPageBoard">
												<td>${list.board_no }</td>
												<td>${list.board_category }</td>
												<td>${list.board_title }</td>
												<td>${list.member_id }</td>
												<td><fmt:formatDate value="${list.board_writeDate }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
												<td><fmt:formatDate value="${list.likeBoard_date }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
						<!-- 페이징 -->
						<div class="myPagePagingBtn">
							<ul class="pagination">
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Cambark's</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak21/js/skel-panels.min.js"></script>
<script src="/resources/cambak21/js/init.js"></script>

<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />

<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<style>
@import url(/resources/cambak21/css/SHWtamplet.css);
</style>

<script>
   $(document).ready(function() {
      // 말 줄임 ...
      textLimit();
      
      // 공지사항 롤링
      rolling();
      
      let boardUri = searchUriAddress();
      asideBarDraw(boardUri);
      
      
      
   });
   
   // 게시판 uri 접속 시 board/ 뒤에 오는 게시판이름 가져오는 기능
   function searchUriAddress() {
       var url = location.href; //url주소
       var params = url.slice(url.indexOf("board") + 6, url.length).split("/"); // board/ 뒤부터 "/"로 잘라서 배열에 넣기
      return params[0]; // board/OO/??/??  OO만 반환
   }
   
   // 전달받은 boardUri 변수로 사이드바 색깔 변경해주는 기능
   function asideBarDraw(boardUri) {
       $("#" + boardUri + "Aside").attr("class", "active");
   }
   
</script>
</head>

<body>
	<%@include file="../../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- 사이드바 템플릿 -->
				<%@include file="../../cambak21Aside2.jsp"%>

				<!-- Content -->
				<div class="content-wrapper">

		<c:choose>
			<c:when test="${boardList != null }">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>

						</tr>
					</thead>
					<c:forEach var="board" items="${boardList }" varStatus="status">
						<c:choose>
							<c:when test='${board.isdelete == "Y" }'>
								<tr>
									<td><strike>${board.no }</strike></td>
									<td><strike> ${board.title } </strike></td>
									<td><strike>${board.writer }</strike></td>
									<td><strike><span class="sendTime"
											id="${status.count }"><fmt:formatDate
													value="${board.regdate }" type="both"
													pattern="yyyy-MM-dd HH:mm:ss" /></span></strike></td>
									<td><strike>${board.viewcnt }</strike></td>

								</tr>
							</c:when>


							<c:otherwise>
								<tr>
									<td>${board.no }</td>
									<td><a href="/board/read?no=${board.no }&page=${param.page}">
											${board.title } </a></td>
									<td>${board.writer }</td>
									<td><span class="sendTime" id="${status.count }"><fmt:formatDate
												value="${board.regdate }" type="both"
												pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
									<td>${board.viewcnt }</td>

								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>



				<div>
					<button type="button" class="btn btn-info" style="float: right;"
						onclick="location.href='/board/register';">글쓰기</button>
				</div>
				
				<div>
					<form action="/board/search" method="GET">
					<select name="searchType">
						<option value="n">----------------------</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
					<input type="text" name="searchWord" placeholder="검색어 입력..."/>
					<input type="submit" id="goSearch" value="검색"/>
					
					</form>
				</div>

 				<div class="text-center">
				<ul class="pagination">
					<c:if test="${pagingParam.prev }">
						<li class="page-item">
							<a class="page-link" href="listCri?page=${param.page - 1 }&searchType=${param.searchType}&searchWord=${param.searchWord}">prev</a>
						</li>
					</c:if>
					
						<c:forEach begin="${pagingParam.startPage }"
							end="${pagingParam.endPage }" var="pageNo">
							<li class="page-item"><a class="page-link"
								href="listCri?page=${pageNo }&searchType=${param.searchType}&searchWord=${param.searchWord}">${pageNo }</a>
							</li>
						</c:forEach>
					
					<c:if test="${pagingParam.next }">
						<li class="page-item">
							<a class="page-link" href="listCri?page=${param.page + 1 }&searchType=${param.searchType}&searchWord=${param.searchWord}">next</a>
						</li>
					</c:if>
					</ul>
					
				</div>

			</c:when>
			<c:otherwise>
				게시물이 존재하지 않거나, 데이터를 얻오지 못했습니다.
			
			</c:otherwise>
		</c:choose>

 </div>
 </div>
 </div>

	</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>

</body>

</html>
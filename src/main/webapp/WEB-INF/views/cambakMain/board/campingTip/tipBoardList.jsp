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
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>고객센터</h2>
							<span class="byline" id="rollNot"><a href="#">공지가 들어갈
									자리입니다.</a></span>
						</header>
						<div class="research">
							<!-- <form> -->
							<div class="input-group">
								<input type="text" class="form-control" size="50"
									placeholder="Search" onkeypress="enterKey();">
								<div class="input-group-btn">
									<button type="button" class="btn btn-danger search"
										onclick="sendKeyword();">Search</button>
									<button class="btn btn-danger write">
										<a href="../cs/write">글쓰기</a>
									</button>
								</div>
							</div>
							<!-- <div class="input-group-btn write">
		                        <button class="btn btn-danger write"><a href="SHW_board.html">글쓰기</a></button>
		                    </div> -->
							<!-- </form> -->
						</div>
					</section>
					<div>
						<div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th class="board-title">제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="item" items="${boardList }">
										<tr>
											<td>${item.board_no }</td>
											<td><a href="" class="board-title-a">${item.board_title }</a> 
												<c:if test="${item.replyCnt > 0 }">
													(${item.replyCnt })
												</c:if>
											</td>
											<td>${item.member_id }</td>
											<td><fmt:formatDate value="${item.board_writeDate }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
											<td>${item.board_viewCnt }</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
						<div class="pageBtn">
							<ul class="pagination">
								<li><a href="#">1</a></li>
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
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>

</body>

</html>
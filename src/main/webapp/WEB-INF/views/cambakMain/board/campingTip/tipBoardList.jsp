<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>

<meta charset="utf-8" />
<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<title>Cambark's</title>

<!-- jquery -->
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet js -->
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak21/js/init.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="/resources/cambak21/css/SHWtamplet.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<!-- 게시판 공통 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script>



<script>
   $(document).ready(function() {
	  
	  movePageNum();
      let boardUri = searchUriAddress();
      asideBarDraw(boardUri);
      getSearchPage();
      changeCheckbox();
      cautionSearch();
      
   });
   
   // 검색어를 작성하지 않고 검색을 누를 경우 입력 요청
   function cautionSearch() {
	   
	   $("#searchTipBtn").on("click", function() {
			  let searchWord = $("#searchWord").val();
			   console.log(searchWord.length);
			   if (searchWord.length <= 0) {
				   alert("검색어를 입력해주세요");
				   return false;
			   } else {
				   return ture;
			   }
			   
		   });
	   
   }
   
   // page번호 없을 시 강제로 page번호로 이동
   function movePageNum() {
	   let page = getParameter("page");
	   let searchWord = getParameter("searchWord");
	   let searchType = getParameter("searchType");
	   
	   if (page == -1 && searchWord == -1 && searchType == -1) {
		   location.href="/board/campingTip/list?page=1";
	   } else if (page == -1 && searchWord != -1 && searchType != -1) {
		   location.href="/board/campingTip/list/search?page=1&searchType=" + searchType + "&searchWord=" + searchWord;
	   }
	   
   }
   
   // 검색 완료 후 검색 결과내에 재검색 체크박스 생성
   function changeCheckbox(){
	   
	      $("#searchCheckbox").on("click", function() {
	    	  clickResult = $("#searchCheckbox").prop("checked");
	    	  console.log(typeof(clickResult));
	    	  
	    	  if (clickResult) {
	    		  $("#searchWord").attr("placeholder", "");
	    		  $("#searchTipBtn").attr("type", "button");
	    		  $("#searchTipBtn").attr("onclick", "searchMore();");
	    	  } else {
	    		  $("#searchWord").attr("placeholder", "전체검색");
	    		  $("#searchTipBtn").attr("type", "submit");
	    		  $("#searchTipBtn").attr("onclick", "");
	    	  }
	    	  
	      });
	   
   }
   
   // 검색 완료 후 검색 결과내에 재검색 체크박스 생성
   function getSearchPage() {
	   let searchType = getParameter("searchType");
	   if (searchType != -1) {
		   $("#formAction").attr("action", "search");
		   $(".searchBar").append('<div><input type="checkbox" id="searchCheckbox"> 검색 내 재검색</div>');
	   }
   }
   
    // 파라메터 값 가져오기
	function getParameter(param) {
		var returnVal; //리턴할 값을 저장하는 변수
		var url = location.href; //url주소
		var params = url.slice(url.indexOf("?") + 1, url.length).split("&");
	
		for ( var i in params) {
			var paraName = params[i].split("=")[0]; // 매개변수명 얻음
			if (param.toLowerCase() == paraName.toLowerCase()) {
				returnVal = params[i].split("=")[1];
				return decodeURIComponent(returnVal);
			}
		}
		return -1; // 모든 배열 요소를 다 검색해도 매개변수가 없을때
	}
   
</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap');

#content {
	font-family: 'Gothic A1', sans-serif;
}

#boardTitle {
	text-align: center;
	font-size: 30px;
	font-weight: 600;
	text-decoration: underline;
	text-underline-position: under;
}

.boardListTitle {
	font-size: 16px;
}

.boardListTitle > th {
	text-align: center;
}

.writeBoard {
	text-align: right;
	font-family: 'Nanum Gothic', sans-serif;
}

.numBoard{
	border-top-color: #ebebea; background-color: #f9f9f8;
	font-family: 'Nanum Gothic', sans-serif;
}

.numBoardLine{
	margin-top: 14px;
	height: 40px;
	padding-top: 16px;
	text-align: center;
}

.numBoardLine > li {
	display: inline-block;
	width: 24px;
	height: 24px;
	margin: 0 2px;
	box-sizing: border-box;
	line-height: 24px;
	font-family: arial, sans-serif;
}

.searchBar {
	text-align: center;
	padding: 16px 0 16px;
	border-top: 1px solid #ebebea;
}

.keySelect {
	display: inline-block;
	position: relative;
	height: 36px;
	border: solid 1px;
	text-align: left;
	vertical-align: top;
}

.inputKeyword {
	display: inline-block;
	position: relative;
	height: 36px;
	box-sizing: border-box;
	border: solid 1px;
	vertical-align: top;
}

.searchBtn {
	display: inline-block;
	width: 56px;
	height: 36px;
	background-color: #03c75a;
	border: 0;
	color: #fff;
}

.moveBtn {
    width: 30px;
}

</style>

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
						<h1 id="boardTitle"><a href="/board/campingTip/list?page=1" style="color: #777;">캠핑 Tip 게시판</a></h1>
					</section>
					<div>
						<div>
							<table class="table table-hover">
								<thead>
									<tr class="boardListTitle">
										<th>작성일</th>
										<th style="width: 416px;">제목</th>
										<th>작성자</th>
										<th>추천</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
							<c:choose>
								<c:when test="${empty boardList}">
									<tr>
										<td colspan="10" style="padding-top: 185px; padding-bottom: 185px; text-align: center;">
											<p>"<em style="color: #fa3830;">${search.searchWord }</em>"에 대한 검색 결과가 없습니다.</p>
										</td>
									</tr>							
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${boardList }">
										<tr style="text-align: center;">
											<td><fmt:formatDate value="${item.board_writeDate }" pattern="yyyy-MM-dd" type="DATE" /></td>
											<td>
											<a href="/board/campingTip/view?id=Tip&no=${item.board_no }&page=${param.page}">${item.board_title } </a>
											<a href="/board/campingTip/view?id=Tip&no=${item.board_no }&page=${param.page}" style="font-weight: 600;">[${item.board_replyCnt }]</a>
											</td>
											<td>${item.member_id }</td>
											<td>${item.board_likeCnt }</td>
											<td>${item.board_viewCnt }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
								</tbody>
							</table>
						</div>
						<div class="writeBoard">
						<button type="button" class="btn btn-default" onclick="location.href='/board/campingTip/write'">글작성</button>
						</div>
						<div class="numBoard">
						<c:set var="campingTipPage" value="${param.page }" scope="session" />
						<c:choose>
							<c:when test="${param.searchWord == null }">
								<div>
									<ul class="numBoardLine">
										<c:if test="${pagingParam.prev }">
											<li style="width: 30px;"><a href="list?page=${param.page -1}">이전</a></li>
										</c:if>
										<c:forEach begin="${pagingParam.startPage }" end="${pagingParam.endPage }" var="pageNo">
											<li><a href="list?page=${pageNo }">${pageNo }</a></li>
										</c:forEach>
										<c:if test="${pagingParam.next }">
											<li style="width: 30px;"><a href="list?page=${param.page +1}">다음</a></li>
										</c:if>
									</ul>
								</div>
							</c:when>
							<c:when test="${param.searchWord != null }">
								<div>
									<ul class="numBoardLine">
										<c:if test="${pagingParam.prev }">
											<li style="width: 30px;"><a href="search?page=${param.page -1}&searchType=${param.searchType }&searchWord=${param.searchWord}">이전</a></li>
										</c:if>
										<c:forEach begin="${pagingParam.startPage }" end="${pagingParam.endPage }" var="pageNo">
											<li><a href="search?page=${pageNo }&searchType=${param.searchType }&searchWord=${param.searchWord}">${pageNo }</a></li>
										</c:forEach>
										<c:if test="${pagingParam.next }">
											<li style="width: 30px;"><a href="search?page=${param.page +1}&searchType=${param.searchType }&searchWord=${param.searchWord}">다음</a></li>
										</c:if>
									</ul>
								</div>
							</c:when>
						</c:choose>
						<div class="searchBar">						
							<form action="list/search" method="GET" id="formAction">
							<select class="keySelect" name="searchType" id="searchType">
								<option value="totalSearch">제목+내용</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select>
					    	<input type="text" class="inputKeyword" name="searchWord" id="searchWord" placeholder="전체검색">
					    	<button type="submit" class="searchBtn" id="searchTipBtn" onclick="">검색</button>
					    	</form>
						</div>
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
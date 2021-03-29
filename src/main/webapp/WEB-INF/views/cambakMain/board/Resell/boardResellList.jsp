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
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/resources/cambak21/js/skel.min.js"></script>
	<script src="/resources/cambak/21js/skel-panels.min.js"></script>
	<script src="/resources/cambak21/js/init.js"></script>

	<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
	
	<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
	<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
	
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	<style>
		@import url(/resources/cambak21/css/SHWtamplet.css);
		
		.\34 u {
			width : 100%;
			margin : 0px;
		}
		.bordListBox{
			width : 322px;
			height : 387px;
			margin :10px;	
			border: solid 1px black;
			float: left;
		
		}
		.tdTotolStyle{
			margin:	 10px;
			display:block;
		}	
		.tdContentBox{
			width: 300px;
			height: 45px;
		}
		.Thumbnail{
			display: block;
			width: 300px;
			height: 175px
		}
		.rightSapn{
			float: right;
		}
	</style>
</head>
<script type="text/javascript">
function gotoDeteilPage	(no) {
	window.location.href="/board/resell/detail?no="+no+"&page=${pagingParam.cri.page}"
}
function like() {
	$.ajax({
		method : "post",
		url : "/like",
		dataType : "text", // 응답 받는 데이터 타입
		data : JSON.stringify({ // 요청하는 데이터
		}),
		success : function(result) {
			if (result == 'Success') {
				//alert('댓글 등록 완료!');
				callReplyList(); // 댓글 다시 호출
			}
			
		
		}
	});
	
}

</script>
<body>
    <%@include file="../../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">
			
			<!-- 사이드바 템플릿 -->
			<%@include file="../../cambak21BoardAside.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important"style="width: 100%;float: revert;">
				<section>
					<header>
						<h2>중고거래</h2>
						<span class="byline" id="rollNot"><a href="../notice/listCri">공지사항</a></span>
					</header>
				</section>
						<table style="width: 100%x">
				
						<tbody style="width: 100%">
						<c:forEach var="board" items="${board}">
						<c:choose>
                  			<c:when test='${board.resellBoard_isDelete == "Y"}'>
								<tr class="bordListBox">
								
								<td class="tdTotolStyle"><del><span>${board.member_id}</span></del></td>
								<td class="Thumbnail tdTotolStyle"><img class="Thumbnail" src="/resources/mallMain/img/shop/shop-5.jpg"/></td>
								<td class="tdTotolStyle"><del><span>${board.resellBoard_title}</span></del></td>
								<td class="tdTotolStyle tdContentBox" ><del><span style="word-break:normal;">${board.resellBoard_content}</span></del></td>
								<td class="tdTotolStyle"><del><div><span>좋아요수 :${board.resellBoard_likeCnt}</span></a><span class="rightSapn">조회수 : ${board.resellBoard_viewCnt}</span></del></td>
								<td class="tdTotolStyle"><del><div><span>${board.resellBoard_postDate}</span><span class="rightSapn">${board.resellBoard_price}원</span></div></del></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="bordListBox" onclick="gotoDeteilPage(${board.resellBoard_no});">
								
								<td class="tdTotolStyle"><span>${board.member_id}</span></td>
								<td class="Thumbnail tdTotolStyle"><img class="Thumbnail" src="/resources/mallMain/img/shop/shop-5.jpg"/></td>
								<td class="tdTotolStyle"><span>${board.resellBoard_title}</span></td>
								<td class="tdTotolStyle tdContentBox" ><span style="word-break:normal;">${board.resellBoard_content	}</span></td>
								<td class="tdTotolStyle"><div><span>좋아요수 :${board.resellBoard_likeCnt}</span onclick="like();"><span class="rightSapn">조회수 : ${board.resellBoard_viewCnt}</span></div></td>
								<td class="tdTotolStyle"><div><span>${board.resellBoard_postDate}</span><span class="rightSapn">${board.resellBoard_price}원</span></div></td>
								</tr>
							</c:otherwise>
							</c:choose>
							
							</c:forEach>

							</tbody>
						</table>
				<div>
					<form action="/board/resell/search" method="GET">
						<select name="searchType">
							<option value="n">---------------------</option>
							<option value="resellBoard_title">제목</option>
							<option value="resellBoard_content">내용</option>
							<option value="member_id">작성자</option>
							<option value="like">좋아요</option>
							<option value="view">조회수</option>
						</select>
						
						<input type="text" name="searchWord" placeholder="검색어 입력..."/>
						<input type="submit" id="goSearch" value="검색" />
					</form>
				</div>
			<c:if test="${loginMember.member_id != null }">
				<a href="write"><button type="button" class="btn btn-info" id="deleteBoard">글쓰기</button></a>
			</c:if>
				<div class="text-center">
				     <ul class="pagination"style="text-align: center;">
	      
	              <c:if test="${pagingParam.prev }">
	                  <li class="page-item">
	                     <a class="page-link" href="list?page=${pagingParam.cri.page -1 }">prev</a>
	                  </li>
	               </c:if>
					
	                  <c:forEach begin="${pagingParam.startPage}" end="${pagingParam.endPage }" var="pageNo">
		
		                     <li class="page-item">
	                     	<a class="page-link" href="list?page=${pageNo}">${pageNo}</a>
	                     </li>
						
	                  </c:forEach>
	              
	               <c:if test="${pagingParam.next }">
	                  <li class="page-item">
	                     <a class="page-link" href="list?page=${pagingParam.cri.page+ 1 }">next</a>
	                  </li>
	               </c:if>
	
	                </ul>
            </div>
			
			</div>
		</div>
		
		
	</div>
	<!-- /Main -->

    <%@include file="../../cambak21Footer.jsp"%>
	
</body>

</html>
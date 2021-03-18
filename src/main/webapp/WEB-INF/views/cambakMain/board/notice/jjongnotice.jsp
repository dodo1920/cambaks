<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 공지사항 </title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
  <style>

#content {
    min-height: 750px;
    max-width: 1200px;
    margin: 300px;
    box-sizing: border-box;
    vertical-align: top;
}

table {
    table-layout: fixed;
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}

table tr td{
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}



.NoticeBoard th, .NoticeBoard td{
    padding: 10px;
    text-align: center;
}

.pagination{
	display:flex;
	list-style: none;
    place-content: center;
}

</style>

</head>

<body>
<div id="content">
  	<div class="headingArea">
                <div class="mTitle">
                    <h1>공지사항 글 보기 </h1>
                </div>
            </div>
			 <div class="NoticeBoard">
          <c:choose>
			<c:when test="${noticeList != null }">
				<table border="1">
					<thead>
						<tr>
							<th style="width: 7%;">번호</th>
							<th style="width: 10%;">분류</th>
							<th style="width: 40%;">제목</th>
							<th style="width: 15%;">작성일(수정일)</th>
							<th style="width: 7%;">좋아요</th>
							<th style="width: 7%;">읽은수</th>
							<th style="width: 10%;">작성자</th>
						</tr>
					</thead>
					<tbody class="center">
					<c:forEach var="noticeList" items="${noticeList }" varStatus="status">
						<c:choose>
							<c:when test='${noticeList.board_isDelete == "Y" }'>
								<tr>
									<td><strike>${noticeList.board_no }</strike></td>
									<td><strike>${noticeList.board_category }</strike></td>
									<td><a href="#" class="noticeTitle" name="board_no"><strike> ${noticeList.board_title } </strike></a></td>
									<td><strike><span class="sendTime"
											id="${status.count }"><fmt:formatDate
													value="${noticeList.board_writeDate }" type="both"
													pattern="yyyy-MM-dd HH:mm:ss" /></span></strike></td>
									<td><strike>${noticeList.board_likeCnt }</strike></td>
									<td><strike>${noticeList.board_viewCnt }</strike></td>
									<td><strike>${noticeList.board_member_id }</strike></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${noticeList.board_no }</td>
										<td>${noticeList.board_category }</td>
									<c:if test="${param.searchType != null}">
											<td><a style="overflow: hidden;" href="/board/notice/read?no=${noticeList.board_no }&searchType=${param.searchType }&searchWord=${param.searchWord }&page=${param.page }" >
																${noticeList.board_title } </a></td></c:if>
										<c:if test="${param.searchType == null}">
											<td><a href="/board/notice/read?no=${noticeList.board_no }&page=${param.page}" >${noticeList.board_title } </a></td>
										</c:if>
												<td><span class="sendTime"
														id="${status.count }"><fmt:formatDate
																value="${noticeList.board_writeDate }" type="both"
																pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
												<td>${noticeList.board_likeCnt }</td>
												<td>${noticeList.board_viewCnt }</td>
												<td>${noticeList.member_id }</td>
								</tr>
									
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
			<c:choose>
						<c:when test='${param.searchWord != null }'>
							<div class="text-center">
					<ul class="pagination">
						<c:if test="${pagingParam.prev }">
							<li class="page-item" style="padding: 15px"><a
								class="page-link" href="search?searchType=${param.searchType }&searchWord=${param.searchWord }&page=${param.page - 1 }">Prev</a>
							</li>
						</c:if>

						<c:forEach begin="${pagingParam.startPage}"
							end="${pagingParam.endPage }" var="pageNo">

							<li class="page-item" style="padding: 15px"><a
								class="page-link" href="search?searchType=${param.searchType }&searchWord=${param.searchWord }&page=${pageNo }">${pageNo }</a>
							</li>

						</c:forEach>

						<c:if test="${pagingParam.next}">
							<li class="page-item" style="padding: 15px"><a
								class="page-link" href="search?searchType=${param.searchType }&searchWord=${param.searchWord }&page=${param.page + 1 }">next</a>
							</li>
						</c:if>

					</ul>
				</div>	
							
				</c:when>
				<c:otherwise>


				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pagingParam.prev }">
							<li class="page-item" style="padding: 15px"><a
								class="page-link" href="listCri?page=${param.page - 1 }">Prev</a>
							</li>
						</c:if>

						<c:forEach begin="${pagingParam.startPage}"
							end="${pagingParam.endPage }" var="pageNo">

							<li class="page-item" style="padding: 15px"><a
								class="page-link" href="listCri?page=${pageNo }">${pageNo }</a>
							</li>

						</c:forEach>

						<c:if test="${pagingParam.next}">
							<li class="page-item" style="padding: 15px"><a
								class="page-link" href="listCri?page=${param.page + 1 }">next</a>
							</li>
						</c:if>

					</ul>
				</div>							
					</c:otherwise>
				</c:choose>
			
			
			<form action="/board/search" method="GET">
				<select name="searchType">
					<option value="n">-----------------</option>
					<option value="title"> 제목 </option>					
					<option value="content"> 내용 </option>					
					<option value="writer"> 작성자 </option>					
				</select>
				
				<input type="text" name="searchWord" placeholder="검색어 입력..."/>
				<input type="submit" id="goSearch" value="검색" />
				<input type="hidden" name="page" value="1" />
				<input type="button" value="전체보기" onclick="#"/>
				<button type="button" class="btn btn-info" style="float: right;"
				onclick="location.href='/board/notice/register'">글쓰기</button>
			</form>
		
			</div>
		</c:when>
			<c:otherwise>
   				게시물이 존재하지 않거나, 데이터를 얻어오지 못했습니다.
   			</c:otherwise>
		</c:choose>
		</div>
    </div>
</body>

</html>
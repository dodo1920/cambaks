<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="text-center">
	<div style="display: inline-block;">
	<form action="/board/qa/search" method="GET">
       	<select name="searchType" style="font-size: 15px; height: 30px;">
       		<option value="title">제목</option>
       		<option value="content">내용</option>
       		<option value="writer">작성자</option>
       	</select>
       	<input type="text" name="searchWord" placeholder="검색어 입력" />
       	<input type="submit" id="goSearch" class="btn btn-danger search" value="검색" />
    </form>
    </div>
    <c:if test="${loginMember.member_id != null }">
      	<button class="btn btn-danger write" onclick="location.href='/board/qa/write'">글쓰기</button>
   	</c:if>
</div>

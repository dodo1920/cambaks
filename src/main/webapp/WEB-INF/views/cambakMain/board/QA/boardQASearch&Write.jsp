<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="text-center">
	<form action="/board/search" method="GET">
       	<select name="searchType" style="font-size: 20px;">
       		<option value="n">------------------------</option>
       		<option value="title">제목</option>
       		<option value="content">내용</option>
       		<option value="writer">작성자</option>
       	</select>
       	<input type="text" name="searchWord" placeholder="검색어 입력" />
       	<input type="submit" id="goSearch" class="btn btn-danger search" value="검색" />
       	<button class="btn btn-danger write"><a href="/board/qa/write">글쓰기</a></button>
    </form>
</div>

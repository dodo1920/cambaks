<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> 공지사항 작성 페이지</title>

  
</head>
<body class="hold-transition sidebar-mini layout-fixed">

   <div class="content-wrapper">
      <div class="container">
      <h1>게시판 글쓰기 페이지</h1><hr />

         <form action="/board/notice/register" method="post">
            <div class="form-group">
               <label class="control-label col-sm-2" for="userid">작성자 :</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="userid" name="member_id" value="${loginMember.uid }">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="title">제 목 :</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="title" name="board_title">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="content">내 용 :</label>
               <div class="col-sm-10">
                  <textarea rows="10" cols="30" class="form-control" id="content" name="board_content"></textarea>
               </div>
            </div>
            <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-success">저장</button>
                  <button type="button" class="btn btn-danger" onclick="location.href='/board/notice/listCri'">취소</button>
               </div>
            </div>
         </form>
      </div>
   </div>
   
</body>
</html>
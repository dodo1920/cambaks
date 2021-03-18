<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>공지사항 수정하기</title>
   
   <style>
   
   
#content {
    min-height: 750px;
    max-width: 1200px;
    margin: 300px;
    box-sizing: border-box;
    vertical-align: top;
}
   
   </style>
   
   
   
   
</head>
<body class="hold-transition sidebar-mini layout-fixed">
 
  <div id="content">
  	<div class="headingArea">
                <div class="mTitle">
                    <h1>공지사항 수정 페이지 </h1>
                </div>
            </div>
		<form action="/board/modi" method="post">
        <input type="text" name="no" readonly value="${noticeBoard.board_no }">
            <div class="form-group">
               <label class="control-label col-sm-2" for="userid">작성자 :</label>
               <div class="col-sm-10">
                 <input type="text" class="form-control" readonly id="userid" name="writer" value="${noticeBoard.member_id }">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="title">제 목 :</label>
               <div class="col-sm-10">
                   <input type="text" class="form-control" id="userid" name="title" value="${noticeBoard.board_title }">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="content">내 용 :</label>
               <div class="col-sm-10">
                     <input type="text" class="form-control" id="userid" name="content" value="${noticeBoard.board_content }">
               </div>
            </div>
             <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-success">저장</button>
                  <button type="button" class="btn btn-danger" onclick="location.href='/board/notice/listAll'">취소</button>
               </div>
            </div>
       </form>
       
    
   </div>

</body>
</html>
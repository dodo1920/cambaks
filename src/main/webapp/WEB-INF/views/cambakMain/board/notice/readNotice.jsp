<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <titler>공지사항 게시판 </title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
	<script>

	function callReplyList(){
		
		let board_no = '${param.no}'
		let output = '<ul class="list-group">';
		
		var date = new Date(1614677525000);
		console.log(date.getFullYear());
		console.log(date.getMonth());
		console.log(date.getDay());
		
		var now = date.getFullYear() + "-" + (date.getMonth() + 1)  + "-" + date.getDay();
		
		console.log(now);
		$.getJSON("/board/notice/getReply/" + board_no, function(data){
			console.log(data[0].replyBoard_no);
			$(data).each(function(index, item){
				let go = Number(item.replyBoard_no);
				$("#replyBoard_no").val(go);
				console.log(go);
				let date111 = new Date(this.replyBoard_updateDate);
				console.log(date111);
				output += '<li class="list-group-item"><input type="hidden" id="replyid" value="' + this.board_no + '"/><div>' + this.replyBoard_content + '</div><div><span>' 
				+ this.replyBoard_writeDate + '<img id="' + item.replyBoard_no + '" src="/resources/cambak21/images/edit.png" onclick="goModify(' + item.replyBoard_no + ');" style="width:30px; height:30px; float:right;"><img src="/resources/cambak21/images/star2.png" onclick="goDelete(' + item.replyBoard_no + ');" style="width:30px; height:30px; float:right;"></div></span>' + 
				'<div><span>' + this.member_id + '</span></div></li>';
				
			});
			
			output += "</ul>";
			
			$("#replyBox").html(output);
		});
	}	
 
	$(function(){
		 rolling();
	  	callReplyList();
	  	
	  	
	  });
	
	function goDelete(replyno){
		
		let no = replyno;
  		$.ajax({
  			method: "get",
  			url: "/board/notice/dropReply/" + no,
  			headers: {	// 요청 하는 데이터의 헤더에 전송
			"X-HTTP-Method-Override" : "DELETE"
  			},
  			dataType: "text", // 응답 받는 데이터 타입
  			data : no, 
  			success : function(result){
  				if(result == 'Success'){
  					alert('댓글 삭제 완료!');
  					callReplyList();
  				}
  			}
  		});
		
		
	}
	
	function modiProc(){
  		// 유효성 검사 하고...
  		
  		let replyBoard_content = $("#replyBoard_content").val();
  		let replyBoard_no = $("#replyBoard_no").val();
  		$.ajax({
  			method: "POST",
  			url: "/board/notice/modiReply/" + replyBoard_no,
  			headers: {	// 요청 하는 데이터의 헤더에 전송
			"Content-Type" : "application/json"
 			},
			dataType: "text", // 응답 받는 데이터 타입
  			data : JSON.stringify({	// 요청하는 데이터
			replyBoard_no : replyBoard_no,
 			replyBoard_content : replyBoard_content
 			}),
  			success : function(result){
  				console.log(result);
  				if(result == 'Success'){
  					alert('댓글 수정 완료!');
  					callReplyList();
  					modiboxclose();
  					
  				}
  			}
  		});
  		
  	};
  	
	function goModify(){
		$("#modifyBox").show();
	}
		
	function modiboxclose(){
		$("#modifyBox").hide();
	}
			
	function inputReplyBox1(){
		$("#inputReplyBox").show();
		
		
	};
	
	
	function replyAddBtn(){
  		// 유효성 검사 하고...
  		let member_id = $("#newReplyMember").val();
  		let replyBoard_content = $("#newReplyContent").val();
  		let board_no = '${param.no}';
  		$.ajax({
  			method: "post",
  			url: "/board/notice/insertReply/",
  			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
  			},
  			dataType: "text", // 응답 받는 데이터 타입
  			data : JSON.stringify({	// 요청하는 데이터
			board_no : board_no,
			member_id : member_id,
  			replyBoard_content : replyBoard_content
  			}),
  			success : function(result){
  				if(result == 'Success'){
  					alert('댓글 등록 완료!');
  					callReplyList();
  				}
  			}
  		});
  		
  	};
  	  	
    </script>
  
  	<style type="text/css">
  	
  		#modifyBox{
  		width: 400px;  		height: 100px;
  		background-color: lightgray;;
  		top: 50%;  		left: 50%;
  		margin: -50px 0p 0px -150px;
  		z-index: 999;
  		padding: 15px;
  		}
   	
  	</style>
    
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<%@include file="../../cambak21Header.jsp"%>
	
   <div class="content-wrapper">
      <div class="container">
      <h1>게시판 상세보기 페이지</h1><hr />
       
           <div class="form-group">
               <label class="control-label col-sm-2" for="no">글번호 :</label>
               <div class="col-sm-10">
                  ${noticeBoard.board_no }
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="userid">작성자 :</label>
               <div class="col-sm-10">
                  ${noticeBoard.member_id }
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="title">제 목 :</label>
               <div class="col-sm-10">
                  ${noticeBoard.board_title }
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="content">내 용 :</label>
               <div class="col-sm-10">
                   ${noticeBoard.board_content }
               </div>
            </div>
                <div class="form-group">
               <label class="control-label col-sm-2" for="regdate">작성시간 : </label>
               <div class="col-sm-10">
             <fmt:formatDate
                                 value="${noticeBoard.board_writeDate }" type="both"
                                 pattern="yyyy-MM-dd HH:mm:ss" />
               </div>
            </div>
                <div class="form-group">
               <label class="control-label col-sm-2" for="viewcnt">조회수 :</label>
               <div class="col-sm-10">
                   ${noticeBoard.board_viewCnt }
               </div>
            </div>
           
        <!--  로그인 한 유저와 작성자가 같을 때만 수정하기 삭제하기 버튼이 보여짐  -->
        <c:if test="${loginMember.uid == board.writer }">	
         <button type="button" class="btn btn-success" id="rewriteBoard" onclick="location.href='/board/notice/mod/${noticeBoard.board_no}'">수정하기</button>
         <button type="button" class="btn btn-info" id="deleteBoard" onclick="location.href='/board/notice/remove/${noticeBoard.board_no}'">삭제하기</button>
         </c:if>
	
		<c:choose>
			<c:when test='${param.searchType != null }'>
		<button type="button" class="btn btn-primary" onclick="location.href='search?searchType=${param.searchType }&searchWord=${param.searchWord }&page=${param.page }'">리스트페이지로</button>
		
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary" onclick="location.href='/board/notice/listCri?page=${param.page}'">리스트페이지로</button>
				
			</c:otherwise>
		</c:choose>

<%--       <c:if test="${loginMember != null }"> --%>
      <button type="button" class="btn btn-primary" onclick="inputReplyBox1();">댓글달기</button>
<%--       </c:if> --%>
      <div id="inputReplyBox" style="board: 1px dotted black; display:none;">
      	
          <div>
         	     
      	댓글 입력 : <input type="text" name="replyBoard_content" id="newReplyContent" />
      </div>
        <div>
<%--       	작성자 : <input type="text" name="replyer" id="newReplyWriter" value="${loginMember.uid }"/> --%>
      	작성자 : <input type="text" name="member_id" id="newReplyMember" />
      </div>
      
   
      <button type="button" id="replyAddBtn" class="btn btn-primary" onclick="replyAddBtn();">ADD Reply</button>
      
      </div>
    
    
      <div id="replyBox">
      		
      </div>
      
           <div id="modifyBox" style="display:none;">
        	<div> 댓글 수정</div>
        	<div>
        		<input type="hidden" name="replyBoard_no" id="replyBoard_no" />
        		<input type="text" id="replyBoard_content" name="replyBoard_content">
        		<button type="button" id="replyModBtn" onclick="modiProc();">수정</button>
        		<button type="button" id="replyModClose" onclick="modiboxclose();">닫기</button>
        	
        	</div>
        </div>
      
       <div id="replyBox12" style="padding : 10px; border-bottom : 1px solid black; height: 5px;"></div>
      
      
      </div>
        </div>
        
        
</body>
</html>
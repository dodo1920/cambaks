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
      
	  noBoardPage();
      let boardUri = searchUriAddress();
      asideBarDraw(boardUri);
      readReply();
      writeBoardInfo();

   });
   
   // 삭제 또는 없는 게시글 접근 시 리스트로 이동
   function noBoardPage() {
	   if (${empty viewBoard}) {
			  alert("삭제된 게시글 또는 없는 게시글입니다.");
			  location.href="/board/campingTip/list";
	   }
   }
   
   // 게시물 삭제
   function deleteBoard(obj) {
	   let no = getParameter("no");
	   
		$.ajax({
			  method: "GET",
			  url: "/board/campingTip/delete",
			  dataType: "text",
			  data : {no : no},
			  success : function(data) {
				  alert("글 삭제 성공!");
				  location.href="/board/campingTip/list";
			  },
	          error : function(data) {
	        	  alert("글 삭제를 실패 했습니다. 다시 시도 후 실패 시 문의바랍니다.");
	          }
			  
			});
   }
   
   // 파라매터 값 가져오기
   function getDateParam(millisecond) {
	   let date = new Date(millisecond);
       let month = date.getMonth() + 1;
       
       if (month < 10) {
          month = "0" + String(month);
       }
       
       let now = date.getFullYear() + "-" + month  + "-" + date.getDate() + "     " + date.getHours() + ":" + date.getMinutes()
       
       return now;
   }
   
   
   // 댓글 가져오기
   function readReply() {
	   
	   let no = getParameter("no");
	   let output = "";
	   
		$.ajax({
			  method: "POST",
			  url: "/board/campingTip/reply",
			  dataType: "json",
			  data : {no : no},
			  success : function(data) {
				  
				  for (let i = 0; i < data.length; i++) {
					  
					  let date = getDateParam(data[i].replyBoard_writeDate);
					  
					  output += '<ul class="replyListUl"><li class="replyListLi"><div class="replyView">' +
					  '<div class="replyViewWriter">' + data[i].member_id + '</div>' +
					  '<div class="replyViewContent">' + data[i].replyBoard_content + '</div>' + 
					  '<div class="replyViewDate">' + date + '</div></div>' +
					  '<div class="replyMoreView"><div class="replyMoreView_info">';
					  
					  // 대댓글 보기, 작성
					  output += '<a onclick="viewReply(this);" class="reReplyView_moreBtn" id="' + data[i].replyBoard_ref + '">답글 보기</a>' +
					  '<a onclick="replyWriteBar(this);" class="reReplyView_replyBtn" id="' + data[i].replyBoard_ref + '">답글 작성</a></div></div>';
					  
					  output += '<div id="replyList' + data[i].replyBoard_ref + '" class="reReplyModify_list"></div>' +
					  			'<div id="reReplyWrite' + data[i].replyBoard_ref + '"></div></li></ul>';
				  };
				  
				  $("#reply_box").append(output);
				  readRereply();
			  }
			});

		
   }
   
   // 대댓글 가져오기
   function readRereply() {
	   
	   let no = getParameter("no");
	   let output = "";
	   
		$.ajax({
			  method: "POST",
			  url: "/board/campingTip/reReply",
			  dataType: "json",
			  data : {no : no},
			  success : function(data) {
				  for (let i = 0; i < data.length; i++) {
					  
					  let date = getDateParam(data[i].replyBoard_writeDate);
					  
					  output += '<div class="reReplyView"><div class="reReplyView_content"><div class="reReplyView_writer">' + data[i].member_id +
					  '</div><div>' + data[i].replyBoard_content + '</div></div>' +
					  '<div class="reReplyView_writeDate">' + date + '</div></div>' +
					  '<div class="reReplyModify"><div class="reReplyModify_info">답글 수정 답글 삭제</div></div>';
					  $("#replyList" + data[i].replyBoard_ref).append(output);
					  $("#" + data[i].replyBoard_ref).css("display", "inline");
					  output = "";
				  }
				  
			  }
			});

   }
   
	// 글 수정 후 알럿 남겨주기
	function writeBoardInfo() {
		let result = getParameter("result");
		if (result == "success") {
			alert("글 수정 성공!");
		} else if (result == "fail") {
			alert("글 수정을 실패 했습니다. 다시 시도 후 실패 시 문의바랍니다.");
		}
	}
   
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
   
	function viewReply(obj) {
		let getId = $(obj).attr("id");
		$("#replyList" + getId).show();
		$(obj).text("답글 숨기기");
		$(obj).attr("onclick", "hideReply(this);");
		
	}
	
	function hideReply(obj) {
		let getId = $(obj).attr("id");
		$("#replyList" + getId).hide();
		$(obj).text("답글 보기");
		$(obj).attr("onclick", "viewReply(this);");
	}
	
	// 댓글 작성 클릭 시 작성 폼 append
	function replyWriteBar(obj) {
		let getId = $(obj).attr("id");
		$("#reReplyWrite" + getId).empty();
		let output = '<div class="reReplyWrite"><textarea class="reReplyWrite_textArea"></textarea><div class="replyWriteBtnSite">' + 
					 '<button type="button" class="btn btn-default" style="float: right;" onclick="replyWriteBarCancle(' + getId + ');">취소</button>' + 
					 '<button type="button" class="btn btn-default" style="float: right;">등록</button></div></div>';
		$("#reReplyWrite" + getId).append(output);
	}
	
	function replyWriteBarCancle(getId) {
		$("#reReplyWrite" + getId).empty();
	}

	
</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap');

#content {
	padding-right: 80px;
	padding-left: 80px;
	font-family: 'Gothic A1', sans-serif;
}

.viewTitle {
	margin-bottom: 15px;
	height: 82px;
	border-top:	1px solid #383838;
	border-bottom: 1px solid #ccc;
	background: #f5f5f5;
}

.viewTitleName {
	font-weight: 500;
	font-size: 26px;
	height: 35px;
	margin-left: 10px;
	margin-top: 8px;
	overflow: hidden;
}

.viewTitleWriteInfo {
	display: block;
	float: left;
	margin-left: 10px;
	font-size: 16px;
}

.viewTitleWriteInfo_blank {
	padding-right: 10px;
}

.viewTitleLikeInfo {
	display: block;
	float: right;
	margin-right: 10px;
	font-size: 16px;
}

.viewTitleLikeInfo_blank {
	padding-left: 10px;
}

.viewContent {
	display: contents;
}

.writeReplyTab {
	height: 38px; line-height: 38px;
	font-weight: bold;
	font-size: 20px;
	margin: 20px 0px 10px 0px;
}

.replyWrite {
	background: #fafafa;
	padding: 9px 12px 7px;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	margin-bottom: 30px;
}

.replyWriteBar {
	width: 841px;
	height: 78px;
	padding: 13px;
	border: 1px solid #cecdce;
	font-size: 13px;
	color: #333;
	line-height: 18px;
	resize: none;
}

.replyWriteBtnSite {
	display: flow-root;
}

.replyList {
	position: relative;
	border-top: 2px solid #525eaa;
}

.replyListUl {
	margin-bottom: 0px;
}

.replyListLi {
	display: list-item;
	text-align: -webkit-match-parent;
}

.replyView {
	padding: 9px 3px 7px 3px;
    border-bottom: 1px solid #eee;
	display: inline-block;
}

.replyViewWriter {
	float: left; width: 132px;
	margin-right: 33px;
	text-align: center;
}

.replyViewContent {
	display: block;
	float: left;
	width: 560px;
}

.replyViewDate {
	display: inline-block;
	width: 130px;
	text-align: center;
}

.replyMoreView {
	padding: 0px 3px 7px 3px;
    border-bottom: 1px solid #eee;
	display: inline-flex;
    font-size: 12px;
}

.replyMoreView_info {
	display: block;
	float: left;
	width: 690px;
	margin-left: 165px;
	font-size: 12px;
}

.reReplyView {
	padding: 9px 3px 7px 3px;
    border-bottom: 1px solid #eee;
	display: inline-block;
}

.reReplyView_content {
	display: block;
	float: left;
	width: 560px;
	margin-left: 165px;
}

.reReplyView_writer {
	padding-bottom: 5px;
	font-weight: bold;
}

.reReplyView_writeDate {
	display: inline-block;
	width: 130px;
	text-align: center;
}

.reReplyView_moreBtn {
	display: none;
	margin-right: 10px;
}

.reReplyView_replyBtn {
	display: inline;
}

.reReplyModify {
	padding: 0px 3px 7px 3px;
    border-bottom: 1px solid #eee;
	display: inline-flex;
}

.reReplyModify_info {
	display: block;
	float: left;
	width: 690px;
	margin-left: 165px;
	font-size: 12px;
}

.reReplyWrite {
	background: #fafafa;
	padding: 9px 12px 7px;
	width: 678px;
	margin-left: 165px;
}

.reReplyWrite_textArea {
	width: 658px;
	height: 48px;
	padding: 13px;
	border: 1px solid #cecdce;
	font-size: 13px;
	color: #333;
	line-height: 18px;
	resize: none;
}

.reReplyModify_list {
	display: none;
}

.boardManageBtn {
	padding: 9px 0px 7px 0px;
	margin-bottom: 30px;
}

.boardModifyBtn {
	display: flow-root;
}

.boardModifyBtn_side {
	display: inline-block;
	float: left;
}

.backListBtn {
	float: right;
}
#formBtnPos {
	float: left;
}

.contentSize {
	height: 350px;
	display: inline-block;"
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
				<!-- 글 제목 -->
				<div id="content" class="8u skel-cell-important">
					<div class="viewTitle">
						<h3 class="viewTitleName">${viewBoard.board_title }</h3>
						
						<div class="viewTitleWriteInfo">
						<span class="viewTitleWriteInfo_blank">작성자 : ${viewBoard.member_id }</span>
						<span>작성일 : <fmt:formatDate value="${viewBoard.board_writeDate }" pattern="yyyy-MM-dd HH:mm" type="DATE" /></span>
						</div>
						
						<div class="viewTitleLikeInfo">
						<span>조회수 : ${viewBoard.board_viewCnt }</span>
						<span class="viewTitleLikeInfo_blank">좋아요 : ${viewBoard.board_likeCnt }</span>
						</div>
					</div>
					
					<!-- 글 내용 -->
					<div class="contentSize">
						${viewBoard.board_content }
					</div>
					
					<!-- 댓글 작성 창 -->
					<div class="writeReplyTab">
						댓글
					</div>
					
					<div class="replyWrite">
						<textarea class="replyWriteBar"></textarea>
						<div class="replyWriteBtnSite">
							<button type="button" class="btn btn-default" style="float: right;">댓글작성</button>
						</div>
					</div>
					
					<!-- 댓글 리스트 창 -->
					<div class="replyList" id="reply_box"></div>
					
					<!-- 글 삭제, 수정, 리스트로 가기 버튼 -->
					<div class="boardManageBtn">
						<div class="boardModifyBtn">
							<div class="boardModifyBtn_side">
							<form action="modify" method="get" id="formBtnPos">
							<input type="hidden" name="no" value="${viewBoard.board_no }" />
							<input type="hidden" name="id" value="${param.id }" />
							<button type="submit" class="btn btn-default">수정</button>
							</form>
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">삭제</button>
							
							<!-- Modal -->
						    <div class="modal fade" id="myModal" role="dialog">
						      <div class="modal-dialog">
						    
						        <!-- Modal content-->
						        <div class="modal-content">
						          <div class="modal-header">
						            <button type="button" class="close" data-dismiss="modal">&times;</button>
						            <strong>게시물 삭제</strong>
						          </div>
						          <div class="modal-body">
						            <p>선택한 게시물을 정말 삭제하시겠습니까?</p>
						            <p>한번 삭제한 자료는 복구할 수 없습니다</p>
						            <p>댓글이 있는 게시글을 선택하신 경우<br />작성된 댓글도 모두 삭제됩니다.</p>
						          </div>
						          <div class="modal-footer">
						            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteBoard();">삭제</button>
						            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						          </div>
						        </div>
						      
						      </div>
						    </div> <!-- modal end -->
						    
							</div>
							<div class="backListBtn">
							<button type="button" class="btn btn-default" onclick="history.back();">목록보기</button>
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
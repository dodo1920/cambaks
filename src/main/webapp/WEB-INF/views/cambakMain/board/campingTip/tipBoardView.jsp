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
      
	  noBoardPage(); // 없는 게시글 로딩 시 다시 돌려보내기
      let boardUri = searchUriAddress(); // 사이드바에 해당 게시판 색상 지정해주기
      asideBarDraw(boardUri); // 사이드바에 해당 게시판 색상 지정해주기
      readReply(); // 댓글 로딩
      writeBoardInfo(); // 글 등록 완료 후 성공 여부 알려주기
      modifyBoardInfo(); // 글 수정 후 돌아왔을 때 수정 성공 여부 알려주기
	
   });
   
   // 댓글 삭제
   function replyDeleteBar(obj) {
		let replyBoard_no = $(obj).attr("id");
		let loginMember = '${loginMember.member_id}'; // 로그인 아이디
		let writeMember = $("#replyBoardNo" + replyBoard_no).text(); // 작성자 아이디 가져오기
		
		if(loginMember == writeMember ) {
			// 작성자와 삭제 요청자가 동일한 경우에만 실행
			$.ajax({
				  method: "POST",
				  url: "/board/campingTip/deleteReply",
				  dataType: "text",
				  data : {replyBoard_no : replyBoard_no},
				  success : function(data) {
					  alert("댓글이 삭제되었습니다!");
					  $("#reply_box").empty(); // 댓글 비우기
					  readReply(); // 댓글 다시 리로드
				  }, error : function(data) {
		        	  alert("댓글 삭제가 실패 했습니다. 다시 시도 후 실패 시 문의바랍니다.");
		          }
				  
				});
			
		} else {
			alert("댓글 작성자만 삭제가 가능합니다.");
		}
	   
   }
   
   // 댓글 작성
   function writeReply() {
	   
	   if (${loginMember != null}) {
		   let member_id = '${loginMember.member_id}';
		   let board_no = '${viewBoard.board_no}';
		   let replyBoard_content = $("#writeReplyContent").val();
		   
			$.ajax({
				  method: "POST",
				  url: "/board/campingTip/writeReply",
				  dataType: "text",
				  data : {member_id : member_id, board_no : board_no, replyBoard_content : replyBoard_content},
				  success : function(data) {
					  if (data == "success") {
						  alert("댓글이 등록되었습니다!");
						  $("#reply_box").empty(); // 댓글 비우기
						  $("#writeReplyContent").val(""); // 댓글 작성 창 비우기
						  readReply(); // 댓글 다시 리로드
				  	  } else if (data == "fail") {
						  alert("댓글 등록을 실패 했습니다. 다시 시도 후 실패 시 문의바랍니다.");
					  }
				  },
		          error : function(data) {
		        	  alert("댓글 등록이 실패 했습니다. 다시 시도 후 실패 시 문의바랍니다.");
		          }
				  
				});
	   } else {
		   alert("댓글은 회원만 작성 가능합니다.");
		   location.href='/user/login';
	   }
	   
   }
   
   
   
   
   
   
	// 댓글 삭제 시 본인이 작성한 댓글이 맞는지 확인
	function deleteMemberCheck() {
		
		let member_id = '${modiBoard.member_id }';
		let entrerMember = '${loginMember.member_id}';
		
		console.log(member_id);
		console.log(entrerMember);
		
		if (member_id != entrerMember) {
			alert("게시글 작성자만 수정이 가능합니다.");
			location.href='/board/campingTip/list?page=1';
		}
		
	}
   
	
	
	
	
	
   // 삭제 또는 없는 게시글 접근 시 리스트로 이동
   function noBoardPage() {
	   if (${empty viewBoard}) {
			  alert("삭제된 게시글 또는 없는 게시글입니다.");
			  location.href="/board/campingTip/list";
	   }
   }
   
   // 글 등록 후 알럿 남겨주기
   function writeBoardInfo() {
	   let result = getParameter("write");
	   if (result == "success") {
		   alert("글 등록 성공!");
	   } else if (result == "fail") {
		   alert("글 등록을 실패 했습니다. 다시 시도 후 실패 시 문의바랍니다.");
	   }
   }
   
   // 게시물 삭제
   function deleteBoard(obj) {
	   let no = getParameter("no");
	   $("#myModal").hide();
		$.ajax({
			  method: "POST",
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
   
   // 댓글 날짜, 시간 1자리 수면 0 붙여주기
   function getDateParam(millisecond) {
	   let date = new Date(millisecond);
       let year = date.getFullYear();
       
       let month = (1 + date.getMonth());
       month = month >= 10 ? month : '0' + month;
       
       let day = date.getDate();
       day = day >= 10 ? day : '0' + day;
       
       let hour = date.getHours();
       hour = hour >= 10 ? hour : '0' + hour;
       
       let minute = date.getMinutes();
       minute = minute >= 10 ? minute : '0' + minute;
       
       return year + "-" + month  + "-" + day + " " + hour + ":" + minute;
   }
   
   
   // 댓글 가져오기
   function readReply() {
	   
	   let no = getParameter("no");
	   let output = "";
	   let loginMember = '${loginMember.member_id}';
	   
		$.ajax({
			  method: "POST",
			  url: "/board/campingTip/reply",
			  dataType: "json",
			  data : {no : no},
			  success : function(data) {
				  
				  for (let i = 0; i < data.length; i++) {
					  
					  let date = getDateParam(data[i].replyBoard_writeDate);
					  
					  if (data[i].replyBoard_isdelete == 'Y') {
						  
						  output += '<ul class="replyListUl"><li class="replyListLi"><div class="deleteReplyView">' +
						  
						  '<div class="replyViewContent">[삭제된 댓글입니다.]</div>' + 
						  '</div>' +
						  '<div class="replyMoreView"><div class="replyMoreView_info">';
						  
					  } else {
						  
						  output += '<ul class="replyListUl"><li class="replyListLi"><div class="replyView">' +
						  '<div class="replyViewWriter" id="replyBoardNo' + data[i].replyBoard_no + '">' + data[i].member_id + '</div>' +
						  '<div class="replyViewContent">' + data[i].replyBoard_content + '</div>' + 
						  '<div class="replyViewDate">' + date + '</div></div>' +
						  '<div class="replyMoreView"><div class="replyMoreView_info">';
						  
					  }

					  
					  // 대댓글 보기, 작성
					  output += '<a onclick="viewReply(this);" class="reReplyView_moreBtn" id="' + data[i].replyBoard_ref + '">답글 보기</a>' +
					  '<a onclick="replyWriteBar(this);" class="reReplyView_replyBtn" id="' + data[i].replyBoard_ref + '">답글 작성</a>';
					  
// 					  가져온 댓글이 로그인한 유저와 동일하면 수정, 삭제 버튼 생성
					  if (loginMember == data[i].member_id && data[i].replyBoard_isdelete == 'N') {
						  output += '<a onclick="replyDeleteBar(this);" class="reReplyView_replyBtn" id="' + data[i].replyBoard_no + '">답글 삭제</a>';
					  }
					  
					  output += '</div></div><div id="replyList' + data[i].replyBoard_ref + '" class="reReplyModify_list"></div>' +
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
	function modifyBoardInfo() {
		let result = getParameter("result");
		if (result == "success") {
			alert("글 수정 성공!");
		} else if (result == "fail") {
			alert("글 수정을 실패 했습니다. 다시 시도 후 실패 시 문의바랍니다.");
		}
	}
   
	// 파라매터 값 가져오기
	function getParameter(param) {
		let returnVal; //리턴할 값을 저장하는 변수
		let url = location.href; //url주소
		let params = url.slice(url.indexOf("?") + 1, url.length).split("&");
	
		for (let i in params) {
			let paraName = params[i].split("=")[0]; // 매개변수명 얻음
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
	border-top: 2px solid #525eaa;
	padding-top: 5px;
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

.deleteReplyView {
	padding: 9px 3px 7px 3px;
    border-bottom: 1px solid #eee;
	display: inline-block;
	width: 861px;
    padding-left: 165px;
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
	margin-right : 10px;
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
	border-top: 1px solid #ddd;
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
						<span class="viewTitleLikeInfo_blank">추천 : ${viewBoard.board_likeCnt }</span>
						</div>
					</div>
					
					<!-- 글 내용 -->
					<div class="contentSize">
						${viewBoard.board_content }
					</div>
					
					<!-- 글 삭제, 수정, 리스트로 가기 버튼 -->
					<div class="boardManageBtn">
						<div class="boardModifyBtn">
							<c:if test="${loginMember.member_id eq viewBoard.member_id}">
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
						</c:if>
							<div class="backListBtn">
							<c:choose>
								<c:when test="${param.page != null }">
									<button type="button" class="btn btn-default" onclick="location.href='/board/campingTip/list?page=${param.page }';">목록보기</button>
								</c:when>
								<c:when test="${campingTipPage != null }">
									<button type="button" class="btn btn-default" onclick="location.href='/board/campingTip/list?page=${campingTipPage }';">목록보기</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-default" onclick="location.href='/board/campingTip/list?page=1';">목록보기</button>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
					
					<!-- 댓글 작성 창 -->
					<div class="writeReplyTab">
						댓글
					</div>
					
					<div class="replyWrite">
						<textarea class="replyWriteBar" id="writeReplyContent"></textarea>
						<div class="replyWriteBtnSite">
							<button type="button" class="btn btn-default" style="float: right;" onclick="writeReply();">댓글작성</button>
						</div>
					</div>
					
					<!-- 댓글 리스트 창 -->
					<div class="replyList" id="reply_box"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>

</body>

</html>
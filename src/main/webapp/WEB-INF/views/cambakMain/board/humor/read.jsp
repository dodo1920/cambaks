<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Cambark's</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak/21js/skel-panels.min.js"></script>
<script src="/resources/cambak21/js/init.js"></script>

<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />

<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script>
function gomodify(no) {
	
	$("replyno").val(no);
	$("#modifyBox").show();
}

function goDel(replyBoard_no){
	
	$.ajax({
		  method: "DELETE",
		  url: "/cambakMain/board/humor/replies/" + replyBoard_no,
		  headers : { // 요청하는 데이터의 헤더에 전송
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "DELETE"
		  },
		  dataType: "text", // 응답 받는 데이터 타입
		  data : JSON.stringify({ // 요청하는 데이터
			  replyBoard_no : replyBoard_no,
			
		  }),
		  success : function(result){
			  if(result == "success"){
				  alert("삭제완료");
				  
			  }
			  callReplyList();
		  }
		});
	
}

function showReplyBox() {
	$("#inputReplyBox").show();
}

function addReply(){
	
	let member_id = $("#newReplyWriter").val();
	let replyBoard_content = $("#newReplyText").val();
	let board_no = ${param.no};
	$.ajax({
		  method: "POST",
		  url: "/cambakMain/board/humor/replies",
		  headers : { // 요청하는 데이터의 헤더에 전송
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "POST"
		  },
		  dataType: "text", // 응답 받는 데이터 타입
		  data : JSON.stringify({ // 요청하는 데이터
			board_no : board_no,
			member_id : member_id,
			replyBoard_content : replyBoard_content
		  }),
		  success : function(result){
			  if(result == "Success"){
				  alert('댓글 등록 완료');
				  
			  }
			  callReplyList();
		  }
		});


}


function callReplyList(){
    
    let bno = "${param.no}";
    console.log(bno);
    let output = '<ul class="list-group">';
    $.getJSON("/cambakMain/board/humor/replies/all/" + bno, function(data){
       console.log(data);
       $(data).each(function(index, item){
          output += '<li><input type="hidden" id="replyno" value="'+this.replyBoard_no +'"/><div>' + this.replyBoard_content + '</div><div><span>' 
          + new Date(this.replyBoard_writeDate) + '</span>' + '<span>작성자' + this.member_id + '</span></div></li>';
          output += '<li><span id=""' + item.replyBoard_no + '" onclick="gomodify(' + item.replyBoard_no + ');"><img id=' + item.replyBoard_no + ' src = "../../../resources/img/modify.png" width="50px"  /></span>' 
          output +="<span id'"+ item.replyBoard_no+"' onclick='goDel("+ item.replyBoard_no +")'><img src='../../../resources/img/delete.png' width='50px'/> </span></li><hr/>"
          
       });
       output += "</ul>";
       $("#replyBox").html(output);
    });
 }   
 
 $(function(){
	
	 callReplyList(); 
 });
</script>
<style>
@import url(/resources/cambak21/css/SHWtamplet.css);

.\34 u {
	width: 100%;
	margin: 0px;
}

.pageBtn {
	justify-content: center;
	display: flex;
}

th.board-title {
	width: 60%;
}

p.category-title {
	font-weight: bold;
	text-align: center;
	font-size: 20px;
}
#modifyBox{
		width:400px;
		height : 150px;
		background-color: gray;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -50px;
		margin-left: -150px;
		z-index: 999;
		display: none;
		padding: 15px;
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
			
				<label class="control-label col-sm-2" for="writer">글번호 :</label>
				<div class="col-sm-10">${board.board_no }</div>


				<label class="control-label col-sm-2" for="writer">작성자 :</label>
				<div class="col-sm-10">${board.member_id }</div>


				<label class="control-label col-sm-2" for="writer">조회수 :</label>
				<div class="col-sm-10">${board.board_viewCnt }</div>


				<label class="control-label col-sm-2" for="writer">작성일 :</label>
				<div class="col-sm-10">
					<fmt:formatDate value="${board.board_writeDate }" type="both"
						pattern="yyyy-MM-dd HH:mm:ss" />

					<label class="control-label col-sm-2" for="title">제 목 :</label>
					<div class="col-sm-10">${board.board_title }</div>


					<label class="control-label col-sm-2" for="content">내 용 :</label>
					<div class="col-sm-10">${board.board_content }</div>
				</div>
					<button type="button" class="btn btn-success" id="rewriteBoard"
						onclick="location.href='/cambakMain/board/humor/modi?no=${board.board_no}'">수정하기</button>
					<button type="button" class="btn btn-info" id="deleteBoard"
						onclick="location.href='/cambakMain/board/humor/remove?no=${board.board_no}'">삭제하기</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/cambakMain/board/humor/listAll?page=${param.page}'">리스트페이지로</button>

					<button type="button" class="btn btn-success"
						onclick="showReplyBox();">댓글달기</button>

				<div id="modifyBox">
					<div>댓글 수정</div>
					<div>
						<input type="text" id="replytext" />

						<button type="button" id="replymodBtn" onclick="modiProc();">
							수정</button>
						<button type="button" id="replyModClose" onclick="modiBoxClose();">
							닫기</button>
					</div>
				</div>

				<div id="inputReplyBox"
					style="margin: 15px; border: 1px dotted gray; display: none;">
					<div>
						작성자 : <input type="text" name="replyer" id="newReplyWriter"
							value="" />

					</div>
					<div>
						댓글 입력 : <input type="text" name="replytext" id="newReplyText" />

					</div>
					<div>
						<button type="button" class="btn btn-info" id="replyAddBtn"
							onclick='addReply();'>ADD Reply</button>
					</div>
				</div>
				<div id="replyBox" style="padding : 10px; border-bottom : 1px solid gray;">
			
				</div>
			</div>
		</div>
	</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>
</body>
</html>
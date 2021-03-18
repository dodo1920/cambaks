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
function showReplyBox() {
	$("#inputReplyBox").show();
}

function addReply(){
	
	let replyer = $("#newReplyWriter").val();
	let replytext = $("#newReplyText").val();
	let bno = ${param.no};
	$.ajax({
		  method: "post",
		  url: "/cambakMain/board/humor/replies",
		  headers : { // 요청하는 데이터의 헤더에 전송
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "POST"
		  },
		  dataType: "text", // 응답 받는 데이터 타입
		  data : JSON.stringify({ // 요청하는 데이터
			bno : bno,
			replyer : replyer,
			replytext : replytext
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
          output += '<li><input type="hidden" id="replyno" value="'+this.no +'"/><div>' + this.replytext + '</div><div><span>' 
          + new Date(this.updatedate) + '</span>' + '<span>작성자' + this.replyer + '</span></div></li>';
          output += '<li><span id=""' + item.no + '" onclick="gomodify(' + item.no + ');"><img id=' + item.no + ' src = "../resources/img/modify.png" width="50px"  /></span>' 
          output +="<span id'"+ item.no+"' onclick='goDel("+ item.no +")'><img src='../resources/img/del.JPG' width='50px'/> </span></li><hr/>"
          
       });
       output += "</ul>";
       $("#replyBox").html(output);
    });
 }   
 
 $(function(){
	 alert("!");
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
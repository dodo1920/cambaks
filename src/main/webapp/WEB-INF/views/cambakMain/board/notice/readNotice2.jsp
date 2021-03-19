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

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak21/js/skel-panels.min.js"></script>
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

<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script>

<script>




function callReplyList(){
	
	let board_no = '${param.no}';
	let output = '<ul class="list-group">';
	
	
	$.getJSON("/board/notice/getReply/" + board_no, function(data){
		
		
	
		$(data).each(function(index, item){
			
			let date = new Date(this.replyBoard_writeDate);
			var now = date.getFullYear() + "-" + (date.getMonth() + 1)  + "-" + date.getDay() + "     " + date.getHours() + ":" + date.getMinutes();
				
			
			let go = Number(item.replyBoard_no);
			$("#replyBoard_no").val(go);
			let date111 = new Date(this.replyBoard_updateDate);
			
			output += '<li class="list-group-item"><input type="hidden" id="replyid" value="' + this.board_no + '"/><div>' + this.replyBoard_content + '</div><div><span>' 
			+ now + '<img src="/resources/cambak21/images/star2.png" onclick="goDelete(' + item.replyBoard_no + ');" style="width:30px; height:30px; float:right;"><img id="' + item.replyBoard_no + '" src="/resources/cambak21/images/edit.png" onclick="goModify(' + item.replyBoard_no + ');" style="width:30px; height:30px; float:right;"></div></span>' + 
			'<div><span>' + this.member_id + '</span></div><div id="modifyBox' +  item.replyBoard_no + '" style="display:none;"><div><input type="hidden" name="replyBoard_no" id="replyBoard_no" /><input type="text" style="width:600px;" onkeyup="enterkey();" id="replyBoard_content" name="replyBoard_content" placeholder="수정할 댓글 내용을 입력하세요"><button type="button" id="replyModBtn" style="margin: 0px 5px 0px 20px;" onclick="modiProc();">수정</button><button type="button" id="replyModClose" onclick="modiboxclose();">닫기</button></div></div></div></li>';
			
		});
		
		output += "</ul>";
		
		$("#replyBox").html(output);
	});
}	

$(function(){
	
  	callReplyList();
    let boardUri = searchUriAddress();
    asideBarDraw(boardUri);
  	
  });

function goDelete(replyno){
	let bno = '${param.no}';
	let no = replyno;
		$.ajax({
			method: "get",
			url: "/board/notice/dropReply/" + no + "/" + bno,
			headers: {	// 요청 하는 데이터의 헤더에 전송
			"X-HTTP-Method-Override" : "DELETE"
			},
			dataType: "text", // 응답 받는 데이터 타입
			data : no, 
			success : function(result){
					alert('댓글 삭제 완료!');
					callReplyList();
				
			}
		});
	
	
}

function enterkey() {
    if (window.event.keyCode == 13) {

       modiProc();
    }
}





function modiProc(){
		// 유효성 검사 하고...
		
		
		
		let replyBoard_content = $("#replyBoard_content").val();
		let replyBoard_no = $("#replyBoard_no").val();
		
		if(replyBoard_content != ""){
	
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
					$('#modifyBox' + replyBoard_no).hide();
					
				}
			}
		});

	}else{
		alert("댓글 내용 입력은 필수 입니다.");
	}
		
	};
	
function goModify(replyBoard_no){
	console.log(replyBoard_no);
	$('#modifyBox' + replyBoard_no).show();
	$("#replyBoard_no").val(replyBoard_no);
	
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
					alert('댓글 등록 완료!');
					callReplyList();
					$("#inputReplyBox").css('display', 'none');
					
				
			}
		});
		
	};


</script>





<style>
@import url(/resources/cambak21/css/SHWtamplet.css);

#modifyBox{
	width: 400px;  		height: 100px;
	background-color: lightgray;;
	top: 50%;  		left: 50%;
	margin: -50px 0p 0px -150px;
	z-index: 999;
	padding: 15px;
	}

.formContent{

	margin: 40px;

}

input:focus {outline:none;}
textarea:focus {outline: none;}

form, form input{
	border:none;
	color:black;
	font-weight: 500;
} 

.boardtextArea{
    resize:none;
    margin: 5px;
    font-weight: 500;
    color: black;
    resize: none;
    padding: 11px;
    border: none;
}

#replyWindow{

    width: 900px;
    height: 400px;
    margin: 40px;
    overflow-x: hidden;

}

#buttonWindow{

	margin: -45px 40px -15px;
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
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>고객센터</h2>
							<span class="byline" id="rollNot"><a href="#">공지사항 상세페이지</a></span>
						</header>
					
					</section>
				<!--  게시판 상세내용  -->	
					<section>
					<form>
					
				    <div class="formContent"> 
				    <div>
				    <input type="text" readonly style="font-size:25px; font-weight:900;max-width: 750px;" name="board_title" value="${noticeBoard.board_title }" />
<%-- 				    <c:if test="${loginMember.uid == noticeBoard.member_id }">	 --%>
         			<button type="button" class="btn btn-success" id="rewriteBoard" onclick="location.href='/board/notice/modi?no=${noticeBoard.board_no}'">수정</button>
<%-- 				    </c:if> --%>
		            </div>
		              <div>
		            작성일: <fmt:formatDate value="${noticeBoard.board_writeDate }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
				    <span style="margin-left:15px;">작성자: <input readonly type="text" name="member_id" value="${noticeBoard.member_id }" /></span>
				    <span style="float:right; margin-left:15px;">조회수 <input readonly type="text" style="width:20px;" value="${noticeBoard.board_viewCnt }" /> </span>
				    <span style="float:right; ">댓글수 <input readonly type="text" style="width:20px;" value="${noticeBoard.board_replyCnt }" /> </span>
			  		 </div>
		               <div>
		               <hr style="margin:1em 0 0 0; padding: 1em 0 0 0;"/>
				    <textarea readonly name="board_content" readonly class="boardtextArea" cols="125" rows="16" >${noticeBoard.board_content }</textarea>
				    <hr style="margin:1em 0 0 0; padding: 1em 0 0 0;"/>
		            </div>
		               
            </form>
        </section>   
        <!--  로그인 한 유저와 작성자가 같을 때만 수정하기 삭제하기 버튼이 보여짐  -->
        <div id="buttonWindow">
        <c:if test="${loginMember.uid == board.writer }">	
         
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
      </div>
<%--       </c:if> --%>
      <div id="inputReplyBox" style="board: 1px dotted black; margin-top: 20px; display:none;">
      	
          <div>
         	     
      	댓글 입력 : <input type="text" name="replyBoard_content" id="newReplyContent" />
      </div>
        <div>
<%--       	작성자 : <input type="text" name="replyer" id="newReplyWriter" value="${loginMember.uid }"/> --%>
      	작성자 : <input type="text" name="member_id" id="newReplyMember" />
      </div>
      
   
      <button type="button" id="replyAddBtn" class="btn btn-primary" onclick="replyAddBtn();">ADD Reply</button>
      
      </div>
    
    <!-- 댓글 보드 시작 -->
    <section>
		<header>
		<span class="byline" id="rollNot"><a href="#">댓글 목록</a></span>
		</header>
	
	
    <div id="replyWindow">
      <div id="replyBox">
      		
      </div>
    </div>  
           <div id="modifyBox" style="display:none;">
        	
        	<div>
        		<input type="hidden" name="replyBoard_no" id="replyBoard_no" />
        		<input type="text" onkeyup="enterkey();" id="replyBoard_content" name="replyBoard_content">
        		<button type="button" id="replyModBtn"  onclick="modiProc();">수정</button>
        		<button type="button" id="replyModClose" onclick="modiboxclose();">닫기</button>
        	
        	</div>
        </div>
    
	</section>
					
			</div>
		</div>
	</div>
</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>
	
	
</body>

</html>
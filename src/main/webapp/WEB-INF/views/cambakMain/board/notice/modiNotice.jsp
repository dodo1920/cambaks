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

	function checkModiForm(){
		
		
		if($(".boardtextArea").val() == $("#prevBoardContext").val() && $("input[name=board_title]").val() == $("#prevBoardTitle").val()){
			alert("수정할 내용이 없습니다.");
		}else {
			$("#modiBoardNotice").submit();
		}	
				
	}

	
	$(function(){
		
		$("#prevBoardContext").val($(".boardtextArea").val());
	  	$("#prevBoardTitle").val($("input[name=board_title]").val());
	  
	  
	    let boardUri = searchUriAddress();
	    asideBarDraw(boardUri);
		 
		
	});

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
    border: solid 1px;
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
							<span class="byline" id="rollNot"><a href="#">공지사항</a></span>
						</header>
					
					</section>
				<!--  게시판 상세내용  -->	
					<section>
					<form id="modiBoardNotice" action="/board/notice/modi" method="post">
					
				    <div class="formContent"> 
				    <div>
				    <input type="text" style="font-size:25px; font-weight:900; width: 700px;" name="board_title" value="${noticeBoard.board_title }" />
				    <input type="hidden" name="board_no" value="${noticeBoard.board_no }" />
<%-- 				    <c:if test="${loginMember.uid == noticeBoard.member_id }">	 --%>
         			
         			<button type="button" style="float:right; margin-top:10px; margin-left:10px;" class="btn btn-warning" id="rewriteBoard" onclick="location.href='/board/notice/read?no=${noticeBoard.board_no }'">수정 취소</button>
         			<button type="button" class="btn btn-success" id="rewriteBoard" onclick="checkModiForm();">수정 완료</button>
<%-- 				    </c:if> --%>
		            </div>
		              <div>
		            <span style="margin-left:15px;">작성자: <input style="border:none;" readonly type="text" name="member_id" value="${noticeBoard.member_id }" /></span>
				   </div>
		               <div>
		               <hr style="margin:1em 0 0 0; padding: 1em 0 0 0;"/>
				    <textarea name="board_content" class="boardtextArea" cols="125" rows="16" >${noticeBoard.board_content }</textarea>
				    <hr style="margin:1em 0 0 0; padding: 1em 0 0 0;"/>
		            </div>
		               
            </form>
        </section>   
        <!--  로그인 한 유저와 작성자가 같을 때만 수정하기 삭제하기 버튼이 보여짐  -->
  
					
			</div>
		</div>
	</div>
</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>

	<input type="hidden" id="prevBoardTitle" />
	<input type="hidden" id="prevBoardContext" />

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>Cambark's</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/resources/cambak21/js/skel.min.js"></script>
	<script src="/resources/cambak/21js/skel-panels.min.js"></script>
	<script src="/resources/cambak21/js/init.js"></script>

	<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
	
	<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
	<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
	
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	<style>
		@import url(/resources/cambak21/css/SHWtamplet.css);
		
		.\34 u {
			width : 100%;
			margin : 0px;
		}
	</style>
	
	<script>
		function writeControll() {
			let result = false
			if($("#title").val() ==  ""){
				result = false;
			}else{
				if($("#price").val() ==  ""){
					result = false;
				}else{
					if($("#addr").val() ==  ""){
						result = false;
					}else{
						result = true;
					}
				}
			}
			return result;
		}
		$(function(){
			$(".fDrop").on("dragenter dragover", function(evt){
				evt.preventDefault();
			});
			$(".fDrop").on("drop", function(evt) {
				evt.preventDefault();
				let files = evt.originalEvent.dataTransfer.files; 
				var uploadData = new FormData();
				for (var i =0; i < files.length;i++){
					uploadData.append("uploadFile",files[i])	
				}
				
				console.log(uploadData.getAll('uploadFile'))
				
				$.ajax({
					url : '/board/resell/uploadAjax',
					data : uploadData,  // 응답 받는 형식
					type : 'post',
					processData : false, // 전송하는 데이터를 쿼리 스트링 형태로 변환하는지를 결정
					contentType: false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
					success : function(result) {
						console.log(result)
					}, 
					fail : function(result) {
						alert(result);
					}
				});
			})
		})
		
	</script>
</head>

<body>
    <%@include file="../../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">
			
			<!-- 사이드바 템플릿 -->
			<%@include file="../../cambak21BoardAside.jsp"%>

				<!-- Content -->
				
				<div id="content" class="8u skel-cell-important">
							<form action="write" method="post" onsubmit="return writeControll();">
							아이디 :
							<input type="text" class="form-control" id="userId" name="member_id">
							제목 : 
							<input type="text" class="form-control" id="title" name="resellBoard_title">
							본문 :
							<textarea id="content" class="fDrop" name="resellBoard_content" style="width: 100%;height: 300px;"></textarea>
							가격 :
							<input type="text" class="form-control" id="price" name="resellBoard_price">
							주소 :
							<input type="text" class="form-control" id="addr" name="resellBoard_addr">
							<input type="submit" class="btn btn-success" value="작성하기">
							<button type="button" class="btn btn-danger"
							onclick="location.href='/board/resell/list?perPageNum=9';">취소</button>
						</form>
						
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

    <%@include file="../../cambak21Footer.jsp"%>
	
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>Cambark's</title>

<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/SHWtamplet.css" />
<<<<<<< HEAD
=======
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageAside.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageTemplet.css" />
>>>>>>> 6ecb86d4d64e4fef4f8d5d52b5577fb92fda2438
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>

<script>
<<<<<<< HEAD



</script>
<style>

.\34 u {
   width: 100%;
}

.profile {
   box-sizing: border-box;
   width: 200px;
   text-align: center;
   border: 1px solid #F0F2F0;
   margin-bottom: 120px 50px 0px 0px;
       
}

.profileSize {
   background-color: #F0F2F0;
   padding: 20px 0px;
}

.userProfileImg {
    width: 64px;
    height: 64px;
    border-radius: 70%;
    overflow: hidden;   
}

.profileEmail {
    font-size: 13px;
}

.nav-stacked>li{
   margin-top: -10px;
}

.nav>li>a {
    position: relative;
    display: block;
    padding: 5px 15px;
}

#category-title{

    text-align-last: center;
    
    }

.panel-success {
    margin-top: 25px;
    border-color: #d6e9c6;
}

.profileMenu1{
margin-top: 10px;
}
=======
let member_id = '${loginMember.member_id}'; // 페이지 로딩 시 로그인 아이디 가져오기
$(document).ready(function() {
	
	readMyReplyList(); // 로딩 시 전체 댓글 리스트 출력
	
});

// 로그인한 회원이 작성한 게시글, 댓글, 좋아요, 문의 개수 가져오기
function getTotalCount() {
	
	$.ajax({
		method: "POST",
		url: "/myPage/getMyCount.mp",
		dataType: "json",
		data : {member_id : member_id},
		success : function(data) {
			let totalBoard = data.boardCnt + data.resellBoardCnt;
			let totalReply = data.replyCnt + data.resellReplyCnt;
			let totalLike = data.likeCnt + data.resellLikeCnt;
			let totalQuestion = data.myQuestion;
			
			$("#totalBoard").text(totalBoard);
			$("#totalReply").text(totalReply);
			$("#totalLike").text(totalLike);
			$("#totalQuestion").text(totalQuestion);
			
		}, error : function(data) {
			
		}
		
		});
	
}


//로딩 시 전체 댓글 리스트 출력
function readMyReplyList() {
	
	let page = 1;
	let board_category = $("#thisCategory").val();
	
	$.ajax({
		method: "POST",
		url: "/myPage/myReplyList.mp",
		dataType: "json",
		data : {member_id : member_id, board_category : board_category, page : page},
		success : function(data) {
			
			let myReplyList = data.myReplyList;
			let paging = data.paging;
			
			for (let i = 0; i < myReplyList.length; i++) {
				
				let board_writeDate = myReplyList[i].board_writeDate;
				let replyBoard_writeDate = myReplyList[i].replyBoard_writeDate;
				
				let output = '<tr class="myPageBoard">' + 
				'<td>' + myReplyList[i].board_no + '</td>' + 
				'<td>' + myReplyList[i].board_category + '</td>' + 
				'<td>' + myReplyList[i].board_title + '</td>' + 
				'<td>' + getDateParam(board_writeDate) + '</td></tr>' + // 게시글 가져오기
				'<tr class="myPageBoard">' +
				'<td colspan="2" class="boardLine"><img src="/resources/cambak21/img/arrow.png" class="replyImgSize">작성한 댓글 :</td>' +
				'<td class="boardLine">' + myReplyList[i].replyBoard_content + '</td>' +
				'<td class="boardLine">' + getDateParam(replyBoard_writeDate) + '</td></tr>';
				
				$("#myPageBoardList").append(output);
			}
			
			let pagingBtn = '<ul class="pagination">';
			
			for (let j = 1; j <= paging.endPage; j++) {
				pagingBtn += '<li><a class="clickBtnHover" id="' + j + '" onclick="MyReplyCategory(this);">' + j + '</a></li>';
			}
			
			if (paging.next) {
				pagingBtn += '<li><a class="clickBtnHover" id="' + 2 + '" onclick="MyReplyCategory(this);">다음</a></li>';
			}
			
			pagingBtn += '</ul>';
			$("#replyPagingBtn").append(pagingBtn);
			getTotalCount(); // 내 총 개수 목록 새로고침
			
		}, error : function(data) {
			
		}
		});
	
}

// 카테고리를 선택해서 페이지 번호를 누를 때마다 실행
function MyReplyCategory(obj) {
	
	
	let page = $(obj).attr("id");
	let board_category = $("#thisCategory").val();
	
	$.ajax({
		method: "POST",
		url: "/myPage/myReplyList.mp",
		dataType: "json",
		data : {member_id : member_id, board_category : board_category, page : page},
		success : function(data) {
			
			let myReplyList = data.myReplyList;
			let paging = data.paging;
			
			$("#myPageBoardList").empty();
			
			for (let i = 0; i < myReplyList.length; i++) {
				
				let board_writeDate = myReplyList[i].board_writeDate;
				let replyBoard_writeDate = myReplyList[i].replyBoard_writeDate;
				
				let output = '<tr class="myPageBoard">' + 
				'<td>' + myReplyList[i].board_no + '</td>' + 
				'<td>' + myReplyList[i].board_category + '</td>';
				
				if (board_category == "Tip") {
					output += '<td><a href="/board/campingTip/view.bo?id=Tip&no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
				}
				
				output += '<td>' + getDateParam(board_writeDate) + '</td></tr>' + // 게시글 가져오기
				'<tr class="myPageBoard">' +
				'<td colspan="2" class="boardLine"><img src="/resources/cambak21/img/arrow.png" class="replyImgSize">작성한 댓글 :</td>' +
				'<td class="boardLine">' + myReplyList[i].replyBoard_content + '</td>' +
				'<td class="boardLine">' + getDateParam(replyBoard_writeDate) + '</td></tr>';
				
				$("#myPageBoardList").append(output);
			}
			
			$("#replyPagingBtn").empty();
			let pagingBtn = '<input type="hidden" id="thisCategory" value="' + board_category + '"><ul class="pagination">';
			
			if(paging.prev) {
				pagingBtn += '<li><a class="clickBtnHover" id="' + (Number(page) - 1) + '" onclick="MyReplyCategory(this);">이전</a></li>';
			}
			
			for (let j = 1; j <= paging.endPage; j++) {
				pagingBtn += '<li><a class="clickBtnHover" id="' + j + '" onclick="MyReplyCategory(this);">' + j + '</a></li>';
			}
			
			if (paging.next) {
				pagingBtn += '<li><a class="clickBtnHover" id="' + (Number(page) + 1) + '" onclick="MyReplyCategory(this);">다음</a></li>';
			}
			
			pagingBtn += '</ul>';
			$("#replyPagingBtn").append(pagingBtn);
			getTotalCount(); // 내 총 개수 목록 새로고침
			
		}, error : function(data) {
			
		}
		});
	
}

//카테고리 탭을 눌렀을 때 실행
function MyReplyCategoryBtn(obj) {
	
	let page = 1;
	let board_category = obj;
	
	$.ajax({
		method: "POST",
		url: "/myPage/myReplyList.mp",
		dataType: "json",
		data : {member_id : member_id, board_category : board_category, page : page},
		success : function(data) {
			
			$("#thisCategory").val(board_category);
			
			let myReplyList = data.myReplyList;
			let paging = data.paging;
			
			console.log(myReplyList);
			console.log(paging);
			
			$("#myPageBoardList").empty();
			
			if (myReplyList.length == 0) { // 작성한 댓글이 없을 시
				
				
				
			} else {
				for (let i = 0; i < myReplyList.length; i++) {
					
					let board_writeDate = myReplyList[i].board_writeDate;
					let replyBoard_writeDate = myReplyList[i].replyBoard_writeDate;
					
					let output = '<tr class="myPageBoard">' + 
					'<td>' + myReplyList[i].board_no + '</td>' + 
					'<td>' + myReplyList[i].board_category + '</td>';
					
					if (board_category == "Tip") { // 캠핑팁
						output += '<td><a href="/board/campingTip/view.bo?id=Tip&no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
					} else if (board_category == "notice") { // 공지사항
						output += '<td><a href="/board/notice/read?no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
					} else if (board_category == "camping") { // 캠핑후기
						
					} else if (board_category == "humor") { // 유머
						output += '<td><a href="/board/humor/read?no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
					} else if (board_category == "QA") { // Q&A
						output += '<td><a href="/board/qa/detail.bo?no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
					} else if (board_category == "Resell") { // 중고
						
					} else if (board_category == "CS") { // 고객센터
						output += '<td><a href="/board/cs/detail?no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
					}
					
					output += '<td>' + getDateParam(board_writeDate) + '</td></tr>' + // 게시글 가져오기
					'<tr class="myPageBoard">' +
					'<td colspan="2" class="boardLine"><img src="/resources/cambak21/img/arrow.png" class="replyImgSize">작성한 댓글 :</td>' +
					'<td class="boardLine">' + myReplyList[i].replyBoard_content + '</td>' +
					'<td class="boardLine">' + getDateParam(replyBoard_writeDate) + '</td></tr>';
					
					$("#myPageBoardList").append(output);
				}
				
				$("#replyPagingBtn").empty();
				let pagingBtn = '<input type="hidden" id="thisCategory" value="' + board_category + '"><ul class="pagination">';
				
				if(paging.prev) {
					pagingBtn += '<li><a class="clickBtnHover" id="' + page - 1 + '" onclick="MyReplyCategory(this);">이전</a></li>';
				}
				
				for (let j = 1; j <= paging.endPage; j++) {
					pagingBtn += '<li><a class="clickBtnHover" id="' + j + '" onclick="MyReplyCategory(this);">' + j + '</a></li>';
				}
				
				if (paging.next) {
					pagingBtn += '<li><a class="clickBtnHover" id="' + page + 1 + '" onclick="MyReplyCategory(this);">다음</a></li>';
				}
				
				pagingBtn += '</ul>';
				$("#replyPagingBtn").append(pagingBtn);
				getTotalCount(); // 내 총 개수 목록 새로고침
				
			}
			
		}, error : function(data) {
			
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

</script>
<style>
<<<<<<< HEAD
.boardLine {
	font-weight: bold;
}

.replyImgSize {
	width: 16px;
	height: 16px;
}
=======
>>>>>>> 6ecb86d4d64e4fef4f8d5d52b5577fb92fda2438
>>>>>>> bf7e71772640ac726587e11fabe63c5630cb1629

.clickBtnHover:hover {
	cursor: pointer;
}

</style>
</head>
<body>
<<<<<<< HEAD
<%@include file="../cambak21Header.jsp"%>

<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row">
			
		<%@include file="myPageAside.jsp"%>
			
			
			
			
			
		</div>
	</div>
</div>

<%@include file="../cambak21Footer.jsp"%>
	
=======
	<%@include file="../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<%@include file="myPageAside.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<div class="welcome-wrap">
						<div class="welcome">
							<span class="bsk-owner">${loginMember.member_name } </span>
							<c:if test="${loginMember.grade_name == 'M'}">
								<img alt="" src="../../resources/cambak21/img/admin.png"
									class="gradeImg">
							</c:if>
							<c:if test="${loginMember.grade_name == 'A'}">
								<img alt="" src="../../resources/cambak21/img/gold.png"
									class="gradeImg">
							</c:if>
							<c:if test="${loginMember.grade_name == 'B'}">
								<img alt="" src="../../resources/cambak21/img/silver.png"
									class="gradeImg">
							</c:if>
							<c:if test="${loginMember.grade_name == 'C'}">
								<img alt="" src="../../resources/cambak21/img/bronze.png"
									class="gradeImg">
							</c:if>
						</div>
					</div>
					<div class="myActivity-wrap">
						<div class="myActivity">
							<p class="myPost">
								작성한 게시글 : <a class="myPostCnt" id="totalBoard">0</a>개
							</p>
							<p class="myPost">
								작성한 댓글 : <a class="myPostCnt" id="totalReply">0</a>개
							</p>
							<p class="myPost">
								좋아요 누른 글 : <a class="myPostCnt" id="totalLike">0</a>개
							</p>
							<p class="myPost">
								나의 문의 : <a class="myPostCnt" id="totalQuestion">0</a>개
							</p>
						</div>
						<!-- 위에 카테고리 -->
						<div class="small-category">
							<nav class="navbar navbar-default" id="bsk-nav">
								<div class="container-fluid" id="bsk-smallCat">
									<ul class="nav navbar-nav">
										<li class="bsk-focus catagory-name"><a class="clickBtnHover" onclick="MyReplyCategoryBtn('total')">전체보기</a></li>
										<li class="catagory-name"><a class="clickBtnHover" onclick="MyReplyCategoryBtn('camping')">캠핑 후기</a></li>
										<li class="catagory-name"><a class="clickBtnHover" onclick="MyReplyCategoryBtn('humor')">유머</a></li>
										<li class="catagory-name"><a class="clickBtnHover" onclick="MyReplyCategoryBtn('QA')">Q&A</a></li>
										<li class="catagory-name"><a class="clickBtnHover" onclick="MyReplyCategoryBtn('Resell')">중고거래</a></li>
										<li class="catagory-name"><a class="clickBtnHover" onclick="MyReplyCategoryBtn('Tip')">캠핑Tip</a></li>
										<li class="catagory-name"><a class="clickBtnHover" onclick="MyReplyCategoryBtn('notice')">공지사항</a></li>
										<li class="catagory-name"><a class="clickBtnHover" onclick="MyReplyCategoryBtn('CS')">고객센터</a></li>
									</ul>
								</div>
							</nav>
						</div>
						<!-- 메인 컨텐츠 -->
						<div class="main-wrap">
							<div class="main-content">
								<table class="table table-hover">
									<thead>
										<tr>
											<th class="myPageThead">글번호</th>
											<th class="myPageThead">게시판</th>
											<th class="myPageThead">글제목</th>
											<th class="myPageThead">작성일</th>
										</tr>
									</thead>
									<tbody id="myPageBoardList">
									</tbody>
								</table>
							</div>
						</div>
						<!-- 페이징 -->
						<div class="myPagePagingBtn" id="replyPagingBtn">
						<input type="hidden" id="thisCategory" value="total">
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

>>>>>>> 6ecb86d4d64e4fef4f8d5d52b5577fb92fda2438
</body>

</html>
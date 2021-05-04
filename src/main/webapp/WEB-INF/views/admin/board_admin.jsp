<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 화면 너비 자동반응 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- 아이콘 및 타이틀 -->
<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<title>Cambak's - Admin Pages</title>
<!-- Custom CSS -->
<link href="../resources/adminAssets/libs/flot/css/float-chart.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>





<script>

let ResultList = new Array();
let AfterResultList = new Array();

	$(function() {
		// 오늘날짜로 기본설정
		setPeriod(0);
		// 오늘 날짜로 조회되는 게시판 목록 출력
		goBoardListAll();
	
		// 1일, 3일 , 7일.. 버튼 클릭시 달력 날짜 동적 변경
		$('.btnDate').on('click', function() {
			$('.btnDate').removeClass('selected');
			$(this).addClass('selected');
		});
	
		$('#list_limit').on('change', function() {
			$("#perPageCnt").val(this.options[this.selectedIndex].value);
			goBoardListAll();
		});
		
		
	});
	
	function outputPagingParam(data){
		
		console.log(data + "페이징 길이");	
	}
	
	
	
	
	
	
	
	// 오름차순 정렬 후 게시판만 출력 함수
	function BoardOutputGo(data){
		let outputList = "";
		
			$(data).each(function(index, item){		
			
				let date = new Date(this.board_writeDate);
				var writeDate = date.getFullYear() + "-" + (date.getMonth() + 1)  + "-" + date.getDate() + "     " + date.getHours() + ":" + date.getMinutes();
			    let date111 = new Date(this.board_updateDate);
			    var modifyDate = date111.getFullYear() + "-" + (date111.getMonth() + 1)  + "-" + date111.getDate() + "     " + date111.getHours() + ":" + date111.getMinutes();
			
				outputList += "<tr>";
				outputList += '<td><input type="checkbox" name="bbs_no[]" value="' + this.board_no + '"class="rowChk"></td>';
				outputList += '<td>' + this.board_no + '</td><td>' + this.board_category + '</td>';
				outputList += '<td class="left"><a href="' + this.CategoryLink + this.board_no + '" class="txtLink">' + this.board_title + '</a></td> -->';
				outputList += '<td>' + this.member_id + '</td>';
				outputList += '<td><a href="#"><span>본문 미리보기</span></a></td>';
				outputList += '<td>' + writeDate + '</td><td>' + modifyDate + '</td><td class="right">' + this.board_viewCnt + '</td><td class="right">' + this.board_replyCnt + '</td><td class="right">' + this.board_likeCnt + '</td></tr>';
			});
			
			if(data.length == 0){
				outputList += '<tr><td style="color:red;" colspan="11">검색값이 없습니다.</td></tr>'
			}	
			
			$("#boardListFrame").html(outputList);
			outputPagingParam(data.length);
	}
	
	// 오름차순 정렬 후 댓글 + 게시판 출력 함수
	function replyOutputGo(data){
		let outputList = "";
		
		$(data).each(function(index, item){		
			
			let date = new Date(this.board_writeDate);
			var writeDate = date.getFullYear() + "-" + (date.getMonth() + 1)  + "-" + date.getDate() + "     " + date.getHours() + ":" + date.getMinutes();
		    let date111 = new Date(this.board_updateDate);
		    var modifyDate = date.getFullYear() + "-" + (date.getMonth() + 1)  + "-" + date.getDate() + "     " + date.getHours() + ":" + date.getMinutes();
									
			let replydate = new Date(this.replyBoard_writeDate);
			var replywriteDate = replydate.getFullYear() + "-" + (replydate.getMonth() + 1)  + "-" + replydate.getDate() + "     " + replydate.getHours() + ":" + replydate.getMinutes();
		    let replydate111 = new Date(this.replyBoard_updateDate);
		    var replymodifyDate = replydate111.getFullYear() + "-" + (replydate111.getMonth() + 1)  + "-" + replydate111.getDate() + "     " + replydate111.getHours() + ":" + replydate111.getMinutes();
			
		 
			outputList += "<tr>";
			outputList += '<td><br/><input type="checkbox" name="bbs_no[]" value="' + this.board_no + '"class="rowChk"></td>';
			outputList += '<td>' + this.board_no + '<hr/ style="margin:5px; background-color: thistle;">(' + this.replyBoard_no + ')</td><td><br/>' + this.board_category + '</td>';
			outputList += '<td class="left" style="width: 240px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><a href="' + this.CategoryLink + this.board_no + '" class="txtLink">' + this.board_title + '<hr/ style="margin:5px; background-color: thistle;">(' + this.replyBoard_content + ')</a></td>';
			outputList += '<td>' + this.bmember_id + '<hr/ style="margin:5px; background-color: thistle;"> (' + this.rmember_id + ')</td>';
			outputList += '<td><br/><a href="#"><span>본문 미리보기</span></a></td>';
			outputList += '<td>' + writeDate + '<hr/ style="margin:5px; background-color: thistle;">(' + replywriteDate + ')</td><td>' + modifyDate + '<hr/ style="margin:5px; background-color: thistle;">(' + replymodifyDate + ')</td><td class="right"><br/>' + this.board_viewCnt + '</td><td class="right"><br/>' + this.board_replyCnt + '</td><td class="right"><br/>' + this.board_likeCnt + '</td></tr>';
		});
	
		if(data.length == 0){
			outputList += '<tr><td style="color:red;" colspan="11">검색값이 없습니다.</td></tr>'
		}	
	
		
		$("#boardListFrame").html(outputList);
		outputPagingParam(data.length);
		
	}
		
		
		
		
	// 검색된 값(게시판 or 댓글+게시판)을 구분하여 오름차순 조건에 따라 오름차순 실행
	function changeResultViewList(data){
			let outputList = "";
	
	// 검색된 값이 게시판일 때만 조건문 구현 
	if(ResultList.Boardlst != null){	
		AfterResultList = ResultList.Boardlst;
		
		if(data.options[data.selectedIndex].value == "basic"){
			
			AfterResultList.sort(function(a, b){
				return b.board_no - a.board_no;
			});
			BoardOutputGo(AfterResultList);
		}else if(data.options[data.selectedIndex].value == "categorydesc"){
	
			AfterResultList.sort(function(a, b){
				return b.board_category > a.board_category ? -1 : b.board_category > a.board_category ? 1 : 0;
			});
			
			BoardOutputGo(AfterResultList);
		}else if(data.options[data.selectedIndex].value == "titledesc"){
	
			AfterResultList.sort(function(a, b){
				return b.board_title > a.board_title ? -1 : b.board_title > a.board_title ? 1 : 0;
			});
			
			BoardOutputGo(AfterResultList);
		}else if(data.options[data.selectedIndex].value == "writerdesc"){
	
			AfterResultList.sort(function(a, b){
				return b.member_id > a.member_id ? -1 : b.member_id > a.member_id ? 1 : 0;
			});
			
			BoardOutputGo(AfterResultList);
		}else if(data.options[data.selectedIndex].value == "updatedaydesc"){
	
			AfterResultList.sort(function(a, b){
				return b.board_updateDate - a.board_updateDate;
			});
			
			BoardOutputGo(AfterResultList);
		}else if(data.options[data.selectedIndex].value == "viewCnt"){
	
			AfterResultList.sort(function(a, b){
				return b.board_viewCnt - a.board_viewCnt;
			});
			
			BoardOutputGo(AfterResultList);
		}else if(data.options[data.selectedIndex].value == "replyCnt"){
	
			AfterResultList.sort(function(a, b){
				return b.board_replyCnt - a.board_replyCnt;
			});
			
			BoardOutputGo(AfterResultList);
		}else if(data.options[data.selectedIndex].value == "likeCnt"){
	
			AfterResultList.sort(function(a, b){
				return b.board_likeCnt - a.board_likeCnt;
			});
			
			BoardOutputGo(AfterResultList);
		}
		
	}
		
	
	
	// 검색된 값이 댓글 + 게시판일 경우에 오름차순 조건문 실행
		if(ResultList.replyBoardlst != null){
			
			AfterResultList = ResultList.replyBoardlst;
					
					if(data.options[data.selectedIndex].value == "basic"){
						
						AfterResultList.sort(function(a, b){
							return b.replyBoard_no - a.replyBoard_no;
						});
						replyOutputGo(AfterResultList);
					}else if(data.options[data.selectedIndex].value == "categorydesc"){
				
						AfterResultList.sort(function(a, b){
							return b.board_category > a.board_category ? -1 : b.board_category > a.board_category ? 1 : 0;
						});
						
						replyOutputGo(AfterResultList);
					}else if(data.options[data.selectedIndex].value == "titledesc"){
				
						AfterResultList.sort(function(a, b){
							return b.board_title > a.board_title ? -1 : b.board_title > a.board_title ? 1 : 0;
						});
						
						replyOutputGo(AfterResultList);
					}else if(data.options[data.selectedIndex].value == "writerdesc"){
				
						AfterResultList.sort(function(a, b){
							return b.rmember_id > a.rmember_id ? -1 : b.rmember_id > a.rmember_id ? 1 : 0;
						});
						
						replyOutputGo(AfterResultList);
					}else if(data.options[data.selectedIndex].value == "updatedaydesc"){
				
						AfterResultList.sort(function(a, b){
							return b.replyBoard_updateDate - a.replyBoard_updateDate;
						});
						
						replyOutputGo(AfterResultList);
					}else if(data.options[data.selectedIndex].value == "viewCnt"){
				
						AfterResultList.sort(function(a, b){
							return b.board_viewCnt - a.board_viewCnt;
						});
						
						replyOutputGo(AfterResultList);
					}else if(data.options[data.selectedIndex].value == "replyCnt"){
				
						AfterResultList.sort(function(a, b){
							return b.board_replyCnt - a.board_replyCnt;
						});
						
						replyOutputGo(AfterResultList);
					}else if(data.options[data.selectedIndex].value == "likeCnt"){
				
						AfterResultList.sort(function(a, b){
							return b.board_likeCnt - a.board_likeCnt;
						});
						
						replyOutputGo(AfterResultList);
					}
					
					
		}
	
	}

	
	
	
	// 댓글은 제목이 없으므로 댓글 선택시 내용으로 자동 변경
	function chageLangSelect(data){
		if(data.options[data.selectedIndex].value == "reply"){
			$("#searchboard_Type").val("content").prop("selected", true);  // 값이 content인거 선택
		}
	}
	// 게시판 선택시 제목으로 변경되도록 기본 설정 완료
	function chagesearchboardTypeSelect(data){
		
		if(data.options[data.selectedIndex].value == "title"){
			$("#searchBoardCategory").val("board").prop("selected", true);  // 값이 content인거 선택
		}
	}
	
// 	let date = new Date(this.replyBoard_writeDate);
	

function setPeriod(period){
    var startDate = getPastDate(period);
    var endDate = getRecentDate();
 
    $("#startDate").val(startDate);
    $("#endDate").val(endDate);
}
 
function getRecentDate(){
    var dt = new Date();
 
    var recentYear = dt.getFullYear();
    var recentMonth = dt.getMonth() + 1;
    var recentDay = dt.getDate();
 
    if(recentMonth < 10) recentMonth = "0" + recentMonth;
    if(recentDay < 10) recentDay = "0" + recentDay;
 
    return recentYear + "-" + recentMonth + "-" + recentDay;
}
 
function getPastDate(period){
    var dt = new Date();
 
    dt.setDate(dt.getDate() - period);
 
    var year = dt.getFullYear();
    var month = dt.getMonth() + 1;
    var day = dt.getDate();
 
    if(month < 10) month = "0" + month;
    if(day < 10) day = "0" + day;
 
    return year + "-" + month + "-" + day;
}

	function goBoardListAll(){
		
		let goStartDate = $("#startDate").val();
		let goEndDate = $("#endDate").val();
		let board_category = $("select[name=cate_board_type]").val(); // 공지, 팁, 후기, 문의 인지 구분
		let searchselectedCategory = $("select[name=searchselectedCategory]").val(); // 게시판인지 댓글인지 구분
		let searchboardType = $("select[name=searchboardType]").val(); // 제목, 내용, 작성자 구분
	    let searchTxtValue = "none";
	    let page = $("#pageSave").val();
	    let perPageCnt = $("#perPageCnt").val();
	    
	    if($("#searchBoard_key").val() != ""){
			searchTxtValue = $("#searchBoard_key").val();
		}
	    
		$.getJSON("/admin/board_admin/ajax/" + goStartDate + "/" + goEndDate + "/" + board_category + "/" + searchselectedCategory + "/" + searchboardType + "/" + searchTxtValue + "/" +  page +"/" + perPageCnt, function(data){
	
			$("#newBoardCnt").html(data.todayTotCnt);
			$("#newReplyCnt").html(data.todayreplyTotCnt);
			$("#totalResultCnt").html(data.pagingParam.totalCount);
	
// 			ResultList = data;
	
			let outputList = "";
				
				if(data.replyBoardlst != null){
					if(data.replyBoardlst.length == 0){
						outputList += '<tr><td style="color:red;" colspan="11">검색값이 없습니다.</td></tr>';
					}
						$(data.replyBoardlst).each(function(index, item){		
						
						let date = new Date(this.board_writeDate);
						var writeDate = date.getFullYear() + "-" + (date.getMonth() + 1)  + "-" + date.getDate() + "     " + date.getHours() + ":" + date.getMinutes();
					    let date111 = new Date(this.board_updateDate);
					    var modifyDate = date.getFullYear() + "-" + (date.getMonth() + 1)  + "-" + date.getDate() + "     " + date.getHours() + ":" + date.getMinutes();
												
						let replydate = new Date(this.replyBoard_writeDate);
						var replywriteDate = replydate.getFullYear() + "-" + (replydate.getMonth() + 1)  + "-" + replydate.getDate() + "     " + replydate.getHours() + ":" + replydate.getMinutes();
					    let replydate111 = new Date(this.replyBoard_updateDate);
					    var replymodifyDate = replydate111.getFullYear() + "-" + (replydate111.getMonth() + 1)  + "-" + replydate111.getDate() + "     " + replydate111.getHours() + ":" + replydate111.getMinutes();
						
				
						outputList += "<tr>";
						if(this.board_category == "humor"){
							this.board_category = "유머";
							this.CategoryLink = "/board/humor/read?no=";
						}else if(this.board_category == "QA"){
							this.board_category = "Q&A";
							this.CategoryLink = "/board/qa/detail?no=";
						}else if(this.board_category == "Tip"){
							this.board_category = "캠핑팁";
							this.CategoryLink = "/board/campingTip/view?id=Tip&no=";
						}else if(this.board_category == "CS"){
							this.board_category = "고객센터";
							this.CategoryLink = "/board/cs/detail?no=";
						}else if(this.board_category == "notice"){
							this.board_category = "공지사항";
							this.CategoryLink = "/board/notice/read?no=";
						}
						
						outputList += '<td><br/><input type="checkbox" name="bbs_no[]" value="' + this.board_no + '"class="rowChk"></td>';
						outputList += '<td>' + this.board_no + '<hr/ style="margin:5px; background-color: thistle;">(' + this.replyBoard_no + ')</td><td><br/>' + this.board_category + '</td>';
						outputList += '<td class="left" style="width: 240px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><a href="' + this.CategoryLink + this.board_no + '" class="txtLink">' + this.board_title + '<hr/ style="margin:5px; background-color: thistle;">(' + this.replyBoard_content + ')</a></td>';
						outputList += '<td>' + this.bmember_id + '<hr/ style="margin:5px; background-color: thistle;"> (' + this.rmember_id + ')</td>';
						outputList += '<td><br/><a href="#"><span>본문 미리보기</span></a></td>';
						outputList += '<td>' + writeDate + '<hr/ style="margin:5px; background-color: thistle;">(' + replywriteDate + ')</td><td>' + modifyDate + '<hr/ style="margin:5px; background-color: thistle;">(' + replymodifyDate + ')</td><td class="right"><br/>' + this.board_viewCnt + '</td><td class="right"><br/>' + this.board_replyCnt + '</td><td class="right"><br/>' + this.board_likeCnt + '</td></tr>';
					});
						ResultList = data;
				}else if(data.Boardlst != null){
					if(data.Boardlst.length == 0){
						outputList += '<tr><td style="color:red;" colspan="11">검색값이 없습니다.</td></tr>';
					}
					$(data.Boardlst).each(function(index, item){		
						
						let date = new Date(this.board_writeDate);
						var writeDate = date.getFullYear() + "-" + (date.getMonth() + 1)  + "-" + date.getDate() + "     " + date.getHours() + ":" + date.getMinutes();
					    let date111 = new Date(this.board_updateDate);
					    var modifyDate = date111.getFullYear() + "-" + (date111.getMonth() + 1)  + "-" + date111.getDate() + "     " + date111.getHours() + ":" + date111.getMinutes();
					
						outputList += "<tr>";
						if(this.board_category == "humor"){
							this.board_category = "유머";
							this.CategoryLink = "/board/humor/read?no=";
						}else if(this.board_category == "QA"){
							this.board_category = "Q&A";
							this.CategoryLink = "/board/qa/detail?no=";
						}else if(this.board_category == "Tip"){
							this.board_category = "캠핑팁";
							this.CategoryLink = "/board/campingTip/view?id=Tip&no=";
						}else if(this.board_category == "CS"){
							this.board_category = "고객센터";
							this.CategoryLink = "/board/cs/detail?no=";
						}else if(this.board_category == "notice"){
							this.board_category = "공지사항";
							this.CategoryLink = "/board/notice/read?no=";
						}
						
						outputList += '<td><input type="checkbox" name="bbs_no[]" value="' + this.board_no + '"class="rowChk"></td>';
						outputList += '<td>' + this.board_no + '</td><td>' + this.board_category + '</td>';
						outputList += '<td class="left"><a href="' + this.CategoryLink + this.board_no + '" class="txtLink">' + this.board_title + '</a></td> -->';
						outputList += '<td>' + this.member_id + '</td>';
						outputList += '<td><a href="#"><span>본문 미리보기</span></a></td>';
						outputList += '<td>' + writeDate + '</td><td>' + modifyDate + '</td><td class="right">' + this.board_viewCnt + '</td><td class="right">' + this.board_replyCnt + '</td><td class="right">' + this.board_likeCnt + '</td></tr>';
					
					 
					
					});
					ResultList = data;
				}
					
			
				console.log(data);
			
				$("#boardListFrame").html(outputList);

		});
		
	}

	
	
	
	
	
	
	
</script>









<style>
#content {
	min-height: 750px;
	padding: 0 40px 40px;
	box-sizing: border-box;
	vertical-align: top;
}

input, select, textarea {
	font-size: 14px;
	color: #2e3039;
	vertical-align: middle;
	font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana',
		sans-serif;
}

.headingArea {
	position: relative;
	margin: 0 0 38px;
}

html:lang(ko) .headingArea {
	padding-top: 20px;
}

.mTitle {
	position: relative;
	margin: 40px 0 14px;
}

.mBreadcrumb {
	position: absolute;
	right: 0px;
	top: 10px;
}

html:lang(ko) .headingArea .mBreadcrumb {
	top: 20px;
	left: 0;
}

.mTab.typeNav {
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: -ms-flex;
	display: -moz-flex;
	display: flex;
	background-color: #f5f7fb;
}

.section {
	margin: 0 0 30px;
	padding: 30px 20px;
	border-radius: 2px;
	border: 1px solid #ddd;
	background: #fff;
	-webkit-box-shadow: 0 2px 1px 0 rgb(205, 211, 222);
	-moz-box-shadow: 0 2px 1px 0 rgba(205, 211, 222, 1);
	box-shadow: 0 2px 1px 0 rgb(205, 211, 222);
}

element.style {
	display: none;
	width: auto;
	position: absolute;
	z-index: 200;
	left: 780px;
	top: 180px;
}

.mBreadcrumb li {
	position: relative;
	display: inline-block;
	margin: 0 0 0 6px;
	color: #969daa;
	font-size: 13px;
	line-height: 19px;
}

.mTab.typeNav>ul {
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: -ms-flex;
	display: -moz-flex;
	display: flex;
	position: relative;
	width: 100%;
	border: 1px solid #c9ced9;
}

.mTab.typeNav>ul>li.selected {
	background-color: #55a0ff;
}

.mTab.typeNav>ul>li {
	min-width: 180px;
	text-align: center;
	border-right: 1px solid #c9ced9;
}

.mButton.gCenter {
	position: relative;
	text-align: center;
}

.mButton {
	margin: 20px 0;
	padding: 0 4px 0 0;
	text-align: right;
}

.section .mTitle:first-child {
	margin-top: 0;
}

.mTitle {
	position: relative;
	margin: 40px 0 14px;
}

.mState {
	margin: 10px 0;
	line-height: 20px;
}

.mState .gLeft {
	float: left;
}

.mState .total {
	float: left;
	margin: 0 8px 0 0;
	color: #97989b;
}

.mCtrl.setting {
	padding-right: 52px;
	min-height: 22px;
}

.mCtrl.typeHeader {
	position: relative;
	z-index: 1;
	margin-bottom: -1px;
}

.mCtrl {
	padding: 7px 15px;
	border: 1px solid #dedede;
	line-height: 21px;
	text-align: center;
	background: #fff;
}

.mCtrl .gLeft .txtLess {
	vertical-align: middle;
}

.txtLess {
	font-size: 13px;
}

.mCtrl .gLeft {
	float: left;
	text-align: left;
}

.btnNormal {
	height: 28px;
	padding: 0 10px;
	color: #1c1c1c;
	font-size: 13px;
	font-weight: normal;
	line-height: 26px;
	border: 1px solid #98989b;
	background-color: #fff;
	-webkit-transition: .2s ease-out;
	transition: .2s ease-out;
}

[class^="btn"] {
	cursor: pointer;
	margin-right: 20px;
}

.fSelect {
	padding: 0 30px 0 10px;
	background: #fff
		url(//img.echosting.cafe24.com/ec/mode/influencer/common/ico_select.png)
		no-repeat right 10px center;
}

.fSelect {
	display: inline;
	height: 32px;
	margin: 0;
	padding: 0 25px;
	border: 1px solid #d4d4d4;
	color: #2e3039;
	font-size: 14px;
	line-height: 30px;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
}

option {
	font-weight: normal;
	display: block;
	white-space: nowrap;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}

.mState .gRight {
	float: right;
	margin-top: -5px;
	margin-bottom: 5px;
}

.mBoard.typeSearch th[scope*='row']+td {
	padding: 4px 20px;
}

.mBoard th[scope*='row']+td {
	height: 32px;
}

.mBoard.gSmall td {
	width: auto;
}

tbody>tr>td {
	border-top-width: 0;
}

.mBoard tbody td {
	border: 1px solid #dedede;
}

.mBoard td {
	padding: 10px 15px;
	line-height: 24px;
	vertical-align: top;
}

th, td {
	border: 0;
	word-wrap: break-word;
}

.btnIcon.icoCal {
	width: 19px;
	height: 19px;
	vertical-align: text-top;
	background-position: -50px -500px;
}

a.btnIcon, button.btnIcon, span.btnIcon, .btnIcon:before {
	display: inline-block;
	overflow: hidden;
	width: 28px;
	height: 28px;
	font-size: 0;
	line-height: 0;
	vertical-align: middle;
	white-space: nowrap;
	background:
		url(//img.echosting.cafe24.com/ec/mode/influencer/common/sfix_icon_button.png)
		0 0 no-repeat;
	box-sizing: border-box;
}

[class^="btn"] {
	cursor: pointer;
}

.btnDate {
	padding: 3px 12px;
	min-width: 46px;
	height: 28px;
	line-height: 26px;
	color: #2e3039;
	border: 1px solid #98989b;
	background-color: #fff;
	-webkit-transition: .2s ease-out;
	transition: .2s ease-out;
}

.delBtnJJ {
	min-width: 46px;
	height: 28px;
	padding: 5px 8px;
	font-size: 13px;
	line-height: 26px;
	color: #2e3039;
	border: 1px solid #98989b;
	background-color: #fff;
	-webkit-transition: .2s ease-out;
	transition: .2s ease-out;
}

.mBreadcrumb li.now {
	color: #2a3954;
	text-decoration: underline;
}

.mBoard .mBoard.gSmall th, .mBoard.gSmall th {
	width: 150px;
}

.mBoard tbody th {
	border: 1px solid #dedede;
	text-align: left;
	word-break: keep-all;
}

.mBoard th {
	padding: 11px 15px 10px;
	vertical-align: top;
	color: #2e3039;
	background-color: #f3f3f3;
}

[class^="btn"] {
	cursor: pointer;
}

.btnDate+.btnDate {
	position: relative;
	z-index: 1;
	margin-left: -5px;
	/*     border-right: 0; */
}

.mBoard tfoot>tr>th, .mBoard tbody>tr>td {
	border-top-width: 0;
}

.fText.gDate {
	/*     width: 100px; */
	text-align: center;
}

.fText {
	height: 32px;
	line-height: 14px;
}

.fText, .fTextarea {
	max-width: 100%;
	padding: 0 9px 2px;
	box-sizing: border-box;
	border: 1px solid #d4d4d4;
	font-size: 14px;
	line-height: 26px;
	color: #686b6d;
	outline: 0 none;
	transition: border .2s ease-out;
}

.mBoard table {
	line-height: 1.5;
	background-color: #fff;
	border-top: 1px solid #dedede;
}

table {
	table-layout: fixed;
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}

.mTitle h2 {
	display: inline-block;
	height: 22px;
	padding: 0 5px 0 0;
	font-size: 16px;
	line-height: 18px;
	color: #2e3039;
	font-weight: normal;
	vertical-align: middle;
}

.mState .total strong {
	color: #ff4311;
}

.btnDate:hover, .btnDate.selected {
	color: #fff;
	border-color: #55a0ff;
	background-color: #55a0ff;
}

.btnSearch {
	min-width: 84px;
	height: 36px;
	padding: 5px 20px;
	color: #fff;
	line-height: 34px;
	border: 1px solid transparent;
	background-color: #55a0ff;
}
</style>











</head>
<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<div id="main-wrapper">
		<!-- 헤더 -->
		<%@ include file="adminTop.jsp"%>
		<!-- 어사이드 -->
		<%@ include file="adminAside.jsp"%>

		<div class="page-wrapper">
			<div id="content">

				<input type="hidden" name="mode" value=""> 
				<input type="hidden" id="EC_SDE_SHOP_NUM" value="1"> 
				<input type="hidden" id="isFloatingNumber" value="F"> 
				<input type="hidden" id="sNewboardAnd12rFlag" value="T"> 
				<input type="hidden" id="sIsUse12R" value="T"> 
				<input type="hidden" id="MALL_ID" value="neomart"> 
				<input type="hidden" id="PRODUCT_VER" value="2"> 
				<input type="hidden" id="hiddenToday" value="2021-04-26">
				<input type="hidden" name="period" value="30"> 
				<input type="hidden" id="navi_hide" name="navi_hide" value="">

				<div class="headingArea">
					<div class="mTitle">
						<h1>게시물 관리</h1>
						<div class="cTip" code="BR.BO.BA.110"></div>
						<span style="display: none;" class="cManual" code="BR.BO.BA"
							href="brd/brd1010001"></span>

					</div>
					<div class="mBreadcrumb">
						<ol>
							<li class="home">홈</li>
							<li>캠박이일 게시판</li>
							<li class="now" title="현재 페이지">게시물 관리</li>
						</ol>
					</div>
				</div>

				<div class="mTab typeNav" style="display: none;">
					<ul>
						<li class="selected"><a href="#none">전체 게시물 보기</a></li>
						<li><a href="board_admin_bulletin_comment_l.php">전체 댓글 보기</a></li>
					</ul>
				</div>

				<div class="section">
					<div class="mBoard gSmall typeSearch">
						<table border="1" summary="">

							<tbody>
								<tr>
									<th scope="row">기간</th>
									<td colspan="3"><a href="javascript:setPeriod(0);" class="btnDate selected"
										title="0"><span>오늘</span></a> <a href="javascript:setPeriod(3);" class="btnDate"
										title="3"><span>3일</span></a> <a href="javascript:setPeriod(7);" class="btnDate"
										title="7"><span>7일</span></a> <a href="javascript:setPeriod(30);" class="btnDate"
										title="30"><span>1개월</span></a> <a href="javascript:setPeriod(90);"
										class="btnDate" title="90"><span>3개월</span></a> <span
										style="margin: 0px 10px;">직접 입력</span> <input type="date"
										id="startDate" class="fText gDate" name="start_date"
										value="2021-03-27"> ~ <input type="date" id="endDate"
										class="fText gDate" name="end_date" value="2021-04-26"></td>
								</tr>
								<tr>
									<th scope="row">게시판 선택</th>
									<td colspan="3"><select class="fSelect" id="sel_board_no"
										name="cate_board_type"
										style="text-align-last: center; width: 155px;">
											<option value="all" selected >*** 전체 ***</option>
											<option value="Tip">캠핑 Tip 게시판</option>
											<option value="QA">Q&A 게시판</option>
											<option value="humor">유머 게시판</option>
											<option value="notice">공지 사항</option>
											<option value="CS">고객 문의</option>
									</select></td>

								</tr>
								<tr>
									<th scope="row">게시글 찾기</th>
									<td colspan="3">
									<select id="searchBoardCategory" name="searchselectedCategory"
										class="fSelect" onchange="chageLangSelect(this);" >
											<option selected value="board">게시판</option>
											<option value="reply">댓글</option>
									</select> 
									
									<select id="searchboard_Type" name="searchboardType"
										class="fSelect" onchange="chagesearchboardTypeSelect(this);" >
											<option selected value="title">제목</option>
											<option value="content">내용</option>
											<option value="member_id">작성자</option>
									</select> <input type="text" id="searchBoard_key" name="search_key" value=""
										class="fText" style="width: 400px;"  ></td>
								</tr>
						
							</tbody>
						</table>
					</div>
					<div class="mButton gCenter">
					
						<a id="eBtnSearch" href="javascript:window.location.reload();"
							class="btnSearch"><span>초기화</span></a>
						<a id="eBtnSearch" href="javascript:goBoardListAll();"
							class="btnSearch"><span>검색</span></a>

					</div>
				</div>

				<div class="section">
					<div class="mTitle">
						<h2 id="Result_h2" >게시물 목록(댓글 목록)</h2>
					</div>
					<div class="mState">
						<div class="gLeft">
							<p class="total">
								[오늘 등록된 새 글 <strong id="newBoardCnt">1</strong>건 & 댓글 <strong id="newReplyCnt">1</strong> 건] <strong>검색 결과</strong> <strong id="totalResultCnt">1</strong> 건
							</p>
						</div>
						<div class="gRight">
							<select class="fSelect" id="eSearchSort" name="searchSort"
								onchange="changeResultViewList(this);" align="absmiddle">
								<option value=""> - 정렬 조건</option>
								<option value="basic" selected="selected">최신()</option>
								<option value="categorydesc">분류</option>
								<option value="titledesc">제목</option>
								<option value="writerdesc">작성자()</option>
								<option value="updatedaydesc">수정일()</option>
								<option value="viewCnt">조회순</option>
								<option value="replyCnt">댓글순</option>
								<option value="likeCnt">좋아요순</option>
							</select> <select class="fSelect" id="list_limit" name="list_limit" align="absmiddle">
								<option value="10" selected="">10개씩보기</option>
								<option value="20">20개씩보기</option>
								<option value="30">30개씩보기</option>
								<option value="50">50개씩보기</option>
							</select>
						</div>
					</div>

					<div class="gLeft">
						<button type="button" class="delBtnJJ">삭제</button>
					</div>

					<div class="mBoard gScroll gCell typeList">
						<table border="1" summary="" class="eChkTr"
							style="text-align: center;">

							<thead>
								<tr>
									<th style="width: 2.5%;" scope="col"><input
										type="checkbox" class="allChk"></th>
									<th style="width: 5.5%;" scope="col">글 번호</th>
									<th style="width: 6%;" scope="col">분류</th>
									<th style="width: 20.5%;" scope="col">제목</th>
									<th style="width: 12%;" scope="col">작성자</th>
									<th style="width: 10%;" scope="col">본문 미리보기</th>
									<th style="width: 11.5%;" scope="col">작성일</th>
									<th style="width: 11.5%;" scope="col">수정일</th>
									<th style="width: 4.5%;" scope="col">조회수</th>
									<th style="width: 4.5%;" scope="col">댓글수</th>
									<th style="width: 4.5%;" scope="col">좋아요</th>

								</tr>
							</thead>
							<tbody class="center" id="boardListFrame">
<!-- 								<tr> -->
<!-- 									<td><input type="checkbox" name="bbs_no[]" value="1" -->
<!-- 										class="rowChk"></td> -->
		
<!-- 									<td>1</td> -->
					
<!-- 									<td>공지사항</td> -->
			
<!-- 									<td class="left"><a -->
<!-- 										href="javascript:open_detail_view('1','1','1');" -->
<!-- 										class="txtLink"> 몰 오픈을 축하합니다. </a> 게시함여부 노출설정 -->

<!-- 									</td> -->
						
<!-- 									<td><input type="hidden" id="writer_type_1" value=""> -->
<!-- 										EC Hosting</td> -->
			
<!-- 									<td><a href="#layerPreview" -->
<!-- 										class="layerPreviewPopup btnNormal eLayerClick" -->
<!-- 										data-board-no="1" data-no="1" data-board-group="1" -->
<!-- 										data-save-btn="F" namelayer="layer_0" bindstatus="true"><span>본문 -->
<!-- 												미리보기</span></a></td> -->
							
	
<!-- 									<td>2021-04-26 07:12:00</td> -->

<!-- 									<td class="right">0</td> -->
				
<!-- 									<td class="right">0</td> -->
					
<!-- 									<td class="right">0</td> -->

<!-- 								</tr> -->
							</tbody>
						</table>
					</div>


				</div>


				<!--미리보기-->
			<div class="mLayer ui-draggable ui-resizable"
					style="display: none; width: auto;" id="layerPreview">
					<h2>게시글 내용 미리보기</h2>
					<div class="wrap" style="width: 400px; height: 400px;"
						id="eBulletinContentWrap">
						<iframe id="eBulletinContent" frameborder="0" width="400px"
							height="400px" marginwidth="0" marginheight="0" scrolling="auto"></iframe>
					</div>
					<div class="footer">
						<a href="#none" class="btnNormal eClose"><span>닫기</span></a>
					</div>
					<button type="button" class="btnClose eClose"
						id="layerPreviewClose">닫기</button>
					<div class="ui-resizable-handle ui-resizable-e"
						style="z-index: 90;"></div>
					<div class="ui-resizable-handle ui-resizable-s"
						style="z-index: 90;"></div>
					<div
						class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se"
						style="z-index: 90;"></div>
				</div>
	
			<!-- 본문 작성  -->
			
			<!--  미리보기  -->
<!-- 			<div class="mLayer ui-draggable ui-resizable" style="display: block; width: auto; position: absolute; z-index: 200; left: 474px; top: 168px;" id="layerPreview" namelayer="layer_0"> -->
<!--                 <h2>게시글 내용 미리보기</h2> -->
<!--                 <div class="wrap" style="width:400px;height:400px;" id="eBulletinContentWrap"> -->
<!--                     <iframe id="eBulletinContent" frameborder="0" width="400px" height="400px" marginwidth="0" marginheight="0" scrolling="auto" src="/admin/php/b/board_admin_bulletin_preview.php?board_no=1&amp;no=1&amp;board_group=1&amp;disp_reply_btn=F"></iframe> -->
<!--                 </div> -->
<!--                 <div class="footer"> -->
<!--                     <a href="#none" class="btnNormal eClose"><span>닫기</span></a> -->
<!--                 </div> -->
<!--                 <button type="button" class="btnClose eClose" id="layerPreviewClose">닫기</button> -->
<!--             <div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div>
				</div> -->
			<!--  미리보기  -->
			
			<!-- 본문 작성 끝  -->
			<%@ include file="adminFooter.jsp"%>
			<%@ include file="adminJs.jsp"%>
		</div>
	
	</div>
<input type="hidden" id="pageSave" value="1">
<input type="hidden" id="searchSorthidden" value="basic">
<input type="hidden" id="perPageCnt" value="10">
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CambakMall</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../../resources/mallMain/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/style.css" type="text/css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	let loginUser = '${loginMember.member_id}';
	let prodId = '${param.prodId}';
	let page = '${param.page}';
	let cate = '${param.cate}';
	
	let orderList;
	
	// ajax페이지 고침을 위한 전역변수
    let currentPage;
	let prodReviewNo;
	let prodReview_likeCnt;
	
	// 원댓글 작성자 이름 가져오기
	let replyMember_id;
	let replyProdReview_no1;

	$(function() {
		if(page.length == 0) {
			page = 1;
		}
		
		if(cate.length == 0) {
			cate = "*";
		}
		
		// 상품평 리스트 출력
		showProdList(prodId);
		
		futurePoints();
		
		totProdQACnt(prodId);
		
		prodQAListAll(prodId, page, 0, cate); // 페이지 호출될 때 상품 문의 목록 함수 호출하는 함수
		prodQAPagingParam(prodId, page, cate); // 페이지 호출될 때 상품 문의 페이징 함수 호출하는 함수
				
		
		// 상품 문의 카테고리가 변경될 때마다 상품 문의 목록 및 페이징 함수 다시 호출하는 함수
		$("#prodQA_category").change(function(){ 
        	let cate = $("#prodQA_category").val();
        	console.log(cate)
        	
        	prodQAListAll(prodId, page, 0, cate);
        	prodQAPagingParam(prodId, page, cate);
        });
	});
	
	// ------------------------------------- 정민 오빠 js--------------------------------------------------------------------------
	// 상품평 배너 클릭시 ajax로 기본 게시글 호출
    function showProdList(prodId, pageNum, checkPoint, orderList) {
		
    	// 유저의 등급
    	let grade_name = "${loginMember.grade_name}";
    	// 넘겨준 페이지 번호가 없을 때,
    	if(pageNum == null){
    		pageNum =1;
    	}
    	if(checkPoint == null){
    		checkPoint = 0;
    	}
    	console.log(checkPoint);
    	// 정렬 순서 선택을 나타내는 부분
    	if(orderList == null){
    		// 기본 설정은 최신순 정렬
    		orderList = "latest";
    	} else{ // 선택한 카테고리가 있을 때,
    		orderList = orderList;
    	}
//     	console.log(orderList);
//     	console.log(prodId);
//     	console.log(pageNum);
    	// ------------------게시판 리스트 출력-------------------------------
    	let output = '<div>';
        output += '<table class="table table-hover"><thead><tr><th>글번호</th><th>글제목</th><th>만족도</th><th>작성자</th><th>작성일</th></tr></thead>';
        
    	$.ajax({
	        type		: "get",
	        url 		: "/mall/prodDetail/prodReviews/" + prodId,
	        data		:  {
	        		'page' : pageNum,
	        		'orderList' : orderList
	        }, 
	        contentType : "application/json",
	        success 	: function(data) {
// 	        	console.log(data);
	        	let prodList = data.prodList;
	        	let pagingParam = data.pagingParam;
	        	currentPage = pagingParam.cri.page;
	        	//console.log(currentPage);
	        	//console.log(prodList);
	        	console.log(pagingParam.cri);
	        	console.log(pagingParam);
	        	
	        	// 날짜 출력 방식 변경을 위한 변수 설정
	        	let showDate;
	        	let showThisDate;
	        	
	        	// 기본 게시글 출력 부분
	        	// ----------------------------prodList ---------------------------------
	        	 $(prodList).each(function(index, item) {
	        		 // 날짜 출력 포맷 변경 부분
	        		 showDate = new Date(item.prodReview_postDate);
	                 showThisDate = showDate.toLocaleString();
	                 
	                 // 게시글 내용 출력 부분
	                
	                 output += '<tr id=' + item.prodReview_no + ' onclick="showContent(' + item.prodReview_no + "," + item.prodReview_likeCnt +');"><td>' + item.prodReview_no + '</td><td><div>' + item.prodReview_title; + '</div></td>';
	                 output += '<td class="stars" id="star">' + showStars(item.prodReview_grade) + '<div class="starrr1"></div></td>';
	                 output += '<td>' + item.member_id + '</td><td><span class="sendTime">' + showThisDate + '</span></td>';
	                 output += '</tr>';
	                 output += '<tr id="content' + item.prodReview_no +'" style="display: none">';
	                 output += '<td colspan="6">';
	                 
	                 if(loginUser == item.member_id || grade_name =='M'){
	                	 output += '<div class="form-row float-right"><button type="button" class="btn btn-primary" onclick="location.href=\'prodReviewsModify?prodReview_no=' + item.prodReview_no + '&member_id=' + item.member_id + '\'">수정하기</button>';
	                	 output += '<button type="button" class="btn btn-info" onclick="location.href=\'prodReviewsDelete?prodReview_no=' + item.prodReview_no + '\'">삭제하기</button></div>';
	                 }
	                 
	                 // display:none 되어있는 Content 내용
	                 output += '<div>' + item.prodReview_content + '</div>';
	                 // --------------상품후기 좋아요 표시 부분-----------------
	                 output += '<div class="likeProdReviews"><span id="likeProd' + item.prodReview_no + '"></span></div>';
	                 
	                 output += '<div class="likeProdReviews">상품후기가 도움이 되었어요!</div>'
	                 // display:none 되어있는 댓글 내용
	                 output += '<div class="replyBox" id="replyBox' + item.prodReview_no + '"></div>';
	                  
	                 // 부모 댓글 작성을 위한 양식 출력 부분
	                 if(loginUser != null){ // 로그인되어 있는 경우에만 댓글 작성을 보여준다.
	                	 output += '<div class="card mb-2"><div class="card-header bg-light">댓글 작성</div>';
	                	 output += '<div class="card-body"><ul class="list-group list-group-flush"><li class="list-group-item"><div class="form-inline mb-2"><label for="replyId"></label></div>';
	                	 output += '<div><p class="card-text"><textarea id="replyProdReview_content' + item.prodReview_no + '" name="replyProdReview_content" placeholder="댓글을 입력해주세요." ></textarea><div class="form-row float-right"><button class="btn btn-success" id="replyAddBtn" onclick="addReplyProdReviews(' + item.prodReview_no + ');">댓글등록</button></div></p></li></ul></div>';
	                	 output += '</td>';
	                 }
	                 
	        	  });// end of foreach prodList

	              output += '</tr></table></div>';
	              
	              
	              // ------------페이징 처리 부분-------------------------
	              let startPage;
	              let endPage;
	              let tempEndPage;
	              let totalCount;
	              let prev;
	              let next;
	              let pageOutput = '<div class="text-center"><ul class="pagination"><li class="page-item">';
            	  pageOutput += '<a class="page-link" onclick="showProdList(' + prodId + ',' + 1 + ',' + 0 + ',\'' + orderList +'\');">처음페이지로</a></li>';
            	  
	              $(pagingParam).each(function(index, item) {
	            	  startPage = item.startPage;
	            	  endPage = item.endPage;
	            	  tempEndPage = item.tempEndPage;
	            	  totalCount = item.totalCount;
	            	  
	            	  if(pageNum > 1){
	            		  prev = pageNum - 1;
	            	  } else if(pageNum = 1){
	            		  prev = 1;
	            	  }
	            	  if(pageNum < tempEndPage){
	            		  next = pageNum + 1; 
	            	  } 
	            	  else if (pageNum = tempEndPage){
	            		  next = tempEndPage;
	            	  }

	            	  pageOutput += '<li class="page-item"><a class="page-link" href="#" onclick="showProdList(' + prodId + ',' + prev + ',' + 0 + ',\'' + orderList + '\'); return false;">prev</a></li>';
	            	  
	              });
	              //console.log(startPage);
	              //console.log(endPage);

	              for(var num = startPage; num <=endPage; num++){
	            	  pageOutput += '<li class="page-item"><a class="page-link" href="#" onclick="showProdList(' + prodId + ',' + num + ',' + 0 + ',\'' + orderList + '\'); return false;">' + num + '</a></li>';
            	  }
	              
	              pageOutput += '<li class="page-item"><a class="page-link" href="#" onclick="showProdList(' + prodId + ',' + next + ',' + 0 + ',\'' + orderList + '\'); return false;">next</a></li>';
	              pageOutput += '<li class="page-item"><a class="page-link" onclick="showProdList(' + prodId + ',' + tempEndPage + ',' + 0 + ',\'' + orderList + '\');">마지막페이지로</a></li>';
	            	  
	              
	              pageOutput += '</ul></div></div>';
	              $("#prodBoardList").html(output);
	              $("#prodBoardListPage").html(pageOutput);
	              $("#prodReviewsCnt").html("상품평(" + totalCount + ")");
	              
	              
	              // --------열어놨던 페이지를 열어준 채로 로딩하는 부분-------------
	              if(checkPoint == 1){
	            	  $("#content" + prodReviewNo).show();
	              }
	              
	        }, // end of Success
	        error		: function(error) {
// 	        	console.log(error);
	        	
	        }, complete : function(data) { // 게시글 부분이 모두 출력되고 난 후에 이루어지는 작업 부분=complete
	            let prodList = data.responseJSON.prodList;
	        	let grade_name = "${loginMember.grade_name}";
// 	            console.log(prodList);
	            
	            
            	//대댓글 작성을 위한 파트
	            $(prodList).each(function(index, item) {
	            	prodReview_no = item.prodReview_no;
	            	
	            	$.ajax({
						  type: "post",
						  url: "/mall/prodDetail/getProdReviewReply/"+prodReview_no,
						  contentType : "application/json",
						  success : function(result) {
							  //console.log(result);

						  $(result).each(function(index, item) {
// 							  console.log(result);
							  
							  let replyOutput;
							  if(item.replyProdReview_no == item.replyProdReview_ref){// 부모 댓글인 경우,
								  replyOutput = '<div class="card mb-2" ><div class="card-header bg-light">';
							  }else{// 대댓글인 경우에는 왼쪽으로부터 10% 떨어지게 하는 효과를 적용
								  replyOutput = '<div class="card mb-2" style="margin-left:10%"><div class="card-header bg-light">';
							  }
								  

							  if(item.replyProdReview_no != item.replyProdReview_ref){ // 대댓글인 경우, 화살표 이미지를 적용
					        	  replyOutput += '<img src="/resources/cambak21/img/replyimg.png" width="20px" height="15px">';
					          }
							  
							  //댓글의 날짜 형식 변경을 위한 부분
					          let showDate = new Date(item.replyProdReview_date);
					          let showThisDate = showDate.toLocaleString();
					          
					          //-----------------댓글 및 대댓글 생성 부분--------------------
				              replyOutput += '<i class="fa fa-user-circle-o fa-2x"></i>' + item.member_id + '<div>' + showThisDate + ' replyProdReview_no : ' + item.replyProdReview_no +'</div></div><div class="card-body"><ul class="list-group list-group-flush">';
				              replyOutput += '<li class="list-group-item"><div class="form-inline mb-2"><label for="replyId"></label></div>';
				              replyOutput += '<div><span id="replyName' + item.replyProdReview_no + '"></span><span id="replyMemberName' + item.replyProdReview_no + '"></span><p class="card-text">';
				              //삭제된 댓글인 경우 '삭제된 댓글입니다' 표시를 위한 처리 부분
				              if(item.replyProdReview_isDelete == 'Y'){
				            	  replyOutput += '<span>삭제된 댓글입니다.</span></p><div>'
				              } else{
				            	  // 대댓글인 경우, 부모 댓글의 이름을 가져와서 출력
				            	  if(item.replyProdReview_repMember_id != null){
				            		  replyOutput += '<span><strong>@' + item.replyProdReview_repMember_id + ' </strong></span><span id="replyContents' + item.replyProdReview_no + '">' + item.replyProdReview_content + '</span></p><div>';
				            	  }else{// 대댓글이 아닌 경우에는, 부모 댓글 이름 가져오는 부분을 생략
				            		  replyOutput += '<span id="replyContents' + item.replyProdReview_no + '">' + item.replyProdReview_content + '</span></p><div>';  
				            	  }
				            	  
				              }
				              //답글 버튼(로그인한 회원에게만 보이도록 처리)
				              if(${loginMember.member_id != null}){
				            	  replyOutput += '<button type="button" class="btn btn-dark" style="cursor:pointer" onClick="javascript:showReply(' + item.replyProdReview_no +');">답글</button>';
				              }
				              
				              if(item.member_id == "${loginMember.member_id}" || grade_name =='M'){ // 로그인 아이디와 동일한 경우, 운영진인 경우에만 수정/삭제 표시
				              //수정 버튼
				              replyOutput += '<button type="button" class="btn btn-dark" style="cursor:pointer" onClick="openModifyReply(' + item.replyProdReview_no +');">수정</button>';
				              //삭제 버튼
				              replyOutput += '<button type="button" class="btn btn-dark" style="cursor:pointer" onClick="deleteReply(' + item.replyProdReview_no +');">삭제</button>';
				              }
				          
				              replyOutput += '</li></ul></div>'; // 닫아주는 부분
				              
				              // ------------------------대댓글 등록 부분--------------------------
				              replyOutput += '<div class="replies" id="reply' + item.replyProdReview_no + '" style="display: none"><p class="card-text"><div class="card"><span><strong>' + item.member_id + ' 님에게 댓글 남기기...</strong></span><div class="card-body"><textarea class="reReply" id="replyContent' + item.replyProdReview_no + '" name="replyProdReview_content" placeholder="대댓글을 입력해주세요." ></textarea></div></div></p>';
				              replyOutput += '<div id="get' + item.replyProdReview_no + '" value="' + item.replyProdReview_ref + '"></div>';
				              replyOutput += '<div class="form-row float-right"><button class="btn btn-success" id="replyAddBtn" onclick="addReply(' + item.replyProdReview_no+ "," + item.replyProdReview_ref + "," + item.prodReview_no + ",\'" + item.member_id +'\');">대댓글등록</button></div></div>';
								
				              // 대댓글 수정 작성 부분
				              replyOutput += '<div class="repliesModi" id="replyModify' + item.replyProdReview_no + '" style="display: none"><p class="card-text"><div class="card"><span><strong>' + item.member_id + ' 님의 댓글 수정하기...</strong></span><div class="card-body"><textarea class="reReply" id="replyContentModi' + item.replyProdReview_no + '" name="replyProdReview_content" placeholder="대댓글을 입력해주세요." ></textarea></div></div></p>';
				              replyOutput += '<div id="get' + item.replyProdReview_no + '" value="' + item.replyProdReview_ref + '"></div>'
				              replyOutput += '<div class="form-row float-right"><button class="btn btn-success" id="replyAddBtn" onclick="modifyReply(' + item.replyProdReview_no +');">댓글 수정</button></div></div>';

				              // end of </div>
				              replyOutput += '</div>';
				              
							  $("#replyBox" + item.prodReview_no).append(replyOutput);

						 	 });
						  }
	            }); // ajax
	            	
	            
	            }); // end of each.function
	            
	            	
				
	        }// end of complete
				
					//
	        

	    });
	} // end of showProdList
	
	 // ajax 방식 onclick 시 content 및 댓글을 보여주는 부분
	 function showContent(prodReview_no, prodReview_likeCnt) {
// 			console.log(prodReview_likeCnt);
			let showLike;
		 	prodReviewNo = prodReview_no;
		 	
		 	prodReview_likeCnt = prodReview_likeCnt;
		 		/*if($('#content' + prodReview_no).is(':visible')==true){
		 			$("#content" + prodReview_no).hide();
		 		} else{
		 			$("#content" + prodReview_no).show();
		 		}*/
		 		$("#content" + prodReview_no).toggle();
		 	//console.log(member_id);
			// 접이식 보여주기
				//$("#content" + prodReview_no).toggle();
			
				// 좋아요 표시 가져오기
				$.ajax({
					  method: "post",
					  url: "/mall/prodDetail/getProdReviewsLike/" + loginUser + "/" + prodReview_no,
					  headers: {	// 요청하는 데이터의 헤더에 전송
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "POST"
					  },
					  dataType: "text", // 응답 받는 데이터 타입
					  success : function(data) {

// 					      console.log(data);
					      
					      // 좋아요를 클릭 안 했으면,
					      if(data==0){
					    	  showLike = '<img src=\'../../resources/img/heartProdReviewsEmpty.png\' onclick="clickLike('+ prodReview_no +')";/>' + prodReview_likeCnt;
					    	  $("#likeProd" + prodReview_no).html(showLike);
					      }else{// 좋아요를 클릭했으면
					    	  showLike = '<img src=\'../../resources/img/heartProdReviews.png\' onclick="clickLike('+ prodReview_no +')";/>' + prodReview_likeCnt;
					    	  $("#likeProd" + prodReview_no).html(showLike);
					      }
					      
					  }
					  
					}); // end of ajax
					
		}


	 // 별점에 따른 별 개수를 표현하는 부분
	 function showStars(grade) {
		var output1 = '';
		if(grade == 1){
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
		} else if(grade == 2){
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
		} else if (grade == 3){
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
		} else if (grade == 4){
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span>';
		} else {
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span>';
		}
		 
		return output1;
	}
	 
	//addReplyProdReviews 댓글 처리 부분
		function addReplyProdReviews(prodReview_no) {
// 					console.log("prodReview_no : " + prodReview_no);
					// 댓글 작성 시 필요한 변수들
					let page = $("#page").val();
					let replyProdReview_content = $("#replyProdReview_content" + prodReview_no).val();
					prodReview_no = prodReview_no;
					let replyProdReview_ref = 0;
					
					$.ajax({
						  method: "post",
						  url: "/mall/prodDetail/insertProdReviewReply",
						  headers: {	// 요청하는 데이터의 헤더에 전송
							  "Content-Type" : "application/json",
							  "X-HTTP-Method-Override" : "POST"
						  },
						  dataType: "text", // 응답 받는 데이터 타입
						  data : JSON.stringify({ // 보내는 데이터 타입(JSON형식으로 직렬화 해서 보낸다.)
							  replyProdReview_content :  replyProdReview_content,
							  member_id : loginUser,
							  prodReview_no : prodReview_no,
							  replyProdReview_ref : replyProdReview_ref
						  }),
						  success : function(result) {
							  //console.log(prodReview_no);
// 							  console.log(currentPage);
							  
							  showProdList(prodId, currentPage, 1, orderList);
							  
						  }, complete : function (result) {
							//$("#replyBox" + prodReview_no).load(document.URL + "#replyBox" + prodReview_no);
						}
						  
						});

		};
		
		//댓글 작성란 보여주기
		function showReply(replyProdReview_no) {

			$(".repliesModi").hide();
			$(".replies").hide();
			$("#reply" + replyProdReview_no).toggle();
			let checkReforder = $("#get" + replyProdReview_no).val();
// 			console.log(checkReforder);
		}
		
		//addReply 대댓글 처리 부분
		function addReply(replyProdReview_no, replyProdReview_ref, prodReview_no, replyProdReview_repMember_id) {
			// replyProdReview_content 수정 필요
// 			console.log(replyProdReview_repMember_id);
			//console.log(member_id);
			/*if(replyProdReview_ref != 0){ 
				replyProdReview_ref = replyProdReview_no;
			}*/
			
			
			
			
			let replyProdReview_content = $("#replyContent" + replyProdReview_no).val();
			$.ajax({
				  method: "post",
				  url: "/mall/prodDetail/insertProdReviewReply",
				  headers: {	// 요청하는 데이터의 헤더에 전송
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST"
				  },
				  dataType: "text", // 응답 받는 데이터 타입
				  data : JSON.stringify({ // 보내는 데이터 타입(JSON형식으로 직렬화 해서 보낸다.)
					  replyProdReview_content :  replyProdReview_content,
					  member_id : loginUser,
					  prodReview_no : prodReview_no,
					  replyProdReview_ref : replyProdReview_ref,
					  replyProdReview_repMember_id : replyProdReview_repMember_id
				  }),
				  success : function(result) {
// 					  console.log(result);

				      console.log("#checkcheck" + replyProdReview_no);
					  //$("#replyName" + replyProdReview_no).html(replyMember_id);
					  showProdList(prodId, currentPage, 1, orderList);
				  }, complete : function (result) {
					  
				}
				  
				});// end of Ajax
			//$("#replyMemberName" + replyProdReview_no).html(replyMember_id);
			console.log(replyProdReview_no);
				
			// 동적으로 생성된 태그의 id값에 접근해서 text를 삽입하고 싶다
		      //$('#checkcheck' + replyProdReview_no).append("체크체크");
		      
			
		}
		
		// 댓글 및 대댓글을 삭제하는 함수
		function deleteReply(replyProdReview_no) {
			console.log(replyProdReview_no);
			//replyProdReview_no = replyProdReview_no;
			
			$.ajax({
				  method: "post",
				  url: "/mall/prodDetail/deleteProdReviewReply/" + replyProdReview_no,
				  headers: {	// 요청하는 데이터의 헤더에 전송
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST"
				  },
				  dataType: "text", // 응답 받는 데이터 타입
				  success : function(deleteResult) {
// 					  console.log(deleteResult);
					  if(deleteResult=="true"){
						  alert("삭제 성공");
					  }
					  
					  //삭제 후 리스트를 다시 출력하라
					  showProdList(prodId, currentPage, 1, orderList);
					  
				  }
				  
				});
		}
			
		
		// 댓글 및 대댓글을 수정하는 content를 보여주는 함수
		function openModifyReply(replyProdReview_no) {

			$(".repliesModi").hide();
			$("#replyModify" + replyProdReview_no).toggle();
			$(".replies").hide();
			// 수정하려는 댓글 및 대댓글 read
			$.ajax({
				  method: "post",
				  url: "/mall/prodDetail/readProdReviewReply/" + replyProdReview_no,
				  headers: {	// 요청하는 데이터의 헤더에 전송
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST"
				  },
				  dataType: "text", // 응답 받는 데이터 타입
				  success : function(readResult) {
// 					  console.log(readResult);
					 $("#replyContentModi" + replyProdReview_no).html(readResult);
					 // 귀신 잡은 포인트.
				  }
				});
		}
			
		// 댓글 및 대댓글을 수정하는 함수
		function modifyReply(replyProdReview_no) {
			let replyProdReview_content = $("#replyContentModi" + replyProdReview_no).val();
// 			console.log(replyProdReview_content);
			$.ajax({
				  method: "post",
				  url: "/mall/prodDetail/modifyProdReviewReply/" + replyProdReview_no + "/" + replyProdReview_content,
				  headers: {	// 요청하는 데이터의 헤더에 전송
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST"
				  },
				  dataType: "text", // 응답 받는 데이터 타입
				  success : function(modifyResult) {
// 					  console.log(modifyResult);
					  if(modifyResult=="true"){
						  alert("수정 성공");
					  }
					  
					  //수정 후 리스트를 다시 출력하라
					  showProdList(prodId, currentPage, 1, orderList);
					  
				  }
				  
				});
			
		}

		// ----------상품후기 좋아요 클릭시 처리 부분-------------
		function clickLike(prodReview_no) {
				console.log(prodReview_no);
				$.ajax({
					  method: "post",
					  url: "/mall/prodDetail/insertLikeProdReviews/" + loginUser + "/" + prodReview_no,
					  headers: {	// 요청하는 데이터의 헤더에 전송
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "POST"
					  },
					  dataType: "text", // 응답 받는 데이터 타입
					  success : function(result) {
// 						  console.log(result);
						  $("#content" + prodReview_no).hide();
						  showContent(prodReview_no, result);
						 //showProdList(product_id, currentPage, 1, orderList);

						  
					  }, complete : function(result) {
					}
					  
					});// end of Ajax
				
		}
	
	//----------------------------------------------------------------------------정민오빠 js 끝!!!---------------------------------------------------------------------
	
	function futurePoints() {
		let sellPrice = '${prodDetail.product_sellPrice}';
		
// 		console.log(sellPrice);
		
		let pointA = Number(sellPrice) * 0.15;
		let pointB = Number(sellPrice) * 0.1;
		let pointC = Number(sellPrice) * 0;
		
		$("#A").html("A : " + pointA + " 원");
		$("#B").html("B : " + pointB + " 원");
		$("#C").html("C : " + pointC + " 원");
	}
	
	function totProdQACnt(prodId) {
		$.ajax({
			url: '/mall/prodDetail/totProdQACnt?prodId=' + prodId,
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
// 				console.log(result);
				$("#totprodQACnt").html(result);	
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	// 페이지 호출될 때 상품 문의 목록 함수
	function prodQAListAll(prodId, page, flag, cate, no) {
	    $.getJSON("/mall/prodDetail/prodQAList?prodId=" + prodId  + "&cate=" + cate + "&page=" + page, function(data){
	    		let output = "";
	    		$("#prodQA_category").val(cate).prop("selected",true);
	    		
	    	if(data.length == 0) { // 등록된 상품 문의가 없다면,  
	    		console.log("데이터 없음");
	    		output += '<tr><td colspan="6">상품 문의사항이 없습니다</td></tr>';
	    		
	    	} else { // 등록된 상품 문의가 있다면,		
	    		console.log(page);	    	
	    		
	    		$(data).each(function(index, item){
		        	let date = new Date(item.prodQA_date);
		        	let dateFormat = date.toLocaleString();
		        	
		        	output += '<tr id="prodQA' + item.prodQA_no + '"><td><input type="hidden" id="produQA_no" value="' + item.prodQA_no + '"/>' + item.prodQA_category + '</td>';
		        	if(loginUser != item.member_id && item.prodQA_isSecret == 'Y') { // 비밀글인데 로그인이 되어있지 않거나, 로그인 유저 아이디와 글쓴이가 다르다면, 
		        		output += '<td><div id="' + item.prodQA_no + '" >비밀글입니다</div></td>';
		        	} else { // 비밀글인데 로그인 유저 아이디와 글쓴이가 같다면,
		        		output += '<td><div id="' + item.prodQA_no + '" onclick="updateView(' + item.prodQA_no + ',\'' + cate + '\');">' + item.prodQA_title + '</div></td>';	
		        	}
	                output += '<td id="writer' + item.prodQA_no + '">' + item.member_id + '</td>';
	                output += '<td>' + dateFormat + '</td>';
	                output += '<td>' + item.prodQA_likeCnt + '</td>';
	                output += '<td>' + item.prodQA_viewCnt + '</td></tr>';
	                
	                output += '<tr id="content' + item.prodQA_no + '" style="display: none">';
	                output += '<td colspan="6"><div>' + item.prodQA_content + '</div><div>';
	                if(item.prodQA_img1 != '' && item.prodQA_img1 != null) { // img1에 데이터가 있다면,
	                	output += '<img src="/mall/prodDetail/displayFile?fileName=' + item.prodQA_img1 + '" />';
	                }
	                if(item.prodQA_img2 != '' && item.prodQA_img2 != null) { // img2에 데이터가 있다면,
	                	output += '<img src="/mall/prodDetail/displayFile?fileName=' + item.prodQA_img2 + '" />';
	                }
	                if(item.prodQA_img3 != '' && item.prodQA_img3 != null) {// img3에 데이터가 있다면,
	                	output += '<img src="/mall/prodDetail/displayFile?fileName=' + item.prodQA_img3 + '" />';
	                }
	                
	                if(loginUser == item.member_id) { // 로그인 유저와 글쓴이가 같아면, 수정/삭제 가능한 버튼 보여주도록
	                	output += '</div><div><input type="button" id="modi" value="수정" onclick="location.href=\'/mall/prodDetail/prodQAModiForm?prodId=' + prodId + '&page=' + page + '&no=' + item.prodQA_no +'\'"/>';
		                output += '<input type="button" id="del" onclick="showHiddenSecret(this);" value="삭제"/>';
		                output += '<span id="likeCnt' + item.prodQA_no + '"><img src="../../resources/img/emptyHeart.png" width="50==40px" height="40px" onclick="updateLike(' + item.prodQA_no + ',\'' + cate + '\');"/></span>';
		                output += '<div class="hiddenSecretDiv" id="' + item.prodQA_no + '"><input type="password" class="hiddenSecret" id="secretPwdBox"  placeholder="비밀번호"/>'; 
		                output += '<input type="button" class="hiddenSecret" id="checkSecretPwd" onclick="chcekSecretPwd(this);" value="확인"/></div></div></td></tr>';
	                }
	                
	                output += '<span id="likeCnt' + item.prodQA_no + '"><img src="../../resources/img/emptyHeart.png" width="50==40px" height="40px" onclick="updateLike(' + item.prodQA_no + ',\'' + cate + '\');"/></span></div></td></tr>';
	    		});
			    
	    	}
	    	
	    	$("#prodQATbody").html(output); 
	    	
	    	if(flag == 1) {
	        	$("#content" + no).show();
	        	if(loginUser.lenght != 0) {
	    			getLike(loginUser);
	    		}
	        	getReply(no, flag);
	        } else if(flag == 2) {
	        	$("#content" + no).show();
	        	getReply(no, flag);
	        	$("#likeCnt" + no).html('<img src="../../resources/img/heart.png" width="50==40px" height="40px" onclick="deleteLike(' + no + ',\'' + cate + '\');"/>');
	        } else {
	        	$("#content" + no).show();
	        	getReply(no, flag);
	        	$("#likeCnt" + no).html('<img src="../../resources/img/emptyHeart.png" width="50==40px" height="40px" onclick="updateLike(' + no + ',\'' + cate + '\');"/>');
	        }
	    });
	}
	
	function prodQAPagingParam(prodId, page, cate) {
		$.getJSON("/mall/prodDetail/prodQAPP?prodId=" + prodId + "&cate=" + cate, function(data){
	    	if(data.length == 0) {
	    		console.log("데이터 없음")
	    	} else {
	    		console.log(data);
	    		let prev = Number(page) - 1;
	    		let next = Number(page) + 1;
	    		
	    		let output = '<ul class="pagination">';
	    		
	    		if(page > 1) {
	    			output += '<li><a href="javascript:void(0);" onclick="prodQAListAll(' + prodId + ',' + page + ',0,\'' + cate + '\');"> < </a></li>';
	    		}
	    		
	    		for(let i = 1; i < data.endPage + 1; i++) {
	    			page = i;
	    			output += '<li><a href="javascript:void(0);" onclick="prodQAListAll(' + prodId + ',' + page + ',0,\'' + cate + '\');">' + i + '</a></li>';
	    		}
	    		
	    		if(page < data.endPage) {
	    			output += '<li><a href="javascript:void(0);" onclick="prodQAListAll(' + prodId + ',' + page + ',0,\'' + cate + '\');"> > </a></li>';
	    		}
	    		
	    		if(loginUser.length != 0) {
	    			output += '</ul><button type="button" class="btn btn-info" style="float: right;" onclick="goWrite(\'1\');">글쓰기</button>';	
	    		}
	    		
	    		$("#pagingParamTb").html(output);

	    	}
	     });
	}
	
	function getReply(no, flag) {		
		$.ajax({
			url: '/mall/prodDetail/prodQAReplyList',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: no
				}),
			dataType : 'json', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				if(result.length == 0) {
		    		console.log("데이터 없음")
		    	} else {
					let output = '';
					
					$(result).each(function(index, item){		
						let writer = $("#writer" + item.prodQA_ref).text();
			    		
						output += '<tr id="reply' + item.prodQA_no + '" class="reply' + item.prodQA_ref + '" style="display: none">';
		                output += '<td colspan="6"><div>' + item.prodQA_content + '</div><div>';
		                if(item.prodQA_img1 != '' && item.prodQA_img1 != null) {
		                	output += '<img src="/mall/prodDetail/displayFile?fileName=' + item.prodQA_img1 + '" />';
		                }
		                if(item.prodQA_img2 != '' && item.prodQA_img2 != null) {
		                	output += '<img src="/mall/prodDetail/displayFile?fileName=' + item.prodQA_img2 + '" />';
		                }
		                if(item.prodQA_img3 != '' && item.prodQA_img3 != null) {
		                	output += '<img src="/mall/prodDetail/displayFile?fileName=' + item.prodQA_img3 + '" />';
		                }
		                if(item.prodQA_category == 'reply' && loginUser == writer) {
		                	output += '<input type="button" class="replyBtn" id="replyBtn" onclick="goWrite(\'2\','+ item.prodQA_no +');" value="답글"/></div></div></td></tr>';
		                }
		                output += '</div></td></tr>'
					});	
					$(output).insertAfter("#content"+no);	
					
					if(flag == 1 || flag == 2 || flag == 3) {
						$('.reply' + result[0].prodQA_ref ).show();
					}
				}
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	function goWrite(flag, no) {
		console.log(flag);
		
		if(flag == 1) {
			window.open('../prodDetail/prodQAForm?prodId=' + prodId + '&page=' + page, 'writeBoard', 'width=400, height=600, left=400, top=400, resizable = yes');
		} else if(flag == 2) {
			window.open('../prodDetail/prodQAForm?prodId=' + prodId + '&page=' + page + '&no=' + no, 'writeReply', 'width=400, height=600, left=400, top=400, resizable = yes');
		}		
	}
	
	function updateView(prodQA_no, cate) {
		console.log(prodId);
		console.log(page);
		
		$.ajax({
			url: '/mall/prodDetail/updateViewCnt',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: prodQA_no,
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
// 				console.log(result);
				
				prodQAListAll(prodId, page, 1, cate, prodQA_no);
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	function getLike(userId) {
		$.getJSON("/mall/prodDetail/getLike?userId=" + userId, function(data){
			if(data.length != 0) {
				console.log(data);
				$(data).each(function(index, item){
					$("#likeCnt" + item.prodQA_no).html('<img src="../../resources/img/heart.png" width="50==40px" height="40px" onclick="deleteLike(' + item.prodQA_no + ',\'' + cate + '\');"/>');
				});
			}
		});
	}
	
	function updateLike(prodQA_no, cate) {
		console.log(prodId);
		
		if(loginUser.length == 0) {
			alert("로그인이 필요합니다");
		} else {
			$.ajax({
				url: '/mall/prodDetail/updateLikeCnt',
				headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
						},
				data : JSON.stringify({	// 요청하는 데이터
					prodQA_no: prodQA_no,
					member_id: loginUser
					}),
				dataType : 'text', // 응답 받을 형식
				type : 'post',
				processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
				success : function(result) {
					console.log(result);
					prodQAListAll(prodId, page, 2, cate, prodQA_no);
				},
				fail : function(result) {
					alert(result);
				}
			});	
		}
	}
	
	function deleteLike(prodQA_no, cate) {
		console.log(prodId);
		
		if(loginUser.length == 0) {
			alert("로그인이 필요합니다");
		} else {
			$.ajax({
				url: '/mall/prodDetail/deleteLike',
				headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
						},
				data : JSON.stringify({	// 요청하는 데이터
					prodQA_no: prodQA_no,
					member_id: loginUser
					}),
				dataType : 'text', // 응답 받을 형식
				type : 'post',
				processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
				success : function(result) {
					console.log(result);
					prodQAListAll(prodId, page, 3, cate, prodQA_no);
				},
				fail : function(result) {
					alert(result);
				}
			});	
		}
	}
	
	function showHiddenSecret(obj) {
		let hiddenSecretAddr = $(obj).next().next();
		console.log(hiddenSecretAddr);
		$(hiddenSecretAddr).show()
	}
	
	function chcekSecretPwd(obj) {
		
		let checkSecretPwd = $(obj).prev().val();
		console.log(checkSecretPwd);
		
		let no = $(obj).prev().parent().attr("id");
		console.log(no);
		
		$.ajax({
			url: '/mall/prodDetail/checkSecretPwd',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: no,
				prodQA_secretPassword : checkSecretPwd
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				prodQAListAll(prodId, page, 0, cate);
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	function buying(obj) {
		console.log(prodId);
		console.log(loginUser);
		
		$.ajax({
			url: '/mall/prodDetail/checkBucket',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				pruduct_id: prodId,
				member_id : loginUser
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
</script>
<style>

		.fa {
		  color: grey;
		}
		.checked {
		  color: orange;
		}
		
		.replyBox{
		 margin-top: 27px;
		}
		
		textarea{
			width: 1070px; 
			height:200px; 
		    resize:none;/* 크기고정 */ 
		    margin-top: 30px;
		/*   resize: horizontal; // 가로크기만 조절가능 
			resize: vertical;  세로크기만 조절가능  */
		}
		/*대댓글 textarea 부분*/
		.reReply{
		    border: none;
		}
		
		.orderList{
			float: left;
			list-style-type: none;
			margin-left: 10px;
		}
		.likeProdReviews{
			text-align: center;
		}

	.product__details__widget {
		padding-top : 0px;
	}
	
	.hiddenSecretDiv {
		display : none;
	}
	
	.nav-tabs {
		border-bottom : none;
	}
	
	.nav-tabs .nav-item {
		background-color: white;
		z-index : 999;
	}
	
	.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
		border : none;
		color : #ca1515;
	}

</style>
<body>


	<%@include file="mallHeader.jsp" %>


<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Women’s </a>
                        <span>${prodDetail.product_name }</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__left product__thumb nice-scroll">
                            <a class="pt active" href="#product-1">
                                <img src="../../resources/mallMain/img/product/details/thumb-1.jpg" alt="">
                            </a>
                            <a class="pt" href="#product-2">
                                <img src="../../resources/mallMain/img/product/details/thumb-2.jpg" alt="">
                            </a>
                            <a class="pt" href="#product-3">
                                <img src="../../resources/mallMain/img/product/details/thumb-3.jpg" alt="">
                            </a>
                            <a class="pt" href="#product-4">
                                <img src="../../resources/mallMain/img/product/details/thumb-4.jpg" alt="">
                            </a>
                        </div>
                        <div class="product__details__slider__content">
                            <div class="product__details__pic__slider owl-carousel">
                                <img data-hash="product-1" class="product__big__img" src="../../resources/mallMain/img/product/details/product-1.jpg" alt="">
                                <img data-hash="product-2" class="product__big__img" src="../../resources/mallMain/img/product/details/product-3.jpg" alt="">
                                <img data-hash="product-3" class="product__big__img" src="../../resources/mallMain/img/product/details/product-2.jpg" alt="">
                                <img data-hash="product-4" class="product__big__img" src="../../resources/mallMain/img/product/details/product-4.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product__details__text">
                        <h3>${prodDetail.product_title }<span>Brand: SKMEIMore Men Watches from SKMEI</span></h3>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <span>( 138 reviews )</span>
                        </div>
                        <div class="product__details__price"> ${prodDetail.product_sellPrice} <span>$ 83.0</span></div>
                        <p>${prodDetail.product_detail }</p>
                        <div class="product__details__button">
                            <div class="quantity">
                                <span>Quantity:</span>
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                            <a href="javascript:void(0);" class="cart-btn" onclick="buying(this);"><span class="icon_bag_alt" ></span> 주문하기 </a>
                            <ul>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__details__widget">
                            <ul>
                                <li>
                                    <span>예상 적립금:</span>
                                    <div class="size__btn">
                                        <label for="xs-btn" id="A">
                                        </label>
                                        / 
                                        <label for="xs-btn" id="B">
                                        </label>
                                        /
                                        <label for="xs-btn" id="C">
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>예상 적립일:</span>
                                    <div class="color__checkbox">
                                        <label for="red">
                                            구매확정일 / 구매일로부터 7일 후
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>사이즈:</span>
                                    <div class="size__btn">
                                        <label for="xs-btn" class="active">
                                            Free
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>배송비:</span>
                                    <p>${prodDetail.product_shipPrice}</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-1" role="tab">상품 상세</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" onclick="showProdList();" id="prodReviewsCnt">상품평</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-3" role="tab">상품 문의(<span id="totprodQACnt"></span>)</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">배송/교환/반품 안내</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane " id="tabs-1" role="tabpanel">
                                <h6>상품 상세</h6>
                                <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed
                                    quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt loret.
                                    Neque porro lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim ipsam
                                    voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed quia ipsu
                                    consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Nulla
                                consequat massa quis enim.</p>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget
                                    dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
                                    nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium
                                quis, sem.</p>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <h6>상품평</h6>
                                <!-- *********아래부터 상품평 정렬순서 넣는 곳 *************************************************************-->	
                            	<ul>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'latest'); return false;" >최신순</a></li>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'grades'); return false;">별점순</a></li>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'replies'); return false;">좋아요순</a></li>
                            	</ul>
                                <!-- *********아래부터 상품평 내용 넣는 곳 *************************************************************-->
                                <div>
                                
						     	<div>
						     	<div class="form-row float-right">
						        <button type="button" class="btn btn-success" onclick="location.href='/cambakMall/writingProdReviews'">글쓰기</button>
						        </div>
						     	<div id="prodBoardList"></div>
								<div id="prodBoardListPage"></div>
								
								
								</div>
                                
                                </div>
                                <!-- ******************************************************************************************** -->
                            </div>
                            <div class="tab-pane active" id="tabs-3" role="tabpanel">
                                <h6>상품 문의</h6>
                                <!-- *********아래부터 상품문의 내용 넣는 곳 *************************************************************-->
						     	
						     	<div class="container" id="prodQATb">
						     		<table class="table table-hover">
						     			<thead>
						     				<tr>
						     					<th>
						     					<select id="prodQA_category" name="prodQA_category">
						     						<option value="*">분류</option>
						     						<option value="product">상품</option>
						     						<option value="delivery">배송</option>
						     						<option value="refund">환불</option>
						     						<option value="exchange">교환</option>
						     						<option value="etc">기타</option>
						     					</select>
						     					</th>
						     					<th>글제목</th>
						     					<th>작성자</th>
						     					<th>작성일</th>
						     					<th>좋아요</th>
						     					<th>조회수</th>
						     				</tr>
						     			</thead>
						     			<tbody id="prodQATbody">
						     			
						     			
						     			</tbody>
						     		</table>
						              
								</div>
								<div class="container" id="pagingParamTb">
									
						    	</div>
                                <!-- ******************************************************************************************** -->
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <h6>배송/교환/반품 안내</h6>
                                <!-- *********아래부터 배송/교환/반품 안내 내용 넣는 곳 *************************************************************-->
                                <div>
                                
                                </div>
                                <!-- ******************************************************************************************** -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="related__title">
                        <h5>RELATED PRODUCTS</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-1.jpg">
                            <div class="label new">New</div>
                            <ul class="product__hover">
                                <li><a href="../../resources/mallMain/img/product/related/rp-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Buttons tweed blazer</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-2.jpg">
                            <ul class="product__hover">
                                <li><a href="../../resources/mallMain/img/product/related/rp-2.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Flowy striped skirt</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 49.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-3.jpg">
                            <div class="label stockout">out of stock</div>
                            <ul class="product__hover">
                                <li><a href="../../resources/mallMain/img/product/related/rp-3.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Cotton T-Shirt</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-4.jpg">
                            <ul class="product__hover">
                                <li><a href="../../resources/mallMain/img/product/related/rp-4.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Slim striped pocket shirt</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->



<%@include file="mallFooter.jsp" %>


<!-- Js Plugins -->
<script src="../../resources/mallMain/js/jquery-3.3.1.min.js"></script>
<script src="../../resources/mallMain/js/bootstrap.min.js"></script>
<script src="../../resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="../../resources/mallMain/js/jquery-ui.min.js"></script>
<script src="../../resources/mallMain/js/mixitup.min.js"></script>
<script src="../../resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="../../resources/mallMain/js/jquery.slicknav.js"></script>
<script src="../../resources/mallMain/js/owl.carousel.min.js"></script>
<script src="../../resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="../../resources/mallMain/js/main.js"></script>


</body>
</html>
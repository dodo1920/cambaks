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
	<style>
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
		.bordListBox{
			width : 322px;
			height : 387px;
			margin :10px;	
			border: solid 1px black;
			float: left;
		
		}
		.tdTotolStyle{
			margin:	 10px;
			display:block;
		}	
		.tdContentBox{
			width: 300px;
			height: 45px;
		}
		.Thumbnail{
			display: block;
			width: 300px;
			height: 175px
		}
		.rightSapn{
			float: right;
		}
	</style>
</head>
<script type="text/javascript">
var minHeight = 0
let page = 2;
function gotoDeteilPage	(no) {
	window.location.href="/board/resell/detail?no="+no+"&page=${pagingParam.cri.page}"
}
$(window).scroll(function () {
	
	var height = $(document).scrollTop();
	console.log(height);
	if(height > (minHeight+600)){
		console.log(minHeight);
		minHeight += 600;
		$.ajax({
			type : "post",
			contentType : "application/json",
			url : "/cambakMall/list/"+page, 
			success : function(data) {
				console.log(data)
				$.each(data,function(index,item){
					let output = ""
					if(item.product_show == "Y"){
						output += '<tr class="bordListBox" onclick="gotoDeteilPage('+item.product_id+');">';
						output +='<td class="tdTotolStyle"><span>'+item.product_name+'</span></td>';
						output +='<td class="Thumbnail tdTotolStyle"><img class="Thumbnail" src="/resources/mallMain/img/shop/shop-5.jpg"/></td>';
						output +='<td class="tdTotolStyle"><span>'+item.product_title+'</span></td>';
						output +='<td class="tdTotolStyle tdContentBox" ><span style="word-break:normal;">'+item.product_detail+'</span></td>';
						output +='<td class="tdTotolStyle"><div><span>'+item.product_date+'</span><span class="rightSapn">'+item.product_purchPrice+'원</span></div></td>';
						output +='</tr>';
					}else{
						output += '<tr class="bordListBox">';
						output +='<td class="tdTotolStyle"><del><span>'+item.product_name+'</span></del></td>';
						output +='<td class="Thumbnail tdTotolStyle"><img class="Thumbnail" src="/resources/mallMain/img/shop/shop-5.jpg"/></td>';
						output +='<td class="tdTotolStyle"><del><span>'+item.product_title+'</span></del></td>';
						output +='<td class="tdTotolStyle tdContentBox" ><del><span style="word-break:normal;">'+item.product_detail+'</span></del></td>';
						output +='<td class="tdTotolStyle"><div><del><span>'+item.product_date+'</span></del><span class="rightSapn">판매완료</span></div></td>';
						output +='</tr>';
					}
					$("#nextPage").append(output)
				});
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
		console.log("page : "+page)
		page+=1;
	}
});

    
function like() {
	$.ajax({
		method : "post",
		url : "/like",
		dataType : "text", // 응답 받는 데이터 타입
		data : JSON.stringify({ // 요청하는 데이터
		}),
		success : function(result) {
			if (result == 'Success') {
				//alert('댓글 등록 완료!');
				callReplyList(); // 댓글 다시 호출
			}
			
		
		}
	});
	
}


</script>
<body>
    <%@include file="mallHeader.jsp" %>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- Content -->
				<div id="content" class="8u skel-cell-important"style="width: 100%;float: revert;">
				<section>
					<header>
						<h2>중고거래</h2>
						<span class="byline" id="rollNot"><a href="../notice/listCri">공지사항</a></span>
					</header>
				</section>
						<table style="width: 100%x"id="nextPage">
				
						<tbody style="width: 100%">
						<div style="display: table;margin: auto;">
							<form action="/board/resell/search" method="GET">
								<select name="searchType" style="margin-right: 15px">
									<option value="resellBoard_title">제목</option>
									<option value="resellBoard_content">내용</option>
									<option value="member_id">작성자</option>
								</select>
								
								<input type="text" name="searchWord" placeholder="검색어 입력..." style="width: 550px"/>
								<input type="submit" id="goSearch" value="검색" />
							</form>
						</div id="ResellList">
						<c:forEach var="board" items="${board}">
						<c:choose>
                  			<c:when test='${board.product_show != "Y"}'>
								<tr class="bordListBox">
								
								<td class="tdTotolStyle"><del><span>${board.product_name}</span></del></td>
								<td class="Thumbnail tdTotolStyle"><img class="Thumbnail" src="/resources/mallMain/img/shop/shop-5.jpg"/></td>
								<td class="tdTotolStyle"><del><span>${board.product_title}</span></del></td>
								<td class="tdTotolStyle tdContentBox" ><del><span style="word-break:normal;">${board.product_detail}</span></del></td>
								<td class="tdTotolStyle"><del><div><span>${board.product_date}</span><span class="rightSapn">"판매완료"</span></div></del></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="bordListBox" onclick="gotoDeteilPage(${board.product_id});">
								
								<td class="tdTotolStyle"><span>${board.product_name}</span></td>
								<td class="Thumbnail tdTotolStyle"><img class="Thumbnail" src="/resources/mallMain/img/shop/shop-5.jpg"/></td>
								<td class="tdTotolStyle"><span>${board.product_title}</span></td>
								<td class="tdTotolStyle tdContentBox" ><span style="word-break:normal;">${board.product_detail	}</span></td>
								<td class="tdTotolStyle"><div><span>${board.product_date}</span><span class="rightSapn">${board.product_purchPrice}원</span></div></td>
								</tr>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							</tbody>
						</table>
			
			</div>
		</div>
		
		
	</div>
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
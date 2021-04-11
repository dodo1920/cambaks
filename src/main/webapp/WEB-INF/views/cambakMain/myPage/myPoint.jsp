<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageAside.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageTemplet.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>


<script>

let member_id = "${loginMember.member_id}";
console.log(member_id);
let pageNum;

function showPointList(pageNum) {
	// 페이지 번호가 null인 경우, 1
	if(pageNum == null){
		pageNum =1;
	}
	
	let showDate;
	let showThisDate;
	let output="<table class='table table-hover'>";
	$.ajax({
    type		: "post",
    url 		: "/myMall/myPoint/" + member_id + "/" + pageNum,
    contentType : "application/json",
    success 	: function(data) {
    	console.log(data);
    	pointList = data.vo;
    	$(pointList).each(function(index, item) {
    		// 날짜 출력 포맷 변경 부분
   		 	showDate = new Date(item.payment_date);
            showThisDate = showDate.toLocaleString();
            //console.log(typeof(item.buyProduct_totPrice));
            // 사용한 포인트가 있는 경우
            //console.log(item.point_savingDate);
            console.log(typeof(item.point_reason));
            
        	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            //1.주문이 취소된 건인 경우,
            if(item.point_reason == "주문취소"){
            	
            	 if(item.point_usedPoint != 0){ //1-1.주문취소 + 포인트 사용
                 	//사용 포인트 반환
                 	output += '<tr><td><img src="../../../resources/img/money-saving-dollar.png" class="pointImg" style="width: 50px;" /><div style="color: red;">사용취소</div></td>';
                 	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                 	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                 	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                 	output += '<td><div>포인트</div><div  style="color: red;">+' + item.point_usedPoint +'</div></td></tr>';

                 
                 if(item.point_savingDate != 978188400000){//주문취소+포인트 적립 확정
                 	//적립 포인트 회수
                 	output += '<tr><td><img src="../../../resources/img/red-x-line.png" class="pointImg" style="width: 50px;" /><div  style="color: blue;">적립포인트회수</div></td>';
                 	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                 	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                 	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                 	output += '<td><div>포인트</div><div  style="color: blue;">-' + item.point_futurePoint +'</div></td></tr>';
                 } 
                 else {
                	 //주문취소+포인트 적립 예정
                 	//적립 예정 포인트 회수 표시
                 	
                 	output += '<tr><td><img src="../../../resources/img/red-x-line.png" class="pointImg" style="width: 50px;" /><div style="color: blue;"">적립예정포인트회수</div></td>';
                 	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                 	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                 	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                 	output += '<td><div>포인트</div><div  style="color: blue;">-' + item.point_futurePoint +'</div></td></tr>';
                 } 
                 }// end of 주문취소 + 포인트 사용
                 
                 //1-2.주문취소이면서, 사용자가 포인트를 사용하지 않았을 경우
                 else{
                      
                      if(item.point_savingDate != 978188400000){//주문취소+포인트 적립 확정
                      	//적립 포인트 회수
                      	output += '<tr><td><img src="../../../resources/img/red-x-line.png" class="pointImg" style="width: 50px;" /><div  style="color: blue;">적립포인트회수</div></td>';
                      	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                      	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                      	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                      	output += '<td><div>포인트</div><div  style="color: blue;">-' + item.point_futurePoint +'</div></td></tr>';
                      } 
                      //주문취소+포인트 적립 예정
                      else {
                      	//적립 예정 포인트 회수 표시
                      	
                      	output += '<tr><td><img src="../../../resources/img/red-x-line.png" class="pointImg" style="width: 50px;" /><div style="color: blue;">적립예정포인트회수</div></td>';
                      	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                      	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                      	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                      	output += '<td><div>포인트</div><div  style="color: blue;">-' + item.point_futurePoint +'</div></td></tr>';
                      } 
    			}
            	 
            }// end of  1.주문이 취소된 건인 경우,
            

            // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
          	// 2.주문이 취소되지 않은 건인 경우, !=주문취소
            else 
            {
            	if(item.point_usedPoint != 0){ //2-1.주문취소x + 포인트 사용o
                 	//사용 포인트 삭감
                 	output += '<tr><td><img src="../../../resources/img/bitcoin-color.png" class="pointImg" style="width: 50px;" /><div style="color: blue;">포인트사용</div></td>';
                 	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                 	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                 	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                 	output += '<td><div>포인트</div><div  style="color: blue;">-' + item.point_usedPoint +'</div></td></tr>';

                 
                 if(item.point_savingDate != 978188400000){//주문취소x, 포인트 적립 확정
                 	//포인트 적립 적용
                 	output += '<tr><td><img src="../../../resources/img/money-saving-dollar.png" class="pointImg" style="width: 50px;" /><div  style="color: green;">적립완료</div></td>';
                 	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                 	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                 	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                 	output += '<td><div>포인트</div><div  style="color: green;">+' + item.point_futurePoint +'</div></td></tr>';
                 } 
                 else {
                	 //주문취소x+포인트 적립 예정
                 	//적립 예정 포인트 표시
                 	
                 	output += '<tr><td><img src="../../../resources/img/piggy-saving.png" class="pointImg" style="width: 50px;" /><div>적립예정</div></td>';
                 	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                 	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                 	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                 	output += '<td><div>포인트</div><div>+' + item.point_futurePoint +'</div></td></tr>';
                 } 
                 }// end of 주문취소x + 포인트 사용
                 //2-2.주문취소x, 사용자가 포인트를 사용x
                 else{
                      
                      if(item.point_savingDate != 978188400000){//주문취소x+포인트 적립 확정
                      	//적립 포인트 확정
                      	output += '<tr><td><img src="../../../resources/img/money-saving-dollar.png" class="pointImg" style="width: 50px;" /><div  style="color: green;">적립완료</div></td>';
                      	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                      	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                      	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                      	output += '<td><div>포인트</div><div  style="color: green;">+' + item.point_futurePoint +'</div></td></tr>';
                      } 
                      //주문취소x+포인트 적립 예정
                      else {
                      	//적립 예정 포인트 표시
                      	
                      	output += '<tr><td><img src="../../../resources/img/piggy-saving.png" class="pointImg" style="width: 50px;" /><div>적립예정</div></td>';
                      	output += '<td><div>구매제품</div><div>' + item.product_name +'</div></td>';
                      	output += '<td><div>사유</div><div>' + item.point_reason + '</div></td>';
                      	output += '<td><div>일시</div><div>' + showThisDate +'</div></td>';
                      	output += '<td><div>포인트</div><div>+' + item.point_futurePoint +'</div></td></tr>';
                      } 
    			}
            	
            }
            
    		
    	});// end of foreach
    	output += "</table>";
    	
    	
    	$("#myPoint").append(output);
    	
    }// end of success
	, complete : function(data) {
		console.log(data.responseJSON.pagingParam);
		console.log(data.responseJSON.pagingParam.tempEndPage);
		

		//무한 스크롤 처리 부분
		$(window).scroll(function() {
			if(pageNum < data.responseJSON.pagingParam.tempEndPage){
		        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				          pageNum++;
				          showPointList(pageNum);
		        }
        	}
		});
	}// end of complete  
	});// end of ajax


}// end of showPointList(page)

$(function() {
	showPointList();
	
	
});
</script>
<style>

</style>
</head>
<body>
	<%@include file="../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<%@include file="myPageAside.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<div id="myPoint"></div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>
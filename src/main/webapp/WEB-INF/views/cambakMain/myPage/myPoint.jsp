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

function showPointList() {

	let showDate;
	let showThisDate;
	let output="<div><table class='table table-hover'>";
	$.ajax({
    type		: "post",
    url 		: "/myMall/myPoint/" + member_id,
    contentType : "application/json",
    success 	: function(data) {
    	console.log(data);
    	$(data).each(function(index, item) {
    		// 날짜 출력 포맷 변경 부분
   		 	showDate = new Date(item.payment_date);
            showThisDate = showDate.toLocaleString();
            //console.log(typeof(item.buyProduct_totPrice));
            if(item.buyProduct_totPrice != 0){
            	output += "<tr><td><span>사용</span></td>";
            	output += "<td><span>" + item.product_name +"</span></td>";
        		output += "<td><span>" + item.buyProduct_totPrice +"</span></td>";
        		output += "<td><span>" + item.point_reason +"</span></td>";
        		output += "<td><span>" + item.point_usedPoint +"</span></td>";
        		output += "<td><span>" + item.point_futurePoint +"</span></td>";
        		output += "<td><span>" + showThisDate +"</span></td></tr>";
            } else{
                output += "<tr><td><span>" + item.product_name +"</span></td>";
        		output += "<td><span>" + item.buyProduct_totPrice +"</span></td>";
        		output += "<td><span>" + item.point_reason +"</span></td>";
        		output += "<td><span>" + item.point_usedPoint +"</span></td>";
        		output += "<td><span>" + item.point_futurePoint +"</span></td>";
        		output += "<td><span>" + showThisDate +"</span></td></tr>";
            }
    		
    	});
    	output += "</table></div>";
    	$("#myPoint").html(output);
    }
	
});

}

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
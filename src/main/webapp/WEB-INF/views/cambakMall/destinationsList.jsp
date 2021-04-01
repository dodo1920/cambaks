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
<script>
	
	let member_id = '${loginMember.member_id}';
	
	$(function(){
		
		getDestinationsList();
		
		
	});
	
	function defaultDestiny(dstno){
	
	    
	     $.ajax({
	         
	            method: "post",
	            url: "/cambakMall/destinationsList/ajax/" + member_id + "/" + dstno,
	            dataType: "text", // 응답 받는 데이터 타입
	            
	            success : function(result){
	            	
	                alert("변경 완료.");
	                $("#tbodyDestinyList").html();
	                getDestinationsList();
	            }
	        });
	}	

	
	
function getDestinationsList(){
	
	$.getJSON("/cambakMall/destinationsList/ajax/" + member_id, function(data){
	
		DestinyList = "";
		console.log
		console.log(data);
		$(data).each(function(index, item){
		
		
	
		if(this.default_address == this.destination_no){
			
			DestinyList += "<tr><td><div><h4>" + this.destination_nickname + "</h4><h5>" + this.destination_toUser + "</h5><div style='color: chocolate; border: solid 1px chocolate; margin: 5px 0px;'>기본배송지</div><div></td><td>" + this.destination_address + "<br />" + this.destination_addressDetail + "</td><td>" + this.destination_mobile + "</td><td><input type='button' style='border-style: double; background-color: white; border-color: darkgrey;'  onclick='deleteDestiny(" + this.destination_no + ");' value='삭제'/>&nbsp<input type='button' style='border-style: double; background-color: white; border-color: darkgrey;' onclick='modefyDestiny(" + this.destination_no + ");' value='수정'/></td><td><span>선택됨</span></td></tr>"
			
		}else{
			
			DestinyList += "<tr><td><div><h4>" + this.destination_nickname + "</h4><h5>" + this.destination_toUser + "</h5><div></div><div></td><td>" + this.destination_address + "<br />" + this.destination_addressDetail + "</td><td>" + this.destination_mobile + "</td><td><input type='button' style='border-style: double; background-color: white; border-color: darkgrey;'  onclick='deleteDestiny(" + this.destination_no + ");' value='삭제'/>&nbsp<input type='button' style='border-style: double; background-color: white; border-color: darkgrey;'  onclick='modefyDestiny(" + this.destination_no + ");' value='수정'/></td><td><input type='button' style='border-style: double; background-color: white; border-color: chocolate; color:chocolate; border: 1px;'  onclick='defaultDestiny(" + this.destination_no + ");' value='기본배송지로 변경' /></td></tr>"
		}
		
		});
		
			$("#tbodyDestinyList").html(DestinyList);
			
			
			});

	}
	
	
	
	
</script>
<style>
	
.MyaddrList{
	width: 100%;
    height: 140px;
    text-align: center;
    font-size: 14px;
}


.MyaddrList th {
text-align: center;
font-size: 20px;
border-bottom-style: double;
    
}

.MyaddrList td {

border-bottom-style: outset;
    
}




</style>
<body>


	<%@include file="mallHeader.jsp" %>

	
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>배송지 목록</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <table class="MyaddrList">
                            <thead>
                                <tr>
                                    <th style="width: 15%" >배송지</th>
                                    <th style="width: 40%">주소</th>
                                    <th style="width: 15%">연락처</th>
                                    <th style="width: 15%">수정 삭제</th>
                                    <th style="width: 15%">기본 배송지</th>
                                </tr>
                            </thead>
                            <tbody id="tbodyDestinyList">
                                
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        
        </div>
    </section>
    <!-- Shop Cart Section End -->







<%@include file="mallFooter.jsp" %>


<!-- Js Plugins -->

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
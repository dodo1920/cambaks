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
	
	
function getDestinationsList(){
	
	$.getJSON("/cambakMall/destinationsList/ajax/" + member_id, function(data){
	
		DestinyList = "";
	
		if(${destinations.default_addrress == this.destination_no}){
			DestinyList += "<tr><td><div><h4>${destinations.destination.nickname}</h4><h5>${destinations.toUser}</h5><div>CsS기본배송지</div><div></td><td>${destinations.destination_address} ${destinations.destination_addressDetail}</td><td>연락처</td><td><input type='button' onclick='deleteDestiny(" this.destination_no + ");' value='삭제'/><input type='button' onclick='modefyDestiny(" this.destination_no + ");' value='수정'/></td><td><span>선택됨</span></td></tr>"
			
		}else{
			
			DestinyList += "<tr><td><div><h4>${destinations.destination.nickname}</h4><h5>${destinations.toUser}</h5><div>CsS기본배송지</div><div></td><td>${destinations.destination_address} ${destinations.destination_addressDetail}</td><td>연락처</td><td><input type='button' onclick='deleteDestiny(" this.destination_no + ");' value='삭제'/><input type='button' onclick='modefyDestiny(" this.destination_no + ");' value='수정'/></td><td><input type='button' onclick='deleteDestiny(" this.destination_no + ");' value='기본배송지로 선택' /></td></tr>"
		}
		
		});
		
			$("#tbodyDestinyList").html (DestinyList);
			
		});
	}
	
	
	
	
</script>
<style>
	
.MyaddrList{

text-align: center;


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
                    <div class="" style="width:800px;">
                        <table class="MyaddrList">
                            <thead>
                                <tr>
                                    <th style="width: 15%" >배송지</th>
                                    <th style="width: 40%">주소</th>
                                    <th style="width: 15%">연락처</th>
                                    <th style="width: 15%">수정 삭제</th>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody id="tbodyDestinyList">
                                <tr>
                                    <td class="">
                                     
                                        <div class="">
                                            <h4>별칭1</h4>
                                            <h5>받는 사람</h4>
                                            <div>기본배송지 CSS</div>
                                           
                                        </div>
                                    </td>
                                    <td class="">주소</td>
                                    <td class="">
                                     연락처
                                    </td>
                                    <td class="">수정 삭제버튼 넣기</td>
                                    <td class=""><span>기본 배송지로 선택하기</span></td>
                              
                                </tr>
                                <tr>
                                    <td class="">
                                       
                                         <div class="">
                                            <h4>별칭2</h4>
                                            <h5>받는 사람</h4>
                                            <div>기본배송지 CSS</div>
                                           
                                        </div>
                                    </td>
                                    <td class="">주소</td>
                                   <td class="">
                                     연락처
                                    </td>
                                     <td class="">수정 삭제버튼 넣기</td>
                                    <td class=""><span>기본 배송지로 선택하기</span></td>
                                    
                                </tr>
                                <tr>
                                    <td class="">
                                     
                                        <div class=>
                                            <h4>별칭3</h4>
                                            <h5>받는 사람</h4>
                                            <div>기본배송지 CSS</div>
                                           
                                        </div>
                                    </td>
                                    <td class="">주소</td>
                                    <td class="">
                                     연락처
                                    </td>
                                    <td class="">수정 삭제버튼 넣기</td>
                                    <td class=""><span>기본 배송지로 선택하기</span></td>
                                        
                                </tr>
                                <tr>
                                    <td class="">
                                       
                                         <div class="">
                                            <h4>별칭4</h4>
                                            <h5>받는 사람</h4>
                                            <div>기본배송지 CSS</div>
                                           
                                        </div>
                                    </td>
                                    <td class="">주소</td>
                                   <td class="">
                                     연락처
                                    </td>
                                     <td class="">수정 삭제버튼 넣기</td>
                                    <td class=""><span>기본 배송지로 선택하기</span></td>
                                      
                                </tr>
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
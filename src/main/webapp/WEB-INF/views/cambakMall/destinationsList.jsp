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
    <link rel="stylesheet" href="../../resources/mallMain/css/cambakMallCommon.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="../../resources/mallMain/js/cambakMallCommon.js"></script>
</head>
<script>
	
	let member_id = '${loginMember.member_id}';
	 window.name = "destinationsList";
     var url="";
     var option="width=530, height=650, top=200, left=200, resizeable = no, scrollbars = no";
     
     
	 function popup(data){

		 if(data){
			  // Ajax로 불러오기 정상 작동 확인 //			 			 
			  url = "/mall/destinationsList/register?no=" + data;
			  var openWin = window.open(url, "registerDestinationForm", option);
			  // Ajax로 불러오기 정상 작동 확인 //
	  
			  
		 }else{
			  url = "/mall/destinationsList/register?no=" + data;
			  var openWin = window.open(url, "registerDestinationForm", option);
		 }
			 
       
         
     }
	 
	 
	function goInsertDestiny(member_id){
		
		let destination_nickname = $("#nickname" + member_id).val();
		let destination_toUser = $("#toUser" + member_id).val();
		let destination_address = $("#address" + member_id).val();
		let destination_addressDetail = $("#addressDetail" + member_id).val();
		let destination_mobile = $("#mobile" + member_id).val();
	
		$.ajax({
			
			method: "POST",
			url: "/mall/destinationsList/insertDestiny/",
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
			},
			dataType: "text", // 응답 받는 데이터 타입
			data : JSON.stringify({	// 요청하는 데이터
			member_id : member_id,
			destination_nickname : destination_nickname,
			destination_address : destination_address,
			destination_addressDetail : destination_addressDetail,
			destination_toUser : destination_toUser,
			destination_mobile : destination_mobile
			}),
			
			success : function(result){
				
					alert('배송지 정보 추가 완료!');
					getDestinationsList();
					
			}
		});
	}
	
	function goModyContent(destination_no){
		
		let destination_nickname = $("#nickname" + destination_no).val();
		let destination_toUser = $("#toUser" + destination_no).val();
		let destination_address = $("#address" + destination_no).val();
		let destination_addressDetail = $("#addressDetail" + destination_no).val();
		let destination_mobile = $("#mobile" + destination_no).val();
		
	
		$.ajax({
			
			method: "POST",
			url: "/mall/destinationsList/modiajax/",
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
			},
			dataType: "text", // 응답 받는 데이터 타입
			data : JSON.stringify({	// 요청하는 데이터
			destination_no : destination_no,
			member_id : member_id,
			destination_nickname : destination_nickname,
			destination_address : destination_address,
			destination_addressDetail : destination_addressDetail,
			destination_toUser : destination_toUser,
			destination_mobile : destination_mobile
			}),
			
			success : function(result){
				
					alert('배송지 추가 완료!');
					getDestinationsList();
					
			}
		});
	
		
		
	}
	
	
	
	
	$(function(){
		
		if(${loginMember == null}){
			alert("로그인 후 이용 가능합니다.");
			location.href="/user/login/yet";
		}
		
		getDestinationsList();
		
		
	});
	
	function defaultDestiny(dstno){
	
	     $.ajax({
	         
	            method: "post",
	            url: "/mall/destinationsList/ajax/" + member_id + "/" + dstno,
	            dataType: "text", // 응답 받는 데이터 타입
	            
	            success : function(result){
	            	
	                alert("변경 완료.");
	                getDestinationsList();
	            }
	        });
	}	
	
	function deleteDestiny(dstno){
		   $.ajax({
	            method: "get",
	            url: "/mall/destinationsList/deleteDestiny/" + member_id + "/" + dstno,
	            dataType: "text", // 응답 받는 데이터 타입
	            success : function(result){
	            	
	                alert("삭제 완료.");
	                getDestinationsList();
	            }
	        });
		
	}
	
	
	
	
	function returnCancle(dstno){
		$("#cancleMody" + dstno).css('display','none');
		$("#sumbitCommit" + dstno).css('display', 'none');
		$(".modiform" + dstno).attr('readonly', true).css('border-style','none');
		$("#openModyBtn" + dstno).css('display', '');
		$("#deleteBtn" + dstno).css('display', '');
		
	}
	
	// 배송지 인서트 부분 
	function returnInsert(id){
		
		$("#insertDestiny" + id + " input").css('display', 'none').css('border-style','none');
	
	}
	
	function showInputDestiny(id){
		
		$("#insertDestiny" + id + " input").css('display', '').css('border-style','solid');
	}

	
	
	
	
	// 끝 배송지 인서트 부분 끝//
	
	
	

	function modefyDestiny(dstno){
				
		$(".modiform" + dstno).attr('readonly', false).css('border-style','solid');
		$("#openModyBtn" + dstno).css('display', 'none');
		$("#deleteBtn"+ dstno).css('display', 'none');
		$("#sumbitCommit"+ dstno).css('display', '');
		$("#cancleMody"+ dstno).css('display', '');
		
		
		 // 비회원이 댓글 textarea창에 마우스 왼쪽 클릭 시 로그인 이동 안내
// 	     $("#writeReplyContent").bind("mousedown", function(event) {
// 	          // 알럿으로 로그인할지 물어보기
// 	         if (loginMember == "") {
// 	            if (confirm("회원만 댓글 작성이 가능합니다. 로그인 페이지로 이동하시겠습니까?") == true) { //확인
// 	               location.href='/user/login/yet';
// 	            } else { //취소
// 	                return false;
// 	            }
// 	         }
	   
// 	         });

	}
	
	

function getDestinationsList(){
	
	$.getJSON("/mall/destinationsList/ajax/" + member_id, function(data){
	
		DestinyList = "";
		let DestinyInsertBtn = "";
		
		
		$(data).each(function(index, item){
		
		
		if(this.default_address == this.destination_no){
			
			DestinyList += "<tr><td><div><input type='text' class='modiform" + this.destination_no + "' readonly id='nickname" + this.destination_no + "' value='" + this.destination_nickname + "'/><input type='text' class='modiform" + this.destination_no + "'  readonly id='toUser" + this.destination_no + "' value='" + this.destination_toUser + "'/><div style='color: chocolate; border: solid 0.5px chocolate; margin: 5px 0px;'>기본배송지</div><div></td><td><input type='text' class='modiform" + this.destination_no + "' id='postCode" + this.destination_no + "' readonly value='" + this.destination_zipCode + "'/><br /><input type='text' class='modiform" + this.destination_no + "' id='address" + this.destination_no + "' readonly value='" + this.destination_address + "'/><br /><input type='text' class='modiform" + this.destination_no + "' readonly id='addressDetail" + this.destination_no + "' value='" + this.destination_addressDetail + "'/></td><td><input type='text' class='modiform" + this.destination_no + "' id='mobile" + this.destination_no + "' readonly value='" + this.destination_mobile + "'/></td><td><input type='button' id='openModyBtn" + this.destination_no + "' style='border-style: double; background-color: white; border-color: darkgrey;' onclick='popup(" + this.destination_no + ");' value='수정'/>&nbsp<input type='button' style='border-style: double; background-color: white; border-color: darkgrey;' id='deleteBtn" + this.destination_no + "' onclick='deleteDestiny(" + this.destination_no + ");' value='삭제'/></td><td><span>선택됨</span></td></tr>"
			
		}else{
			
			DestinyList += "<tr><td><div><input type='text' class='modiform" + this.destination_no + "' readonly id='nickname" + this.destination_no + "' value='" + this.destination_nickname + "'/><input type='text' class='modiform" + this.destination_no + "'  readonly id='toUser" + this.destination_no + "' value='" + this.destination_toUser + "'/><div></td><td><input type='text' class='modiform" + this.destination_no + "' id='postCode" + this.destination_no + "' readonly value='" + this.destination_zipCode + "'/><br /><input type='text' class='modiform" + this.destination_no + "' id='address" + this.destination_no + "' readonly value='" + this.destination_address + "'/><br /><input type='text' class='modiform" + this.destination_no + "' readonly id='addressDetail" + this.destination_no + "' value='" + this.destination_addressDetail + "'/></td><td><input type='text' class='modiform" + this.destination_no + "' id='mobile" + this.destination_no + "' readonly value='" + this.destination_mobile + "'/></td><td><input type='button' id='openModyBtn" + this.destination_no + "' style='border-style: double; background-color: white; border-color: darkgrey;' onclick='popup(" + this.destination_no + ");' value='수정'/>&nbsp<input type='button' style='border-style: double; background-color: white; border-color: darkgrey;' id='deleteBtn" + this.destination_no + "' onclick='deleteDestiny(" + this.destination_no + ");' value='삭제'/></td><td><input type='button' style='border-style: double; background-color: white; border-color: chocolate; color:chocolate; border: 1px;'  onclick='defaultDestiny(" + this.destination_no + ");' value='기본배송지로 변경' /></td></tr>"
		}
		
		if(data.length < 3){
			 $(".green_bg").css("display","");
		}else{
			$(".green_bg").css("display","none");
		}	
		
		});

			$("#tbodyDestinyList").html(DestinyList);
		
			
		});

	}
	
	
	
	
</script>
<style>
	
	.MyaddrList{
	
	    text-align: center;
	    font-size: 14px;
	}
	
	
	.MyaddrList th {
	border-bottom-width: thin;
    border-color: darkgray;
    text-align: center;
    font-size: 20px;
    border-top-style: solid;
    border-bottom-style: solid;
}

	#tbodyDestinyList tr{
	
	height: 90px;

	}
	
	
	.MyaddrList td {
	
	border-bottom-style: outset;
	    
	}
	
	input[class^="modiform"] {
	text-align: center;
	width: 100%;
	border-style: none;
	margin: 2px 0px;
	
	}
	
	input[id^="nickname"] {
		font-size:15px;
	    font-weight: bold;
	}

.setting_btn {
	cursor: pointer;
	margin: 10px 0px;
	left: 74.3%;
    display: inline-block;
    position: relative;
    padding: 0 13px;
    border-color: dimgrey;
    background-color: dimgrey;
    border-radius: 0;
    line-height: 33px;
    color: #222;
    text-align: center;
    text-decoration: none;
    vertical-align: top;
}
.setting_btn .green_bg {
    border-color: dimgrey;
    background-color: dimgrey;
    color: #fff;
    text-decoration: none;
  	
    }
    
    .desc_delivery .setting_btn {
    position: absolute;
    right: 0;
    bottom: 0;
    font-size: 13px;
    font-weight: bold;
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
    <section class="shop-cart spad" style="margin-bottom: 200px;">
    	<a onclick="popup(0);" class="_insert setting_btn green_bg" style="color: white;">배송지 등록</a>
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
        <div style="font-weight: bold; float: right; margin-right: 20%; margin-top: 10px; font-size: 15px; color: chocolate;"> ※ &nbsp 최대 3개까지 저장 가능합니다.</div>
    </section>
    <!-- Shop Cart Section End -->

<!-- 	<div> -->
<!-- 		<iframe id="iframeForScroll" style="border: none; width: 100%;height:-webkit-fill-available; "src="/mall/destinationsList/register"></iframe> -->
		
<!-- 	</div> -->





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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<head>
 <meta charset="UTF-8">

<script>

var didScroll; 

function getcheck(){
	
	console.log("12");
	
}

// $("window").scroll(function(event){
// didScroll = true; 
// });

// // hasScrolled()를 실행하고 didScroll 상태를 재설정 
// setInterval(function() {
// 	 if (didScroll) { hasScrolled(); didScroll = false;
// 		 hasScrolled();
// 		 didScroll = false;
	 
// 		 } 
// 	 }, 250); 
 
//  function hasScrolled() { // 동작을 구현 }
//  	console.log("!");
 
//  }


	let member_id = "${loginMember.member_id}";

// function getChkListYet(){
	 	
// 	 	console.log(member_id);
// 		$.ajax({
// 			method: "get",
// 			url: "/mall/main/getChkListYet",
// 			dataType: "text", // 응답 받는 데이터 타입
// 			data : {"member_id" : member_id
// 			},
// 			success : function(result){
					
// 					$("#CheckListCnt").html("체크리스트 (" + result + ")개");
// 					let size = 134 + (result * 35);
// 					$("#chklistIframe").css("max-height",size + "px");
// 			}
// 		});
	
// }




	 function viewCheckList(){
		 
		 console.log($("#chklistIframe").css("display"));
				if($("#chklistIframe").css("display") == "none"){
					 
					 $("#chklistIframe").css("display","block");
					 $("#CheckListCnt").html("체크리스트 닫기");
					 $(".radios").css("background-color","#111");
					 $(".radios").css("color","white");
			
				}else{
					 $("#chklistIframe").css("display","none");
				
// 					getChkListYet();
					 $(".radios").css("background-color","#fff");
					 $(".radios").css("color","#333");
				} 
	 }
		 
		 
		 	
$(function(){
		
	 if(member_id != null){
		 console.log("접속한 유저가 있다");
// 		 getChkListYet();	 
	 }	
	 
});

</script>

<style>


 .radios{
    right: 5%;
    bottom: 45px;
    width: 170px;
	position: fixed;
 	z-index: 99999;
    height: 50px;
    padding: 0 20px 0 20px;
    border-radius: 25px;
    border: 1px solid #555;
    background-color: #fff;
    box-shadow: 0 5px 14px 0 rgb(0 0 0 / 10%);
    font-size: 14px;
    line-height: 48px;
    letter-spacing: -.3px;
    color: #333;
    transition: right .4s;
 
/*     display:none; */
    
 }
 

</style>



</head>	
	

		<!--  박종진 작업 체크리스트  -->
			
			
			<div class="radios" id="checkListCntContainer" style="cursor:pointer;" onclick="viewCheckList();">
	  		<div id="chklistIframe"  style=" position: fixed; display:none; right:1%; top:35%; width:600px; height: -webkit-fill-available; overflow:hidden; max-height: 513px;">
	  		
<!--   			<iframe onload="getChkListYet();" id="iframeForScroll" style="border: none; width: 100%;height:-webkit-fill-available; "src="../../../myPage/checkList"></iframe> -->
  				
<!-- 			<iframe id="iframeForScroll" style="border: none; width: 100%;height:-webkit-fill-available; "src="/mall/destinationsList/register"></iframe> -->
			<iframe id="iframeForScroll" style="border: none; width: 100%;height:-webkit-fill-available; "src="../../../myPage/checkList"></iframe>
			
			
  			</div>
	  		<span id="CheckListCnt" style="margin-left: 15px; ">체크리스트(회원 전용)</span>
	  	</div>
	  
			
			
			
			
			
			
			
			
			<!--  박종진 작업 체크리스트  -->
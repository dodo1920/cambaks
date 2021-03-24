<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>체크리스트 뉴 버전</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>

	let member_id = '${loginMember.member_id}';
	let checkList_no = 0;
	let output = "";
	let checkList_checked = "";
	let checkedCnt = 0;
	let noncheckedCnt = 0;
	
	function changeView(getVal){
		
			if(getVal == 'active'){
				console.log("active");
				$('li[name=checkedCompleted]').css('display','none');
			}else if(getVal == 'completed'){
				console.log("completed");
				$('li[name=checkedCompleted]').css('display','');
				$('li[name=noncheckedList]').css('display','none');
			}else if(getVal == 'all'){
				console.log("all");
				$('li[name=checkedCompleted]').css('display','');
				$('li[name=noncheckedList]').css('display','');
			}
			
		
	}
	
	function deleteAll(){
		console.log(member_id);	
		
			if(checkedCnt != 0){
				$.ajax({
			 		type: "POST", // method(토신 방식, get / post)
			 		dataType: "text", // 응답을 어떤 형식으로 받을지	
			 		url: "/checkList/ajax/deleteThis/" + member_id, // 서블릿 주소
			 		headers: {	// 요청 하는 데이터의 헤더에 전송
						"Content-Type" : "application/json"
					},success: function(data){
						getAjaxCheckListAll();
			 		
			 	}, // 통신 성공시
			 		error: function(data){     
			 		}, // 통신 실패시
			 		complete: function(data){
			 		} // 통신 완료시
			 	});	
				
			};
		
		}
	
	function deleteThis(checkList_no){
		
		$.ajax({
	 		type: "get", // method(토신 방식, get / post)
	 		dataType: "text", // 응답을 어떤 형식으로 받을지	
	 		url: "/checkList/ajax/deleteThis/" + checkList_no, // 서블릿 주소
	 		headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
			},success: function(data){
				getAjaxCheckListAll();
	 		
	 	}, // 통신 성공시
	 		error: function(data){     
	 		}, // 통신 실패시
	 		complete: function(data){
	 		} // 통신 완료시
	 	});
		
	}
	
	function enterkey() {
	    if (window.event.keyCode == 13) {
	    	if($(".checkListInputBox").val() == ""){
	    		alert("내용을 입력해주세요.");
	    	}else{
	    		
	    		$("#searchFormGo").submit();
	    		
	    		getAjaxCheckListAll();
	    	}
	    	
	    }
	}
	
	
	function changeCheck(checkList_no){
		checkList_checked = $("#checkcheck" + checkList_no).val();
		checkedCnt = 0;
		noncheckedCnt = 0;
		
		$.ajax({
	 		type: "get", // method(토신 방식, get / post)
	 		dataType: "text", // 응답을 어떤 형식으로 받을지	
	 		url: "/checkList/ajax/change/" + checkList_checked  + "/" + checkList_no, // 서블릿 주소
	 		headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
			},success: function(data){
				getAjaxCheckListAll();
	 		
	 	}, // 통신 성공시
	 		error: function(data){     
	 		}, // 통신 실패시
	 		complete: function(data){
	 		} // 통신 완료시
	 	});
	}
	
	$(function() {
		getAjaxCheckListAll();

	});

	
	
	function getAjaxCheckListAll(){
	
	$.getJSON("/checkList/ajax/" + member_id, function(data){
	
		output = "";
		output += "<ul class='listCheck'>"
		$(data).each(function(index, item){
			let R = Math.floor(Math.random()*255);
			let G = Math.floor(Math.random()*255);
			let B = Math.floor(Math.random()*255);
			
			if(this.checkList_checked == 'Y'){
				output += "<li name='checkedCompleted'><img style='width:30px; height:30px; margin-right:20px; cursor:pointer;' src='../resources/img/check1.png' id='check_box" + this.checkList_no + "' onclick='changeCheck(" + this.checkList_no + ");' /><label for='check_box" + this.checkList_no + "'></label><input id='checkcheck" + this.checkList_no + "' type='hidden' value='" + this.checkList_checked + "'><input id='listno" + this.checkList_no + "' type='hidden' value='" + this.checkList_no + "'><span style='color: rgb(" + R + "," +  G + "," + B + ")'>" + this.checkList_content + "</span><img onclick='deleteThis(" + this.checkList_no + ")' style='float:right; margin: 7px 5px 0px 0px; width:20px; height:20px;' src='../resources/img/x.png'/></li>";
				checkedCnt++;
				
				
			}else{
				output += "<li name='noncheckedList'><img style='width:30px; height:30px; margin-right:20px; cursor:pointer;' src='../resources/img/noncheck.png' id='check_box" + this.checkList_no + "' onclick='changeCheck(" + this.checkList_no + ");' /><label for='check_box" + this.checkList_no + "'></label><input id='checkcheck" + this.checkList_no + "' type='hidden' value='" + this.checkList_checked + "'><input id='listno" + this.checkList_no + "' type='hidden' value='" + this.checkList_no + "'><span style='color: rgb(" + R + "," +  G + "," + B + ")'>" + this.checkList_content + "</span><img onclick='deleteThis(" + this.checkList_no + ")' style='float:right; margin: 7px 5px 0px 0px; width:20px; height:20px;' src='../resources/img/x.png'/></li>";
				noncheckedCnt++;
			}
			
//				output += "<li><label for='check_box'><img name='checkimg'style='width:30px; height:30px; margin-right:20px;' src='../resources/img/noncheck.png'><input type='checkbox' id='check_box" + this.checkList_no + "'/></label><input id='listno" + this.checkList_no + "' type='hidden' value='" + this.checkList_no + "'><span style='color: rgb(" + R + "," +  G + "," + B + ")'>" + this.checkList_content + "</span><span>"  + this.checkList_checked + "</span></li>";
		    
		});
		output += "<li style='border-bottom-style:outset; line-height: 35px; border-bottom-width: thick;'><span id='noncheckCnt'></span>" + noncheckedCnt + "items left<ul id='changeView_ul' class='filters'><li onclick='changeView(\"all\");' >All</li><li onclick='changeView(\"active\")'>Active</li><li onclick='changeView(\"completed\");' >Completed</li><li  onclick='deleteAll();' style='margin-left: 60px;'>Clear completed</li></ul></li>";
		<!--       <li><a href="#" >완료</a></li> -->
		<!--     </ul> -->
		output += "</ul>";
			console.log(checkedCnt);
			console.log(noncheckedCnt);
			$("#inputTodo").html (output);


	});

	}

</script>


<style>

body{

}

.checklist{
    width: 100%;
	margin-top:200px;
    left: 35%;
    top: -5%;
    position: absolute;
}

.listCheck{
    border-style: ridge;
    text-decoration: none;
    list-style: none;
    padding: 10px;
    margin-top: 1px;
    width: 500px;
}

.listCheck li{
    font-weight: bold;
    padding: 3px;
    font-size: 17px;
    border-style: ridge;
    border-color: mintcream;
}






/* #selected li {background-color:blue;} */


.listCheck li:select {
	
}



.filters {
  display: inline-flex; padding: 0; list-style: none; right: 0; left: 0; margin: 0px 0px 0px 25px; cursor: pointer;
}

.filters li{
	text-decoration: none;
    border: none;
    margin: 0px 5px;
    font-size: 12px;
   
}


.checkListBox{

	width: 35%;
	background-color: whitesmoke;
	

}
.checkListInputBox{
    font-weight: bold;
    font-size: 20px;
    width: 300px;
    width: 450px;
    height: 40px;
    opacity: 0.8;
    background-color: whitesmoke;
    padding: 5px;
    margin: 2px 1px 0px 47px;
    outline: none;
    font-weight: bold;
    font-size: 20px;
    width: 300px;
    width: 450px;
    height: 40px;
    opacity: 0.8;
    background-color: whitesmoke;
    padding: 5px;
    margin: 2px 1px 0px 47px;
    border: none;
    outline: none;
	
}




</style>



</head>
<body>
	<section class='checklist'>
	<h1>캠박이일 체크리스트</h1>
	<div class="checkListBox">
	<div style="margin: -1px 8px -3px 0px; border-style:ridge;">
	
	<input type="text" name="checkList_content" class="checkListInputBox" onkeydown="enterkey();" placeholder="해야할 일, 준비해야할 물건"/>

	</div>
	
	<div id="inputTodo" ></div>
	</div>
	</section>
	<hr />


</body>
</html>
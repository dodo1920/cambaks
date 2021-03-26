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
<script src="/resources/cambak21/js/checkList.js"></script>

<script>

	let member_id = '${loginMember.member_id}';
	let checkList_no = 0;
	let output = "";
	let checkList_checked = "";
	let checkedCnt = 0;
	let noncheckedCnt = 0;
	
	$(function() {
		getAjaxCheckListAll();
	});

	

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
    font-weight: 600;
}


.checkListBox{

	width: 35%;
	background-color: whitesmoke;
	

}
.checkListInputBox{
    font-weight: bold;
    font-size: 20px;
 	height: 40px;
    opacity: 0.8;
    background-color: whitesmoke;
    padding: 5px;
    margin: 2px 1px 0px 47px;
    outline: none;
    font-weight: bold;
    font-size: 20px;
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
	<div style="margin: -1px 0px -3px 0px; border-style:ridge;">
	<input type="text" name="checkList_content" class="checkListInputBox" onkeydown="enterkey();" placeholder="해야할 일, 준비해야할 물건"/>
	<input type="hidden" id="checkListmember_id" name ="member_id" value="${loginMember.member_id }"/>
	
	</div>
	
	<div id="inputTodo" ></div>
	</div>
	</section>
	<hr />


</body>
</html>
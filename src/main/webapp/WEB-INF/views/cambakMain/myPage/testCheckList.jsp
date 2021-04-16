<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>

<title> 테스트 체크리스트 </title>

<style type="text/css">



</style>

</head>
<body style="overflow: hidden;">

<section class='checklist'>

	
	<div class="checkListBox">
	<div style="margin: -1px 0px -3px 0px; border-style:ridge;">
	<input type="text" name="checkList_content" class="checkListInputBox" onkeydown="enterkey();" placeholder="해야할 일, 준비해야할 물건 입력하기(Enter Key)"/>
	<input type="hidden" id="checkListmember_id" name ="member_id" value="${loginMember.member_id }"/>
	
	</div>
	
	<div id="inputTodo" ></div>
	</div>
	
	
	</section>

</body></html>
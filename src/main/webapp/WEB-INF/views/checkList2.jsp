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
	
	function changeCheck(checkList_no){
		checkList_checked = $("#checkcheck" + checkList_no).val();
		checkedCnt = 0;
		nencheckedCnt = 0;
		
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
		
		$(".filters li").click(function(){
				$(".filters li").removeClass("selected");
				$(this).addClass("selected");
		});
	

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
				output += "<li><img style='width:30px; height:30px; margin-right:20px; cursor:pointer;' src='../resources/img/check1.png' id='check_box" + this.checkList_no + "' onclick='changeCheck(" + this.checkList_no + ");' /><label for='check_box" + this.checkList_no + "'></label><input id='checkcheck" + this.checkList_no + "' type='hidden' value='" + this.checkList_checked + "'><input id='listno" + this.checkList_no + "' type='hidden' value='" + this.checkList_no + "'><span style='color: rgb(" + R + "," +  G + "," + B + ")'>" + this.checkList_content + "</span></li>";
				checkedCnt++;
				console.log(checkedCnt);
				
			}else{
				output += "<li><img style='width:30px; height:30px; margin-right:20px; cursor:pointer;' src='../resources/img/noncheck.png' id='check_box" + this.checkList_no + "' onclick='changeCheck(" + this.checkList_no + ");' /><label for='check_box" + this.checkList_no + "'></label><input id='checkcheck" + this.checkList_no + "' type='hidden' value='" + this.checkList_checked + "'><input id='listno" + this.checkList_no + "' type='hidden' value='" + this.checkList_no + "'><span style='color: rgb(" + R + "," +  G + "," + B + ")'>" + this.checkList_content + "</span></li>";
				noncheckedCnt++;
			}
			
//				output += "<li><label for='check_box'><img name='checkimg'style='width:30px; height:30px; margin-right:20px;' src='../resources/img/noncheck.png'><input type='checkbox' id='check_box" + this.checkList_no + "'/></label><input id='listno" + this.checkList_no + "' type='hidden' value='" + this.checkList_no + "'><span style='color: rgb(" + R + "," +  G + "," + B + ")'>" + this.checkList_content + "</span><span>"  + this.checkList_checked + "</span></li>";
		    
		});
		output += "<li style='border-bottom-style:outset; line-height: 35px; border-bottom-width: thick;'><span id='noncheckCnt'></span>items left<ul class='filters'><li>All</li><li>Actice</li><li>Completed</li><li style='margin-left: 60px;'>Clear completed</li></ul></li>";
		<!--       <li><a href="#" >완료</a></li> -->
		<!--     </ul> -->
		output += "</ul>";
	     	
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
    left: 50%;
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
  display: inline-flex; padding: 0; list-style: none; right: 0; left: 0; margin: 0px 0px 0px 45px;
}

.filters li{
	text-decoration: none;
    border: none;
    margin: 0px 5px;
    font-size: 12px;
    
    
}








</style>



</head>
<body>
	<section class='checklist'>
	<h1>캠박이일 체크리스트</h1>
	<div>
	<input type="text" style="width:300px; width: 500px;  height: 40px; opacity: 0.8; border-color: cadetblue;;" placeholder="           해야할 일, 준비해야할 물건"/>
	<div id="inputTodo" ></div>
	</div>
	</section>
	<hr />

<!-- <section class="todoapp"> -->
<!--   <header class="header"> -->
<!--     <input class="new-todo" autocomplete="off" placeholder="Type your todo list" v-model="newTodo" @keyup.enter="addTodo"> -->
<!--       <button class="new-todo-button"  @click="addTodo"  v-show="newTodo.length > 0" ></button> -->
<!--   </header> -->
<!--   <section class="main" v-show="todos.length" v-cloak> -->
<!--     <div class="completed-wrapper"> -->
<!--       <input id="toggle-all" class="toggle-all" type="checkbox" v-model="allDone"> -->
<!--       <label for="toggle-all">Complete all tasks</label> -->
<!--       <button class="clear-completed" @click="removeCompleted"> -->
<!--         Clear completed -->
<!--       </button> -->
<!--     </div> -->
<!--     <ul class="todo-list"> -->
<!--       <li v-for="todo in filteredTodos"  class="todo" :key="todo.id"  :class="{ completed: todo.completed, editing: todo == editedTodo }"> -->
<!--         <div class="view"> -->
<!--           <input class="toggle" type="checkbox" v-model="todo.completed"> -->
<!--           <label @dblclick="editTodo(todo)">{{ todo.title }}</label> -->
<!--           <button class="destroy" @click="removeTodo(todo)"></button> -->
<!--         </div> -->
<!--         <input class="edit" type="text" v-model="todo.title" v-todo-focus="todo == editedTodo" @blur="doneEdit(todo)" @keyup.enter="doneEdit(todo)"  @keyup.esc="cancelEdit(todo)"> -->
<!--       </li> -->
<!--     </ul> -->
<!--   </section> -->
<!--   <footer class="footer" v-show="todos.length" v-cloak> -->
<!--     <span class="todo-count"> -->
<!--       <strong>{{ remaining }}</strong>  -->
<!--     </span> -->
<!--     <ul class="filters"> -->
<!--       <li><a href="#" >전체</a></li> -->
<!--       <li><a href="#" >미완료</a></li> -->
<!--       <li><a href="#" >완료</a></li> -->
<!--     </ul> -->
    
<!--         <span>완료 삭제</span> -->
    
<!--   </footer> -->
<!-- </section> -->







</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>캠박이일 체크리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
// 	$(function(){
// 		TodoFunc("startgo");
// 	})
	
	function delvalue(trNum){
		let deltodoName = trNum.children[0].textContent;
		let deltodoDate = trNum.children[1].textContent;
		let command = "deleteVal";
	$.ajax({
			type: "get", // method(토신 방식, get / post)
			dataType: "json", // 응답을 어떤 형식으로 받을지	
			url: "/checkList", // 서블릿 주소
			data: {deltodoName : deltodoName, deltodoDate : deltodoDate, command : command},// 보낼 데이터
			success: function(data){
				
					if(data.result == "ok" && data.count == "1"){
						TodoFunc("startgo");
					}else if ( data.result == "ok" && data.count == "0"){
						$("#inputTodo").append("저장 및 조회에 실패하였습니다.");
					}else if(data.result == "fail"){
						$("#inputTodo").append("연결 실패..");
					}
			
		}, // 통신 성공시
			error: function(data){     
			}, // 통신 실패시
			complete: function(data){
			} // 통신 완료시
		});
	}
	
	function modifyFunc(val){

		let afterName = $("#afterName").val();
		let afterDate = $("#afterDate").val();
		let prevName = $("#todoName").val();
		let prevDate = $("#todoDate").val();
		let command = "modifyVal";
	
		$.ajax({
			type: "get", // method(토신 방식, get / post)
			dataType: "json", // 응답을 어떤 형식으로 받을지	
			url: "/todoList/todolist", // 서블릿 주소
			data: {prevName : prevName, prevDate : prevDate, afterName : afterName, afterDate : afterDate, command : command},// 보낼 데이터
			success: function(data){
				
					if(data.result == "ok" && data.count == "1"){
						TodoFunc("startgo");
						console.log("수정 완료");
					}else if ( data.result == "ok" && data.count == "0"){
						$("#inputTodo").append("저장 및 조회에 실패하였습니다.");
					}else if(data.result == "fail"){
						$("#inputTodo").append("연결 실패..");
					}
			
					$("#todoName").val("");
					$("#afterName").val("");
					$("#defaultbutton").show();
					$("#modibutton").css("display","none");
					$("#modiCancle").css("display","none");
					$("#inputAfterName").css("display","none");
					$("#inputAfterDate").css("display","none");
					$("#inputTodoName").show();
					$("#inputTodoDate").show();
					
		}, // 통신 성공시
			error: function(data){     
			}, // 통신 실패시
			complete: function(data){
			} // 통신 완료시
		});
		
	}
	
	function modify(trNum){
		$("#afterName").val(trNum.children[0].textContent);
		$("#afterDate").val(trNum.children[1].textContent);
		$("#todoName").val(trNum.children[0].textContent);
		$("#todoDate").val(trNum.children[1].textContent);
		$("#defaultbutton").css("display","none");
		$("#inputTodoName").css("display","none");
		$("#inputTodoDate").css("display","none");
		$("#modibutton").show();
		$("#modiCancle").show();
		$("#inputAfterName").show();
		$("#inputAfterDate").show();
	}
	
	function cancleMody(){
	
		$("#todoName").val("");
		$("#inputTodoName").show();
		$("#inputTodoDate").show();
		$("#defaultbutton").show();
		$("#modibutton").css("display","none");
		$("#modiCancle").css("display","none");
		$("#inputAfterName").css("display","none");
		$("#inputAfterDate").css("display","none");
		
	}
	

	function TodoFunc(savego){
		let todoName = $("#todoName").val();
		let todoDate = $("#todoDate").val();
		
		$("#todoName").val("");
		$("#todoDate").val("");
		
		$.ajax({
			type: "post", // method(토신 방식, get / post)
			dataType: "json", // 응답을 어떤 형식으로 받을지	
			url: "/todoList/todolist", // 서블릿 주소
			data: {todoName : todoName, todoDate : todoDate, todoval : savego},// 보낼 데이터
			success: function(data){
				
				$("#inputTodo").empty();
					if(data.result == "ok" && data.count == "1"){
						$("#inputTodo").show();
						$("#inputTodo").empty();
						let output = "";
						output += "<table border='1'>";
						output += "<tr><th>일정 이름</th><th>일정 일자</th><th>삭제</th><th>수정</th></tr>";
						for(var i = 0; i < data.alltodolist.length; i++){
							let R = Math.floor(Math.random()*255);
							let G = Math.floor(Math.random()*255);
							let B = Math.floor(Math.random()*255);
							output += "<tr style='color: rgb(" + R + "," +  G + "," + B + ")' id='trNum" + i + "'><td>" + data.alltodolist[i].todoName + "</td>";
							output += "<td>"  + data.alltodolist[i].todoDate + "</td>";
							output += "<td><input type='button' value='삭제' onclick='delvalue(trNum" + i + ");'/></td><td><input type='button' value='수정' onclick='modify(trNum" + i + ");'/></td></tr>";
						}
						output += "</table>";
						$("#errorMsg").empty();
						$("#inputTodo").append(output);
						
					}else if ( data.result == "ok" && data.count == "0"){
						$("#inputTodo").append("저장 및 조회에 실패하였습니다.");
					}else if(data.result == "fail"){
						$("#inputTodo").append("연결 실패..");
					}else{
						$("#errorMsg").empty();
						$("#errorMsg").append("목록이 없습니다.");
					}
			}, // 통신 성공시
			error: function(data){     
			}, // 통신 실패시
			complete: function(data){
			} // 통신 완료시
		});
	}

</script>



</head>

<body>


	<h1>ajax로 통신하여 TodoList 만들기</h1>
	<div>
	<div id="inputTodoName">Todo List 입력 : <input type="text" name="todoName" id="todoName" /></div>
	<div id="inputTodoDate">ToDo Date 입력 : <input type="date" name="todoDate" id="todoDate"  /></div><input id="defaultbutton" type="button" value="저장" onclick="TodoFunc('savego');"/>
	<div id="inputAfterName" style="display:none;"> Todo List 수정 : <input type="text" name="afterName"  id="afterName" /></div> <br/>
	<div id="inputAfterDate" style="display:none;"> ToDo Date 수정 : <input type="date" name="afterDate"  id="afterDate" /></div>
	
	<input id="modibutton" type="button" value="수정 완료" style="display:none;" onclick="modifyFunc();"/>
	<input id="modiCancle" type="button" value="취소" style="display:none;" onclick="cancleMody();"/><hr />
	<div id="errorMsg"></div>
	<div id="inputTodo" style="display:none;"></div>
	</div>
	
	<hr />


</body>
</html>
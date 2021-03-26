  
  function changeView(getVal){
		
			if(getVal == 'active'){
				$("#active").css('font-weight','bolder');
				$("#completed").css('font-weight','600');
				$("#clickAll").css('font-weight','600');
				$('li[name=noncheckedList]').css('display','');
				$('li[name=checkedCompleted]').css('display','none');
			}else if(getVal == 'completed'){
				$("#active").css('font-weight','600');
				$("#completed").css('font-weight','bolder');
				$("#clickAll").css('font-weight','600');
				$('li[name=checkedCompleted]').css('display','');
				$('li[name=noncheckedList]').css('display','none');
			}else if(getVal == 'all'){
				$("#active").css('font-weight','600');
				$("#completed").css('font-weight','600');
				$("#clickAll").css('font-weight','bolder');
				$('li[name=checkedCompleted]').css('display','');
				$('li[name=noncheckedList]').css('display','');
			}
		}
	
	function deleteAll(){
		
		noncheckedCnt = 0;
			if(checkedCnt != 0){
				$.ajax({
			 		type: "POST", // method(토신 방식, get / post)
			 		dataType: "text", // 응답을 어떤 형식으로 받을지	
			 		url: "/checkList/ajax/deleteAll/" + member_id, // 서블릿 주소
			 		headers: {	// 요청 하는 데이터의 헤더에 전송
						"Content-Type" : "application/json"
					},success: function(data){
						getAjaxCheckListAll();
				     }, 
			 	 // 통신 성공시
			 		error: function(data){
			 			
			 		}, // 통신 실패시
			 		complete: function(data){
			 		} // 통신 완료시
			 	});	
			};
		}
	
	function deleteThis(checkList_no){
		checkedCnt = 0;
		noncheckedCnt = 0;
		
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
	    		checkedCnt = 0;
	    		noncheckedCnt = 0;
	    		let member_id = $("#checkListmember_id").val();
		    	let checkList_content = $(".checkListInputBox").val();
		 
				$.ajax({
					method: "post",
					url: "/checkList/ajax/saveList/",
					headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
					},
					dataType: "text", // 응답 받는 데이터 타입
					data : JSON.stringify({	// 요청하는 데이터
						member_id : member_id,
						checkList_content : checkList_content
					}),
					success : function(result){
							$(".checkListInputBox").val("");
							getAjaxCheckListAll();
					}
				});
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
		output += "<li style='border-bottom-style:outset; line-height: 35px; border-bottom-width: thick;'><span id='noncheckCnt'></span>" + noncheckedCnt + "items left<ul id='changeView_ul' class='filters'><li id='clickAll' style='font-weight: bolder;' onclick='changeView(\"all\");' >All</li><li id='active' onclick='changeView(\"active\")'>Active</li><li id='completed' onclick='changeView(\"completed\");' >Completed</li><li  onclick='deleteAll();' style='margin-left: 60px;'>Clear completed</li></ul></li>";
		output += "</ul>";
			console.log(checkedCnt);
			console.log(noncheckedCnt);
			$("#inputTodo").html (output);
		});
	}
	
	
	
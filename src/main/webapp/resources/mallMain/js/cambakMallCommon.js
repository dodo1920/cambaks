/**
 * 캠박몰에서 공통적으로 사용될 코드
 */

//사이트 헤더에 있는 검색 창 열고 닫기 css 변경 - 서효원 작성
function searchSiteControll() {
	$("body").click(function(e){
		if(!$(e.target).hasClass("searchIconBtn") && !$(e.target).hasClass("searhcInput")){
			$("#searchForm").css("display", "none");
			$("#keyword").val("");
			$("#searchIcon").attr("onclick", "viewSearchForm();");
		}
	})
}

//검색어 입력창에 입력 후 엔터 시 체크 - 서효원 작성
function formSearchBtn() {
	let searchKeyword = $("#keyword").val();
	
	if (event.keyCode === 13) {
		if (searchKeyword.length == 0) {
			alert("검색어를 입력해주세요");
		} else {
			$("#searchForm").attr("onsubmit", "");
			$("#searchForm").submit();
		}
	};
	
}

//검색 아이콘 눌렀을 경우 입력창 보여주기 - 서효원 작성
function viewSearchForm() {
	$("#searchForm").css("display", "inline-block");
	$("#searchIcon").attr("onclick", "searchBtn();");
}

// 입력창에 작성 후 검색 아이콘 눌렀을 경우 검색 - 서효원 작성
function searchBtn() {
	let searchKeyword = $("#keyword").val();
	
	if (searchKeyword.length == 0) {
		alert("검색어를 입력해주세요");
	} else {
		$("#searchForm").attr("onsubmit", "");
		$("#searchForm").submit();
	}

// 캠박몰 로그인 - 서효원 작성
function loginRequestCheck() {
	let member_id = $("#member_id").val();
	let member_password = $("#member_password").val();
	
	$.ajax({
		  method: "POST",
		  url: "/user/cambakLoginCheck",
		  dataType: "text",
		  data : {member_id : member_id, member_password : member_password},
		  success : function(data) {
			  if (data == "memberCheck") {
					$.ajax({
						  method: "POST",
						  url: "/user/login",
						  dataType: "text",
						  data : {member_id : member_id, member_password : member_password}
						});
					location.reload();
			  } else {
				  alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다");
			  }
		  }, error : function(data) {
			  alert(data);
        }
		  
		});
}

}
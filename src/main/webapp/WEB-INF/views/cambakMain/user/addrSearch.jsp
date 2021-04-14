<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jquery -->
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>

function addrSearchEnter() {
	if (event.keyCode == 13) {
		addrSearch(1);
	}
}

function closeBtn() {
	parent.closeAddrBar();
}

function addrSearch(currentPage) {
	
	let confmKey = "devU01TX0FVVEgyMDIxMDQxNDEyMzkxMzExMTA0OTg=";
	let countPerPage = 10;
	let keyword = $("#searchAddr").val();
	let resultType = "json";
	console.log(currentPage);
	$.ajax({
		 url :"https://www.juso.go.kr/addrlink/addrLinkApi.do"  //인터넷망
		,type:"post"
		,data:{keyword : keyword, confmKey : confmKey, currentPage : currentPage, countPerPage : countPerPage, resultType : resultType}
		,dataType:"json"
		,crossDomain:true
		,success:function(data){
			console.log(data);
			let addr = data.results.juso;
			let totalCount = data.results.common.totalCount;
			let output = "";
			console.log(totalCount);
			$("#resultContent").empty();
			
			output += '<div class="result" id="resultList"><table class="table table-striped"><thead>';
			output += '<tr><th class="addrTitle">No</th><th class="addrTitle">도로명주소</th><th class="addrTitle">우편번호</th></tr></thead><tbody>';
			
			
			for (let i = 0; i < addr.length; i++) {
				output += '<tr class="dataBox"><td style="padding-top: 17px;">';
				
				if (currentPage == 1) {
					output += i + 1;
				} else if (currentPage != 1) {
					output += ((currentPage + 1) * 10) + i; 
				}
				
				output += '</td>';
				output += '<td><a href="#"><span style="display: block;"><b>' + addr[i].roadAddr + '</b></span>';
				output += '<span>[지번]</span>&nbsp;<span id="jibunAddrDiv1">' + addr[i].jibunAddr + '</span></a></td>';
				output += '<td>' + addr[i].zipNo + '</td></tr>';
			}
			
			let lastPage = 0; // 총 페이지 수
			
			
			if (totalCount < 10) {
				
				output += '</tbody></table></div>';
				output += '<ul class="pagination pagination-sm">';
				output += '<li><a onclick="addrSearch(1);">1</a></li>';
				output += '</ul>';
				
			} else {
				
				if (totalCount % countPerPage == 0) {
					lastPage = totalCount / countPerPage;
				} else {
					lastPage = Math.ceil(totalCount / countPerPage);
				}
				
				console.log(lastPage);
				output += '</tbody></table></div>';
				output += '<ul class="pagination pagination-sm">';
				
				if (currentPage != 1) {
					output += '<li><a onclick="addrSearch(1);">첫페이지</a></li>';
					output += '<li><a onclick="addrSearch(' + (currentPage - 3) + ');">이전</a></li>';
				}
				
				if (currentPage > 3 && currentPage < lastPage - 2) {
					output += '<li id="thisPage' + (currentPage - 2) + '"><a onclick="addrSearch(' + (currentPage - 2) + ');">' + (currentPage - 2) + '</a></li>';
					output += '<li id="thisPage' + (currentPage - 1) + '"><a onclick="addrSearch(' + (currentPage - 1) + ');">' + (currentPage - 1) + '</a></li>';
					output += '<li id="thisPage' + currentPage + '"><a onclick="addrSearch(' + currentPage + ');">' + currentPage + '</a></li>';
					output += '<li id="thisPage' + (currentPage + 1) + '"><a onclick="addrSearch(' + (currentPage + 1) + ');">' + (currentPage + 1) + '</a></li>';
					output += '<li id="thisPage' + (currentPage + 2) + '"><a onclick="addrSearch(' + (currentPage + 2) + ');">' + (currentPage + 2) + '</a></li>';
				} else if (currentPage >= lastPage - 2) {
					output += '<li id="thisPage' + (lastPage - 2) + '"><a onclick="addrSearch(' + (lastPage - 2) + ');">' + (lastPage - 2) + '</a></li>';
					output += '<li id="thisPage' + (lastPage - 1) + '"><a onclick="addrSearch(' + (lastPage - 1) + ');">' + (lastPage - 1) + '</a></li>';
					output += '<li id="thisPage' + currentPage + '"><a onclick="addrSearch(' + lastPage + ');">' + lastPage + '</a></li>';
				} else {
					output += '<li id="thisPage1"><a onclick="addrSearch(1);">1</a></li>';
					output += '<li id="thisPage2"><a onclick="addrSearch(2);">2</a></li>';
					output += '<li id="thisPage3"><a onclick="addrSearch(3);">3</a></li>';
					output += '<li id="thisPage4"><a onclick="addrSearch(4);">4</a></li>';
					output += '<li id="thisPage5"><a onclick="addrSearch(5);">5</a></li>';
				}
				
				if (currentPage == lastPage - 1) {
					output += '<li><a onclick="addrSearch(' + lastPage + ');">마지막페이지</a></li>';
				} else if (currentPage != lastPage) {
					output += '<li><a onclick="addrSearch(' + (currentPage + 3) + ');">다음</a></li>';
					output += '<li><a onclick="addrSearch(' + lastPage + ');">마지막페이지</a></li>';	
				}
				
				output += '</ul>';
				
			}
			
			$("#resultContent").append(output);
			$("#thisPage" + currentPage).attr("class", "active");
		}
	    ,error: function(xhr,status, error){
	    	alert("에러가 발생했습니다. 다시 시도 후 문의바랍니다.");
	    }
	});
	
}

</script>

<style>
.content {
  position: absolute;
  z-index: 1;
  left: 0;
  top: 0;
  min-width: 500px;
  min-height: 400px;
  width: 100%;
  border: 0 none;
}

.titleBar {
 position: relative;
 text-align: center;
 background-color: #fff;
 background-repeat: no-repeat;
 background-position: 100% 100%;
}

.searchBar {
  display: block;
  position: relative;
  background: #eee;
  border-bottom: 1px solid #e9e9e9;
  margin: 0 auto;
  padding: 15px 0;
}

.inputBar {
  display: block;
  width: 420px;
  position: relative;
  box-sizing: border-box;
  border: 2px solid #186bb9;
  margin: 0 auto;
  padding: 0 39px 0 0;
  background-color: #fff;
}

.inputTextBar {
  width: 100%;
  line-height: 40px;
  font-size: 12px;
  font-weight: normal;
  border: 0 none;
}

.searchBtn {
  cursor: pointer;
  position: absolute;
  right: 0;
  top: 0;
  width: 39px;
  background: url(/resources/cambak21/img/addrSearchIcon.png) 50% 50% no-repeat;
  height: 45px;
  border: 0 none;
}

.closeBtn {
  position: absolute;
  right: 10px;
  top: 35px;
  margin-top: -12px;
  width: 24px;
  height: 24px;
  background: url(/resources/cambak21/img/closeButton.png) 50% 50% no-repeat;
  text-indent: -9999px;
}

.dataBox {
  height: auto;
  padding: 10px 0;
}

.addrTitle {
  text-align: center;
}
</style>
</head>
<body> 
<div class="content">
  <div class="titleBar">
    <div id="searchContentBox" style="min-height: 478px;">
        <div class="searchBar">
        <span class="inputBar">
            <input type="text" class="inputTextBar" id="searchAddr" onkeyup="addrSearchEnter();">
            <input type="button" class="searchBtn" onclick="addrSearch('1');">
        </span>
        </div>
     <div id="resultContent"></div>
      	  <a class="closeBtn" onclick="closeBtn();"></a>
    </div>
  </div>
</div>


</body>
</html>
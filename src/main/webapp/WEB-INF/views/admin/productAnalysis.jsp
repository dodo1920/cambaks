<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/assets/images/favicon.png">
    <title>Matrix Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="../../resources/adminAssets/libs/flot/css/float-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../../resources/adminDist/css/style.min.css" rel="stylesheet">
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://www.gstatic.com/charts/loader.js"></script>
   <!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">

google.charts.load("current", {packages:["corechart"]});

function checkDates() {
	
	let startDate = $("#startDate").val();
	
	let endDate =  $("#endDate").val();
	
	if(startDate == '' || endDate == ''){
		alert("날짜를 입력해 주세요");
		
	}else {
		 $.ajax({
	  			type : "get",
	  			dataType : "json", // 받을 데이터
	  			//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
	  			url : "productAnalysis/selectDate",// 서블릿 주소
	  			data : {startDate : startDate,
	  				endDate: endDate},
	  			success : function(result) {
	  				if (result != null) {
	  					console.log(result);
	  					window.setTimeout(200);
	  					google.charts.setOnLoadCallback(drawChart(result));
	  				}
	  				
	  				
	  				console.log("1");
	  			}, // 통신 성공시
	  			error : function(result) {
	  				
	  			}, // 통신 실패시
	  			complete : function(result) {
	  				console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	  				console.log(result);
//	   				if(result != null){
	  					
//	   				}
	  				
	  				
	  			} // 통신 완료시
	  		});
	}
	
	
}

function testAjax(obj) {
	let dateVal = 0;
	
	if(obj != null){
		dateVal = obj.id;
		console.log(dateVal);
	}
	console.log("@@@@@@@@@" + dateVal);
	
	 $.ajax({
			type : "get",
			dataType : "json", // 받을 데이터
			//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
			url : "productAnalysis/perDate",// 서블릿 주소
			data : {dateVal : dateVal},
			success : function(result) {
				console.log(result);
				if (result != null) {
					
					window.setTimeout(200);
					google.charts.setOnLoadCallback(drawChart(result));
					google.charts.setOnLoadCallback(drawChart1(result));
				}
				
				
				console.log("1");
			}, // 통신 성공시
			error : function(result) {
				
			}, // 통신 실패시
			complete : function(result) {
				console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				console.log(result);
//				if(result != null){
					
//				}
				
				
			} // 통신 완료시
		});
}

function drawChart(result) {
	 var data = new google.visualization.DataTable();
   	
	 data.addColumn('string', '제품명');
	 data.addColumn('number', '판매수량');
	 
	for(i = 0; i < result.length; i++){
		var product_count = result[i].product_count;
		var product_name = result[i].product_name;
		
		data.addRow([product_name, product_count]);
	}

    var options = {
      title: '판매 수량 top 10',
      is3D: true,
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
    chart.draw(data, options);
  }

function drawChart1(result) {
	 var data = new google.visualization.DataTable();
  	
	 data.addColumn('string', '제품명');
	 data.addColumn('number', '판매수량');
	 
	for(i = 0; i < result.length; i++){
		var buyProduct_totPrice = result[i].buyProduct_totPrice;
		var product_name = result[i].product_name;
		
		data.addRow([product_name, buyProduct_totPrice]);
	}

   var options = {
     title: '판매 금액 top 10',
     is3D: true,
   };

   var chart = new google.visualization.PieChart(document.getElementById('piechart_3d2'));
   chart.draw(data, options);
 }
  
function defaultDate() {
	var now = new Date();

	var day = ("0" + now.getDate()).slice(-2);
	var month = ("0" + (now.getMonth() + 1)).slice(-2);

	var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
	$("#endDate").val(today);
	$("#startDate").val(today);
    
}

function changeDate() {
	var now = new Date();
	
	var day = ("0" + now.getDate()).slice(-2);
	var month = ("0" + (now.getMonth() + 1)).slice(-2);

	var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
	
	if($("#endDate").val() > today){
		alert("현재날짜보다 큰 값을 입력할 수 없습니다.");
		$("#endDate").val(today);
	}
}
function changeStartDate() {
	var now = new Date();
	
	var day = ("0" + now.getDate()).slice(-2);
	var month = ("0" + (now.getMonth() + 1)).slice(-2);

	var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
	
	if($("#startDate").val() > today){
		alert("현재날짜보다 큰 값을 입력할 수 없습니다.");
		console.log($("#startDate").val());
		$("#startDate").val(today);
	}
}
$(function(){
	
	defaultDate();
});

</script>
</head>
<body>
<div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
<div id="main-wrapper">
	<!-- 헤더 -->
	<%@ include file="adminTop.jsp" %>
	<!-- 어사이드 -->
	<%@ include file="adminAside.jsp" %>
	
	<div class="page-wrapper">
	<div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">상품별 판매 비중</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
	<!-- 본문 작성  -->
	<div class="container-fluid">



<div style="margin-top: 50px;height:150px;background-color:#ddd;" >
	<table class="table table-bordered h-25">
    <thead>
      <tr style="height:80px;background-color:#ddd;margin-top: 50px">
        <td style="vertical-align: middle;text-align: center" class="w-25">기간</td>
        <td style="vertical-align: middle;text-align: left">  <div class="btn-group btn-group-lg">
    <button type="button" class="btn btn-primary" id="0" onclick='testAjax(this);'>오늘</button>
    <button type="button" class="btn btn-primary" id="3" onclick='testAjax(this);'>3일</button>
    <button type="button" class="btn btn-primary" id="7" onclick='testAjax(this);'>7일</button>
    <button type="button" class="btn btn-primary" id="30" onclick='testAjax(this);'>30일</button>
    <button type="button" class="btn btn-primary" id="90" onclick='testAjax(this);'>90일</button>
    <input type="hidden" id="hidVal" value="1"/>
    <input type="date" style="margin-left:10px;margin-right: 10px" id = "startDate" name="startDate" onchange="changeStartDate();"> ~ 
    <input type="date" style="margin-left:10px;margin-right: 10px" id="endDate" name="endDate" onchange="changeDate();"/>
    
  </div>
  </td>
        
      </tr>
    </thead>
   
  </table>
  <input type="button" class="btn btn-primary btn-lg" style="position: absolute; left: 50%; " value="검색" onclick="checkDates();"/>
</div>

<div>
	 <div id="piechart_3d" style="width: 800px; height: 500px;float: left"></div>
	 <div id="piechart_3d2" style="width: 800px; height: 500px;float: left"></div>
</div>
	</div>
	<!-- 본문 작성 끝  -->
     <%@ include file="adminFooter.jsp" %>    
     <%@ include file="adminJs.jsp" %> 
	</div>
	
</div>
 
</body>
</html>
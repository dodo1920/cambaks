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
    google.charts.load("current", {packages:['corechart']});
    
    
    
    
    function testAjax() {
    	 $.ajax({
  			type : "get",
  			dataType : "json", // 받을 데이터
  			//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
  			url : "revenue/perDate",// 서블릿 주소
  			
  			success : function(result) {
  				console.log(result);
  				google.charts.setOnLoadCallback(drawChart(result));
  			}, // 통신 성공시
  			error : function(result) {
  				
  			}, // 통신 실패시
  			complete : function(result) {
  				$(result).each(function(index, obj) {
  					console.log(obj);
  					
  				});
  				
  			} // 통신 완료시
  		});
	}
    
    function drawChart(result) {
    	var data = new google.visualization.DataTable();
    	data.addColumn('string', '연도');
    	data.addColumn('number', '금액');
    	 
    	
    	console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		console.log(result);
         
    	 for(var i = 0; i < result.length; i++){
    		 
    		 var time = result[i].payment_date;
    		 var date = new Date(time);
    		 var dateTime = date.getFullYear()+ "/ "+ (date.getMonth()+1)+"/ "+date.getDate()
    		 data.addRow([dateTime, result[i].buyProduct_totPrice]);
    	 }
    	 
    	 
      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1]);

      var options = {
        title: "일자별 매출",
        width: 600,
        height: 400,
        bar: {groupWidth: "70%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
    
    $(function(){
    	testAjax();
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
                        <h4 class="page-title">매출</h4>
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
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">일별 매출</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">주별 매출</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">월별 매출</a>
    </li>
   
  </ul>
</nav>

<form action="">
<div style="margin-top: 50px;height:150px;background-color:#ddd;" >
	<table class="table table-bordered h-25">
    <thead>
      <tr style="height:80px;background-color:#ddd;margin-top: 50px">
        <td style="vertical-align: middle;text-align: center" class="w-25">기간</td>
        <td style="vertical-align: middle;text-align: left">  <div class="btn-group btn-group-lg">
    <button type="button" class="btn btn-primary">오늘</button>
    <button type="button" class="btn btn-primary">3일</button>
    <button type="button" class="btn btn-primary">7일</button>
    <input type="date" style="margin-left:10px;margin-right: 10px"> ~ <input type="date" style="margin-left:10px;margin-right: 10px">
  </div>
  </td>
        
      </tr>
    </thead>
   
  </table>
  <input type="submit" class="btn btn-primary btn-lg" style="position: absolute; left: 50%; " value="검색"/>
</div>
</form>
<div>
	<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
</div>
	</div>
	<!-- 본문 작성 끝  -->
     <%@ include file="adminFooter.jsp" %>    
     <%@ include file="adminJs.jsp" %> 
	</div>
	
</div>
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 화면 너비 자동반응 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 아이콘 및 타이틀 -->
    <link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
    <title>Cambak's - Admin Pages</title>
    <!-- Custom CSS -->
    <link href="../resources/adminAssets/libs/flot/css/float-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
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
                        <h4 class="page-title">Dashboard</h4>
                    </div>
                </div>
            </div>
	<!-- 본문 작성  -->
	<div class="container-fluid">
		<H3>DAD S마넝</H3>
	</div>
	<!-- 본문 작성 끝  -->
     <%@ include file="adminFooter.jsp" %>    
     <%@ include file="adminJs.jsp" %> 
	</div>
	
</div>
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>Cambark's</title>

<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/SHWtamplet.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>

<script>



</script>
<style>

.\34 u {
   width: 100%;
}

.profile {
   box-sizing: border-box;
   width: 200px;
   text-align: center;
   border: 1px solid #F0F2F0;
   margin-bottom: 120px 50px 0px 0px;
       
}

.profileSize {
   background-color: #F0F2F0;
   padding: 20px 0px;
}

.userProfileImg {
    width: 64px;
    height: 64px;
    border-radius: 70%;
    overflow: hidden;   
}

.profileEmail {
    font-size: 13px;
}

.nav-stacked>li{
   margin-top: -10px;
}

.nav>li>a {
    position: relative;
    display: block;
    padding: 5px 15px;
}

#category-title{

    text-align-last: center;
    
    }

.panel-success {
    margin-top: 25px;
    border-color: #d6e9c6;
}

.profileMenu1{
margin-top: 10px;
}


</style>
</head>
<body>
<%@include file="../cambak21Header.jsp"%>

<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row">
			
		<%@include file="myPageAside.jsp"%>
			
			
			
			
			
		</div>
	</div>
</div>

<%@include file="../cambak21Footer.jsp"%>
	
</body>

</html>
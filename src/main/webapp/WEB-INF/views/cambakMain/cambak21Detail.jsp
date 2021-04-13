<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>Cambark's</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/resources/cambak21/js/skel.min.js"></script>
	<script src="/resources/cambak/21js/skel-panels.min.js"></script>
	<script src="/resources/cambak21/js/init.js"></script>

	<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
	
	<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
	<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
	
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=887fe4aa88407b63eba44422c0a6fef4"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	
		
	<style>
		@import url(/resources/cambak21/css/SHWtamplet.css);
		
		#main {
			padding-bottom: 0px;
		}
		
		.\38 u {
			width : 100%;
		}
		
		.\34 u {
			width : 100%;
			margin : 0px;
		}
		
		#research {
			margin-bottom: 3%;
		}
		
		.row {
			margin-right: 0px;
		}
		.container {
 			padding-left: 0px;
 		}
 		
 		.campingImg {
 			padding-bottom: 0px;
 		}
		
		#campingListContainer {
			height:788px;
			border : 1px solid black;
			overflow: scroll;
		}
		
		iframe {
			width: 100%;
		}
    
    <!-- 김정민 CSS -->
    
    
    
    <!-- -->
    
	</style>
	
	<script>
	
	//쿼리문에서 해당 항목 값을 찾아주는 함수
	function getParameter(param) {
		var returnVal; //리턴할 값을 저장하는 변수
		var url = location.href; //url주소
		// console.log(url);
		var params = url.slice(url.indexOf("?") + 1, url.length).split("&");
		// console.log(params);

		for (var i in params) {
			var paraName = params[i].split("=")[0]; // 매개변수명 얻음
			if (param.toLowerCase() == paraName.toLowerCase()) {
				returnVal = params[i].split("=")[1];
				return decodeURIComponent(returnVal);
			}
		}

		return -1; // 모든 배열 요소를 다 검색해도 매개변수가 없을때
	}
	

	
	let contentId = getParameter("contentId"); // 관광지 PK
	let weatherUrl;
	let X;
	let Y;
	
	// 날씨URL 변수 설정
	const weatherServiceKey = "&appid=e3d6df7622a5cd65dca26e2c8231e08a&units";
	
	console.log(typeof(contentId));
	
	function showCampingDetail() {
		
		$.ajax({
		    type		: "post",
		    url 		: "/index/campingDetail/" + contentId,
		    contentType : "application/json",
		    success 	: function(data) {
		    	console.log(data);
		    	//메인 이미지
		    	let campingFirstImgUrl = "<img src='" + data.camping_firstImageUrl + "' style=\"width: 640.547px; height:480.406px;\"/>";
				
		    	//캠핑장 이름
		    	let output = "<div><h3>" + data.camping_facltNm + "</h3></div>";
				
		    	
		    	output += "<div class='cont_tb'><table class='table'><tbody>";
		    	output += "<tr><th>주소</th><td>" + nullCheck(data.camping_addr1) + "</td></tr>";
		    	output += "<tr><th>문의처</th><td>" + nullCheck(data.camping_tel) + "</td></tr>";
		    	output += "<tr><th>캠핑장 환경</th><td>" + nullCheck(data.camping_lctCl) + "</td></tr>";
		    	output += "<tr><th>캠핑장 유형</th><td>" + nullCheck(data.camping_induty) + "</td></tr>";
		    	output += "<tr><th>운영기간</th><td>" + nullCheck(data.camping_operPdCl) + "</td></tr>";
		    	output += "<tr><th>운영일</th><td>" + nullCheck(data.camping_operDeCl) + "</td></tr>";
		    	output += "<tr><th>예약방법</th><td>" + nullCheck(data.camping_resveCl) + "</td></tr>";
		    	output += "</tbody></table><div>";
		    	
		    	let campingInfoDetail = "<div>" + nullCheck(data.camping_intro) + "</div>";
		    	
				//메인 이미지 출력
				$("#campingFirstImgUrl").html(campingFirstImgUrl);
				//캠핑장 간략 정보 출력
				$("#basicDesc1").html(output);
				
				//캠핑 상세 설명 출력
				$("#detailedDesc").html(campingInfoDetail);
		    }
		
			, complete : function(data) {
		    	console.log(data.responseJSON);
		    	X = data.responseJSON.camping_mapY;
		    	Y = data.responseJSON.camping_mapX;
		    	weatherUrl = "http://api.openweathermap.org/data/2.5/weather?lat=" + X + "&lon=" + Y + weatherServiceKey + "=metric";
				console.log(weatherUrl);
				ajaxLoading(weatherUrl, 2);
				mapApi(X, Y);
		    	
			}
		}); // end of ajax
	}
	
	// 받은 json url 주소를 바탕으로 데이터 로딩하는 부분!
	function ajaxLoading(dataUrl, urlType) {
		$.ajax({
			url: dataUrl, // 데이터가 송수신 될 곳
			dataType: "json", // 수신할 데이터의 타입
			type: "GET", // 통신 방식
			success: function (data) { // 통신이 성공 했을때 수행되는 콜백함수
				// console.log(data);
				parseTour(data, contentId, urlType);
			},
			error: function (response) { // 통신 실패시
				alert("통신 실패 : " + response.responseText);
			}
		});
	}
	
	// 데이터 로딩 후, 1)상세내용2)이미지3)날씨 관련 파싱하는 부분!
	function parseTour(data, contentId, urlType) {
		let tour = " ";
		let selectedContentId = " ";
		let weatherList = " ";

		switch (urlType) {
			// 상세내용일 때,
			case 0:
				tour = data.response.body.items.item;
				selectedContentId = contentId;
				printDataURL(tour, selectedContentId);
				console.log(tour);
				console.log(selectedContentId);
				break;
			// 이미지일 때,
			case 1:
				tour = data.response.body.items.item;
				selectedContentId = contentId;
				printImageUrl(tour, selectedContentId);
				break;
			// 날씨일 때,
			case 2:
				weatherList = data;
				printWeatherDataUrl(weatherList);
				console.log(weatherList);
				break;
		}
	}
	
	//3) 날씨 데이터 파싱 함수
	function printWeatherDataUrl(itemData) {
		let weatherData;
		// let weatherDataCheck = itemData;
		// console.log(weatherDataCheck);
		$.each(itemData, function (index, item) {
			weatherData = "<div><h3 style='margin-top: 0%;'>현지 날씨</h3></div><div class='cont_tb'><table class='table'><tbody><tr><th>기온</th><td>" + itemData.main.temp + "도" + "</td></tr><tr><th>시간당 최저/최고기온</th><td> " + itemData.main.temp_min + "도 / " + itemData.main.temp_max + "도" + "</td></tr><tr><th>일몰 시간</th><td>" + msToTime(itemData.sys.sunset) + "</td></tr><tr><th>습도/풍속</th><td>"+ itemData.main.humidity + "% / " + itemData.wind.speed + " m/s </td></tr></tbody></table></div>";
		});
		$("#weather").html(weatherData);
	}
	
	//3-1)일기예보 시간 변환 함수
	let duration = " ";
	function msToTime(duration) {
		let _gmt = new Date();  // GMT시간
		duration = new Date(_gmt.getTime() + (_gmt.getTimezoneOffset() * 60000));

		let milliseconds = parseInt((duration % 1000) / 100)
			, seconds = parseInt((duration / 1000) % 60)
			, minutes = parseInt((duration / (1000 * 60)) % 60)
			, hours = parseInt((duration / (1000 * 60 * 60)) % 24);

		hours = (hours < 10) ? "0" + hours : hours;
		minutes = (minutes < 10) ? "0" + minutes : minutes;
		seconds = (seconds < 10) ? "0" + seconds : seconds;
		return hours + ":" + minutes + ":" + seconds; //"." + milliseconds;
	}
	
	// //카카오 지도 api 연동 및 표시 부분 함수
	function mapApi(X, Y) {
		console.log(X, Y);
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(X, Y), //지도의 중심좌표.
			//center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		let markerPosition = new kakao.maps.LatLng(X, Y); // 위도, 경도 객체
		let marker = new kakao.maps.Marker({
			position: markerPosition
		}); // 마커 객체 생성

		marker.setMap(map);
	}
	
	// 데이터 Url 항목 검사 함수(null인지 아닌지)
	function nullCheck(itemData) {
		let fixedData;
		fixedData = itemData;
		if (fixedData == null) {
			fixedData = "";
		}
		return fixedData;
	}
	
	$(function() {
		showCampingDetail();
	});
    
    
    
	</script>
</head>

<body>
    <%@include file="cambak21Header.jsp"%>
    
    	<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
				<section>
				<header>
					<h2>캠핑장 검색</h2>
<!--            	<span class="byline" id="rollNot"><a href="#">공지가 들어갈 자리입니다.</a></span> -->
				</header>
				<div id="research">
		        <!-- <form> -->
		           <div class="input-group">
		              <input type="text" class="form-control" size="50" placeholder="Search" onkeypress="enterKey();">
		                 <div class="input-group-btn">
		                    <button type="button" class="btn btn-danger search" onclick="sendKeyword();">Search</button>
		                 </div>
		            </div>
		        </div>
		        	<div id="content">
			            <div class="row">
			            <div class="col-sm-12">
				            <!-- 이미지 4장 출력 부분 -->
				            <div class="row" id="imageListBox">
								<div class="col-md-6" id="campingFirstImgUrl">
									<div class="well">
									대표이미지
									</div>
								</div>
								<div class="col-md-6" id="imgListBox">
									<div class="row">
										<div class="col-md-6" id="imageList1">
											이미지1
											<!-- <div class="well"></div> -->
										</div>
										<div class="col-md-6" id="imageList2">
											이미지2
											<!-- <div class="well"></div> -->
										</div>
									</div>
									<div class="row">
										<div class="col-md-6" id="imageList3">
											이미지3
											<!-- <div class="well"></div> -->
										</div>
										<div class="col-md-6" id="imageList4">
											이미지4
											<!-- <div class="well"></div> -->
										</div>
									</div>
								</div>
							</div>
							<!-- 지도 + 일기예보 -->
							<div class="row" id="descAndMap">
								<!-- 카카오 지도가 들어가는 부분 -->
								<div class="col-md-6" id="kakaoMap">
									<div class="well" id="map" style="width: 640.547px; height:539px;">
										<!-- <p></p> -->
									</div>
								</div>
								<!-- 야영지 기본정보 + 날씨예보 -->
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-12" id="basicDesc1" style="padding-left: 110px;">
											<div class="well">
												야영지 기본 정보
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12" id="weather" style="padding-left: 110px;">
											<div class="well">일기예보 위치</div>
										</div>
									</div>
								</div>
		
							</div><!-- end of 지도+일기예보 -->
							<!-- 장소 상세 설명 부분 -->
				            <div class="row" id="detailedBox">
								<div class="col-sm-12" id="detailedDesc">
									<div class="well">
									야영지 상세 설명
									</div>
								</div>
							</div>
			            	
			            </div><!-- end -->
					                
						</div>
					</div>                    
					</section>
				</div>
			</div>
		</div>
<!--  	<script>  -->
<!--  	</script>  -->

    <%@include file="cambak21Footer.jsp"%>
	
</body>


</html>
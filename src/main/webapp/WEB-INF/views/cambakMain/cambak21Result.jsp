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
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ea8351e29d05bbce3e8af30705e5907"></script> -->
	
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
		
		#keyword {
			border-radius: 0;
		}
		
		.btn {
			border: 1px solid #333;
			background-color: #333;
			color: #f1f1f1;
			border-radius: 0;
			transition: .2s;
			
		}
		
		.btn:hover {
			background-color: white;
			color: #333;
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
    
	</style>
	
	<script>
	
	let page = 1;
	let keyword = "${param.keyword}";
	
    $(document).ready(function () {
        // 공지들을 배열로 넣는 함수
        let notices = new Array();
        index = 0;

        notices.push("공지1");
        notices.push("공지2");
        notices.push("공지3");

        // 공지 롤링 함수를 호출하는 함수
        setInterval(
        	rolling(), 500
        );

        // 배열에 넣은 공지를 0번째부터 출력하여 롤릴하는 함수(+무한 롤링)
        function rolling() {
            $("#rollNot").fadeOut(3000, function () {
                for (let j = 0; j < 3; j++) {
                    if (index == j) {
                        $("#rollNot").html("<a href='http://zinsimi.cafe24.com/1_project/Do_bbsDetail.html?contentId=1116925&title=갈산근린공원&firstImage=http://tong.visitkorea.or.kr/cms/resource/62/2612062_image2_1.bmp'>" + notices[j] + "<a>").fadeIn(3000);
                    };
                };
                index++;
                rolling();
                if (index >= notices.length) {
                    index = 0;
                }
                console.log(index);
            });
        };

        $(".row").on("click", ".heartIcon", function () {
            fix(this);
        });

        $(".row").on("click", ".commentIcon", function () {
            fix2(this);
        });
        
        addCampings(page);
        
        pagingScroll();
        
    });
    
    function pagingScroll() {
    	$("#campingListContainer").scroll(function() {
//     		if(page < ${pagingInfo.endPage}){
//     			console.log($("#campingListContainer").scrollTop());
//     			console.log($(document).height()-282);
//     	        if ($("#campingListContainer").scrollTop() == $(document).height()-282) {
//     	        	page++;
//     	        	addCampings(page);
//     	        }
//         	} 
//     		// 페이지 스크롤이 완료된 경우,
//     		else{
//     			let output1 = '<div style="float:right;"><a href="" onclick="goToTop(); return false;"><img src ="../../../resources/img/go-up.png" style="width: 70px;"/></a></div>';
//         		$("#goUp").html(output1);
//         	}
    	});    	
    }
    
    function addCampings(pageNum) {
    	$.ajax({
    	    type		: "post",
    	    url 		: "/index/result?keyword=" + keyword + "&page=" + pageNum,
    	    contentType : "application/json",
    	    success 	: function(data) {
    	    	console.log(data);
//     	    	myTotPoint = String(data.myTotPoint);
//     	    	myTotFuturePoint = String(data.myTotFuturePoint);

//     	    	//console.log(myTotPoint);
//     	    	//console.log(typeof(myTotPoint));
//     	    	// 포인트 출력
//     			$("#myTotAvlPoint").html(myTotPoint);
//     			$("#myFuturePoint").html(myTotFuturePoint);
    	    	}
    			
    		});
    }
    
    
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
	                    <input type="text" class="form-control" id="keyword" size="50" placeholder="Search" onkeypress="enterKey();">
	                    <div class="input-group-btn">
	                        <button type="button" class="btn" onclick="sendKeyword();">Search</button>
	                    </div>
	                </div>
            <!-- </form> -->
		        </div>
		        <div id="content">
		            <div class="row">
		            	<div class="col-lg-6 col-md-6">
		            		<div class="contact__content" id="campingListContainer">
<%-- 				                            <c:if test="${campings == null}"> --%>
<!-- 					                        	<p> 검색결과 없음 </p> -->
<%-- 					                        </c:if> --%>
<%-- 					                        <c:if test="${campings != null}"> --%>
					                        	
<%-- 					                        	<c:forEach var="camping" items="${campings }"> --%>
<!-- 					                        	<table> -->
<!-- 					                        		<tr> -->
<%-- 					                        			<td rowspan="4" class="campingImg"><img src="${camping.camping_firstImageUrl }"  width="150px" height="150px"/></td> --%>
<%-- 					                        			<td><a href="../index/detail?contentId=${camping.camping_contentId}">${camping.camping_facltNm }</a></td> --%>
<!-- 					                        		</tr> -->
<!-- 					                        		<tr> -->
<!-- 			<!-- 		                        			<td>3</td> --> -->
<%-- 					                        			<td>${camping.camping_addr1 }  --%>
<%-- 					                        				<c:if test="${camping.camping_addr2 } == null"> </c:if> --%>
<!-- 					                        			</td> -->
<!-- 					                        		</tr> -->
<!-- 					                        		<tr> -->
<!-- 			<!-- 		                        			<td>5</td> --> -->
<%-- 					                        			<td>${camping.camping_tel }</td> --%>
<!-- 					                        		</tr> -->
<!-- 					                        		<tr> -->
<!-- 			<!-- 		                        			<td>7</td> --> -->
<!-- 					                        			<td>8</td> -->
<!-- 					                        		</tr> -->
<!-- 					                        	</table> -->
<%-- 					                        	</c:forEach> --%>
					                        	
<%-- 					                        </c:if> --%>
				                    </div>
				                </div>
				                <div class="col-lg-6 col-md-6">
				                    <div class="contact__map" id="map">
				                        <iframe
				                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d48158.305462977965!2d-74.13283844036356!3d41.02757295168286!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c2e440473470d7%3A0xcaf503ca2ee57958!2sSaddle%20River%2C%20NJ%2007458%2C%20USA!5e0!3m2!1sen!2sbd!4v1575917275626!5m2!1sen!2sbd"
				                        height="780" style="border:0" allowfullscreen="">
				                    </iframe>
				                </div>
				            </div>
						</div>
					</div>                    
					</section>
				</div>
			</div>
		</div>
<!--  	<script>  -->
// 	var container = document.getElementById('map');
// 	var options = {
// 		center: new kakao.maps.LatLng(33.450701, 126.570667),
// 		level: 3
// 	};

// 	var map = new kakao.maps.Map(container, options);
<!--  	</script>  -->

    <%@include file="cambak21Footer.jsp"%>
	
</body>


</html>
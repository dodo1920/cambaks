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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ea8351e29d05bbce3e8af30705e5907"></script>
	
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
		
		#map {
			height: 788px;
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
        
    });
    
    function addCampings(pageNum) {
    	$.ajax({
    	    type		: "post",
    	    url 		: "/index/result?keyword=" + keyword + "&page=" + pageNum,
    	    contentType : "application/json",
    	    success 	: function(data) {
    	    	console.log(data);
    	    	
    	    	showResult(data);
    	    	pagingScroll(data);
    	    	showMap(data);
    	    	}
    			
    		});
    }
    
    function showResult(data) {
    	let paging = data.pagings;
    	let campings = data.campings;
    	
    	console.log(campings);
    	let output ="";
    	
    	if(campings.length == 0) {
    		output += '<p> 검색결과 없음 </p>';
    	} else {
    		$(campings).each(function(index, item) {
    			output += '<table>';
    			output += '<tr><td rowspan="4" class="campingImg"><img src="' + item.camping_firstImageUrl + '"  width="150px" height="150px"/></td>';
    			output += '<td><a href="../index/detail?contentId=' + item.camping_contentId + '">' + item.camping_facltNm + '</a></td></tr>';
    			output += '<tr><td>' + item.camping_addr1 + '</td></tr>';
    			output += '<tr><td>' + item.camping_tel + '</td></tr>';
    			output += '<tr><td>8</td></tr>';
    			output += '</table>';
    		});
    	}
    	
    	$("#campingListContainer").append(output);
    }
    
    
    function pagingScroll(data) {
    	$("#campingListContainer").scroll(function() {
    		let paging = data.pagings;
    		if(page < paging.endPage){
    			let scroll = 0;
    			console.log($("#campingListContainer").height());
//     	        if () {
//     	        	scroll += $("#campingListContainer").scrollTop() - $(window).height() + 30;
//     	        	page++;
//     	        	addCampings(page);
//     	        }
        	} 
//     		// 페이지 스크롤이 완료된 경우,
//     		else{
//     			let output1 = '<div style="float:right;"><a href="" onclick="goToTop(); return false;"><img src ="../../../resources/img/go-up.png" style="width: 70px;"/></a></div>';
//         		$("#goUp").html(output1);
//         	}
    	});    	
    }
    
    function showMap(data) {
    	let campings = data.campings;
    	
    	let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    	let options = { //지도를 생성할 때 필요한 기본 옵션
        	center: new kakao.maps.LatLng(campings[0].camping_mapY,campings[0].camping_mapX), //지도의 중심좌표.
        	level: 13 //지도의 레벨(확대, 축소 정도)
        };

    	let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        
     	// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
        let positions = [campings.length];
    	

    	
        for (let i = 0; i < campings.length; i++) {
        	let content1 = '<div class="wrap">';
        	content1 += '<div class="info">';
        	content1 += '<div class="title">';
        	content1 += campings[i].camping_facltNm;
        	content1 += '<div class="close" onclick="closeOverlay()" title="닫기"></div></div>';
        	content1 += '<div class="body">';
        	content1 += '<div class="img">';
        	content1 += '<img src="' + campings[i].camping_firstImageUrl + '" width="73" height="70"></div>';
        	content1 += '<div class="desc">';
        	content1 += '<div class="ellipsis">' + campings[i].camping_addr1 + '</div>';
        	content1 += '<div class="jibun ellipsis">(우) ' + campings[i].camping_zipcode + '</div>';
        	content1 += '<div><a href="' + campings[i].camping_resveUrl + '" target="_blank" class="link">홈페이지</a></div></div></div></div></div>';

        	let position = {
        			content: content1, 
                    latlng: new kakao.maps.LatLng(campings[i].camping_mapY,campings[i].camping_mapX)	
        	}
        	
        	positions.push(position);
        	
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i + 1].latlng // 마커의 위치
            });

            // 마커에 표시할 인포윈도우를 생성합니다 
            var infowindow = new kakao.maps.InfoWindow({
                content: positions[i].content // 인포윈도우에 표시할 내용
            });

            // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
            // 이벤트 리스너로는 클로저를 만들어 등록합니다 
            // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        }
        
        console.log(positions);

        // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
        function makeOverListener(map, marker, infowindow) {
            return function() {
                infowindow.open(map, marker);
            };
        }

        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        function makeOutListener(infowindow) {
            return function() {
                infowindow.close();
            }; 
        }
    }
    
    function sendKeyword() {
    	let keyword = $("#keyword").val();
    	
    	location.href="/index/result?keyword=" + keyword;
    }
    
    function showBoard(flag) {
    	$.ajax({
			  method: "post",
			  url: "/index/resultBoard/" + flag + "/" + keyword + "/" + page,
			  headers: {	// 요청하는 데이터의 헤더에 전송
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "json", // 응답 받는 데이터 타입
			  success : function(data) {
				  console.log(data);
				  showList(data.boards);
				  addPaging(data.pagings, flag);
			  }			  
			}); 
    }
    
    function showList(data) {
    	let output = '';
    	
    	if(data.length == 0) {
    		output += '<p>데이터 없음</p>';
    	} else {
    		output += '<ul class="list-group">';
        	
        	$(data).each(function(index, item) {
        		output += '<li class="list-group-item">';
        		output += '<a href="#">' + item.board_title + '</a>';
        		output += '<div><span>작성자: ' + item.member_id + '</span>';
        		output += '<span> 작성일: ' + item.board_updateDate + '</span>'
        		output += '<span> 조회수: ' + item.board_viewCnt + '</span>'
        		output += '<span> 좋아요: ' + item.board_likeCnt + '</span>'
        		output += '</div>';
        		output += '<div>' + item.board_content + '</div>';
        		output += '</li>';
        	});
        	
        	output += '</ul><div id="paging"></div>';    	
    	}
    	
    	$("#content").html(output);
    }
    
    function addPaging(data, flag) {
    	if(data.length == 0) {
    		console.log("데이터 없음")
    	} else {
    		console.log(data);
    		let prev = Number(page) - 1;
    		let next = Number(page) + 1;
    		
    		let output = '<ul class="pagination">';
    		
    		if(page > 1) {
    			output += '<li><a href="javascript:void(0);" onclick="showBoard(' + flag + ')"> << </a></li>';
    			output += '<li><a href="javascript:void(0);" onclick="showBoard(' + flag + ')"> < </a></li>';
    		}
    		
    		for(let i = 1; i < data.endPage + 1; i++) {
    			page = i;
    			output += '<li><a href="javascript:void(0);" onclick="showBoard(' + flag + ')">' + i + '</a></li>';
    		}
    		
    		if(page < data.endPage) {
    			output += '<li><a href="javascript:void(0);" onclick="showBoard(' + flag + ')"> > </a></li>';
    			output += '<li><a href="javascript:void(0);" onclick="showBoard(' + flag + ')"> >> </a></li>';
    		}
    		
    		output += '</ul>';
    		
    		$("#paging").html(output);

    	}
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
	            		<input type="text" class="form-control" id="keyword" size="50" placeholder="Search" />
	                	<div class="input-group-btn">
	                    	 <button type="button" class="btn" onclick="sendKeyword();">Search</button>
	                	</div>
	            	</div>
            		<!-- </form> -->
		        </div>
		        <!-- 위에 카테고리 -->
				<div class="small-category">
					<nav class="navbar navbar-default" id="bsk-nav">
						<div class="container-fluid" id="bsk-smallCat">
							<ul class="nav navbar-nav">
								<li class="bsk-focus catagory-name"><a href="http://localhost:8081/index/result?keyword=${param.keyword }">전체보기</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('1');">캠핑 후기</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('2');">유머</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('3');">Q&A</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('4');">중고거래</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('5');">캠핑Tip</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('6');">공지사항</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('7');">고객센터</a></li>
							</ul>
						</div>
					</nav>
				</div>
		        <div id="content">
		        	<div class="col-lg-6 col-md-6">
		        		<div class="contact__content" id="campingListContainer">
				        </div>
				    </div>
				    <div class="col-lg-6 col-md-6">
				        <div class="well" id="map">
				        </div>
				    </div>
				</div>                  
				</section>
				</div>
			</div>
		</div>

    <%@include file="cambak21Footer.jsp"%>
	
</body>


</html>
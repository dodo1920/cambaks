<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Cambark's</title>
<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/cambak21/css/effectV5.css">
<link rel="stylesheet" href="/resources/cambak21/css/SHWtamplet.css" />
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script>
	let pageNo = 0;
    
	$(document).ready(function () {
        // Initialize Tooltip
        $('[data-toggle="tooltip"]').tooltip();

        // Add smooth scrolling to all links in navbar + footer link
        $(".navbar a, footer a[href='#myPage']").on('click', function (event) {

            // Make sure this.hash has a value before overriding default behavior
            if (this.hash !== "") {

                // Prevent default anchor click behavior
                event.preventDefault();

                // Store hash
                var hash = this.hash;

                // Using jQuery's animate() method to add smooth page scroll
                // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                $('html, body').animate({
                    scrollTop: $(hash).offset().top
                }, 900, function () {

                    // Add hash (#) to URL when done scrolling (default click behavior)
                    window.location.hash = hash;
                });
            } // End if
        });

        dataLoading();
        textLimitBoard();
    });

 	// 게시글 제목의 길이가 30개를 넣을 시 21번째 글짜부터 ...으로로 변환
    function textLimitBoard() {
    	$(".boardLinkSize").each(function() {
    		var length = 30; //표시할 글자수 정하기

    		$(this).each(function() {

    			if ($(this).text().length >= length) {

    				$(this).text($(this).text().substr(0, length) + '...')
    				//지정할 글자수 이후 표시할 텍스트
    			}
    		});
    	});
    };  
    
    // 각 테마 버튼 선택하면, 해당 결과 페이지로 이동 함수
    function thema(themaVal) {
        console.log(themaVal.innerHTML);
        let output = "http://zinsimi.cafe24.com/1_project/glory_searchresult.html?keyword=" + themaVal.innerHTML;
        // output += theamVal;
        console.log(output);
        // location.href = output; // 페이지 완성 후 주석 해제
    }

    // search창에 keyword를 입력하고 search버튼을 누르면, 해당 keyword에 대한 결과 페이지로 이동 함수
    function sendKeyword() {
        let keyword = document.getElementsByClassName("form-control")[0].value;
        if (keyword.length > 1) {
            let output = "http://zinsimi.cafe24.com/1_project/glory_searchresult.html?keyword=" + keyword;
            // output += theamVal;
            console.log(output);
            location.href = output; // 페이지 완성 후 주석 해제
        }
    };

    // search창에 keyword를 입력하고 엔터 누르면, 해당 keyword의 결과 페이지로 이동 함수
    function enterKey() {
        if (event.keyCode == 13) {
            sendKeyword();
        };
    };

    // 페이지 로딩하면 고캠핑 api 로딩하는 함수 (추천 캠핑장을 위해)
    function dataLoading() {
        pageNo = Math.floor(Math.random() * 257 + 1);
        // console.log(pageNo);
        let serviceKey =
            "LZek9TowzX7QwARv08FuPHojIPTBkuOzAUcTq592PziGQXdZjxOvllpYByBchlb7mDz9soxa9Fg39BYdhg%2FEHQ%3D%3D";
        let dataURL = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?serviceKey=" +
            serviceKey + "&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest";

        $.ajax({
            url: dataURL, // 데이터 송수신 될 곳
            dataType: "json", // 수신할 데이터의 타입
            type: "GET", // 통신 방식
            success: function (data) { // 통신이 성공 했을때 수행되는 callBack 함수
                console.log(data);
                parseTour(data);
            },
            error: function (response) { // 통신이 실패 했을 때 수행되는 callBack 함수
                alert("통신실패 : " + response.responseText);
            }
        });
    };

    // 로딩된 캠핑장 데이터를 파싱하고(객체로 배열 저장), 임의로 3개 선택하여 출력하는 함수
    // 캠핑장 데이터 중 필요한 자료만 추출해서 객체화 하기 위한 틀 만들기
    function RecomCamp(photo, title, addr, contentId) {
        this.photo = photo;
        this.title = title;
        this.addr = addr;
        this.contentId = contentId;
    };

    // 필요한 데이터 추출 및 객체화 & 배열로 묶기
    function parseTour(data) {
        let itemAr = data.response.body.items.item;
        console.log(itemAr);
        // console.log(itemAr.item);

        let recomcamps = new Array();

        $.each(itemAr, function (i, e) {
            let photo = e.firstImageUrl;
            let title = e.facltNm;
            let addr = e.addr1;
            let contentId = e.contentId;

            if (e.firstImageUrl != null) {
                recomcamps.push(new RecomCamp(photo, title, addr, contentId));
            };
        });

        // recomcamps.push(new RecomCamp());

        console.log(recomcamps);

        // 겹치지 않는 랜덤 번호 3개 추출 
        function isDuplicate(rndNum, ranNumAr) {
            var result = ranNumAr.indexOf(rndNum);
            if (result !== -1) {
                //중복 된다
                return true;
            }
            return false;
        }

        var ranNumAr = [0, 0, 0] // 배열 생성과 초기화


        for (var i = 0; i < ranNumAr.length; i++) {
            var rndNum = 0;
            do {
                //랜덤 한 수 생성
                rndNum = Math.floor(Math.random() * recomcamps.length);
                // console.log(rndNum);
            }
            while (isDuplicate(rndNum, ranNumAr))
            ranNumAr[i] = rndNum;
        }
        console.log(ranNumAr);
        // console.log(photoAr[ranNumAr[0]]);

        // 배열로 만든 데이터와 랜덤 번호 매칭해서 출력
        for (let i = 0; i < ranNumAr.length; i++) {
            document.getElementsByClassName("effect-milo")[i].innerHTML = '<img src="' + recomcamps[ranNumAr[i]]
                .photo + '" alt="img11" id="' + recomcamps[ranNumAr[i]].contentId + '" /><figcaption><h2><span>' +
                recomcamps[ranNumAr[i]].title + '</span></h2><p>' + recomcamps[ranNumAr[i]].addr +
                '</p><a href="#">View more</a></figcaption>';
        };

        $(".effect-milo").click(function () {
            let contentId = $(this).children()[0].attributes[2].value;
            // console.log(contentId);
            let output = "http://zinsimi.cafe24.com/1_project/KJM_tampletSub.html?contentId=" +
                contentId;
            console.log(output);
            location.href = output; // 페이지 완성 후 주석 해제
        });
    };
    
</script>

<style>

#footerContent {
	padding-top: 10px;
	border-top: 1px solid #dedede;
	font-size: 15px;
	color: #000;
}

#footerTitle {
	font-weight: bold;
	color: #3A4636;
	font-size: 23px;
}

#footerSubheading {
	font-size: 16px;
}

.BoardListHead {
	text-align: center;
}

.BoardListBody {
	text-align: center;
}

.moreView {
	float: right;
}

.plusBtn {
	width: 8px;
    margin-bottom: 3px;
}

.boardPageLink {
	width: 486px;
}

.boardLinkSize {
	color: #000;
}

.boardPageLink a:hover {
	color: #5d5d5d;
	text-decoration: none;
}

.moreViewBtn {
	color: #5d5d5d;
    font-size: 13px;
}

.moreView a:hover {
	color: #777;
	text-decoration: none;
}

</style>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/index/main">Logo</a>
                <a class="navbar-brand" href="/">캠박몰 바로가기</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">MENU<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                        	<c:choose>
                        		<c:when test="${loginMember != null }">
		                            <li><a href="/user/login/yet" id="loginBtn">로그아웃</a></li>
		                            <li><a href="/myPage/checkList">마이페이지</a></li>
		                            <li><a href="/board/campingreview/listcri?page=1">게시판</a></li>
		                            <li><a href="/board/notice/listCri?page=1">공지사항</a></li>
		                            <li><a href="/board/cs/list?page=1">고객센터</a></li>
                            	</c:when>
                            	<c:otherwise>
                            		<li><a href="/user/login/yet" id="loginBtn">로그인</a></li>
                            		<li><a href="/user/register" id="loginBtn">회원가입</a></li>
		                            <li><a href="/board/campingreview/listcri?page=1">게시판</a></li>
		                            <li><a href="/board/notice/listCri?page=1">공지사항</a></li>
		                            <li><a href="/board/cs/list?page=1">고객센터</a></li>
                            	</c:otherwise>
                            </c:choose>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <!-- <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol> -->

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="/resources/cambak21/img/main_bushcraft.jpg" alt="campfire" width="1200" height="800">
            </div>

            <div class="item">
                <img src="/resources/cambak21/img/main_bonfire.jpg" alt="tent" width="1200" height="800">
            </div>

            <div class="item">
                <img src="/resources/cambak21/img/thumb_tent.jpg" alt="bus" width="1200" height="800">
            </div>
        </div>

        <div class="carousel-search">
            <div class="thema">
                <div class="themaBtn"><a href="http://zinsimi.cafe24.com/1_project/glory_searchresult.html?keyword=야영장">봄</a></div>
                <div class="themaBtn"><a href="http://zinsimi.cafe24.com/1_project/glory_searchresult.html?keyword=계곡" >여름</a></div>
                <div class="themaBtn"><a href="http://zinsimi.cafe24.com/1_project/glory_searchresult.html?keyword=글램핑" >가을</a></div>
                <div class="themaBtn"><a href="http://zinsimi.cafe24.com/1_project/glory_searchresult.html?keyword=카라반" >겨울</a></div>
            </div>
            <h1>캠박이일</h1>
            <p>We are specialized in camping</p>
            <br />
            <!-- <form> -->
                <div class="input-group">
                    <input type="text" class="form-control" size="50" placeholder="Search" onkeypress="enterKey();">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-danger" onclick="sendKeyword();">Search</button>
                    </div>
                </div>
                <div id="search-res">
                </div>
            <!-- </form> -->
        </div>

        <!-- Left and right controls -->
        <!-- <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a> -->

    </div>

    <div class="grid">
        <h3 class="text-center" id="footerTitle">이달의 추천 둘레길</h3>
        <p class="text-center">What do you think about going there for this month break?<br> Enjoy your trip
            with fresh
            air and wonderful landscape!</p><br />
        <figure class="effect-milo">
        </figure>
        <figure class="effect-milo">
        </figure>
        <figure class="effect-milo">
        </figure>
    </div>
    <div id="contact" class="container">
        <h3 class="text-center" id="footerTitle">Cambark's board</h3>
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">캠핑후기</a></li>
            <li><a data-toggle="tab" href="#menu1">캠핑Tip</a></li>
            <li><a data-toggle="tab" href="#menu2">캠박마켓</a></li>
            <li><a data-toggle="tab" href="#menu3">Q&amp;A</a></li>
            <li><a data-toggle="tab" href="#menu4">유머</a></li>
        </ul>

        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
				<div class="moreView">
					<a href="/board/campingreview/listcri?page=1" class="moreViewBtn">캠핑후기 더보기<img src="/resources/cambak21/img/plus.png" class="plusBtn"/></a>
				</div>
				<table class="table">
				  <thead>
				    <tr>
				      <th class="BoardListHead">제목</th>
				      <th class="BoardListHead">추천</th>
				      <th class="BoardListHead">조회</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="review" items="${Boards.review }">
				    <tr class="BoardListBody">
				      <td class="boardPageLink"><a href="/board/campingreview/detail?no=${review.board_no }" class="boardLinkSize">${review.board_title }</a></td>
				      <td>${review.board_likeCnt }</td>
				      <td>${review.board_viewCnt }</td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
            </div>
            <div id="menu1" class="tab-pane fade">
				<div class="moreView">
					<a href="/board/campingTip/list?page=1" class="moreViewBtn">캠핑팁 더보기<img src="/resources/cambak21/img/plus.png" class="plusBtn"/></a>
				</div>
				<table class="table">
				  <thead>
				    <tr>
				      <th class="BoardListHead">제목</th>
				      <th class="BoardListHead">추천</th>
				      <th class="BoardListHead">조회</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="Tip" items="${Boards.Tip }">
				    <tr class="BoardListBody">
				      <td class="boardPageLink"><a href="/board/campingTip/view?id=Tip&no=${Tip.board_no }" class="boardLinkSize">${Tip.board_title }</a></td>
				      <td>${Tip.board_likeCnt }</td>
				      <td>${Tip.board_viewCnt }</td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
            </div>
            <div id="menu2" class="tab-pane fade">
				<div class="moreView">
					<a href="/board/resell/list?page=1" class="moreViewBtn">캠핑마켓 더보기<img src="/resources/cambak21/img/plus.png" class="plusBtn"/></a>
				</div>
				<table class="table">
				  <thead>
				    <tr>
				      <th class="BoardListHead">제목</th>
				      <th class="BoardListHead">추천</th>
				      <th class="BoardListHead">조회</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="Resell" items="${Boards.Resell }">
				    <tr class="BoardListBody">
				      <td class="boardPageLink"><a href="/board/resell/detail?no=${Resell.resellBoard_no }" class="boardLinkSize">${Resell.resellBoard_title }</a></td>
				      <td>${Resell.resellBoard_likeCnt }</td>
				      <td>${Resell.resellBoard_viewCnt }</td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
            </div>
            <div id="menu3" class="tab-pane fade">
				<div class="moreView">
					<a href="/board/qa/list.bo?page=1" class="moreViewBtn">Q&amp;A 더보기<img src="/resources/cambak21/img/plus.png" class="plusBtn"/></a>
				</div>
				<table class="table">
				  <thead>
				    <tr>
				      <th class="BoardListHead">제목</th>
				      <th class="BoardListHead">추천</th>
				      <th class="BoardListHead">조회</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="QA" items="${Boards.QA }">
				    <tr class="BoardListBody">
				      <td class="boardPageLink"><a href="/board/qa/detail.bo?no=${QA.board_no }" class="boardLinkSize">${QA.board_title }</a></td>
				      <td>${QA.board_likeCnt }</td>
				      <td>${QA.board_viewCnt }</td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
            </div>
            <div id="menu4" class="tab-pane fade">
				<div class="moreView">
					<a href="/cambakMain/board/humor/listAll?page=1" class="moreViewBtn">유머 더보기<img src="/resources/cambak21/img/plus.png" class="plusBtn"/></a>
				</div>
				<table class="table">
				  <thead>
				    <tr>
				      <th class="BoardListHead">제목</th>
				      <th class="BoardListHead">추천</th>
				      <th class="BoardListHead">조회</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="Humor" items="${Boards.Humor }">
				    <tr class="BoardListBody">
				      <td class="boardPageLink"><a href="/cambakMain/board/humor/read?no=${Humor.board_no }" class="boardLinkSize">${Humor.board_title }</a></td>
				      <td>${Humor.board_likeCnt }</td>
				      <td>${Humor.board_viewCnt }</td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
            </div>
        </div>
    </div>

	<!-- Footer -->
	<footer class="text-center">
		<div id="contact" class="container">
			<h3 class="text-center" id="footerTitle">Cambark's Info</h3>
			<div class="row">
				<div class="col-md-2" id="footerSubheading">
					<p>계절별 캠핑장</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>캠박게시판</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>캠박몰</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>고객센터</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>캠박이일 제작 1팀</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>캠박이일 제작 2팀</p>
				</div>
				<div class="col-md-2" id="footerContent" style="border-top: 1px solid #dedede;">
					<p><a>봄</a></p>
					<p><a>여름</a></p>
					<p><a>가을</a></p>
					<p><a>겨울</a></p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p><a href="/board/campingreview/listcri?page=1">캠핑 후기 게시판</a></p>
					<p><a href="/board/campingTip/list?page=1">캠핑Tip 게시판</a></p>
					<p><a href="">캠박마켓 게시판</a></p>
					<p><a href="/board/qa/list.bo?page=1">Q&amp;A 게시판</a></p>
					<p><a href="/cambakMain/board/humor/listAll?page=1">유머 게시판</a></p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p>1</p>
					<p>2</p>
					<p>3</p>
					<p>4</p>
					<p>5</p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p><a href="/board/notice/listCri?page=1">공지사항</a></p>
					<p><a href="/board/cs/list?page=1">1:1문의</a></p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p>김대기</p>
					<p>장원영</p>
					<p>이영광</p>
					<p>김도연</p>
					<p>김태훈</p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p>박종진</p>
					<p>김정민</p>
					<p>서효원</p>
					<p>백승권</p>
				</div>
			</div>
			<!-- 위로 가기 버튼-->
			<a href="#" class="top"><img
				src="/resources/cambak21/images/top.png" class="topMove"></a>
			<!-- 위로 가기 버튼-->
		</div>
	</footer>
	<!-- /Footer -->

</body>

</html>
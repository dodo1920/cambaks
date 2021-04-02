<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <title>teamProject_Main</title>
    <link rel="icon" type="image/x-icon" href="./assets/favicon.ico" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script>
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
        });

        let pageNo = 0;

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
        @import url(css/effectV5.css);
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
                <a class="navbar-brand" href="http://zinsimi.cafe24.com/1_project/Do_main5.html">Logo</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">MENU<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="glory-login.html" id="loginBtn">로그인
                                </a></li>
                            <li><a href="Do_bbsList.html">게시판</a></li>
                            <li><a href="SHW_myCamping.html">마이페이지</a></li>
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
                <img src="img/main_bushcraft.jpg" alt="campfire" width="1200" height="800">
            </div>

            <div class="item">
                <img src="img/main_bonfire.jpg" alt="tent" width="1200" height="800">
            </div>

            <div class="item">
                <img src="img/thumb_tent.jpg" alt="bus" width="1200" height="800">
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
        <h3 class="text-center">이달의 추천 둘레길</h3>
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
        <h3 class="text-center">OUR TEAM MEMBERS</h3>
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">김대기</a></li>
            <li><a data-toggle="tab" href="#menu1">김정민</a></li>
            <li><a data-toggle="tab" href="#menu2">이영광</a></li>
            <li><a data-toggle="tab" href="#menu3">서효원</a></li>
            <li><a data-toggle="tab" href="#menu4">김도연</a></li>
        </ul>

        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
                <h2>김대기, 체크리스트 페이지</h2><br />
                <p>체크리스트 & 회원가입, ID/PW 찾기 페이지(+ 지도 팝업 기능)</p>
            </div>
            <div id="menu1" class="tab-pane fade">
                <h2>김정민, 상세 페이지</h2><br />
                <p>상세페이지 & 회원탈퇴 페이지</p>
            </div>
            <div id="menu2" class="tab-pane fade">
                <h2>이영광, 검색 결과 페이지</h2><br />
                <p>검색 결과 페이지& 로그인, 캠핑 일기 게시판 페이지</p>
            </div>
            <div id="menu3" class="tab-pane fade">
                <h2>서효원, 캠핑 일기 작성 페이지</h2><br />
                <p>캠핑 일기 작성 페이지 & 마이페이지, 회원 정보 수정 페이지, 결과 없음 페이지 (+전체 CSS) </p>
            </div>
            <div id="menu4" class="tab-pane fade">
                <h2>김도연, 메인 페이지</h2><br />
                <p>메인 페이지 & 게시판, 게시글 상세 페이지</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center">
        <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a><br>
        <div id="contact" class="container">
            <!-- <h3 class="text-center">Contact</h3>
            <p class="text-center"><em>We love our fans!</em></p> -->

            <div class="row">
                <div class="col-md-4">
                    <p>Feel free to contact us:)</p>
                    <p><span class="glyphicon glyphicon-map-marker"></span>서울, 대한민국</p>
                    <p><span class="glyphicon glyphicon-phone"></span>Phone: +00 1515151515</p>
                    <p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p>
                    <p><span class="glyphicon glyphicon-envelope"></span>SNS</p>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
                        </div>
                        <div class="col-sm-6 form-group">
                            <input class="form-control" id="email" name="email" placeholder="Email" type="email"
                                required>
                        </div>
                    </div>
                    <textarea class="form-control" id="comments" name="comments" placeholder="Comment"
                        rows="5"></textarea>
                    <br>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <button class="btn pull-right" type="submit">Send</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </footer>



</body>

</html>
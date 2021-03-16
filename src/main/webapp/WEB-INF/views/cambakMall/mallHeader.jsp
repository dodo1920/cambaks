<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<head>
 <meta charset="UTF-8">
</head>
    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__close">+</div>
        <ul class="offcanvas__widget">
            <li><span class="icon_search search-switch"></span></li>
     
            <li><a href="#"><span class="icon_bag_alt"></span>
                <div class="tip">2</div>
            </a></li>
        </ul>
        <div class="offcanvas__logo">
            <a href="./index.html"><img src="resources/mallMain/img/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__auth">
            <a href="#">Login</a>
            <a href="#">Register</a>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-2">
                    <div class="header__logo">
                        <a href="#"><img src="resources/mallMain/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="#">텐트/타프</a>
                              <ul class="dropdown">
                                    <li><a href="#">텐트</a></li>
                                    <li><a href="#">타프</a></li>
                                </ul></li>
                            <li><a href="#">침낭/매트</a>
                               <ul class="dropdown">
                                    <li><a href="#">침낭</a>
                                    <li><a href="#">매트</a></li>
                                </ul></li>
                            <li><a href="#">테이블/체어/배트</a>
                             <ul class="dropdown">
                                    <li><a href="#">경랑 테이블</a></li>
                                    <li><a href="#">체어</a></li>
                                </ul></li>
                            <li><a href="#">랜턴</a></li>
                            <li><a href="#">액세서리</a>
                               <ul class="dropdown">
                                    <li><a href="#">담요</a></li>
                                    <li><a href="#">쿨러/아이스박스</a></li>
                                </ul></li>
                            <li><a href="#">화로/히터</a>
                               <ul class="dropdown">
                                    <li><a href="#">착화재</a></li>
                                    <li><a href="#">화로대</a></li>
                                </ul></li>
                            <li><a href="#">수납/케이스</a></li>
                            <li><a href="#">키친/취사용품</a>
		                         <ul class="dropdown">
		                              <li><a href="#">설거지용품</a></li>
		                              <li><a href="#">식기/일반</a></li>
		                              <li><a href="#">버너</a></li>
		                          </ul></li>
             		    </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__right">
                        <div class="header__right__auth">
                            <a href="#">Login</a>
                            <a href="#">Register</a>
                        </div>
                        <ul class="header__right__widget">
                            <li><span class="icon_search search-switch"></span></li>
                            <li><a href="#"><span class="icon_bag_alt"></span>
                                <div class="tip">2</div>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End --> 
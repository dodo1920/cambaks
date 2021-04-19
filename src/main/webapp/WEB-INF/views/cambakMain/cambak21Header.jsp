<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- Header -->
	<div id="header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/index/main">Logo</a>
					<a class="navbar-brand" href="/">캠박몰 바로가기</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">MENU<span class="caret"></span></a>
							<ul class="dropdown-menu">
	                        	<c:choose>
	                        		<c:when test="${loginMember != null }">
			                            <li><a href="/myPage/checkList">마이페이지</a></li>
			                            <li><a href="/board/campingreview/listcri?page=1">게시판</a></li>
			                            <li><a href="/board/notice/listCri?page=1">공지사항</a></li>
			                            <li><a href="/board/cs/list?page=1">고객센터</a></li>
			                            <li><a href="/user/logout" id="loginBtn">로그아웃</a></li>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<li><a href="/user/login/yet" id="loginBtn">로그인</a></li>
	                            		<li><a href="/user/register">회원가입</a></li>
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


		<div class="container">

			<!-- Logo -->
			<div id="logo">
				<h1>캠박이일</h1>
				<span class="tag">We are specialized in camping</span>
			</div>
		</div>
	</div>

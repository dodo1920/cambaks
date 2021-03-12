<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- Tweet -->
	<div id="tweet">
		<div class="container">
			<section>
				<blockquote>
					&ldquo;진정한 여행은 새로운 풍경을 보러가는 것이 아니라, <br />세상을 바라보는 또 하나의 눈을 얻어오는
					것이다.&rdquo;
				</blockquote>
			</section>
		</div>
	</div>
	<!-- /Tweet -->

	<!-- Footer -->
	<footer class="text-center" id="foot">
		<div id="contact" class="container">
			<h3 class="text-center">Contact</h3>
			<p class="text-center">
				<em>We love our fans!</em>
			</p>

			<div class="row">
				<div class="col-md-4">
					<p>Feel free to contact us:)</p>
					<p>
						<span class="glyphicon glyphicon-map-marker"></span>서울, 대한민국
					</p>
					<p>
						<span class="glyphicon glyphicon-phone"></span>Phone: +00
						1515151515
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span>Email:
						mail@mail.com
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span>SNS
					</p>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-sm-6 form-group">
							<input class="form-control" id="name" name="name"
								placeholder="Name" type="text" required>
						</div>
						<div class="col-sm-6 form-group">
							<input class="form-control" id="email" name="email"
								placeholder="Email" type="email" required>
						</div>
					</div>
					<textarea class="form-control" id="comments" name="comments"
						placeholder="Comment" rows="5"></textarea>
					<br>
					<div class="row">
						<div class="col-md-12 form-group">
							<button class="btn pull-right" type="submit">Send</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 위로 가기 버튼-->
			<a href="#" class="top"><img
				src="/resources/cambak21/images/top.png" class="topMove"></a>
			<!-- 위로 가기 버튼-->
		</div>
	</footer>
	<!-- /Footer -->

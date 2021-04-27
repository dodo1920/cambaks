<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<title>Cambak's - Admin Pages</title>
<!-- css -->
<link href="../resources/adminDist/css/bootstrap.min.css"
	type="text/css">
<link href="../resources/adminDist/css/font-awesome.min.css"
	type="text/css">
<link href="../resources/adminDist/css/elegant-icons.css"
	type="text/css">
<link href="../resources/adminDist/css/jquery-ui.min.css"
	type="text/css">
<link href="../resources/adminDist/css/magnific-popup.css"
	type="text/css">
<link href="../resources/adminDist/css/owl.carousel.min.css"
	type="text/css">
<link href="../resources/adminDist/css/slicknav.min.css" type="text/css">
<link href="../resources/adminDist/css/style.css" type="text/css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../resources/adminAssets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="../resources/adminAssets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../resources/adminAssets/libs/quill/dist/quill.snow.css">


<!-- js -->
<script src="../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<script
	src="../resources/adminAssets/libs/popper.js/dist/umd/popper.min.js"></script>
<script
	src="../resources/adminAssets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script
	src="../resources/adminAssets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../resources/adminAssets/extra-libs/sparkline/sparkline.js"></script>
<script src="../resources/adminDist/js/waves.js"></script>
<script src="../resources/adminDist/js/sidebarmenu.js"></script>
<script src="../resources/adminDist/js/custom.min.js"></script>
<script
	src="../resources/adminAssets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="../resources/adminDist/js/pages/mask/mask.init.js"></script>
<script
	src="../resources/adminAssets/libs/select2/dist/js/select2.full.min.js"></script>
<script
	src="../resources/adminAssets/libs/select2/dist/js/select2.min.js"></script>
<script
	src="../resources/adminAssets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
<script
	src="../resources/adminAssets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
<script
	src="../resources/adminAssets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
<script
	src="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
<script
	src="../resources/adminAssets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/adminAssets/libs/quill/dist/quill.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
// 		var quill = new Quill('#editor', {
// 			modules : {
// 				toolbar : '#toolbar'
// 			}
// 		});

		var toolbarOptions = [
			  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
			  ['blockquote', 'code-block'],

			  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
			  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
			  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
			  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
			  [{ 'direction': 'rtl' }],                         // text direction

			  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
			  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

			  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
			  [{ 'font': [] }],
			  [{ 'align': [] }],
			  ['image', 'code-block'],
			  ['clean']                                         // remove formatting button
		];
			
		var quill = new Quill('#editor', {
			modules: {
			  toolbar: toolbarOptions
			},
			theme: 'snow'
		});
		
		quill.getModules('toolbar').addHandler('image', function () {
			imgCallback(); // 이미지 업로드 콜백 함수 실행
		})
		
		// 콜백 함수 실행
		function imgCallback() {
			let input = document.createElement('input');
			input.setAttribute('type', 'file');
			input.click();
		}
		
		
	})
	
	
</script>
<style type="text/css">
td.table_title {
	width: 190px;
}

td.table_title {
	font-size: 17px;
	font-weight: bold;
}

input[type="text"] {
	background-color: lightgrey;
	border: 1px;
	padding: 6px;
}

.btn-Wrap {
	display: flex;
	justify-content: center;
	padding: 50px 0;
}
</style>

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
		<%@ include file="adminTop.jsp"%>
		<!-- 어사이드 -->
		<%@ include file="adminAside.jsp"%>

		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">상품 등록</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Library</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- 본문 작성  -->
			<div class="container-fluid">
				<div class="container">
					<form method="post">
						<table class="table table-bordered">
							<tr>
								<td class="table_title">제품이름</td>
								<td><input type="text" value="활활화로" style="width: 300px"
									class="input_style"></td>
							</tr>
							<tr>
								<td class="table_title">매입가</td>
								<td><input type="text" value="활활화로" style="width: 200px"
									class="input_style"></td>
							</tr>
							<tr>
								<td class="table_title">매입수량</td>
								<td><input type="text" value="활활화로" style="width: 200px"
									class="input_style"></td>
							</tr>
							<tr>
								<td class="table_title">제조사</td>
								<td><input type="text" value="활활화로" style="width: 300px"
									class="input_style"></td>
							</tr>
							<tr>
								<td class="table_title">상품 이름</td>
								<td><input type="text" value="활활화로" style="width: 600px"
									class="input_style"> [ 0 / 250 ]</td>
							</tr>
						</table>
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">Quill Editor</h4>
										<!-- Create the editor container -->
										<div id="toolbar">
										</div>
										<div id="editor" style="height: 300px;"></div>
									</div>
								</div>
							</div>
						</div>

						<table class="table table-bordered">
							<tr>
								<td class="table_title">대표 이미지</td>
								<td><input type="file" value="활활화로"> <br>- 권장
									사이즈 : 412 x 412 / 10M 이하 / gif, png, jpg(jpeg)</td>
							</tr>
							<tr>
								<td class="table_title">미리보기</td>
								<td><img alt="" src="../resources/img/test.jpg"></td>
							</tr>
							<tr>
								<td class="table_title">대분류</td>
								<td><select>
										<option>-대분류-</option>
										<option>텐트/타프</option>
										<option>텐트/타프</option>
										<option>텐트/타프</option>
										<option>텐트/타프</option>
										<option>기타</option>
								</select></td>
							</tr>
							<tr>
								<td class="table_title">소분류</td>
								<td><select>
										<option>-소분류-</option>
										<option>국자</option>
										<option>젓가락</option>
										<option>숟가락</option>
										<option>모자</option>
										<option>신발</option>
								</select></td>
							</tr>
							<tr>
								<td class="table_title">판매가</td>
								<td><input type="text" value="50,000" style="width: 200px"
									class="input_style"> [ 상품가 : 0원 / 과세금액 : 0원 / 과세상품 :
									10% ]</td>
							</tr>
							<tr>
								<td class="table_title">진열 여부</td>
								<td><select>
										<option>진열함</option>
										<option>진열안함</option>
								</select></td>
							</tr>
							<tr>
								<td class="table_title">인기 상품 진열 여부</td>
								<td><select>
										<option>진열함</option>
										<option>진열안함</option>
								</select> <span> [ 쇼핑몰 하단에 랜덤으로 상품이 노출 됩니다. ]</span></td>
							</tr>
							<tr>
								<td class="table_title">배송비</td>
								<td><input type="text" style="width: 200px" value="3,000"
									class="input_style"></td>
							</tr>
						</table>
						<div class="btn-Wrap">
							<button type="button" class="btn btn-primary">상품 등록</button>
						</div>
					</form>
				</div>
			</div>

			<!-- 본문 작성 끝  -->
			<%@ include file="adminFooter.jsp"%>

		</div>

	</div>

</body>
</html>
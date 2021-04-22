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
<!-- Custom CSS -->
<link href="../resources/adminAssets/libs/flot/css/float-chart.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<!-- include summernote css/js -->

<!-- All Jquery -->
<!-- ============================================================== -->
<script src="../resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<!-- include summernote css/js -->
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script
	src="../resources/adminAssets/libs/popper.js/dist/umd/popper.min.js"></script>
<script
	src="../resources/adminAssets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script
	src="../resources/adminAssets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../resources/adminAssets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="../resources/adminDist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="../resources/adminDist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="../resources/adminDist/js/custom.min.js"></script>
<!-- Charts js Files -->
<script src="../resources/adminAssets/libs/flot/excanvas.js"></script>
<script src="../resources/adminAssets/libs/flot/jquery.flot.js"></script>
<script src="../resources/adminAssets/libs/flot/jquery.flot.pie.js"></script>
<script src="../resources/adminAssets/libs/flot/jquery.flot.time.js"></script>
<script src="../resources/adminAssets/libs/flot/jquery.flot.stack.js"></script>
<script
	src="../resources/adminAssets/libs/flot/jquery.flot.crosshair.js"></script>
<script
	src="../resources/adminAssets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="../resources/adminDist/js/pages/chart/chart-page-init.js"></script>

<!-- 썸머노트관련 -->
<script src="../resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500,
			focus : true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
	});

	function sendFile(file, el) {
		let path = "/resources/uploads/boardCs";

		var form_data = new FormData();

		form_data.append('file', file);

		$.ajax({
			data : form_data,
			type : "POST",
			url : '/board/cs/image',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(url) {
				$(el).summernote('editor.insertImage', path + url);
			}, // 통신 성공시
			error : function(data) {
				$("#modalText").text("이미지 파일이 아닙니다");
				$("#myModal").modal();
			},
		});
	}
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
					<table class="table table-bordered">
						<tr>
							<td class="table_title">제품이름</td>
							<td><input type="text" value="활활화로" style="width: 300px" class="input_style"></td>
						</tr>
						<tr>
							<td class="table_title">매입가</td>
							<td><input type="text" value="활활화로" style="width: 200px" class="input_style"></td>
						</tr>
						<tr>
							<td class="table_title">매입수량</td>
							<td><input type="text" value="활활화로" style="width: 200px" class="input_style"></td>
						</tr>
						<tr>
							<td class="table_title">제조사</td>
							<td><input type="text" value="활활화로" style="width: 300px" class="input_style"></td>
						</tr>
						<tr>
							<td class="table_title">상품 이름</td>
							<td><input type="text" value="활활화로" style="width: 600px" class="input_style"> [ 0 / 250 ]</td>
						</tr>
					</table>
					<div class="product-detail">
						<form method="post">
							<textarea id="summernote" name="editordata" placeholder="상품 설명"></textarea>
						</form>
					</div>

					<table class="table table-bordered">
						<tr>
							<td class="table_title">대표 이미지</td>
							<td><input type="file" value="활활화로"> <br>- 권장 사이즈 : 412 x 412 / 10M 이하 / gif, png, jpg(jpeg)</td>
						</tr>
						<tr>
							<td class="table_title">미리보기</td>
							<td><img alt="" src="../resources/img/test.jpg"> </td>
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
							<td><input type="text" value="50,000" style="width: 200px" class="input_style"> [ 상품가 : 0원 / 과세금액 : 0원 / 과세상품 : 10% ]</td>
						</tr>
						<tr>
							<td class="table_title">진열 여부</td>
							<td>
								<select>
									<option>진열함</option>
									<option>진열안함</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="table_title">인기 상품 진열 여부</td>
							<td>
								<select>
									<option>진열함</option>
									<option>진열안함</option>
								</select>
								 <span> [ 쇼핑몰 하단에 랜덤으로 상품이 노출 됩니다. ]</span>
							</td>
						</tr>
						<tr>
							<td class="table_title">배송비</td>
							<td><input type="text" style="width: 200px" value="3,000" class="input_style"></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 본문 작성 끝  -->
			<%@ include file="adminFooter.jsp"%>

		</div>

	</div>


</body>
</html>
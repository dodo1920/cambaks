<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- 화면 너비 자동반응 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<title>Cambak's - Admin Pages</title>

<!-- css -->
<link href="../resources/adminDist/css/bootstrap.min.css" type="text/css">
<link href="../resources/adminDist/css/font-awesome.min.css" type="text/css">
<link href="../resources/adminDist/css/elegant-icons.css" type="text/css">
<link href="../resources/adminDist/css/jquery-ui.min.css" type="text/css">
<link href="../resources/adminDist/css/magnific-popup.css" type="text/css">
<link href="../resources/adminDist/css/owl.carousel.min.css" type="text/css">
<link href="../resources/adminDist/css/slicknav.min.css" type="text/css">
<link href="../resources/adminDist/css/style.css" type="text/css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/quill/dist/quill.snow.css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">

<!-- js -->
<script src="../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<script src="../resources/adminAssets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="../resources/adminAssets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../resources/adminAssets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../resources/adminAssets/extra-libs/sparkline/sparkline.js"></script>
<script src="../resources/adminDist/js/waves.js"></script>
<script src="../resources/adminDist/js/sidebarmenu.js"></script>
<script src="../resources/adminDist/js/custom.min.js"></script>
<script src="../resources/adminAssets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="../resources/adminDist/js/pages/mask/mask.init.js"></script>
<script src="../resources/adminAssets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="../resources/adminAssets/libs/select2/dist/js/select2.min.js"></script>
<script src="../resources/adminAssets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
<script src="../resources/adminAssets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
<script src="../resources/adminAssets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
<script src="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
<script src="../resources/adminAssets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/adminAssets/libs/quill/dist/quill.min.js"></script>

<script>

// 메인 카테고리 select 박스를 ajax 방식으로 출력
function selectMainCategories() {
	let output = '<select class="select form-control" id="checkOption" style="height:36px;" onchange="getMainCate(this);")><optgroup label="-검색항목선택-"><option value="default">- 카테고리 대분류 -</option>';
				
					$.ajax({
						method: "get",
					  url: "/admin/getMainCategories",
					  headers: {	// 요청하는 데이터의 헤더에 전송
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "GET"
					  },
					  success : function(data) {

					      console.log(data);
					      
					      let mainCategory = data.mainCategories;
					      
					      console.log(mainCategory);
					      $(mainCategory).each(function(index, item) {
					    	  
					    	  output += '<option value="' + item.mainCategory_id + '">' + item.mainCategory_content + '</option>';
					    	  
					      }); // end of foreach

						  output += '</optgroup></select>';
						  $("#selectMainCategories").html(output);
					  }
					  
					}); // end of ajax
}


// 수정 삭제를 위한 체크 박스 설정
$(document).ready(function(){
	
    //최상단 체크박스 클릭
    $("#allChecked").click(function(){
        //클릭되었으면
        if($("#allChecked").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    });
    
    //메인 카테고리 목록을 ajax로 호출
    selectMainCategories();
    
    
    
    
    
    
    
});


//메인카테고리의 셀렉트박스가 선택되었을 때, 해당 카테고리의 id로 미들 카테고리 출력
function getMainCate(obj) {
	let mainCategory_id = $("#checkOption option:selected").val();
	console.log(mainCategory_id);
	let output1 = '<select class="select form-control" id="checkMidle" style="height:36px;" onchange="getMidCate(this);")><optgroup label="-검색항목선택-"><option value="default">- 카테고리 중분류 -</option>';
	$.ajax({
		method: "get",
	  	url: "/admin/getMiddleCategories",
	  	headers: {	// 요청하는 데이터의 헤더에 전송
		  "Content-Type" : "application/json",
		  "X-HTTP-Method-Override" : "GET"
	  }, 
	  data		:  {
  		'mainCategory_id' : mainCategory_id
		}, 
	  success : function(data) {

	      console.log(data);
	      
	      let middleCategory = data.middleCategories;
	      
	      console.log(middleCategory);
	      $(middleCategory).each(function(index, item) {
	    	  
	    	  output1 += '<option value="' + item.middleCategory_id + '">' + item.middleCategory_content + '</option>';
	    	  
	      }); // end of foreach
	      output1 += '</optgroup></select>';
		  $("#selectMiddleCategories").html(output1);
		  // body에 input type hidden 부분에 form태그 전송을 위한 value 넣기
		  $('input[name=mainCategory_id]').attr('value',mainCategory_id);
	  }
	  
	}); // end of ajax
}

function getMidCate(obj) {
	let middleCategory_id = $("#checkMidle option:selected").val();
	console.log(middleCategory_id);
	// body에 input type hidden 부분에 form태그 전송을 위한 value 넣기
	$('input[name=middleCategory_id]').attr('value',middleCategory_id);
}

</script>


<style>

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
<%@ include file="adminTop.jsp"%>
<%@ include file="adminAside.jsp"%>
<div class="page-wrapper">
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">상품목록 게시판</h4>
				<div class="ml-auto text-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">홈</a></li>
							<li class="breadcrumb-item active" aria-current="page">주문목록</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
				<!-- 검색을 위한 form 태그 시작 부분 -->
					<form  action="/admin/searchProdList" method="GET">
					<div class="card-body">
						<div class="form-group row">
							<label class="col-md-1 m-t-15">검색어</label>
							
							
							
							<div class="col-md-1" style="padding-left: 0px;">
								<select class="select form-control" name="searchType" style="height:36px;">
											<option value="searchAll">전체</option>
											<option value="product_name">상품명</option>
											<option value="product_factory">제조사명</option>
								</select>
								
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control" name="searchWord" placeholder="검색어를 입력해주세요.">
								<!-- ajax로 가져온 mainCategory_id, middleCategory_id 값을 넣어놓는 부분 -->
								<input type="hidden" id="mainCategory_id" name="mainCategory_id" value=""/>
								<input type="hidden" id="middleCategory_id" name="middleCategory_id" value=""/>
								<!-- ajax로 가져온 mainCategory_id, middleCategory_id 값을 넣어놓는 부분 -->
							</div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary" id="goSearch">검색</button>&nbsp;<button type="button" class="btn btn-light" onclick="location.href='/admin/prodList?page=1'">초기화</button>
							</div>
							<div class="col-md-7"></div>
						</div>
						<div class="form-group row">
						    <label class="col-md-1  m-t-15">상품분류</label>
						    <!-- 대분류 카테고리 ajax 삽입 부분 -->
							    <div class="col-md-1.5" id="selectMainCategories">
									
									
								</div>
							<!-- 중분류 카테고리 ajax 삽입 부분 -->
								<div class="col-md-1.5" id="selectMiddleCategories">
									
									
								</div>
								
						    <div class="col-md-4"></div>
						</div>
						<div class="form-group row">
						    <label class="col-md-1">상품등록일</label>
						    <div class="col-md-7"  style="padding-left: 0px;">
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">오늘</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">7일</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">1개월</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="">3개월</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 10px;" onclick="">1년</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 10px;" onclick="">전체</button>
							    <input type="date" id="checkLowDate" name="checkLowDate" onchange="" />
							    <span>~</span>
							    <input type="date" id="checkHighDate" name="checkHighDate" onchange="" />
							    <div id="checkOrderDate">
								    <input type="hidden" value="" name="checkDate"/>
								    <!-- <input type="hidden" value="" name="checkLowDate"/>
								    <input type="hidden" value="" name="checkHighDate"/> -->
							    </div>
						    </div>
						    <div class="col-md-4"></div>
						</div>
						
						
						<div class="form-group row">
							<label class="col-md-1 m-t-15">진열상태</label>
							<div class="col-md-3" style="padding-left: 0px;">
								<input type="radio" name="product_show" value="all" checked="checked">전체&nbsp;&nbsp;&nbsp;<input type="radio" name="product_show" value="Y">진열&nbsp;&nbsp;&nbsp;<input type="radio" name="product_show" value="N">진열안함
							</div>
						</div>
					</div>
					</form>
				<!-- 검색을 위한 form 태그 종료 부분 -->
					
				</div>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
									<!-- 글쓰기 버튼 -->
									<div>
										<input type="button" class="btn btn-primary" value="수정" onclick="location.href='수정하러가자'" style="margin-left: 10px; margin-bottom: 20px;">
										<input type="button" class="btn btn-primary" value="삭제" onclick="location.href='삭제하러가자'" style="margin-right: 20px; margin-bottom: 20px;">
										<input type="button" class="btn btn-primary" value="상품등록" onclick="location.href='글쓰러가자'" style="margin-right: 20px; margin-bottom: 20px; float: right;">
									</div>
									
							<div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
							
									
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-striped table-bordered dataTable" style="font-size: 13px;">
										<thead>
											<tr role="row">
												<th style="font-weight: bold; width: 100px;"><input type="checkbox" id="allChecked" value="allChecked"/></th>
												<th style="font-weight: bold; width: 100px;">상품번호</th>
												<th style="font-weight: bold; width: 150px;">상품명</th>
												<th style="font-weight: bold; width: 75px;">판매가</th>
												<th style="font-weight: bold; width: 180px;">진열상태</th>
												<th style="font-weight: bold; width: 130px;">제조사</th>
												<th style="font-weight: bold; width: 102px;">상품등록일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="board" items="${boardList }" varStatus="status">
											<tr role="row">
												<td><input type="checkbox" name="chk" id="check${board.product_id }"/></td>
												<td>${board.product_id }</td>
												<td>${board.product_name }</td>
												<td>${board.product_sellPrice }</td>
												<td>${board.product_show }</td>
												<td>${board.product_factory }</td>
												<td><fmt:formatDate value="${board.product_date }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
											</tr>
											</c:forEach>
										</tbody>
                                    </table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-5"></div>
									<div class="col-sm-12 col-md-7">
										<div>
											<ul class="pagination">
											<c:choose>
               									<c:when test="${SearchCriteria.searchType != null}">
												<c:if test="${pagingParam.prev }">
												<li class="page-item">
													<a class="page-link" href="searchProdList?page=${param.page -1 }&searchType=${SearchCriteria.searchType }&searchWord=${SearchCriteria.searchWord }" aria-label="Previous">
														<span aria-hidden="true">«</span>
														<span class="sr-only">Previous</span>
													</a>
												</li>
												</c:if>
												<c:forEach begin="${pagingParam.startPage }" end="${pagingParam.endPage }" var="pageNo">
												<li class="page-item active">
													<a href="searchProdList?page=${pageNo }&searchType=${SearchCriteria.searchType }&searchWord=${SearchCriteria.searchWord }" class="page-link">${pageNo }</a>
												</li>
												</c:forEach>
												<c:if test="${pagingParam.next }">
												<li class="page-item">
													<a class="page-link" href="searchProdList?page=${param.page +1 }&searchType=${SearchCriteria.searchType }&searchWord=${SearchCriteria.searchWord }" aria-label="Next">
														<span aria-hidden="true">»</span>
														<span class="sr-only">Next</span>
													</a>
												</li>
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${pagingParam.prev }">
													<li class="page-item">
														<a class="page-link" href="prodList?page=${param.page -1 }" aria-label="Previous">
															<span aria-hidden="true">«</span>
															<span class="sr-only">Previous</span>
														</a>
													</li>
													</c:if>
													<c:forEach begin="${pagingParam.startPage }" end="${pagingParam.endPage }" var="pageNo">
													<li class="page-item active">
														<a href="prodList?page=${pageNo }" class="page-link">${pageNo }</a>
													</li>
													</c:forEach>
													<c:if test="${pagingParam.next }">
													<li class="page-item">
														<a class="page-link" href="prodList?page=${param.page +1 }" aria-label="Next">
															<span aria-hidden="true">»</span>
															<span class="sr-only">Next</span>
														</a>
													</li>
												</c:if>
											</c:otherwise>
											</c:choose>
											
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="adminFooter.jsp"%>
</div>
</body>
</html>
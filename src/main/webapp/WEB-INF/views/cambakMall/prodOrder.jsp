<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CambakMall</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../../resources/mallMain/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/style.css" type="text/css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<script>
		function usePoint() {
			
		}
	</script>
</head>
<script type="text/javascript">
//화면시작시 실행할 함수들
 $(function(){
	 default_addr();
});

//김대기 script start
//배송지 선택하기 버튼 클릭시
function destList(){
	
	let member = "${loginMember.member_id}"
	console.log(member);
	let output ="";
	$.getJSON("/mall/prodOrder/" + member, function(data) {
		console.log(data);
		 $(data).each(function(index, item){
			output += "<div>" + this.destination_nickname + "</div>"
			output += "<div>" + this.destination_address + " " + this.destination_addressDetail + "</div>"
			output += "<div>" + this.destination_mobile + "</div><button type='button' class='btn btn-default' data-dismiss='modal' onclick='selectDest(" + this.destination_no + ")'>선택하기</button><hr/>"
			
			
		});
		 $("#destList").html(output); 
	});
	
}
// 배송지 선택완료 햇을시
function selectDest(destination_no){
	$.ajax({
		  method: "GET",
		  url: "/mall/prodOrder/select/" + destination_no ,
		  headers : { // 요청하는 데이터의 헤더에 전송
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "GET"
		  },
		  dataType: "JSON", // 응답 받는 데이터 타입
		  destination_no : destination_no,
		  success : function(result){
			  $("#user_name").html(result.destination_nickname);
			  $("#user_number").html(result.destination_mobile);
			  $("#user_dest").html(result.destination_address + " " + result.destination_addressDetail);
			  $("#destination_no").val(result.destination_no);
		  }
		});
	
}

function shownoAccount() {
	$("#creditCard").hide();
	$("#creditCardBank").attr('disabled', 'true');
	$("#creditCardInstallments").attr('disabled', 'true');
	$("#transfer").hide();
	$("#transferBank").attr('disabled', 'true');
	$("#noAccount").show();
	$("#noAccountBank").removeAttr('disabled'); 
	
}

function showcreditCard(){
	$("#noAccount").hide();
	$("#noAccountBank").attr('disabled', 'true');
	$("#transfer").hide();
	$("#transferBank").attr('disabled', 'true');
	$("#creditCard").show();
	$("#creditCardBank").removeAttr('disabled'); 
	$("#creditCardInstallments").removeAttr('disabled'); 
}

function showtransfer() {
	$("#creditCard").hide();
	$("#creditCardBank").attr('disabled', 'true');
	$("#creditCardInstallments").attr('disabled', 'true');
	$("#noAccount").hide();
	$("#noAccountBank").attr('disabled', 'true');
	$("#transfer").show();
	$("#transferBank").removeAttr('disabled'); 
}

function checkForm(){
	
	agreement = $("#agreement").prop("checked");
	console.log(agreement);
	if(agreement == false){
		alert("겔제 동의가 필요합니다.");
		return false;
	}
	
	

}

function default_addr() {
	let member_id = "${loginMember.member_id}";
	console.log(member_id);
	$.ajax({
		  method: "GET",
		  url: "/mall/prodOrder/default/" ,
		  headers : { // 요청하는 데이터의 헤더에 전송
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "GET"
		  },
		  dataType: "JSON", // 응답 받는 데이터 타입
		  data : {member_id : member_id},
		  success : function(result){
			 if(result != null){
				 $("#user_name").html(result.destination_nickname);
				  $("#user_number").html(result.destination_mobile);
				  $("#user_dest").html(result.destination_address + " " + result.destination_addressDetail);
				  $("#destination_no").val(result.destination_no);
			
			 }
			
		  }
		});
	}	

//김대기 script end

// 장원영 script Start
	function usePoint() {
		$.ajax({
			type : "get",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/mall/prodOrder/select/" + ${member.member_totPoint}, // 서블릿 주소
			success : function(data) {
				listOutput(data);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}

//장원영 script End




</script>
<style>
.tbl_wrap{
	vertical-align: middle;
}
</style>
<body>

	<%@include file="mallHeader.jsp" %>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Breadcrumb Begin -->
  
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Women’s </a>
                        <span>Essential structured blazer</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
      <section class="shop-cart spad">
      <div class="container">
      
    <!-- 배송지 선택 테이블 start -->
    <form action = "" method ="post" onsubmit="checkForm(); return false;">
    <div>
    <h2>배송지 정보</h2>
    <div class="tbl_wrap">
    
    	<table class="table">
    	<colgroup>
    		<col style="width:160px;">
    		<col>
    	</colgroup>
    	<tbody id="table_in">
    		<tr>
    			<th>배송지 선택</th>
    			<td>
    			
    			<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="destList();">배송지 선택하기</button>
    			
    			</td>
    		</tr>
    		<tr>
    			<th>이름</th>
    			<td id="user_name">배송지 선택 버튼을 클릭해주세요</td>
    			
    		</tr>
    		<tr>
    			<th>연락처</th>
    			<td id="user_number">배송지 선택 버튼을 클릭해주세요</td>
    		</tr>
    		<tr>
    			<th>주소</th>
    			<td id = "user_dest">배송지 선택 버튼을 클릭해주세요</td>
    			
    		</tr>
    	</tbody>
    	</table>
    	<input type="hidden" name="destination_no" value="" id="destination_no">
    </div>
    </div>
    <!-- 배송지 선택 테이블 end -->

				<!-- 배송지 선택 modal start-->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">배송지 선택</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body" id="destList">
						
							</div>
							<div class="modal-footer">
								
									<button type="button" class="btn btn-default"
									onclick="location.href='http://localhost:8081/mall/destinationsList'">배송지 수정하기</button>
									<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
				<!-- 배송지 선택 modal end -->

				<!-- 주문 상품 정보 테이블 start -->
    <div style="margin-top:50px">
    <h2>주문상품 정보</h2>
    <table class="table">
    	<thead>
    	<tr>
    		<th style="display: none">번호</th>
    		<th colspan="2">상품정보</th>
    		<th>상품금액</th>
    		<th>수량</th>
    		<th>배송비</th>
    		<th>주문금액</th>
    	</tr>
    	</thead>
    	<tbody>
    	
    	
		<tr>
			<td style="display: none">번호</th>
    		<td><img alt="" src="../../resources/img/test.jpg" style="width:100px"> </td>
    		<td>컵누들</td>
    		<td>10,000<i>원</i></td>
    		<td>1</td>
    		<td>2500<i>원</i></td>
    		<td>12,500<i>원</i></td>
   		</tr>
    	
    	
    	<c:forEach var="item" items="${prodList }">
    		<c:if test="${item.buyProduct_isFinished == Y and loginMember.member_id == item.member_id}">
				<tr>
					<td style="text-align: center;">${item.buyProduct_no }</td>
					<td style="text-align: center; width: 100px;">${item.product_img1 }</td>
		    		<td style="text-align: center;">${item.product_name }</td>
		    		<td style="text-align: center;">${item.product_sellPrice }</td>
		    		<td style="text-align: center;">${item.buyProduct_qty }</td>
		    		<td style="text-align: center;">${item.buyProduct_deliveriPay }</td>
		    		<td style="text-align: center;">${item.totPrice }</td>
	    		</tr>
	    	</c:if>
    	</c:forEach>
    	
    	
    	</tbody>
    	<tfoot>
    		<tr>
    			<td rowspan="2"><div style="">포인트 할인</div></td>
    		</tr>
    		<tr>
	   			<td colspan="6">
	   				<div>
	   					<ul style="float:right; margin-right:80px; font-style:normal; list-style:none;">
	   						<li>
	   							<em style="margin-right:10px; margin-bottom:10px;font-style:NORMAL">보유</em>
	   							<span>
	   							<em>3,000</em><i>점</i>
	   							</span>
	   						</li>
	   						<li>
	   							<em style="margin-right:10px;margin-bottom:10px;font-style:NORMAL">사용</em>
	   							<span><em>2,000</em><i>점</i></span><button class="btn btn-info" style="padding: 6px;" onclick="usePoint()">전액사용</button>
	   						</li>
	   					</ul>
	   				</div>
	   			</td>
    		</tr>
    		<tr>
    			<td rowspan="2"><div style="">주문 합계</div></td>
    		</tr>
    		<tr>
    			<td colspan="6">
    				<div>
    					<ul style="float:right; margin-right:80px; font-style:normal; list-style:none;">
    						<li>
    							<em style="margin-right:10px; margin-bottom:10px;font-style:NORMAL">상품 금액</em>
    							<span>
    							<em>3,000</em><i>원</i>
    							</span>
    						</li>
    						<li>
    							<em style="margin-right:10px;margin-bottom:10px;font-style:NORMAL">할인 금액</em>
    							<span><em>3,000</em><i>원</i></span>
    						</li>
    						<li>
    							<em style="margin-right:10px;margin-bottom:10px;font-style:NORMAL">배송 금액</em>
    							<span><em>2,500</em><i>원</i></span>
    						</li>	
    					</ul>
    				</div>
    			</td>
    		</tr>
   			<tr>
   				<td rowspan="2"><div style="">적립 예정 금액</div></td>
   			</tr>
   			<tr>
	   			<td colspan="6">
	   				<div>
	   					<span style="text-align:right; float:right;margin-right:80px"><em>1,000</em><i>원</i></span>
	   				</div>
	   			</td>
   			</tr>
   			<tr>
   				<td rowspan="2"><div style="">총 주문 금액</div></td>
   			</tr>
   			<tr>
	   			<td colspan="6">
	   				<div>
	   					<span style="text-align:right; float:right;margin-right:80px"><em>11,000</em><i>원</i></span>
	   				</div>
	   			</td>
   			</tr>
    	</tfoot>
    	
    </table>
    
    
    </div>
    <!-- 주문 상품 정보 테이블 end -->
    <!-- 결제 방법테이블 테이블 start -->
    <div style="margin-top: 50px;">
    	<h2>결제 방법 선택</h2>
    	<div>
			<div>
				 <table class="table">
					<thead>
						<tr>
							<th>결제방법</th>
							<th>
							<label class="radio-inline"><input type="radio" name="optradio" value="무통장입금" onclick="shownoAccount();" checked>무통장입금</label>
							<label class="radio-inline"><input type="radio" name="optradio" value="카드" onclick="showcreditCard();">카드</label>
							<label class="radio-inline"><input type="radio" name="optradio" value="계좌이체" onclick="showtransfer();">계좌이체</label>
							</th>
							</tr>
							<tr>
							<td colspan="2">
								<div id="noAccount">
									<ul>
										<li>
										<div>
											<label>입금은행</label>
												<select id="noAccountBank">
													<option>국민은행</option>
													<option>신한은행</option>
													<option>하나은행</option>
													<option>농협은행</option>
													<option>우리은행</option>
													<option>우체국</option>
												</select>
											</div>
										</li>	
										<li>
											<div>
												<span>입금기한</span>
												<span>결제후 24시간</span>
											</div>
										</li>
									</ul>
								 </div>
								<div id="creditCard" style="display: none">
									<ul>
										<li>
										<div>
											<label>카드 선택</label>
												<select id="creditCardBank">
													<option>국민카드</option>
													<option>신한카드</option>
													<option>하나카드</option>
													<option>농협카드</option>
													<option>우리카드</option>
													<option>우체국카드</option>
												</select>
											</div>
										</li>	
										<li>
											<div>
												<span>할부기한</span>
												<select id="creditCardInstallments">
													<option>일시불</option>
													<option>3개월</option>
													<option>6개월</option>
													<option>9개월</option>
													<option>12개월</option>
													
												</select>
												<span>*할부는 50,000이상만 가능합니다.</span>
											</div>
										</li>
									</ul>
								</div>
								<div id="transfer" style="display: none">
									<ul>
										<li>
										<div>
											<label>입금은행</label>
												<select id="transferBank">
													<option>국민은행</option>
													<option>신한은행</option>
													<option>하나은행</option>
													<option>농협은행</option>
													<option>우리은행</option>
													<option>우체국</option>
												</select>
											</div>
										</li>	
									
									</ul>
								</div>
							</td>
							
							
						</tr>
					</thead>
				</table>
			</div>    
   		</div>
    </div>
    
    <!-- 결제 방법테이블 테이블 end -->
    <!-- 약관동의 테이블 start -->
    <div style="margin-top: 50px;">
    	<h2>약관동의</h2>
    	<div>
    		<div>
    			<dl>
    				<dt>
    					 <label><input type="checkbox" value="" id="agreement">동의</label>
    				</dt>
    			</dl>
    		</div>
    	</div>
    </div>
    <div>
    	<button type="submit" class="btn btn-default">결제하기</button>
    	<button class="btn btn-default">취소</button>
    </div>
    </form>
    <!-- 약관동의 테이블 end -->


    </div>
	</section>
	   <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->
	<%@include file="mallFooter.jsp" %>
	<!-- Js Plugins -->
<script src="../../resources/mallMain/js/jquery-3.3.1.min.js"></script>
<script src="../../resources/mallMain/js/bootstrap.min.js"></script>
<script src="../../resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="../../resources/mallMain/js/jquery-ui.min.js"></script>
<script src="../../resources/mallMain/js/mixitup.min.js"></script>
<script src="../../resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="../../resources/mallMain/js/jquery.slicknav.js"></script>
<script src="../../resources/mallMain/js/owl.carousel.min.js"></script>
<script src="../../resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="../../resources/mallMain/js/main.js"></script>

</body>
</html>
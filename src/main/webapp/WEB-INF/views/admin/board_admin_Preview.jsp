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
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<!-- include summernote css/js -->
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<script>
$(function(){
	
	$('#summernote').summernote({
		height : 500
	});
	
});



</script>

<style>

/*  미리보기  */


table {
    table-layout: fixed;
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}






.mLayer > h2 {
    padding: 8px 50px 7px 20px;
    border-bottom: 1px solid #686868;
    color: #fff;
    font-size: 16px;
    text-align: left;
    font-weight: normal;
    background: #2f4363;
}

.mBoard.gSmall th {
    width: 100px;
}

.mBoard tbody th {
    border: 1px solid #d9dadc;
    text-align: left;
}

.mBoard th {
    font-weight: normal;
    background-color: #f5f4f4;
}

.mBoard th, .mBoard td {
    padding: 9px 9px 7px;
    vertical-align: top;
}

.mBoard.gSmall td {
    width: auto;
}


.mBoard tbody td {
    border: 1px solid #d9dadc;
}

.mBoard th, .mBoard td {
    padding: 9px 9px 7px;
    vertical-align: top;
}

.mBoard table {
    line-height: 1.5;
    background-color: #fff;
}

.mLayer {
    display: none;
    position: absolute;
    z-index: 110;
    left: 50%;
    border: 1px solid #2f4363;
    line-height: 1.5;
    background-color: #fff;
}

.mLayer .footer .btnNormal {
    min-width: 63px;
    height: 36px;
    line-height: 34px;
    font-size: 14px;
    color: #55a0ff;
    border-color: #55a0ff;
}
.mLayer .footer {
    padding: 15px 0;
    border-top: 1px solid #dedede;
    text-align: center;
    background-color: #fafafa;
}

html {
    width: 100%;
    height: 100%;
}

</style>


</head>
<body>		
 <!--미리보기-->

<div class="mBoard gSmall">
        <table border="1" summary="">
            <caption>게시글 내용 미리보기</caption>
            <tbody>
            <tr>
                <th scope="row">제목</th>
                <td>
                    <div id="eSubject">몰 오픈을 축하합니다.</div>
                    <div id="eReplaySubject" style="display:none"><input type="text" name="subject" id="subject" style="width:250px;" value="몰 오픈을 축하합니다."></div>
                </td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>EC Hosting</td>
            </tr>
                        <tr id="reply" style="display:none">
                <th scope="row">답변상태</th>
                <td>
                    <div class="mButton">
                        <p class="gInfo">
                            <span class="txtLight" id="reply_status_msg"></span>
                                                            <a href="javascript:changeStatus(true);" class="btnNormal"><span id="btn_change_status"></span></a>
                                                    </p>
                        <a href="javascript:writeReply();" class="btnCtrl"><span>답변</span></a>
                    </div>
                </td>
            </tr>
            <tr id="view_area">
                <th scope="row">원글</th>
                <td id="orig_msg">몰 오픈을 축하합니다.</td>
            </tr>
            <tr id="write_area" style="display:none">
                <th scope="row">답변</th>
                <td>
                    <textarea rows="6" cols="20" class="fTextarea" style="width:98%;height:120px;" id="content_temp" name="content_temp"></textarea>
                </td>
            </tr>
            <tr id="passwd_area" style="display:none">
                <th scope="row">비밀글 설정</th>
                <td>
                    <input name="secret_passwd" id="eSecretPasswdF" type="radio" checked="checked" value="F"> <label for="eSecretPasswdF">공개글</label>&nbsp;&nbsp;&nbsp;
                    <input name="secret_passwd" id="eSecretPasswdT" type="radio" value="T"> <label for="eSecretPasswdT">비밀글</label>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    
    
    
	
<!-- 			 <div class="mLayer ui-draggable ui-resizable" -->
<!-- 					style="width: auto; display: none;  width: auto; position: absolute; z-index: 200; left: 395px; top: 167px;" id="layerPreview"> -->
					
<!-- 					<h2>게시글 내용 미리보기</h2> -->
<!-- 					<div class="wrap" style="width: 400px; height: 400px;" -->
<!-- 						id="eBulletinContentWrap"> -->
<!-- 						<iframe id="eBulletinContent" frameborder="0" width="400px" -->
<!-- 							height="400px" marginwidth="0" marginheight="0" scrolling="auto"></iframe> -->
<!-- 					</div> -->
<!-- 					<div class="footer"> -->
<!-- 						<a href="javascript:closePreviewFrame();" class="btnNormal eClose"><span>닫기</span></a> -->
<!-- 					</div> -->
			
				
<!-- 				</div> -->

	 <!--미리보기-->

	
            
            
            
</body>
</html>
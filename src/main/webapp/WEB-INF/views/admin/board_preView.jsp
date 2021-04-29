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
<title>Cambak's - Admin Pages</title>

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>



</head>
<body>

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
    
            </tbody>
        </table>
    </div>

</body>
</html>
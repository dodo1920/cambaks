<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>

<title>배송지 등록</title>

<style type="text/css">

.setting_popup_title{

	position: relative;
    margin-top: 30px;
    padding: 0 10px;
    border-top: 1px solid #888;
    border-bottom: 1px solid #ebebeb;

}

.tbl_delivery_info {
    width: 100%;
    padding: 13px 0 11px;
    border-bottom: 1px solid #ebebeb;
    table-layout: fixed;
    -webkit-font-smoothing: antialiased;
}

.tbl_delivery_info {
    width: 100%;
    padding: 13px 0 11px;
    border-bottom: 1px solid #ebebeb;
    table-layout: fixed;
    -webkit-font-smoothing: antialiased;
}

.tbl_delivery_info th.cell_title {
    width: 98px;
    padding: 5px 0 0 12px;
    font-weight: normal;
    line-height: 32px;
    text-align: left;
    color: #222;
    vertical-align: top;
}

.tbl_delivery_info td {
    padding: 5px 0;
}

.delivery_notice {
    padding: 16px 20px 14px;
    background-color: #fafafa;
    font-size: 11px;
    line-height: 22px;
    color: #666;
}

#pop_footer {
    padding: 30px 0 32px;
    text-align: center;
}

.basic_input {
    display: inline-block;
    position: relative;
    padding: 0 10px;
    border: 1px solid #ccc;
    background-color: #fff;
    color: #222;
    vertical-align: top;
}
.basic_input .lb_text {
    position: absolute;
    left: 0;
    top: 0;
    padding: 0 10px;
    line-height: 30px;
    color: #888;
}

.basic_input .ip_text {
    position: relative;
    width: 100%;
    height: 30px;
    border: none;
    background-color: transparent;
    line-height: 30px;
    color: #222;
    vertical-align: top;
}

.basic_input.focus {
    border-color: #00c73c;
}

#pop_container {
    margin: 0 25px;
    padding-top: 25px;
}

#pop_wrap {
    margin: 0 auto;
    position: relative;
}


.setting_selectbox {
    display: inline-block;
    position: relative;
    height: 33px;
    border: 1px solid #ccc;
    background-color: #fff;
}

.tbl_delivery_info .setting_selectbox, .tbl_delivery_info .setting_selectbox a.select_value {
    height: 30px;
    line-height: 30px;
}
.setting_selectbox .layer_select_option {
    display: none;
    z-index: 10;
    position: absolute;
    left: -1px;
    right: -1px;
    top: 33px;
    padding: 10px 0;
    background-color: #fff;
    border: 1px solid #e0e0e0;
    box-shadow: 1px 1px 4px 0 rgb(0 0 0 / 5%);
}

.setting_selectbox .layer_select_option > ul {
    position: relative;
}


ul, ol {
    list-style: none;
}
.setting_selectbox .layer_select_option > ul li a:hover {
    background-color: #f8f8f8;
}

.setting_selectbox .layer_select_option > ul li a {
    display: block;
    padding: 0 10px;
    background-color: #fff;
    line-height: 35px;
    color: #222;
    text-decoration: none;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.setting_btn.green {
    border-color: #00c73c;
    color: #00c73c;
}
.tbl_delivery_info .setting_btn {
    margin-left: -4px;
    padding: 0 12px;
    line-height: 30px;
}

.setting_btn.green:hover {
    background-color: #00c73c;
    color: #fff;
}

.setting_btn {
    display: inline-block;
    position: relative;
    padding: 0 13px;
    border: 1px solid #ddd;
    background-color: #fff;
    border-radius: 0;
    line-height: 33px;
    color: #222;
    text-align: center;
    text-decoration: none;
    vertical-align: top;
}

.delivery_notice {
    padding: 16px 20px 14px;
    background-color: #fafafa;
    font-size: 11px;
    line-height: 22px;
    color: #666;
}


.button.green_bg {
    border: 1px solid #00bc38;
    background-color: #00c73c;
    color: #fff;
}

.button.green_bg:hover {
    background-color: #00ba38;
}

.button {
    padding: 0 23px;
    font-size: 13px;
    color: #222;
    background: #fff;
    border: 1px solid #ddd;
    line-height: 34px;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    -webkit-font-smoothing: antialiased;
}

.button:hover {
    background-color: #f0f1f2;
}



/* .setting_checkbox:after { */
/*     width: 18px; */
/*     height: 18px; */
/*     background-position: -70px -30px; */
/* } */

.setting_checkbox input, .setting_radio input {
    position: absolute;
    z-index: -1;
    opacity: 0;
    filter: alpha(opacity=0);
}
.basic_input .ip_text:focus {
    outline: none;
}

.tbl_delivery_info .setting_checkbox {
    margin-right: 3px;
    vertical-align: top;
}

.setting_checkbox, .setting_radio {
    display: inline-block;
    position: relative;
}




</style>

</head>
<body style="overflow: hidden;">

<div id="pop_wrap">

    <div id="pop_container">
        <div id="pop_content">
            <div class="setting_popup_title">
                <h2 class="h_title" style="font-size: 12px; line-height: 45px; color: #222;">배송지 정보 상세</h2>
            </div>
            <table class="tbl_delivery_info">
         
                <tbody>
                <tr>
                    <th class="cell_title">배송지명</th>
                    <td>
                        <span class="_editable_input _input basic_input" style="width: 133px">
                            <label for="addressName" class="lb_text blind"></label>
                            <input type="text" id="addressName" class="ip_text" value="" maxlength="150">
                            <input type="hidden" id="hash" class="ip_text" value="">
                        </span>
                    </td>
                </tr>
                <tr>
                    <th class="cell_title">수령인 <em class="mark_necessity"><span class="blind"></span></em></th>
                    <td>
                        <span class="_editable_input _input basic_input" style="width: 133px">
                           
                            <label for="receiver" class="lb_text "></label>
                            <input type="text" id="receiver" class="ip_text" value="" maxlength="150">
                        </span>
                    </td>
                </tr>
                <tr>
                    <th class="cell_title">주소 <em class="mark_necessity"><span class="blind"></span></em></th>
                    <td>
                                <span class="_input basic_input" style="width: 64px">
								<label for="zipCode" class="lb_text blind"></label>
								<input type="text" id="zipCode" class="ip_text" disabled="disabled" value="">
							</span>
                        <a href="#" class="_search setting_btn green">주소검색</a>
                        <p class="address_detail">
                                    <span class="_input basic_input" style="width: 338px">
									<label for="baseAddress" class="lb_text blind"></label>
									<input type="text" id="baseAddress" class="ip_text" disabled="disabled" value="">
									<input type="hidden" id="roadNameAddressYn" value="">
								</span>
                        </p>
                        <p class="address_detail">
                                    <span class="_editable_input _input basic_input" style="width: 338px">
							
									<label for="detailAddress" class="lb_text">
                                        상세 주소를 입력해주세요.
                                    </label>
									<input type="text" id="detailAddress" class="ip_text" value="" maxlength="100">
								</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="cell_title">연락처 <em class="mark_necessity"><span class="blind"></span></em></th>
                    <td>
                    
                          <span class="_editable_input _input basic_input" style="width: 48px">
								<label for="telNo1Second" class="lb_text blind"></label>
								<input type="text" id="telNo1Second" class="ip_text" maxlength="4" value="">
							</span>
                        <span class="hyphen">-</span>
                        <span class="_editable_input _input basic_input" style="width: 48px">
								<label for="telNo1Second" class="lb_text blind"></label>
								<input type="text" id="telNo1Second" class="ip_text" maxlength="4" value="">
							</span>
                        <span class="hyphen">-</span>
                        <span class="_editable_input _input basic_input" style="width: 48px">
								<label for="telNo1Third" class="lb_text blind"></label>
								<input type="text" id="telNo1Third" class="ip_text" maxlength="4" value="">
							</span>
                    </td>
                </tr>
            
                </tbody>
            </table>
            <div class="delivery_notice">
                <p class="desc">· 입력/수정하신 배송지는 배송지 목록에 저장됩니다.</p>
            </div>
        </div>
    </div>
    <div id="pop_footer">
        <button type="button" class="button" onclick="javascript:window.close();return false;">닫기</button>
        <button type="button" class="_btn_save button green_bg">저장</button>
    </div>
</div>

</body></html>
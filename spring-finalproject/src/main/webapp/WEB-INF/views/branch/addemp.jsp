<%@page import="com.finalproject.service.BranchService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="current_page" value="branchaddemp" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/branch.css">
<script type="text/javascript" src="../resources/jquery/jquery.js" ></script>
<script type="text/javascript" src="../resources/jquery/money.js" ></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
// 업로드 이미지 미리보기
$.fn.setPreview = function(opt){
    "use strict"
    var defaultOpt = {
        inputFile: $(this),
        img: null,
        w: 200,
        h: 200
    };
    $.extend(defaultOpt, opt);
 
    var previewImage = function(){
        if (!defaultOpt.inputFile || !defaultOpt.img) return;
 
        var inputFile = defaultOpt.inputFile.get(0);
        var img       = defaultOpt.img.get(0);
 
        // FileReader
        if (window.FileReader) {
            // image 파일만
            if (!inputFile.files[0].type.match(/image\//)) return;
 
            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    img.src = e.target.result;
                    //img.style.width  = defaultOpt.w+'px';
                    //img.style.height = defaultOpt.h+'px';
                    img.style.display = '';
                }
                reader.readAsDataURL(inputFile.files[0]);
            } catch (e) {
                // exception...
            }
        // img.filters (MSIE)
        } else if (img.filters) {
            inputFile.select();
            inputFile.blur();
            var imgSrc = document.selection.createRange().text;
 
            img.style.width  = defaultOpt.w+'px';
            img.style.height = defaultOpt.h+'px';
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";            
            img.style.display = '';
        // no support
        } else {
            // Safari5, ...
        }
    };
 
    // onchange
    $(this).change(function(){
        previewImage();
    });
};
 
 
$(document).ready(function(){
    var opt = {
        img: $('#img_preview'),
        w: 200,
        h: 200
    };
 
    $('#input_file').setPreview(opt);
});

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
</script>
<title>지점 - 사용자등록</title>
</head>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="brno" property="principal.brEmp.branch.no"/>
	<sec:authentication var="empno" property="principal.brEmp.no"/>
	<sec:authentication var="brname" property="principal.brEmp.branch.name"/>
</sec:authorize>
<body id="emp-${empno }">
<div class="wrapper container" id="brno-${brno }">
	<div class="row">
		<div class="col-sm-12">
			<%@ include file="topmenu.jsp" %>
		</div>
	</div>
	
	<div class="row addemp-con">
		<h3>아르바이트생 등록하기</h3>
		<div class="col-sm-12">
			<form role="form" action="upload.do?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
				<table class="table table-bordered">
					<tbody>
						<colgroup>
							<col width="15%">
							<col width="27.5%">
							<col width="15%">
							<col width="17.5%">
							<col width="15%">
						</colgroup>
						
						<tr>
							<th>비밀번호 *</th>
							<td colspan="3"><input type="password" name="password" class="form-control input-sm" /></td>
							<td rowspan="3"><img id="img_preview" style="display:none;"/></td>
						</tr>
						<tr>
							<th>이름 *</th>
							<td colspan="3"><input type="text" name="name" class="form-control input-sm" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3">
								<div class="form-group">
									<div class="col-xs-4">								
										<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control">
									</div>
									<div class="col-xs-3">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-info">
									</div>
								</div>
								<div class="form-group">
								
									<div class="col-xs-6">
										<input type="text" id="sample6_address" name="address1" placeholder="주소" class="form-control">
									</div>
									<div class="col-xs-6">
										<input type="text" id="sample6_address2" name="address2" placeholder="상세주소" class="form-control">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td colspan="3"><input type="text" name="phone" class="form-control input-sm" /></td>
							<td><label for="input_file" class="btn btn-primary btn-sm">이미지등록</label><input type="file" id="input_file" name="images" /></td>
						</tr>
						<tr>
							<th>이메일 *</th>
							<td><input type="email" name="email" class="form-control input-sm" /></td>
							<th>생년월일</th>
							<td colspan="2"><input type="date" name="birth" class="form-control input-sm" /></td>
						</tr>
						<tr>
							<th>직책</th>
							<td><input type="hidden" name="grade" value="ROLE_MEMBER" />아르바이트생</td>
							<th>근무지점</th>
							<td colspan="2"><input type="hidden" name="brno" value="${brno }" />${brname }</td>
						</tr>
					</tbody>
				</table>
				
				<div id="add-btn-box">
					<input type="submit" class="btn btn-success" value="전송" />
					<input type="reset" class="btn btn-default" value="취소" />
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
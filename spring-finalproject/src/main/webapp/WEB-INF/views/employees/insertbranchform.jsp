<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/FinalProject/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/FinalProject/resources/jquery/jquery.js"></script>
<style type="text/css">
	.container {position:relative; top:150px;}
	.container:after {clear:both; content:""; display:block;}

	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table { table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px; padding:0 !important;}
	th {text-align:center; vertical-align:middle !important;}
	td {padding:8px 0 !important;}
	td > input, td > select {width:100%; height:100%;border:none; padding:0 8px !important;}
	td > input:focus, td > select:focus {outline:none;}
	td.ckbox { text-align:center; vertical-align:middle !important; }
	td> input[type="checkbox"] {width:30px; height:30px; margin:0 !important; padding:5px !important; vertical-align:middle; }
	
	.ptBox {padding:0 !important;}
	.ptImg {width:100%; height:100%; overflow:hidden;  text-align:center;}
	.ptImg:after {clear:both; content:""; display:block; }
	.ptImg > #thumnail { width:100% !important; margin:0 auto; vertical-align:middle; text-align:center; border:1px solid #ddd;}
	.photoBtn {width:100%; height:100%; padding:0 !important;}
	.photoBtn > div > label { width:100%; height:100%; vertical-align:middle; cursor: pointer; text-align:center; line-height:50px;}
	/* 파일 필드 숨기기 */
	.photoBtn > div > input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;}
	
	.formBtnBox {clear:both; margin-top:60px;}
	.formBtn {width:50%; float:left; text-align:center;}
	.formBtn > input { width:50%; padding:10px 0;}
	
	
</style>
<script type="text/javascript">
$(function() {
	
	$(".insertbranchform").submit(function() {
		
		var address = $("input[name='address']").val().replace(/ /g, '');
		var add1 = $("input[name='add1']").val().replace(/ /g, '');
		var add2 = $("input[name='add2']").val().replace(/ /g, '');
		
		var addressval = add1 + " " + add2;
		$("input[name='address']").val(addressval)
			
		return true;
		
	});
	
	function readURL(input) {
		var url = input.value;
		var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
		if (input.files && input.files[0] && (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) {
		    var reader = new FileReader();
	
		    reader.onload = function (e) {
		        $('#thumnail')
			        .attr('src', e.target.result)
	                .css('height', '100%').css('display', 'block').css('margin', '0 auto'). css('text-align', 'center');
		    }
		    
		    //alert(url);
		    reader.readAsDataURL(input.files[0]);
		    
		}
		else{
		     $('#thumnail').attr('src', '/FinalProject/resources/image/no-image.png');
		  }
	}
	
	$("#ptFile").on("change", function() {
		readURL(this);
		
	});
	
	
});
</script>
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>	
	<div id="page-content-wrapper">
		<div class="container">
			<h1>지점 등록</h1>
			<form role="form" action="insertbranch.do" method="post" class="insertbranchform" enctype="multipart/form-data">
				<table class="table table-bordered">
					<colgroup>
						<col style="width:15%">
						<col style="width:8%">
						<col style="width:15%">
						<col style="width:8%">
						<col style="width:15%">
						<col style="width:8%">
						<col style="width:31%">
					</colgroup>
					<tr>
						<th class="info">지점명</th>
						<td colspan="5"><input type="text" name="name"/></td>
						<td rowspan="6" class="ptBox">
							<div class="ptImg">
								<img id="thumnail" src="/FinalProject/resources/image/no-image2.png"/>
							</div>
						</td>
					</tr>
					<tr>
						<th class="info">담당자</th>
						<td colspan="5">
							<select  name="empNo">
							<c:forEach var="emp" items="${empList }">
								<option value="${emp.no }">${emp.name }</option>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th class="info">전화번호</th>
						<td colspan="5"><input type="text" name="phone"/></td>
					</tr>
					<tr>
						<th class="info">주소</th>
						<td colspan="5"><input type="text" name="add1"/></td>
					</tr>
					<tr>
						<th class="info">상세주소</th>
						<td colspan="5">
							<input type="text" name="add2"/>
							<input type="hidden" name="address"/>
						</td>
					</tr>
					<tr>
						<th class="info">ATM</th>
						<td class="ckbox"><input type="checkbox" name="atm" value="Y"/></td>
						<th class="info">직접조리식품</th>
						<td class="ckbox"><input type="checkbox" name="freshFood" value="Y"/></td>
						<th class="info">로또</th>
						<td class="ckbox"><input type="checkbox" name="lotto" value="Y"/></td>
					</tr>
					<tr>
						<th class="info">택배서비스</th>
						<td class="ckbox"><input type="checkbox" name="parcelService" value="Y"/></td>
						<th class="info">생활편의</th>
						<td class="ckbox"><input type="checkbox" name="lifeService" value="Y"/></td>
						<th class="info">&nbsp;</th>
						<td>&nbsp;</td>
						<td class="photoBtn btn btn-primary">
							<div>
								<label for="ptFile">이미지 등록</label> 
		  						<input type="file" id="ptFile" class="upload-hidden" name="img" accept="image/gif, image/jpeg, image/png"> 
							</div>
						</td>
					</tr>
				</table>
				<div class="formBtnBox">
					<div class="formBtn">
						<input type="submit" class="btn btn-primary" value="등록"/>
					</div>
					<div class="formBtn">
						<input type="reset" class="btn btn-default" value="취소"/>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
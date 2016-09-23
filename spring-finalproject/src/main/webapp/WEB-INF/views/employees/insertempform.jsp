<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/FinalProject/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/FinalProject/resources/jquery/jquery.js"></script>
<link href="/FinalProject/resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script src="/FinalProject/resources/bootstrap/js/bootstrap.min.js"></script>
<style>
	.insertempBox {width:1200px;position:absolute; top:50%; margin-top:-300px;}
	.insertempBox:after {clear:both; content:""; display:block;}
	/* 
	tr {clear:both;}
	th {text-align:center}
	td > input, td > select {width:100%; height:100%;border:none;}
	td > input:focus, td > select:focus {outline:none;}
	 */
	 
	.insertLeft1 {width:80%; float:left; border-top:1px solid #ddd;}
	.left, .right {clear:both; width:100%; height:100%; padding:8px; border-bottom:1px solid #ddd;}
	.left:after, .right:after {clear:both; content:""; display:block; }
	.left > .info, .right > .info {width:100px; float:left;  vertical-align:middle;}
	.left > div, .right > div {float:left; vertical-align:middle;}
	.left > div > input, .left > div > select, .right > div > input, .right > div > select {width:100%; height:100%; padding:0; border:none; vertical-align:middle;}
	.insertRight1 {width:20%; float:right; border:1px solid #ddd; border-bottom:none;}
	.insertline {clear:both; width:100%; border-top:1px solid #ddd;}
	.insertline > left {width:50%; float:left;}
	.insertline > right {width:50%; float:right;}
	.content3 {clear:both; width:100%;}
	 
	 
	#photobox { width:100%; height:188px;}
	#photobox > img { height:100%; }
	.photoBtn label { width:100%; height:45px; line-height: normal; vertical-align: middle; cursor: pointer;}
	/* 파일 필드 숨기기 */
	.photoBtn input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;}
	
	.formBtnBox {clear:both; margin-top:60px;}
	.formBtn {width:50%; float:left; text-align:center;}
	.formBtn > input { width:50%; padding:10px 0;}
	
	.deptBtn-box {position:relative; padding:0 !important;}
	.deptBtn-box > input {width:80%;}
	.deptBtn-box > .deptBtn {padding:0; width:20%; height:100%; cursor:pointer; vertical-align:middle; text-align:center; float:right; }
	.deptBtn-box > .deptBtn > span.glyphicon {top:12px !important;}
	.deptBtn-box > .deptBtn-scroll {width:100%; height:300px; position:absolute; margin-top:2px; background:blue;}
</style>
<script type="text/javascript">
$(function() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
 	
	if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

	today = yyyy+'-'+mm+'-'+dd;
	$("input[name='birth']").setAttribute("max", today);
	
	/* 썸네일 이미지 */
	$("#ptFile").on("change", function() {
		alert( $("#ptFile").val());
	});
	
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>	
	<div class="container">
		<form role="form" action="insertemp.do" method="post" class="insertempBox">
			<div class="insertLeft1">
				<div class="left">
					<p class="info">비밀번호</p>
					<div><input type="password" name="password"/></div>
				</div>
				<div class="left">
					<p class="info">이름</p>
					<div><input type="text" name="name"/></div>
				</div>
				<div class="left">
					<p class="info">연락처</p>
					<div><input type="text" name="phone"/></div>
				</div>
				<div class="left">
					<p class="info">이메일</p>
					<div><input type="text" name="email"/></div>
				</div>
			</div>
			<div class="insertRight1">
				<div id="photobox">
					<img id="thumnail" src="/FinalProject/resources/image/no-image.png" width="100%"/>
				</div>					
				<div class="info photoBtn">
					<label for="ptFile">사진등록</label>
					<input type="file" id="ptFile" name="photo"/>
				</div>
			</div>
			<div class="content">
				<div class="inserline">
					<div class="left">
						<p class="info">주소</p>
						<div><input type="text" name="address"/></div>
					</div>
					<div class="right">
						<p class="info">생년월일</p>
						<div colspan="2"><input type="date" name="birth" min="1850-01-01" max="2016-09-22"></div>
					</div>	
				</div>
				<div class="content">	
					<div class="left">
						<p class="info">직책</p>
						<div colspan="2">
							<select name="position">
								<option>부장</option>
								<option>과장</option>
								<option>대리</option>
								<option>주임</option>
								<option>사원</option>
							</select>					
						</div>
					</div>
				<div class="insertRight2">
					<div class="right">
						<p class="info">근무지점</p>
						<div colspan="2" class="deptBtn-box">
								<input type="text" name="dept"/>
								<!-- <div class="deptBtn">
									<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
								</div>
								<div class="deptBtn-scroll"></div> -->
						</div>
					</div>	
				</div>
				</div>
			</div>
			<div class="content3">
				<div class="left">
					<p class="info">비고</p>
					<div colspan="5"><input type="text" name="remarks"/></div>
				</div>
			</div>
			<div class="formBtnBox">
				<div class="formBtn">
					<input type="submit" class="btn btn-primary" value="등록"/>
				</div>
				<div class="formBtn">
					<input type="reset" class="btn btn-danger" value="취소"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
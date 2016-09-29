<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	table {table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px;}
	th {text-align:center; vertical-align:middle !important;}
	td {padding:8px 0 !important;}
	td > input, td > select {width:100%; height:100%;border:none; padding:0 8px !important;}
	td > input:focus, td > select:focus {outline:none;}
	
	.ptBox { margin:0; padding:0 !important;}
	.ptBox .ptImg {height:100%; overflow:hidden;  text-align:center;}
	.ptBox .ptImg:after {clear:both; content:""; display:block; }
	.ptBox > .ptImg > #thumnail { width:auto; margin:0 auto;height:100% !important; vertical-align:middle; text-align:center;}
	.photoBtn label { width:100%; vertical-align: middle; cursor: pointer; text-align:center;}
	/* 파일 필드 숨기기 */
	.photoBtn input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;}
	
	.formBtnBox {clear:both; margin-top:60px;}
	.formBtn {width:50%; float:left; text-align:center;}
	.formBtn > input { width:50%; padding:10px 0;}
	
	.branchBtn-box {position:relative; padding:0 !important;}
	.branchBtn-box > input {width:80%;}
	.branchBtn-box > .branchBtn {padding:0; width:16%; height:100%; cursor:pointer; vertical-align:middle; text-align:center; float:right; }
	.branchBtn-box > .branchBtn:after {clear:both; content:""; display:block;}
	.branchBtn-box > .branchBtn > span.glyphicon {top:17px !important;}
	.branchBtn-box > .branchBtnScroll {width:100%; height:300px; position:absolute; border:1.5px solid #ddd; background:#fff; overflow:hidden; }
	.branchBtn-box > .branchBtnScroll > ul {padding:0; width:100%; height:100%; list-style:none; overflow-y:scroll;  }
	.branchBtn-box > .branchBtnScroll > ul > li {padding:10px 5px; width:98%; margin:0 auto; list-style:none; border-bottom:1px solid #ddd; cursor:pointer; }

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
	//$("input[name='birth']").setAttribute("max", today);
	
	/* 썸네일 이미지 */
	/* function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	
	        reader.onload = function (e) {
	            $('#thumnail').attr('src', e.target.result);
	            
	            alert($('#thumnail').src());
	        }
	
	        reader.readAsDataURL(input.files[0]);
	    }
	} */
	function readURL(input) {
		var url = input.value;
		var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
		if (input.files && input.files[0] && (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) {
		    var reader = new FileReader();
	
		    reader.onload = function (e) {
		        $('#thumnail')
			        .attr('src', e.target.result)
	                .css('height', '100%');
		    }
		    
		    alert(url);
		    reader.readAsDataURL(input.files[0]);
		}
		else{
		     $('#thumnail').attr('src', '/FinalProject/resources/image/no-image.png');
		  }
	}
	$("#ptFile").on("change", function() {
		readURL(this);
		//$("#puFile")
		
		
	});
	
	/* 근무지점 */
	$(".branchBtnScroll").hide();
	$(".branchBtn").click(function() {
		 $(".branchBtnScroll").slideDown();

		 $("#branchList > li").click(function() {
			 
			 $("#branchName").val($(this).text());
			 $(".branchBtnScroll").slideUp(250);
		 });
	});
	
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>	
	<div class="container">
		<form role="form" action="insertemp.do" method="post" class="insertempBox">
			<table class="table table-bordered" >
				<colgroup>
					<col style="width:15%;">
					<col style="width:17%;">
					<col style="width:17%;">
					<col style="width:15%;">
					<col style="width:17%;">
					<col style="width:15%;">
				</colgroup>
				<tr>
					<th class="info">비밀번호</th>
					<td colspan="4"><input type="password" name="emp.password"/></td>
					<td rowspan="3" class="ptBox">
						<div class="ptImg">
							<img id="thumnail" src="/FinalProject/resources/image/no-image.png" />
						</div>
					</td>
				</tr>
				<tr>
					<th class="info">이름</th>
					<td colspan="4"><input type="text" name="emp.name"/></td>
				</tr>
				<tr>
					<th class="info">연락처</th>
					<td colspan="4"><input type="text" name="emp.phone"/></td>
				</tr>
				<tr>
					<th class="info">주소</th>
					<td colspan="4"><input type="text" name="emp.address"/></td>
					<th class="info photoBtn" >
						<label for="ptFile">이미지 등록</label> 
  						<input type="file" id="ptFile" class="upload-hidden" name="emp.photo" accept="image/gif, image/jpeg, image/png"> 
					</th>
				</tr>
				<tr>
					<th class="info">이메일</th>
					<td colspan="2"><input type="text" name="emp.email"/></td>
					<th class="info">생년월일</th>
					<td colspan="2"><input type="date" name="emp.birth" min="1850-01-01" max="2016-09-22"></td>
				</tr>
				<tr>
					<th class="info">직책</th>
					<td colspan="2">
						<select name="emp.position">
							<option>부장</option>
							<option>과장</option>
							<option>대리</option>
							<option>주임</option>
							<option>사원</option>
						</select>	
					</td>
					<th class="info">근무지점</th>
					<td colspan="2" class="branchBtn-box">
						<input type="text" name="name" id="branchName"/>
						<div class="branchBtn">
							<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
						</div>
						<div class="branchBtnScroll">
							<ul id="branchList">
							<c:forEach var="branch" items="${branchNames }">
								<li>${branch.name }</li>
							</c:forEach>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<th class="info">비고</th>
					<td colspan="5"><input type="text" name="emp.remarks"/></td>
				</tr>
			</table>
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
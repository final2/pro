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
	.container {position:relative; top:150px;}
	.container:after {clear:both; content:""; display:block;}

	.empBox {width:75%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	
	select {padding:4px !important; vertical-align:middle;}
	select > option { vertical-align:middle; display:block;}
	 
	.empct {margin-top:10px;}
	.empct > .row {margin-bottom:25px; clear:both;}
	.empct > .row:after {clear:both; content:""; display:block;}
	.empct > .empctLast {margin-bottom:10px !important;}
	.row > label {vertical-align:middle; margin-top:2px;}
	.empct > .row > p { -webkit-appearance: textfield; background-color: white; -webkit-rtl-ordering: logical; -webkit-user-select: text;
    cursor: auto; padding: 1px; border-width: 2px; border-style: inset; border-color: initial; border-image: initial; padding:2px 8px; margin:0 !important;}
	.empAddct > .empaddL {width:10.4%; float:left; padding:0 15px 0 15px;}
	.empAddct > .empaddI {width:89.6%; padding:0 15px 0 15px;}
	
	.empctrow > .empcareerL {width:11.3%; float:left; padding:0 15px 0 15px;}
	.empctrow > .empcareerI {width:85%; padding:0 15px 0 15px; float:left;}
	
	.empctrow {margin-bottom:7px !important;}
	.empctrow:after {clear:both; content:""; display:block;}
	
	.ptBox {width:60%; text-align:center;}
	.ptImg {width:100%; height:100%; overflow:hidden;  text-align:center;}
	.ptImg:after {clear:both; content:""; display:block; }
	.ptImg > #thumnail { width:100% !important; margin:0 auto; vertical-align:middle; text-align:center; border:1px solid #ddd;}
	.photoBtn {width:99%;}
	.photoBtn label { width:100%; vertical-align: middle; cursor: pointer; text-align:center;}
	/* 파일 필드 숨기기 */
	.photoBtn input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;}
	
	.careerBoxR {padding-right:0 !important;}
	.careerBtnBox {padding-right:0 !important;}
	.careerAdd {padding:2px; border:1px solid #888; background:#ddd; text-align:center; box-sizing: border-box; cursor:pointer;}
	.careerMinus {padding:2px; border:1px solid #888; background:#ddd; text-align:center; box-sizing: border-box; cursor:pointer;}
	
	.formBtnBox {clear:both; margin-top:60px;}
	.formBtn {width:50%; float:left; text-align:center;}
	.formBtn > input { width:50%; padding:10px 0;}
	

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
	
	$("#careerAddBox").on("click", ".careerBtnBox div", function() {
		alert("aa");
	})
	
	
	$("#careerAddBox").hide();
	$(".careerAdd").on("click", function() {
		var $careerAddBox = $("#careerAddBox");
		$careerAddBox.show();
		
		$careerAddBox.append("<div class='empctrow'>"
								+"<div class='empcareerL'>"
									+"<label></label>"
								+"</div>"
								+"<div class='empcareerI careerBoxR'>"
									+"<div class='row'>"
										+"<div class='col-sm-4'>"
											+"<div class='row'>"
												+"<label class='col-sm-4'>학교명</label>"
												+"<input type='text' name='school' class='col-sm-8'/>"
											+"</div>"
										+"</div>"
										+"<div class='col-sm-4 col-sm-offset-1'>"
											+"<div class='row'>"
											+"<label class='col-sm-4'>전공</label>"
											+"<input type='text' name='school' class='col-sm-8'/>"
											+"</div>"
										+"</div>"
										+"<div class='col-sm-1 col-sm-offset-2 careerBtnBox'>"
											 
										+"</div>"
									+"</div>"
								+"</div>"
							+"</div>");
		
	});
	
});
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>	
	<div class="container well" id="page-content-wrapper">
		<form role="form" action="insertemp.do" method="post" class="empBox row">
			<div class="row">
				<div class="col-md-5 empct">
					<div class="row">
						<label class="col-sm-3">사원번호</label>
						<p class="col-sm-9">${empNo }</p>
					</div>
					<div class="row">
						<label class="col-sm-3">비밀번호</label>
						<input  class="col-sm-9" type="password" name="emp.password"/>
					</div>
					<div class="row">
						<label class="col-sm-3">이름</label>
						<input  class="col-sm-9" type="text" name="emp.name"/>
					</div>
					<div class="row empctLast">
						<label class="col-sm-3">연락처</label>
						<input class="col-sm-9" type="text" name="emp.phone"/>
					</div>
				</div>
				<div class="col-md-4 col-md-offset-3">
					<div class="ptBox pull-right">
						<div class="ptImg">
							<img id="thumnail" src="/FinalProject/resources/image/no-image.png" />
						</div>
						<div class="photoBtn btn btn-primary btn-xs" >
							<label for="ptFile">이미지 등록</label> 
	  						<input type="file" id="ptFile" class="upload-hidden" name="emp.photo" accept="image/gif, image/jpeg, image/png"> 
						</div>
					</div>
				</div>
			</div> <!-- row1 end -->
			<div class="row">
				<div class="col-md-5 empct">
					<div class="row">
						<label class="col-sm-3">생년월일</label>
						<input  class="col-sm-9" type="date" name="emp.birth"/>
					</div>
					<div class="row empctLast">
						<label class="col-sm-3">부서명</label>
						<input  class="col-sm-9" type="text" name="emp.dept"/>
					</div>
				</div>
				<div class="col-md-5 col-sm-offset-2 empct">
					<div class="row">
						<label class="col-sm-3">급여</label>
						<input  class="col-sm-9" type="text" name="emp.salary"/>
					</div>
					<div class="row empctLast">
						<label class="col-sm-3">직책</label>
						<select name="emp.position" class="col-sm-9">
							<option>부장</option>
							<option>과장</option>
							<option>대리</option>
							<option>주임</option>
							<option>사원</option>
						</select>
					</div>
				</div>
			</div> <!-- row2 end -->
			<div class="empct row">
				<div class="empAddct">
					<label class="empaddL">주소</label>
					<input class="empaddI" type="text" name="emp.address"/>
				</div>
			</div> <!-- row3 end -->
			<div class="empct row">
				<div class="empctrow">
					<div class="col-sm-1">
						<label>학력</label>
					</div>
					<div class="col-sm-11 careerBoxR">
						<div class="col-sm-4">
							<div class="row">
								<label class="col-sm-4">학교명</label>
								<input type="text" name="school" class="col-sm-8"/>
							</div>
						</div>
						<div class="col-sm-4 col-sm-offset-1">
							<div class="row">
								<label class="col-sm-4">전공</label>
								<input type="text" name="major" class="col-sm-8"/>
							</div>
						</div>
						<div class="col-sm-1  col-sm-offset-2 careerBtnBox">
							<div class="careerAdd">
								<span class="glyphicon glyphicon-plus"></span>
							</div>
						</div>
					</div>
				</div>
				<!-- 추가되는 구간 -->
				<div  id="careerAddBox" class="row">
				</div> <!-- 추가 끝나는 구간 -->
			</div> <!-- row4 end -->
		</form>
	</div>
</div>
</body>
</html>
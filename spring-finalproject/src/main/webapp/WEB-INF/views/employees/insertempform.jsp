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
	.empct:after {clear:both; content:""; display:block;}
	.empct > .row {margin-bottom:25px; clear:both;}
	.empct > .row:after {clear:both; content:""; display:block;}
	.empct > .empctLast {margin-bottom:10px !important;}
	.row > label {vertical-align:middle; margin-top:2px;}
	.empct > .row > p { -webkit-appearance: textfield; background-color: white; -webkit-rtl-ordering: logical; -webkit-user-select: text;
    cursor: auto; padding: 1px; border-width: 2px; border-style: inset; border-color: initial; border-image: initial; padding:2px 8px; margin:0 !important;}
	
	.empct2 { margin-top:20px;}
	
	.empAddct > .empaddL {width:13.9%; float:left; padding:0 15px 0 15px;}
	.empAddct > .empaddI {width:86.1%; padding:0 15px 0 15px;}
	
	.empctrow > .empcareerL, .empctrow > .emplicensesL, .empctrow > .empLanguagesL {width:13.9%; float:left; padding:0 15px 0 15px;}
	.empctrow > .empcareerI, .empctrow > .emplicensesI, .empctrow > .empLanguagesI {width:86.1%; padding:0 15px 0 15px; float:left;}
	
	.empctrow {margin-bottom:7px !important;}
	.empctrow:after {clear:both; content:""; display:block;}
	
	.ptBox {width:70%; height:200px; text-align:center;}
	.ptImg {width:100%; height:100%; overflow:hidden;  text-align:center; border:1px solid #ddd; margin-bottom:0 !important;}
	.ptImg:after {clear:both; content:""; display:block; }
	.ptImg > #thumnail {height:100% !important; vertical-align:middle;  display:block !important; margin:0 auto;text-align:center; border:1px solid #ddd;}
	.photoBtn {width:99%;}
	.photoBtn label { width:100%; vertical-align: middle; cursor: pointer; text-align:center;}
	/* 파일 필드 숨기기 */
	.photoBtn input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;}
	
	.careerBoxR, .licensesBoxR, .languagesBoxR {padding-right:0 !important;}
	.careerBtnBox, .licensesBtnBox, .languagesBtnBox {padding-right:0 !important;} 
	.careerAdd, .licensesAdd, .languagesAdd {padding:2px; border:1px solid #888; background:#ddd; text-align:center; box-sizing: border-box; cursor:pointer;}
	.careerMinus, .licenseMinus, .languagesMinus {padding:2px; border:1px solid #888; background:#ddd; text-align:center; box-sizing: border-box; cursor:pointer;}
	
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
	
	
	$(".empBox").submit(function() {
		
		
	});
	
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
	
	/* 학력 */
	/* $("#careerAddBox").on("click", ".careerBtnBox .careerMinus", function() {
		$(this).parents(".empctrow").hide();
	})
	
	$("#careerAddBox").hide();
	$(".careerAdd").on("click", function() {
		var $careerAddBox = $("#careerAddBox");
		$careerAddBox.show();
		var html = "";
		html += "<div class='empctrow'>";
		html += 	"<div class='empcareerL'>";
		html += 		"<label></label>";
		html += 	"</div>";
		html += 	"<div class='empcareerI careerBoxR'>";
		html += 		"<div class='col-sm-4'>";
		html += 			"<div class='row'>";
		html += 				"<label class='col-sm-4'>학교명</label>";
		html += 				"<input type='text' name='career' class='col-sm-8'/>";
		html += 			"</div>";
		html += 		"</div>";
		html += 		"<div class='col-sm-4 col-sm-offset-1'>";
		html += 			"<div class='row'>";
		html += 				"<label class='col-sm-4'>전공</label>";
		html += 				"<input type='text' name='career' class='col-sm-8'/>";
		html += 			"</div>";
		html += 		"</div>";
		html += 		"<div class='col-sm-1 col-sm-offset-2 careerBtnBox'>";
		html += 			"<div class='careerMinus'>";
		html += 				"<span class='glyphicon glyphicon-minus'></span>";
		html += 			"</div>";
		html += 		"</div>";
		html += 	"</div>";
		html += "</div>";
		
		$careerAddBox.append(html);
		
	}); */
	
	
	/* 자격증 */
	/* $("#licensesAddBox").on("click", ".licensesBtnBox .licensesMinus", function() {
		$(this).parents(".empctrow").hide();
	})
	
	$("#licensesAddBox").hide();
	$(".licensesAdd").on("click", function() {
		var $licensesAddBox = $("#licensesAddBox");
		$licensesAddBox.show();
		
		$licensesAddBox.append("<div class='empctrow'>"
								+"<div class='emplicensesL'>"
									+"<label></label>"
								+"</div>"
								+"<div class='emplicensesI licensesBoxR'>"
									+"<div class='row'>"
										+"<div class='col-sm-4'>"
											+"<div class='row'>"
												+"<label class='col-sm-4'>자격증</label>"
												+"<input type='text' name='licenses' class='col-sm-8'/>"
											+"</div>"
										+"</div>"
										+"<div class='col-sm-4 col-sm-offset-1'>"
											+"<div class='row'>"
											+"<label class='col-sm-4'>기관명</label>"
											+"<input type='text' name='licenses' class='col-sm-8'/>"
											+"</div>"
										+"</div>"
										+"<div class='col-sm-1 col-sm-offset-2 licensesBtnBox'>"
											+"<div class='licensesMinus'>"
												+"<span class='glyphicon glyphicon-minus'></span>"
											+"</div>"
										+"</div>"
									+"</div>"
								+"</div>"
							+"</div>");
		
	});
	 */
	/* 어학능력 */
	/* $("#languagesAddBox").on("click", ".languagesBtnBox .languagesMinus", function() {
		$(this).parents(".empctrow").hide();
	})
	
	$("#languagesAddBox").hide();
	$(".languagesAdd").on("click", function() {
		var $languagesAddBox = $("#languagesAddBox");
		$languagesAddBox.show();
		
		$languagesAddBox.append("<div class='empctrow'>"
								+"<div class='emplanguagesL'>"
									+"<label></label>"
								+"</div>"
								+"<div class='emplanguagesI languagesBoxR'>"
									+"<div class='row'>"
										+"<div class='col-sm-4'>"
											+"<div class='row'>"
												+"<label class='col-sm-4'>외국어명</label>"
												+"<input type='text' name='languages' class='col-sm-8'/>"
											+"</div>"
										+"</div>"
										+"<div class='col-sm-4 col-sm-offset-1'>"
											+"<div class='row'>"
											+"<label class='col-sm-4'>비고</label>"
											+"<input type='text' name='languages' class='col-sm-8'/>"
											+"</div>"
										+"</div>"
										+"<div class='col-sm-1 col-sm-offset-2 languagesBtnBox'>"
											+"<div class='languagesMinus'>"
												+"<span class='glyphicon glyphicon-minus'></span>"
											+"</div>"
										+"</div>"
									+"</div>"
								+"</div>"
							+"</div>"
		);
		
	});
	 */
	
});
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>	
	<div id="page-content-wrapper">
		<div class="container ">
			<h1>사원 등록</h1>
			<div class="well">
				<form role="form" action="insertemp.do" method="post" class="empBox row" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-5 empct">
							<div class="row">
								<label class="col-sm-4">사원번호</label>
								<input class="col-sm-8" type="text" value="${empNo }" name="empNo" readonly />  
							</div>
							<div class="row">
								<label class="col-sm-4">비밀번호</label>
								<input  class="col-sm-8" type="password" name="password"/>
							</div>
							<div class="row">
								<label class="col-sm-4">이름</label>
								<input  class="col-sm-8" type="text" name="name"/>
							</div>
							<div class="row">
								<label class="col-sm-4">연락처</label>
								<input class="col-sm-8" type="text" name="phone"/>
							</div>
							<div class="row empctLast">
								<label class="col-sm-4">이메일</label>
								<input class="col-sm-8" type="text" name="email"/>
							</div>
						</div>
						<div class="col-md-4 col-md-offset-3">
							<div class="ptBox pull-right">
								<p class="ptImg">
									<img id="thumnail" src="/FinalProject/resources/image/no-image.png" />
								</p>
								<div class="photoBtn btn btn-primary btn-xs" >
									<label for="ptFile">이미지 등록</label> 
			  						<input type="file" id="ptFile" class="upload-hidden" name="photo" accept="image/gif, image/jpeg, image/png"> 
								</div>
							</div>
						</div>
					</div> <!-- row1 end -->
					<div class="row">
						<div class="col-md-5 empct">
							<div class="row">
								<label class="col-sm-4">생년월일</label>
								<input  class="col-sm-8" type="date" name="birth"/>
							</div>
							<div class="row empctLast">
								<label class="col-sm-4">부서명</label>
								<input  class="col-sm-8" type="text" name="dept"/>
							</div>
						</div>
						<div class="col-md-5 col-sm-offset-2 empct">
							<div class="row">
								<label class="col-sm-4">급여</label>
								<input  class="col-sm-8" type="text" name="salary"/>
							</div>
							<div class="row empctLast">
								<label class="col-sm-4">직책</label>
								<select name="position" class="col-sm-8">
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
							<input class="empaddI" type="text" name="address"/>
						</div>
					</div> <!-- row3 end -->
					<!-- <div class="empct2">
						<div class="row">
							<div class="empctrow">
								<div class="empcareerL">
									<label>학력</label>
								</div>
								<div class="empcareerI careerBoxR">
									<div class="col-sm-4">
										<div class="row">
											<label class="col-sm-4">학교명</label>
											<input type="text" name="carees" class="col-sm-8"/>
										</div>
									</div>
									<div class="col-sm-4 col-sm-offset-1">
										<div class="row">
											<label class="col-sm-4">전공</label>
											<input type="text" name="carees" class="col-sm-8"/>
										</div>
									</div>
									<div class="col-sm-1  col-sm-offset-2 careerBtnBox">
										<div class="careerAdd">
											<span class="glyphicon glyphicon-plus"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						추가되는 구간
						<div  id="careerAddBox" class="row">
						</div> 추가 끝나는 구간
					</div> --><!-- row4 end -->
					<!-- <div class="empct row">
						<div class="empctrow">
							<label class="emplicensesL">자격증</label>
							<div class="emplicensesI licensesBoxR">
								<div class="col-sm-4">
									<div class="row">
										<label class="col-sm-4">자격증</label>
										<input type="text" name="licenses" class="col-sm-8"/>
									</div>
								</div>
								<div class="col-sm-4 col-sm-offset-1">
									<div class="row">
										<label class="col-sm-4">기관명</label>
										<input type="text" name="licenses" class="col-sm-8"/>
									</div>
								</div>
								<div class="col-sm-1  col-sm-offset-2 licensesBtnBox">
									<div class="licensesAdd">
										<span class="glyphicon glyphicon-plus"></span>
									</div>
								</div>
							</div>
						</div>
						추가되는 구간
						<div  id="licensesAddBox" class="row">
						</div> 추가 끝나는 구간
					</div> --> <!-- row5 end -->
					<!-- <div class="empct row">
						<div class="empctrow">
							<label class="empLanguagesL">어학능력</label>
							<div class="empLanguagesI languagesBoxR">
								<div class="col-sm-4">
									<div class="row">
										<label class="col-sm-4">자격증</label>
										<input type="text" name="language" class="col-sm-8"/>
									</div>
								</div>
								<div class="col-sm-4 col-sm-offset-1">
									<div class="row">
										<label class="col-sm-4">기관명</label>
										<input type="text" name="language" class="col-sm-8"/>
									</div>
								</div>
								<div class="col-sm-1  col-sm-offset-2 languagesBtnBox">
									<div class="languagesAdd">
										<span class="glyphicon glyphicon-plus"></span>
									</div>
								</div>
							</div>
						</div>
						추가되는 구간
						<div  id="languagesAddBox" class="row">
						</div> 추가 끝나는 구간
					</div>  --><!-- row6 end -->
					
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
		</div>
	</div>
</div>
</body>
</html>
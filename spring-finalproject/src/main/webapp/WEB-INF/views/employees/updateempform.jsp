<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/FinalProject/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/FinalProject/resources/jquery/jquery.js"></script>
<style>
	.container {position:relative; top:30px;}
	.container:after {clear:both; content:""; display:block;}

	.empBox {width:75%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	
	select {padding:4px !important; vertical-align:middle;}
	select > option { vertical-align:middle; display:block;}
	 
	.empct {margin-top:20px;}
	.empct:after {clear:both; content:""; display:block;}
	.empct > .row {margin-bottom:30px; clear:both;}
	.empct > .row:after {clear:both; content:""; display:block;}
	.empct > .empctLast {margin-bottom:10px !important;}
	.row > label {vertical-align:middle; margin-top:2px;}
	.empct > .row > p { -webkit-appearance: textfield; background-color: white; -webkit-rtl-ordering: logical; -webkit-user-select: text;
    cursor: auto; padding: 1px; border-width: 2px; border-style: inset; border-color: initial; border-image: initial; padding:2px 8px; margin:0 !important;}
	
	.empAddct {margin-bottom:30px;}
	.empct2 { margin-top:20px;}
	
	.empAddct > .empaddL {width:13.9%; float:left; padding:0 15px 0 15px;}
	.empAddct > .empaddI {width:86.1%; padding:0 15px 0 15px;}
	
	.empctrow > .empcareerL, .empctrow > .emplicensesL, .empctrow > .emplanguagesL {width:13.9%; height:100%; float:left; padding:0 15px 0 15px;}
	.empctrow > .empcareerL:after {clear:both; content:""; display:block;}
	.empctrow > .empcareerI, .empctrow > .emplicensesI, .empctrow > .emplanguagesI {width:86.1%; padding:0 15px 0 15px; float:left;}
	.empctrow > .empcareerI label, .empctrow > .emplicensesI label, .empctrow > .emplanguagesI label {text-align:right;}
	
	.empctrow {margin-bottom:7px !important;}
	.empctrow:after {clear:both; content:""; display:block;}
	
	.ptBox {width:63%; height:180px; text-align:center; margin-top:10px;}
	.ptImg {width:100%; height:100%; overflow:hidden; border:2px solid #c2c2c2; box-sizing: border-box; background:#fff; margin-bottom:0 !important;}
	.ptImg:after {clear:both; content:""; display:block; }
	.ptImg > #thumnail {width:auto !important; height:100% !important; vertical-align:middle; }
	.photoBtn {width:99%;}
	.photoBtn label { width:100%; vertical-align: middle; cursor: pointer; text-align:center;}
	/* 파일 필드 숨기기 */
	.photoBtn input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;}
	
	.careerBoxR, .licensesBoxR, .languagesBoxR {padding-right:0 !important;}
	.careerBtnBox, .licensesBtnBox, .languagesBtnBox {padding-right:0 !important;} 
	.careerAdd, .licensesAdd, .languagesAdd {padding:2px; border:1px solid #888; background:#ddd; text-align:center; box-sizing: border-box; cursor:pointer;}
	.careerMinus, .licenseMinus, .languagesMinus {padding:2px; border:1px solid #888; background:#ddd; text-align:center; box-sizing: border-box; cursor:pointer;}
	
	.formBtnBox {clear:both; margin-top:60px;}
	.formBtnBox {clear:both; content:""; display:block;}
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
		
		/* if() {
			
		}
		
		return false;
		 */
	});
	
	$("input[name='salary']").css('text-align', 'right');
	
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
	
	/* 학력 */
	$("#careerAddBox").on("click", ".careerBtnBox .careerMinus", function() {
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
		html += 				"<label class='col-sm-4'>기간</label>";
		html += 				"<input type='text' name='terms' class='col-sm-8'/>";
		html += 			"</div>";
		html += 		"</div>";
		html += 		"<div class='col-sm-4'>";
		html += 			"<div class='row'>";
		html += 				"<label class='col-sm-4'>학교명</label>";
		html += 				"<input type='text' name='schools' class='col-sm-8'/>";
		html += 			"</div>";
		html += 		"</div>";
		html += 		"<div class='col-sm-3'>";
		html += 			"<div class='row'>";
		html += 				"<label class='col-sm-4'>전공</label>";
		html += 				"<input type='text' name='majors' class='col-sm-8'/>";
		html += 			"</div>";
		html += 		"</div>";
		html += 		"<div class='col-sm-1 careerBtnBox'>";
		html += 			"<div class='careerMinus'>";
		html += 				"<span class='glyphicon glyphicon-minus'></span>";
		html += 			"</div>";
		html += 		"</div>";
		html += 	"</div>";
		html += "</div>";
		
		$careerAddBox.append(html);
		
	});
	
	
	/* 자격증 */
	$("#licensesAddBox").on("click", ".licensesBtnBox .licenseMinus", function() {
		$(this).parents(".empctrow").hide();
	})
	
	$("#licensesAddBox").hide();
	$(".licensesAdd").on("click", function() {
		var $licensesAddBox = $("#licensesAddBox");
		$licensesAddBox.show();
		
		var html = "";
		html += "<div class='empctrow'>";
		html +=		"<div class='emplicensesL'>";
		html +=			"<label></label>";
		html +=		"</div>";
		html +=		"<div class='emplicensesI licensesBoxR'>";
		html +=			"<div class='col-sm-6'>";
		html +=				"<div class='row'>";
		html +=					"<label class='col-sm-5'>종류 및 등급</label>";
		html +=					"<input type='text' name='licenses' class='col-sm-7'/>";
		html +=				"</div>";
		html +=			"</div>";
		html +=			"<div class='col-sm-5'>";
		html +=				"<div class='row'>";
		html +=					"<label class='col-sm-4'>기관명</label>";
		html +=					"<input type='text' name='licenseOffices' class='col-sm-8'/>";
		html +=				"</div>";
		html +=			"</div>";
		html +=			"<div class='col-sm-1 licensesBtnBox'>";
		html +=				"<div class='licenseMinus'>";
		html +=					"<span class='glyphicon glyphicon-minus'></span>";
		html +=				"</div>";
		html +=			"</div>";
		html +=		"</div>";
		html +=	"</div>";
		
		$licensesAddBox.append(html);
		
	});
	
	/* 어학능력 */
	$("#languagesAddBox").on("click", ".languagesBtnBox .languagesMinus", function() {
		$(this).parents(".empctrow").hide();
	})
	
	$("#languagesAddBox").hide();
	$(".languagesAdd").on("click", function() {
		var $languagesAddBox = $("#languagesAddBox");
		$languagesAddBox.show();
		
		var html = "";
		html += "<div class='empctrow'>";
		html +=		"<div class='emplanguagesL'>";
		html +=			"<label></label>";
		html +=		"</div>";
		html +=		"<div class='emplanguagesI languagesBoxR'>";
		html +=			"<div class='col-sm-6'>";
		html +=				"<div class='row'>";
		html +=					"<label class='col-sm-5'>외국어명</label>";
		html +=					"<input type='text' name='languages' class='col-sm-7'/>";
		html +=				"</div>";
		html +=			"</div>";
		html +=			"<div class='col-sm-5'>";
		html +=				"<div class='row'>";
		html +=					"<label class='col-sm-4'>점수</label>";
		html +=					"<input type='text' name='grades' class='col-sm-8'/>";
		html +=				"</div>";
		html +=			"</div>";
		html +=			"<div class='col-sm-1 languagesBtnBox'>";
		html +=				"<div class='languagesMinus'>";
		html +=					"<span class='glyphicon glyphicon-minus'></span>";
		html +=				"</div>";
		html +=			"</div>";
		html +=		"</div>";
		html +=	"</div>";
		
		$languagesAddBox.append(html);
		
	});
	
	
	function currency(obj)
	{
	 if (event.keyCode >= 48 && event.keyCode <= 57) {
	  
	 } else {
	                // else 를 지웠을때는 한글이 자동으로 삭제 됩니다.
	  event.returnValue = false
	 }
	}
	function com(obj)
	{
	 obj.value = unComma(obj.value);
	 obj.value = Comma(obj.value);
	}
	function Comma(input) {

	  var inputString = new String;
	  var outputString = new String;
	  var counter = 0;
	  var decimalPoint = 0;
	  var end = 0;
	  var modval = 0;

	  inputString = input.toString();
	  outputString = '';
	  decimalPoint = inputString.indexOf('.', 1);

	  if(decimalPoint == -1) {
	     end = inputString.length - (inputString.charAt(0)=='0' ? 1:0);
	     for (counter=1;counter <=inputString.length; counter++)
	     {
	        var modval =counter - Math.floor(counter/3)*3;
	        outputString = (modval==0 && counter <end ? ',' : '') + inputString.charAt(inputString.length - counter) + outputString;
	     }
	  }
	  else {
	     end = decimalPoint - ( inputString.charAt(0)=='-' ? 1 :0);
	     for (counter=1; counter <= decimalPoint ; counter++)
	     {
	        outputString = (counter==0  && counter <end ? ',' : '') +  inputString.charAt(decimalPoint - counter) + outputString;
	     }
	     for (counter=decimalPoint; counter < decimalPoint+3; counter++)
	     {
	        outputString += inputString.charAt(counter);
	     }
	 }
	    return (outputString);
	}
	
	function unComma(input) {
	   var inputString = new String;
	   var outputString = new String;
	   var outputNumber = new Number;
	   var counter = 0;
	   if (input == '')
	   {
	 return 0
	   }
	   inputString=input;
	   outputString='';
	   for (counter=0;counter <inputString.length; counter++)
	   {
	      outputString += (inputString.charAt(counter) != ',' ?inputString.charAt(counter) : '');
	   }
	   outputNumber = parseFloat(outputString);
	   return (outputNumber);
	}
	
	$("input[name='salary']").keyup(function() {
		com(this);
	});
	
	$("input[name='salary']").keypress(function() {
		currency(this);
	});
});
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>	
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<!-- 메신저 modal창 -->
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	
	<div id="page-content-wrapper">
		<%@ include file="../companynotice/backgroundVideo.jsp" %>
		<div class="container ">
			<h1>사원 정보 수정</h1>
			<div class="well" style="opacity:0.8">
				<form role="form" action="insertemp.do" method="post" class="empBox row" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-5 empct">
							<div class="row">
								<label class="col-sm-4">비밀번호</label>
								<input class="col-sm-8 text-danger" type="text" value="${empDetail.emp.password }" placeholder="본인이 변경가능"/>
								<%-- <input  class="col-sm-8" type="password" name="password" value="${empDetail.emp.password }" readonly="readonly"/> --%>
							</div>
							<div class="row">
								<label class="col-sm-4">이름</label>
								<input  class="col-sm-8" type="text" name="name" value="${empDetail.emp.name }"/>
							</div>
							<div class="row">
								<label class="col-sm-4">연락처</label>
								<input class="col-sm-8" type="text" name="phone" value="${empDetail.emp.phone }"/>
							</div>
							<div class="row empctLast">
								<label class="col-sm-4">이메일</label>
								<input class="col-sm-8" type="text" name="email" value="${empDetail.emp.email}"/>
							</div>
						</div>
						<div class="col-md-4 col-md-offset-3">
							<div class="ptBox pull-right">
								<p class="ptImg">
									<img id="thumnail" src="/FinalProject/resources/image/empimg/${empDetail.emp.photo }" />
								</p>
								<div class="photoBtn btn btn-primary btn-xs" >
									<label for="ptFile">이미지 수정</label> 
			  						<input type="file" id="ptFile" class="upload-hidden" name="photo" accept="image/gif, image/jpeg, image/png"> 
								</div>
							</div>
						</div>
					</div> <!-- row1 end -->
					<div class="row">
						<div class="col-md-5 empct">
							<div class="row">
								<label class="col-sm-4">생년월일</label>
								<input  class="col-sm-8" type="date" name="birth" value='<fmt:formatDate value="${empDetail.emp.birth}" pattern="yyyy-MM-dd" />'/>
							</div>
							<div class="row empctLast">
								<label class="col-sm-4">부서명</label>
								<input  class="col-sm-8" type="text" name="dept" value="${empDetail.emp.dept}"/>
							</div>
						</div>
						<div class="col-md-5 col-sm-offset-2 empct">
							<div class="row">
								<label class="col-sm-4">급여</label>
								<input  class="col-sm-8" type="text" name="salary" value="<fmt:formatNumber type="number" value="${empDetail.emp.salary}"  groupingUsed="true"/> "/>
							</div>
							<div class="row empctLast">
								<label class="col-sm-4">직책</label>
								<select name="position" class="col-sm-8" value="${empDetail.emp}">
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
							<input class="empaddI" type="text" name="address" value="${empDetail.emp.address}"/>
						</div>
					</div> <!-- row3 end -->
					<div class="empct2">
						<div class="row">
							<div class="empctrow">
								<div class="empcareerL">
									<label>학력</label>
								</div>
								<div class="empcareerI careerBoxR">
									<div class="col-sm-4">
										<div class="row">
											<label class="col-sm-4"></label>
											<p class="col-sm-8"></p>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="row">
											<label class="col-sm-4"></label>
											<p class="col-sm-8"></p>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="row">
											<label class="col-sm-4"></label>
											<p class="col-sm-8"></p>
										</div>
									</div>
									<div class="col-sm-1 careerBtnBox">
										<div class="careerAdd">
											<span class="glyphicon glyphicon-plus"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
						<c:forEach var="career" items="${empDetail.careerList}">
							<div class='empctrow'>
								<div class='empcareerL'>
									<label></label>
								</div>
								<div class='empcareerI careerBoxR'>
									<div class='col-sm-4'>
										<div class='row'>
											<label class='col-sm-4'>기간</label>
											<input type='text' name='terms' class='col-sm-8' value="${career.term}"/>
										</div>
									</div>
									<div class='col-sm-4'>
										<div class='row'>
											<label class='col-sm-4'>학교명</label>
											<input type='text' name='schools' class='col-sm-8' value="${career.school}"/>
										</div>
									</div>
									<div class='col-sm-3'>
										<div class='row'>
											<label class='col-sm-4'>전공</label>
											<input type='text' name='majors' class='col-sm-8' value="${career.major}"/>
										</div>
									</div>
									<div class='col-sm-1 careerBtnBox'>
										<div class='careerMinus'>
											<span class='glyphicon glyphicon-minus'></span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						</div> 
						<!-- 추가되는 구간 -->
						<div  id="careerAddBox" class="row">
						</div> <!-- 추가 끝나는 구간 -->
					</div> <!-- row4 end -->
					<div class="empct2">
						<div class="row">
							<div class="empctrow">
								<div class="empcareerL">
									<label>자격증</label>
								</div>
								<div class="empcareerI careerBoxR">
									<div class="col-sm-6">
										<div class="row">
											<label class="col-sm-5"></label>
											<p class="col-sm-7"></p>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="row">
											<label class="col-sm-4"></label>
											<p class="col-sm-8"></p>
										</div>
									</div>
									<div class="col-sm-1 careerBtnBox">
										<div class="licensesAdd">
											<span class="glyphicon glyphicon-plus"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
						<c:forEach var="license" items="${empDetail.licenseList }">
							<div class='empctrow'>
								<div class='emplicensesL'>
									<label></label>
								</div>
								<div class='emplicensesI licensesBoxR'>
									<div class='col-sm-6'>
										<div class='row'>
											<label class='col-sm-5'>종류 및 등급</label>
											<input type='text' name='licenses' class='col-sm-7' value="${license.license }"/>
										</div>
									</div>
									<div class='col-sm-5'>
										<div class='row'>
											<label class='col-sm-4'>기관명</label>
											<input type='text' name='licenseOffices' class='col-sm-8' value="${license.licenseOffice }"/>
										</div>
									</div>
									<div class='col-sm-1 licensesBtnBox'>
										<div class='licenseMinus'>
											<span class='glyphicon glyphicon-minus'></span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
						<!-- 추가되는 구간 -->
						<div  id="licensesAddBox" class="row">
						</div> <!-- 추가 끝나는 구간 -->
					</div> <!-- row5 end -->
					<div class="empct2">
						<div class="row">
							<div class="empctrow">
								<div class="emplanguagesL">
									<label>어학능력</label>
								</div>
								<div class="emplanguagesI languagesBoxR">
									<div class="col-sm-6">
										<div class="row">
											<label class="col-sm-5"></label>
											<p class="col-sm-7"></p>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="row">
											<label class="col-sm-4"></label>
											<p class="col-sm-8"></p>
										</div>
									</div>
									<div class="col-sm-1 languagesBtnBox">
										<div class="languagesAdd">
											<span class="glyphicon glyphicon-plus"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
						<c:forEach var="language" items="${empDetail.languageList }">
							<div class='empctrow'>
								<div class='emplanguagesL'>
									<label></label>
								</div>
								<div class='emplanguagesI languagesBoxR'>
									<div class='col-sm-6'>
										<div class="row">
											<label class="col-sm-5">외국어명</label>
											<input type="text" name="languages" class="col-sm-7" value="${language.language }"/>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="row">
											<label class="col-sm-4">점수</label>
											<input type="text" name="grades" class="col-sm-8" value="${language.grade }"/>
										</div>
									</div>
									<div class='col-sm-1 licensesBtnBox'>
										<div class='licenseMinus'>
											<span class='glyphicon glyphicon-minus'></span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
						<!-- 추가되는 구간 -->
						<div  id="languagesAddBox" class="row">
						</div> <!-- 추가 끝나는 구간 -->
					</div> <!-- row6 end -->
					
					<div class="formBtnBox">
						<div class="formBtn">
							<input type="submit" class="btn btn-primary" value="수정"/>
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
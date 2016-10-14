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
<style>
	.container {position:relative; top:80px;}
	.container:after {clear:both; content:""; display:block;}
	
	.headerBox {width:100%;}
	.headerBox > h1 {width:55%; float:left;}
	.headerBox .row {width:45%; float:right; margin-top:30px;}
	.headerBox .row select:focus {outline:none;}

	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table { clear:both; table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px;  padding:0 !important;}
	th {vertical-align:middle !important; padding-left:8px !important;}
	td > input {text-align:right;}
	td > input, td > select {width:100%; height:100%;border:none; padding:0 8px !important;}
	td > input:focus, td > select:focus {outline:none;}
	th.info {text-align:center;}
	
	/* td > .empBtn {width:100%; height:100%; display:block; background:#f5fbff; vertical-align:middle; line-height:50px; text-decoration:none; color:inherit;} */
	.salaryName {background:#efefef;}
	
	.pageBox {width: 232px; position:absolute; left:50%; top:50%; margin-left:-116px; margin-top:550px;}
	
	.formBtnBox {clear:both; margin-top:80px;}
	.formBtn {width:50%; float:left; text-align:center;}
	.formBtn > input { width:50%; padding:10px 0;}
	
</style>
<script type="text/javascript">
	/* function currency(obj)
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
	} */
	
$(function() {
	$(".salaryForm").submit(function() {
		var nomal = $("input[name='salary']").val.replace(/ /g, '');
		var yeongeum = $("input[name='insureSocial']").val.replace(/ /g, '');
		var geongang = $("input[name='insurehealth']").val.replace(/ /g, '');
		var goyong = $("input[name='insureLonghealth']").val.replace(/ /g, '');
		var sanjae = $("input[name='employeeInsure']").val.replace(/ /g, '');
		var total = $("input[name='total']").val.replace(/ /g, '');
		var overtimeTime = $("input[name='overtimeTime']").val.replace(/ /g, '');
		var overtimePrice = $("input[name='overtimePrice']").val.replace(/ /g, '');
		var overtime = $("input[name='overtime']").val.replace(/ /g, '');
		var result = $("input[name='result']").val.replace(/ /g, '');
		
		yeongeum + geongang
		
		alert(nomal);
		
		
		
		return true;
	});
	
	$("#empNameBtn").on("change", function() {
		var empName = $(this).children("option:selected").val();
		$(".salaryName").text(empName+ "님의 급여명세서");
		var empNo = $(this).children("option:selected").attr("id").replace("no-", "");
		
		$.ajax({
			type:'GET',
			url:'getsalarybyno.do',
			contentType:'application/json',
			data:{empNo:empNo},
			dataType:'json',
			success:function(result) {
				console.log(result.salary)

			}
		}); 
		
		$("input[name='salary']").val();
		
	});
	
	
	$("#deptBtn").on("change", function () {
		var dept = $("#deptBtn").val();

		
		$.ajax({
			type:'GET',
			url:'getemployeebydept.do',
			contentType:'application/json',
			data:{dept:dept},
			dataType:'json',
			success:function(result) {
				var $select = $('#empNameBtn');
				$select.empty();
					$select.append("<option>사원 선택</option>");
				$.each(result, function(index, emp) {
					$select.append("<option id='no-"+emp.no+"'>"+ emp.no + " " + emp.name +"</option>");
				});

			}
		}); 
	});
});
</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>	
	<div id="page-content-wrapper">
		<div class="container">
			<div class="headerBox">
				<h1>급여 등록</h1>
				<div class="row">
					<div class="col-sm-6 form-group">
						<label>부서명</label>
						<select  class="form-control" id="deptBtn">
							<option>선택</option>
						<c:forEach var="emp" items="${empList }">
							<option name="dept" value="${emp.dept }">${emp.dept }</option>
						</c:forEach>
						</select>
					</div>
					<div class="col-sm-6 form-group empNameBox">
						<label>사원명</label>
						<select class="form-control" id="empNameBtn">
							<option selected="selected">부서명을 선택해주세요</option>
						</select>
					</div>
				</div>
			</div>
			<form role="form" action="insertbranchemp.do" method="post" class="salaryForm">
				<table class="table table-bordered empBox" >
					<colgroup>
						<col style="width:15%;">
						<col style="width:55%;">
						<col style="width:30%;">
					</colgroup>
					<c:if test="${ !empty empList }">
						<tr>
							<th colspan="3" class="salaryName text-center"></th>
						</tr>
					</c:if>
					<tr>
						<th colspan="2"  class="info text-left">기본급</th>
						<td><input type="text" name="salary"/></td>
					</tr>
					<tr>
						<th rowspan="5" class="info">공제 내역</th>
						<th>국민연금</th>
						<td><input type="text" name="insureSocial"/></td>
					</tr>
					<tr>
						<th>건강보험</th>
						<td><input type="text" name="insureHealth" onKeyPress="currency(this);" onKeyup="com(this);"/></td>
					</tr>
					<tr>
						<th>장기요양보험</th>
						<td><input type="text" name="insureLonghealth" onKeyPress="currency(this);" onKeyup="com(this);"/></td>
					</tr>
					<tr>
						<th>고용/산재보험</th>
						<td><input type="text" name="employeeInsure" onKeyPress="currency(this);" onKeyup="com(this);"/></td>
					</tr>
					<tr>
						<th>합계</th>
						<td><input type="hidden" name="total"/></td>
					</tr>
					<tr>
						<th rowspan="3" class="info">추가 수당</th>
						<th>초과 근무 시간</th>
						<td><input type="text" name="overtimeTime" onKeyPress="currency(this);" onKeyup="com(this);"/></td>
					</tr>
					<tr>
						<th>금액</th>
						<td><input type="text" name="overtimePrice" onKeyPress="currency(this);" onKeyup="com(this);"/></td>
					</tr>
					<tr>
						<th>합계</th>
						<td><input type="hidden" name="overtime"/></td>
					</tr>
					<tr>
						<th colspan="2"  class="info">총 지급 내역</th>
						<td><input type="hidden" name="result"/></td>
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
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
$(function() {
	
	$("#empNameBtn").on("change", function() {
		var empName = $(this).children("option:selected").val();
		
		var Now = new Date(); 
		var year = Now.getFullYear(); 
		
		var $salaryTitle = $(".salaryName");
		$salaryTitle.empty();
		
		var html = "";
		html += empName+"님의 ";
		html += "<select name='paymentDate' class='salaryDate'>";
		html += "	<option value='"+year+".01'>"+year+".01</option>";
		html += "	<option value='"+year+".02'>"+year+".02</option>";
		html += "	<option value='"+year+".03'>"+year+".03</option>";
		html += "	<option value='"+year+".04'>"+year+".04</option>";
		html += "	<option value='"+year+".05'>"+year+".05</option>";
		html += "	<option value='"+year+".06'>"+year+".06</option>";
		html += "	<option value='"+year+".07'>"+year+".07</option>";
		html += "	<option value='"+year+".08'>"+year+".08</option>";
		html += "	<option value='"+year+".09'>"+year+".09</option>";
		html += "	<option value='"+year+".10'>"+year+".10</option>";
		html += "	<option value='"+year+".11'>"+year+".11</option>";
		html += "	<option value='"+year+".12'>"+year+".12</option>";
		html += "</select>";
		html += " 급여 지급명세서";
		
		$salaryTitle.append(html);
		
		var empNo = $(this).children("option:selected").attr("id").replace("no-", "");
		
		$.ajax({
			type:'GET',
			url:'getsalarybyno.do',
			contentType:'application/json',
			data:{empNo:empNo},
			dataType:'json',
			success:function(result) {
				var a = Math.round(result.emp.salary);
				var b = Math.round(result.emp.salary * 0.09);
				var c = Math.round(result.emp.salary * 0.0533);
				var d = Math.round(result.emp.salary * 0.0655);
				var e = Math.round(result.emp.salary * 0.0045);
				$("input[name=salary]").val(Number(a).toLocaleString('en'));
				$("input[name=insureSocial]").val(Number(b).toLocaleString('en'));
				$("input[name=insureHealth]").val(Number(c).toLocaleString('en'));
				$("input[name=insureLonghealth]").val(Number(d).toLocaleString('en'));
				$("input[name=employeeInsure]").val(Number(e).toLocaleString('en'));
				
				var f = a-b+c+d+e;
				$("input[name=total]").val(Number(f).toLocaleString('en'));
				
				var g = result.overtime;
				$("input[name=overtimeTime]").val(g);
				
				if (g > 0) {
					var h = a/30/8 * 1.5;
					$("input[name=overtimePrice]").val(Number(h).toLocaleString('en'));
				
				} else {
					var h = 0;
					$("input[name=overtimePrice]").val(h);
				}
					var i = h * g;
					$("input[name=overtime]").val(Number(i).toLocaleString('en'));
					
					var j = f + i;
					$("input[name=result]").val(Number(j).toLocaleString('en'));
					
				
			}
			
		});
				$(".salaryNo").val(empNo);
		
		
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
	
	$(".salaryForm").submit(function() {
		
		
		
		return true;
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
			<form role="form" action="insertsalary.do" method="post" class="salaryForm">
				<table class="table table-bordered empBox" >
					<colgroup>
						<col style="width:15%;">
						<col style="width:55%;">
						<col style="width:30%;">
					</colgroup>
					<c:if test="${ !empty empList }">
						<tr>
							<th colspan="3" class="salaryName text-center">
								<input type="hidden" name='paymentDate' readonly="readonly"/>
								<input type="hidden" name='emp.no' class="salaryNo" readonly="readonly"/>
							</th>
						</tr>
					</c:if>
					<tr>
						<th colspan="2"  class="info text-left">기본급</th>
						<td>
							<input type="text" name='salary' readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th rowspan="5" class="info">공제 내역</th>
						<th>국민연금</th>
						<td><input type="text" name="insureSocial" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>건강보험</th>
						<td><input type="text" name="insureHealth" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>장기요양보험</th>
						<td><input type="text" name="insureLonghealth" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>고용/산재보험</th>
						<td><input type="text" name="employeeInsure" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>합계</th>
						<td><input type="text" name="total" readonly="readonly"/></td>
					</tr>
					<tr>
						<th rowspan="3" class="info">추가 수당</th>
						<th>초과 근무 시간</th>
						<td><input type="text" name="overtimeTime" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>금액</th>
						<td><input type="text" name="overtimePrice" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>합계</th>
						<td><input type="text" name="overtime" readonly="readonly"/></td>
					</tr>
					<tr>
						<th colspan="2"  class="info">총 지급 내역</th>
						<td><input type="text" name="result" readonly="readonly"/></td>
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
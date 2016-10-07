<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="current_page" value="branchwait" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/branch.css">
<link rel="stylesheet" type="text/css" href="../resources/css/buttons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/jquery/jquery.js" ></script>
<script type="text/javascript" src="../resources/jquery/money.js" ></script>
<script type="text/javascript">
$(function() {
	var brno = $(".container").attr("id").replace("brno-", "");
	var empno = $("body").attr("id").replace("emp-", "");
	var salesno = 0;
	var jsonData = "";
	
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/wsales/" + empno,
		dataType:"json",
		success:function(result) {
			var $tbody = $(".holding-con tbody").empty();
			
			var sum = 0;
			var resum = 0;
			
			$.each(result, function(index, item) {
				salesno = item.branchSales.no;
				
				sum = item.qty * item.product.price;
				
				$tbody.append("<tr><td>"+item.product.no+"</td><td>"
						+item.product.name+"</td><td>"
						+item.qty+"</td><td>"
						+formatNumber(item.product.price)+"</td><td>"
						+formatNumber(sum)+"</td></tr>");
				resum += sum;
				
			});
			
			$(".holding-sum").empty().append(formatNumber(resum));
			$(".holding-con").attr("id", "holding-" + salesno);
			
			jsonData = JSON.stringify(result).replace(/\"/g, "-");
		},
		error:function() {
			console.log("데이타 없다요")
		}
	});
	
	// 보류를 판매로
	$("#holding-to-sales-btn").on("click", function() {
		salesno = $(".holding-con").attr("id").replace("holding-", "");
		
		$.ajax({
			type:"POST",
			url:"/FinalProject/json/wsales/del/" + salesno + "/holding/" + jsonData,
			contentType:"application/json",
			dataType:"json",
			success:function(result) {
				console.log("성공할리가 없다.")
			},
			error:function(result) {
				var holdinglist = result.responseText;

				window.location.href = "branchsales.do?holdinglist=" + holdinglist;
			}
		});
	});
});
</script>
<title>지점 - 보류</title>
</head>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="brno" property="principal.brEmp.branch.no"/>
	<sec:authentication var="empno" property="principal.brEmp.no"/>
</sec:authorize>
<body id="emp-${empno }">
<div class="wrapper container" id="brno-${brno }">
	<div class="row">
		<div class="col-sm-12">
			<%@ include file="topmenu.jsp" %>
		</div>
	</div>
	
	<div class="row holding-con">
		<div class="col-sm-12">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>제품명</th>
						<th>수량</th>
						<th>가격</th>
						<th>합계</th>
					</tr>
				</thead>
				
				<tbody>
					<!-- 보류 물품 리스트 -->
	      		</tbody>
	      		
	      		<tfoot>
					<tr>
						<td colspan="2">총 합계</td>
						<td colspan="3" class="holding-sum"></td>
					</tr>
				</tfoot>
			</table>
			
			<div>
				<button class="btn btn-success" id="holding-to-sales-btn">판매로 이동</button>

				<button class="btn btn-default" id="holding-delete-btn">보류 삭제</button>
			</div>
		</div>
	</div>
</body>
</html>
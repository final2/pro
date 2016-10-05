<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="current_page" value="branchinven" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/branch.css">
<script type="text/javascript" src="../resources/jquery/jquery.js" ></script>
<script type="text/javascript">
$(function() {
	var brno = $(".container").attr("id").replace("brno-", "");
	
	var $tbody = $("tbody").empty();
	var detailList = [];
	
	
	// 지점 재고 띄우기
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/inv/" + brno,
		dataType:"json",
		success:function(result) {
			$.each(result, function(index, tr) {
				var no = index + 1;
				
				$tbody.append("<tr><td>"+no+"</td><td>"+tr.product.name+"</td><td>"+tr.qty
						+"</td><td><input type='hidden' value='"+tr.product.no+"' />"
						+"<input type='number' min='0' value='0' name='qty-"+no+"' /></td></tr>");
				
				if ( tr.qty < 20) {
					$("input[name='qty-"+no+"']").parent().addClass("red").siblings().addClass("red");
				}
			})
		}
	});
	
	// 발주 추가하기
	$("#addorder-btn").on("click", function(){
		var $qtyList = $("input[name^='qty']");
		var $pnoList = {};
		$qtyList.each(function(index, item) {
			var detail = {};
			detail.qty = $(item).val();
			var product = {};
			product.no = $(item).siblings("input").val();
			detail.product = product;
			detailList.push(detail);			
		})
		
		var jsonData = JSON.stringify(detailList);
		$.ajax({
			type:"POST",
			url:"/FinalProject/json/wor/" + brno,
			contentType:"application/json",	// 서버로 보내는 요청데이타 타입
			data:jsonData,
			dataType:"json",				// 서버로부터 받는 응답데이타 타입
			success:function(result) {
				alert("발주 대기목록에 추가되었습니다.")
				window.location.href = "branchorder.do";
			}
		})
	});
	
	// 재고 - 검색
	$("#inven-search").change(function() {
		var k = $("#inven-search option:selected").val();
		
		$("form").submit(function(event) {
			event.preventDefault();
			
			var $q = $("input[name='keyword']").val();
			if (!$q) {
				$("input[name='keyword']").focus().attr("placeholder", "검색할 값을 입력하세요.");
				return;
			}
			
			$.ajax({
				type:"POST",
				url:"/FinalProject/json/inv/" + brno + "/key/" + k + "/q/" + $q,
				contentType:"application/json",
				success:function(result) {					
					$("tbody").empty();
					
					if (k.indexOf("pt") != -1) {
						console.log("본사");
						$.ajax({
							type:"GET",
							url:"/FinalProject/json/pt/key/" + k + "/q/" + $q,
							dataType:"json",
							success:function(result) {
								$.each(result, function(index, tr) {
									var no = index + 1;
									
									$tbody.append("<tr><td>"+no+"</td><td>"
											+tr.name+"</td><td></td><td><input type='hidden' value='"+tr.no+"' />"
											+"<input type='number' min='0' value='0' name='qty-"+no+"' /></td></tr>");
									
									if ( tr.qty < 20) {
										$("input[name='qty-"+no+"']").parent().addClass("red").siblings().addClass("red");
									}
								})
							}
						})
					} else {
						$.ajax({
							type:"GET",
							url:"/FinalProject/json/inv/" + brno + "/key/" + k + "/q/" + $q,
							dataType:"json",
							success:function(result) {
								$.each(result, function(index, tr) {
									var no = index + 1;
									
									$tbody.append("<tr><td>"+no+"</td><td>"+tr.product.name+"</td><td>"+tr.qty
											+"</td><td><input type='hidden' value='"+tr.product.no+"' />"
											+"<input type='number' min='0' value='0' name='qty-"+no+"' /></td></tr>");
									
									if ( tr.qty < 20) {
										$("input[name='qty-"+no+"']").parent().addClass("red").siblings().addClass("red");
									}
								})
							}
						});
					}
				}
			})
		})
	})
	
})
</script>
<title>지점 - 재고</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="brno" property="principal.brEmp.branch.no"/>
</sec:authorize>
<div class="wrapper container" id="brno-${brno }">
	<div class="row">
		<div class="col-sm-12">
			<%@ include file="topmenu.jsp" %>
		</div>
	</div>
	
	<div class="row inven-search">
		<div class="col-sm-6 col-sm-offset-3">
			<form role="form" class="form-inline">
				<div class="form-group col-sm-4">
					<select title="검색조건" id="inven-search" class="form-control">
						<option value>검색조건</option>
						<option value="name">상품명</option>
						<option value="qty">수량</option>
						<option value="cat">소분류명</option>
						<option value="ptname">본사-상품명</option>
						<option value="ptcat">본사-소분류</option>
					</select>
				</div>
				
				<div class="col-sm-6 form-group inven-keyword">
					<input type="text" class="form-control" name="keyword" />
				</div>
				
				<div class="form-group col-sm-2">
					<input type="submit" class="btn btn-success" value="검색" />
				</div>
			</form>
		</div>
	</div>
	
	<div class="row inven-list">
		<div class="col-sm-8 col-sm-offset-2">
			<table class="table table-bordered">
				<colgroup>
					<col width="10%" />
					<col width="55%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>품목명</th>
						<th>재고</th>
						<th>주문수량</th>						
					</tr>
				</thead>
				
				<tbody>
					
				</tbody>
			</table>
			
			<div class="pull-right">
				<button class="btn btn-default btn-lg" id="addorder-btn">발주 추가</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
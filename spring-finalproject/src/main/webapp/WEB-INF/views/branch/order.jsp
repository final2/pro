<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="current_page" value="branchorder" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/branch.css">
<script type="text/javascript" src="../resources/jquery/jquery.js" ></script>
<script type="text/javascript" src="../resources/jquery/money.js" ></script>
<script type="text/javascript">
$(function() {
	
	// 발주 대기목록 가져오기
	var refreshWaitingOrderList = function() {
		var $tbody = $("#tab-2 tbody").empty();
		
		var brno = $(".container").attr("id").replace("brno-", "");
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/wor/" + brno,
			dataType:"json",
			success:function(result) {
				var orderNo = 0;
				$.each(result, function(index, tr) {
					var no = index + 1;
					var sum = tr.qty * tr.product.price;
					$tbody.append("<tr><td>"+no+"</td><td>"
							+tr.product.name+"</td><td>"
							+tr.product.maker+"</td><td>"
							+tr.qty+"</td><td>"
							+formatNumber(tr.product.price)+"</td><td>"
							+formatNumber(sum)+"</td><td><input type='checkbox' name='ck"+no+"' value='"+tr.no+"' /></td></tr>");
					orderNo = tr.order.no;
				})
				$(".order-con").attr("id", orderNo);
			}
		});
	}
	refreshWaitingOrderList();
	
	// 발주 탭메뉴
	$("#order-tabmenu li:first").addClass("active").trigger("click");
	
	$("#tab-1").siblings().hide();

	$("#order-tabmenu").on("click", "li", function() {
		$(this).addClass("active").siblings().removeClass("active");
		var i = $(this).index() + 1;
		$("#tab-"+i).siblings().hide();
		$("#tab-"+i).show();
	});
	
	
	// 발주 대기목록에서 전체선택/전체해제 
	$("#tab-2").on("click",":checkbox[name='allcheck']", function() {
		if($(":checkbox[name='allcheck']").is(":checked")){
	        $(":checkbox[name^='ck']").prop("checked", true);
	    }
	    else{
	        $(":checkbox[name^='ck']").prop("checked", false);
	    }
	});
	
	// 발주 대기목록에서 전체선택 상태에서 개별 체크해제시 전체선택 체크해제
	$("#tab-2").on("click",":checkbox[name^='ck']", function() {
		var countCk = $(":checkbox[name^='ck']").length;
		if($(":checkbox[name^='ck']").is(":checked").length == countCk){
	        $(":checkbox[name='allcheck']").prop("checked", true);
	    }
	    else{
	        $(":checkbox[name='allcheck']").prop("checked", false);
	    }
	});
	
	
	// 발주 대기목록에서 삭제하기
	$(".order-btn").on("click", "#delete-btn", function(event) {
		event.stopPropagation();
		var $checknoList = $(":checkbox[name^='ck']:checked");
		
		if ($checknoList) {
			$checknoList.each(function(){
				var no = $(this).val();
				
				$.ajax({
					type:"DELETE",
					url:"/FinalProject/json/wor/del/"+no,
					dataType:"json",
					success:function(result) {
						refreshWaitingOrderList();
					}
				});
			});
		}
		
	});
	
	// 발주 대기목록에서 전송하기 - 재고에 추가됨
	$(".order-btn").on("click", "#send-btn", function(event) {
		if ($(".order-con").attr("id") == 0) {
			$(this).attr("disabled");
		} else {
			var no = $(".order-con").attr("id");
			window.location.href = "orderupdate.do?no="+ no;
		}
	})
	
});
</script>
<title>지점 - 발주</title>
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
	
	<div class="row order-con">
		<div class="col-sm-12">
			<ul id="order-tabmenu">
				<li>발주내역</li>
				<li>발주대기목록</li>
				<li>반품목록</li>
			</ul>
			
			<div class="tab-con">
				<div id="tab-1">
					<form role="form" class="form-inline">
						<div class="form-group form-group-sm">
							<label>날짜검색:</label>
							<input type="date" name="startdate" class="form-control" /> - <input type="date" name="enddate" class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit" value="검색" name="keyword" class="btn btn-default btn-sm" />
						</div>
					</form>
					
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>발주일자</th>
								<th>발주번호</th>
								<th>완료여부</th>
								<th>비고</th>
							</tr>
						</thead>
						
						<tbody>
						</tbody>
					</table>
				</div>
				
				<div id="tab-2">
					<div class="order-btn">
						<button id="send-btn" class="btn btn-success">전송</button>
						<button id="delete-btn" class="btn btn-danger">삭제</button>
					</div>
					
					<table class="table table-bordered">
						<colgroup>
							<col width="10%" />
							<col width="25%" />
							<col width="15%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
						</colgroup>
						
						<thead>
							<tr>
								<th>번호</th>
								<th>품목명</th>
								<th>제조사</th>
								<th>수량</th>
								<th>단가</th>
								<th>총금액</th>
								<th><input type="checkbox" name="allcheck" /></th>
							</tr>
						</thead>
						
						<tbody>
						
						</tbody>
					</table>
				</div>
				
				<div id="tab-3">
				
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
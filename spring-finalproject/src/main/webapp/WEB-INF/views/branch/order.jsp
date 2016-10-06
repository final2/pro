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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/jquery/jquery.js" ></script>
<script type="text/javascript" src="../resources/jquery/money.js" ></script>
<script type="text/javascript">
$(function() {
	var brno = $(".container").attr("id").replace("brno-", "");
	$("#order-detail").hide();
	
	// 발주 대기목록 가져오기
	var refreshWaitingOrderList = function() {
		var $tbody = $("#tab-1 tbody").empty();
		var worsum = 0;
		
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
					worsum+= sum;
				})
				$(".order-con").attr("id", orderNo);
				$(".wor-sum").append(formatNumber(worsum));
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
	$("#tab-1").on("click",":checkbox[name='allcheck']", function() {
		if($(":checkbox[name='allcheck']").is(":checked")){
	        $(":checkbox[name^='ck']").prop("checked", true);
	    }
	    else{
	        $(":checkbox[name^='ck']").prop("checked", false);
	    }
	});
	
	// 발주 대기목록에서 전체선택 상태에서 개별 체크해제시 전체선택 체크해제
	$("#tab-1").on("click",":checkbox[name^='ck']", function() {
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
					url:"/FinalProject/json/wor/"+brno+"/del/"+no,
					dataType:"json",
					success:function(result) {
						refreshWaitingOrderList();
					}
				});
			});
		}
		
	});
	
	// 발주 대기목록에서 전송하기 - isCart N -> Y 변경
	$(".order-btn").on("click", "#send-btn", function(event) {
		if ($(".order-con").attr("id") == 0) {
			$(this).attr("disabled");
		} else {
			var no = $(".order-con").attr("id");
			window.location.href = "orderupdate.do?no="+ no + "&brno=" +brno;
		}
	});
	
	// 발주내역 조회하기
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/or/" + brno,
		dataType:"json",
		success:function(result) {
			var $tbody2 = $("#tab-2 tbody").empty();
			var iscomplete = "";
			
			$.each(result, function(index, tr) {
				if (tr.iscomplete == 'Y') {
					iscomplete = "완료";
				} else {
					iscomplete = "진행중"
				}
				
				var note = tr.note;
				if (tr.note == null) {
					note = "";
				}
				
				$tbody2.append("<tr><td class='regdate'>"+tr.regdate+"</td><td><a type='button' data-toggle='modal' data-target='#myModal' id='order-"+tr.no+"'>"
					+tr.no+"</a></td><td class='is-complete'>"+iscomplete+"</td><td>"
					+note+"</td></tr>");
				
			})
		}
	});
	
	// 발주번호 클릭시 발주 상세내역 조회하기
	$("#tab-2").on("click", "a[id^='order-']", function() {
		console.log($(this).attr("id"));
		var no = $(this).attr("id").replace("order-", "");
		
		$(".order-number").empty();
		$(".order-date").empty();
		
		$(".order-number").append("발주번호: "+no);
		$(".order-date").append("발주일자: "+$(this).parent().parent().find("td[class='regdate']").text());
		
		var iscomplete = $(this).parent().parent().find(".is-complete").text();
		console.log(iscomplete);
		
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/or/d/" + no,
			dataType:"json",
			success:function(result) {
				var $tbody = $(".modal-body tbody").empty();
				
				var sum = 0;
				var orsum = 0;
				
				$.each(result, function(index, tr) {
					sum = tr.qty * tr.product.price;
					$tbody.append("<tr><td>"+tr.product.no+"</td><td>"
							+tr.product.name+"</td><td>"
							+tr.qty+"</td><td>"
							+formatNumber(tr.product.price)+"</td><td>"
							+formatNumber(sum)+"</td></tr>");
					orsum += sum;
				});
				
				$(".or-sum").empty().append(formatNumber(orsum));
				
				if (iscomplete == '완료') {
					$("#order-send-btn").hide();
				} else {
					$("#order-send-btn").show();
					
					// 발주 상세내역에서 전송하기 - 재고에 추가됨
					$(".modal-body").on("click", "#order-send-btn", function(event) {
						
							window.location.href = "invenupdate.do?no="+ no;
						
					});
					
				}
			}
		});
	});
	
	$("#tab-2 form").submit(function(event) {
		event.preventDefault();
		var $date1 = $("input[name='startdate']").val();
		var $date2 = $("input[name='enddate']").val();
		
		if (!$date1 && !$date2) {
			$("input[name='startdate']").focus();
		} else if (!$date1) {
			$("input[name='startdate']").focus();
		} else if (!$date2) {
			$("input[name='enddate']").focus();
		} else if ($date1 && $date2) {
			$.ajax({
				type:"POST",
				url:"/FinalProject/json/or/"+brno+"/d1/"+$date1+"/d2/" + $date2,
				contentType:"application/json",
				dataType:"json",
				success:function(result){
					// 날짜 검색이 이루어진 발주내역 가져오기
					$.ajax({
						type:"GET",
						url:"/FinalProject/json/or/"+brno+"/d1/"+$date1+"/d2/" + $date2,
						dataType:"json",
						success:function(result) {
							var $tbody2 = $("#tab-2 tbody").empty();
							var iscomplete = "";
							
							$.each(result, function(index, tr) {
								if (tr.iscomplete == 'Y') {
									iscomplete = "완료";
								} else {
									iscomplete = "진행중"
								}
								
								var note = tr.note;
								if (tr.note == null) {
									note = "";
								}
								
								$tbody2.append("<tr><td class='regdate'>"+tr.regdate+"</td><td><a type='button' data-toggle='modal' data-target='#myModal' id='order-"+tr.no+"'>"
									+tr.no+"</a></td><td class='is-complete'>"+iscomplete+"</td><td>"
									+note+"</td></tr>");
								
							})
						}
					});
				}
			});
		}
	});
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
				<li>발주대기목록</li>
				<li>발주내역</li>
				<li>반품목록</li>
			</ul>
			
			<div class="tab-con">
				<div id="tab-1">
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
								<th>금액</th>
								<th><input type="checkbox" name="allcheck" /></th>
							</tr>
						</thead>
						
						<tbody>
							<!-- 발주 대기목록 -->
						</tbody>
						
						<tfoot>
							<tr>
								<td colspan="3">금액 합계</td>
								<td colspan="4" class="wor-sum"></td>
							</tr>
						</tfoot>
					</table>
				</div>
				
				<div id="tab-2">
					<form role="form" class="form-inline">
						<div class="form-group form-group-sm">
							<label>날짜검색:</label>
							<input type="date" name="startdate" class="form-control" /> - <input type="date" name="enddate" class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit" value="검색" id="search-date-btn" class="btn btn-default btn-sm" />
						</div>
					</form>
					
					<table class="table table-bordered">
						<colgroup>
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
						</colgroup>
						<thead>
							<tr>
								<th>발주일자</th>
								<th>발주번호</th>
								<th>완료여부</th>
								<th>비고</th>
							</tr>
						</thead>
						
						<tbody>
							<!-- 발주내역 리스트 -->
						</tbody>
					</table>
					
					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
					  <div class="modal-dialog modal-lg">
					
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">발주 상세내역</h4>
					      </div>
					      <div class="modal-body">
					      	<div>
					      		<p class="order-number"></p>
					      		<p class="order-date"></p>
					      		<button class="btn btn-primary btn-sm" id="order-send-btn">전송</button>
					      	</div>
					      	<table class="table table-bordered">
					      		<thead>
					      			<tr>
					      				<th>제품번호</th>
					      				<th>제품명</th>
					      				<th>수량</th>
					      				<th>가격</th>
					      				<th>금액</th>
					      			</tr>
					      		</thead>
					      		
					      		<tbody>
					      			<!-- 발주 상세내역 -->
					      		</tbody>
					      		
					      		<tfoot>
									<tr>
										<td colspan="2">금액 합계</td>
										<td colspan="3" class="or-sum"></td>
									</tr>
								</tfoot>
					      	</table>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					
					  </div>
					</div>
				</div>
				
				<div id="tab-3">
				
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
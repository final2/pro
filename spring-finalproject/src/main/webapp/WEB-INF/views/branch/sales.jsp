<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="current_page" value="branchsales" />
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
	var empno = $("body").attr("id").replace("emp-", "");
	
	// 화면 띄우자마자 물품목록 띄우기
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/lcat/",
		dataType:"json",
		success:function(result) {
			var $ul = $('#sales-lc');
			$ul.empty();
			
			$.each(result, function(index, lc){
				$ul.append("<li id='no-"+lc.no+"'>"+lc.name+"</li>");
			});
			
			$("#sales-lc li:first").addClass("active").trigger("click");
			
			var lcno = $("#sales-lc li:first").attr("id").replace("no-", "");
			$.ajax({
				type:"GET",
				url:"/FinalProject/json/scat/" + lcno,
				dataType:"json",
				success:function(result) {
					var $ul = $('#sales-sc');
					$ul.empty();
					
					$.each(result, function(index, sc) {
						$ul.append("<li id='no-"+sc.no+"'>"+sc.name+"</li>");
					});
					
					$("#sales-sc li:first").addClass("active").trigger("click");
				}
			})
		}
	});
	
	// 대분류 클릭시 소분류 조회하기
	$("#sales-lc").on("click", "li", function() {
		$(this).addClass('active').siblings().removeClass('active');
		
		var lcno = $(this).attr("id").replace("no-", "");
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/scat/" + lcno,
			dataType:"json",
			success:function(result) {
				var $ul = $('#sales-sc');
				$ul.empty();
				
				$.each(result, function(index, sc) {
					$ul.append("<li id='no-"+sc.no+"'>"+sc.name+"</li>");
				});
				
			}
		})
	});

	// 소분류 클릭시 물품 조회하기
	$("#sales-sc").on("click", "li", function() {
		$(this).addClass('active').siblings().removeClass('active');
		
		var scno = $(this).attr("id").replace("no-", "");
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/pt/" + scno,
			dataType:"json",
			success:function(result) {
				var $ul = $("#sales-pt");
				$ul.empty();
				
				$.each(result, function(index, pt) {
					$ul.append("<li id='no-"+pt.no+"'>"+"<p class='sales-pt-name'>"+pt.name+"</p><p class='sales-pt-price'>"+formatNumber(pt.price)+"</p></li>")
					
				});				
			}
		});
	});
	
	var branchSalesForm = {};
	var detailList = [];
	
	function addDetail(detail) {
		var searchIndex = searchDetailIndex(detail);
		
		if (searchIndex >= 0) {
			detailList[searchIndex].qty++;
		} else {
			detailList.push(detail);
		}
	} 
	
	function getTotalSum() {
		var totalSum = 0;
		$.each(detailList, function(index, item) {
			var p = item.product.price;
			var subSum = p * item.qty;
			totalSum += subSum;
		});
		return totalSum;
	}
	
	function searchDetailIndex(detail) {
		var searchIndex = -1;
		$.each(detailList, function(index, item) {
			if (item.product.no == detail.product.no) {
				searchIndex = index;
			}
		});
		return searchIndex;
	}
	
	function searchDetailIndexByPno(no) {
		var searchIndex = -1;
		
		$.each(detailList, function(index, item) {
			if (item.product.no == no) {
				searchIndex = index;
			}
		});
		return searchIndex;
	}
	
	// 물품 클릭시 물품리스트에 추가 및 리프레시하기
	$("#sales-pt").on("click", "li", function() {		
		var pno = $(this).attr("id").replace("no-", "");
		var name = $(this).find(".sales-pt-name").text();
		var price = $(this).find(".sales-pt-price").text();
		var qty = $(this).find("input[name='qty']").val();
		
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/inv/" + brno + "/pno/" + pno,
			dataType:"json",
			success:function(result) {
				if (result.length == 0) {
					alert("재고가 없습니다.")
				} else {
					
					var detail = {};
					var product = {};
					product.name = name;
					product.no = pno;
					product.price = parseInt(price.split(",").join(""));
					detail.product = product;
					detail.qty = 1;
					
					addDetail(detail);
					
					var total = getTotalSum();
					$("#sum-box").empty().append(formatNumber(total));
				}	
				var $tbody = $(".sales-left tbody").empty();
				
				$.each(detailList, function(index, item) {
					$tbody.append("<tr id='sales-pt-"+item.product.no+"'><td>"+1+"</td><td>"
							+item.product.name+"</td><td>"
							+formatNumber(item.product.price)+"</td><td><input type='text' value='"+item.qty+"' name='qty-"+item.product.no+"' /></td>"
							+"<td><a id='remove-btn-"+item.product.no+"'><span class='glyphicon glyphicon-remove'></span></a></td></tr>");
					
					removeProduct();
				});
					
			}
		});
	});
	
	// 수량 직접 변경시 바뀌기
	$(".sales-left").on("change","input[name^='qty-']", function() {
		var no = $(this).attr("name").replace("qty-", "");
		var qty = $(this).val();
		var i = searchDetailIndexByPno(no);
		detailList[i].qty = qty;
		
		var total = getTotalSum();
		$("#sum-box").empty().append(formatNumber(total));
		
		var $tbody = $(".sales-left tbody").empty();
		$.each(detailList, function(index, item) {
			$tbody.append("<tr id='sales-pt-"+item.product.no+"'><td>"+1+"</td><td>"
					+item.product.name+"</td><td>"
					+formatNumber(item.product.price)+"</td><td><input type='text' value='"+item.qty+"' name='qty-"+item.product.no+"' /></td>"
					+"<td><a id='remove-btn-"+item.product.no+"'><span class='glyphicon glyphicon-remove'></span></a></td></tr>");
			
			removeProduct();
		});
	});
	
	// 물품리스트에서 물품 삭제하기
	var removeProduct = function() {
		$.each(detailList, function(index, item) {
			$("a[id='remove-btn-"+item.product.no+"']").on("click", function() {
				detailList.splice(index, 1);
				$("tr[id='sales-pt-"+item.product.no+"']").remove();
				
				var total = getTotalSum();
				$("#sum-box").empty().append(formatNumber(total));
			});
		})
	}
	
	// 일괄취소
	$("#sales-btn-list").on("click","#all-cancel-btn", function(){
		var tt = detailList.length;
		detailList.splice(0, tt);
		$(".sales-left tbody").empty();
	});
	
	// 결제버튼 클릭시, 구매자정보 입력 후 결제정보 저장
	$(".modal-footer").on("click", "#pay-btn", function() {
		var payment = $("input[name='payment']").val();
		var gender = $("input[name='gender']").val();
		var ages = $("input[name='ages']").val();
		
		console.log(detailList);
		var jsonData = JSON.stringify(detailList);
		$.ajax({
			type:"POST",
			url:"/FinalProject/json/sales/add/"+empno+"/pay/"+payment+"/gen/"+gender+"/age/" + ages,
			contentType:"application/json",
			data:jsonData,
			dataType:"json",
			success:function() {
				window.location.href = "branchsales.do";
			}			
		})
	})
	
	$("#each-pt-add").submit(function(event) {
		event.preventDefault();
		var inputPno = $("input[name='each-pno']").val();
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/pno/" + inputPno,
			dataType:"json",
			success:function(result) {
				console.log(result.length);
				if (result[0] == null) {
					alert("물품이 없습니다.");
				} else {
					$.each(result, function(index, item) {
						var detail = {};
						var product = {};
						product.name = item.name;
						product.no = item.no;
						product.price = item.price;
						detail.product = product;
						detail.qty = 1;
						
						addDetail(detail);
						
						var total = getTotalSum();
						$("#sum-box").empty().append(formatNumber(total));
					})
					var $tbody = $(".sales-left tbody").empty();
					
					$.each(detailList, function(index, item) {
						$tbody.append("<tr id='sales-pt-"+item.product.no+"'><td>"+1+"</td><td>"
								+item.product.name+"</td><td>"
								+formatNumber(item.product.price)+"</td><td><input type='text' value='"+item.qty+"' name='qty-"+item.product.no+"' /></td>"
								+"<td><a id='remove-btn-"+item.product.no+"'><span class='glyphicon glyphicon-remove'></span></a></td></tr>");
						
						removeProduct();
					});
				}
			}
		})
	})
});
</script>
<title>지점 - 판매</title>
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
	
	
	<div class="row">
		<div class="col-sm-5 sales-left">
			<div class="sales-table">
				<table class="table table-bordered">
				<colgroup>
					<col width="15%" />
					<col width="40%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>삭제</th>
					</tr>
				</thead>
				
				<tbody>
					
				</tbody>
			</table>
			</div>
			
			<p class="sales-sum">총 합계: <span id="sum-box">0</span> 원</p>
			
			<form role="form" id="each-pt-add">
				<div>
					<div class="col-xs-8 sales-search-btn">
						<input type="text" class="form-control" name="each-pno" placeholder="품목번호를 입력하세요" />
					</div>
					<input type="submit" class="btn btn-warning" value="추가" />
				</div>
			</form>
			
			
		</div>
		
		<div class="col-sm-7 sales-right">
			<ul id="sales-lc">
				<!-- 대분류 리스트 -->
			</ul>
			
			<ul id="sales-sc">
				<!-- 소분류 리스트 -->
			</ul>
			
			<ul id="sales-pt">
				<!-- 물품 리스트 -->
			</ul>
			
			<ul id="sales-btn-list">
				<li id="all-cancel-btn">일괄 취소</li>
				<li>보류</li>
				<li data-toggle="modal" data-target="#myModal">결제</li>
			</ul>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
		  <div class="modal-dialog">
		  
		    <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">구매자 정보 입력하기</h4>
		        </div>
		        <div class="modal-body">
		        	<div>
		        		<h4>지불방법</h4>
		        		<label class="radio-inline"><input type="radio" name="payment" value="M" checked>현금</label>
						<label class="radio-inline"><input type="radio" name="payment" value="C">신용카드</label>
		        	</div>
		        	<div>
		        		<h4>성별</h4>
		        		<label class="radio-inline"><input type="radio" name="gender" value="M" checked>남자</label>
						<label class="radio-inline"><input type="radio" name="gender" value="F">여자</label>
		        	</div>
		        	<div>
		        		<h4>연령별</h4>
		        		<label class="radio-inline"><input type="radio" name="ages" value="10" checked>10대</label>
						<label class="radio-inline"><input type="radio" name="ages" value="20">20대</label>
						<label class="radio-inline"><input type="radio" name="ages" value="30">30대</label>
						<label class="radio-inline"><input type="radio" name="ages" value="40">40대</label>
						<label class="radio-inline"><input type="radio" name="ages" value="50">50대 이상</label>
		        	</div>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		          <button type="button" id="pay-btn" class="btn btn-primary">결제</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		</div>
</div>
</body>
</html>
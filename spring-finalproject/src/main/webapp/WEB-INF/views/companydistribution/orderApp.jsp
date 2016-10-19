<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet"></script>
<style>
h1{color:white;}
th,td {text-align:center;}
.price{background-color: #EBFBFF}
</style>
<script type="text/javascript">
$(function(){
	
	$("#client").change(function() {
		
		var clno = $("#client option:selected").val();
		
		 $.ajax({
			type:"GET",
			url:"/FinalProject/json/pro/" + clno,
			dataType:"json",
			success:function(result) { 
				
				var $tr = $("#order-table");
				
				$tr.empty();
				$tr.append("<tr><th style='width:20%'>제품번호</th><th style='width:20%'>제품 명</th><th style='width:15%'>소비자가격</th><th style='width:15%' class='price'>공장도가격</th><th style='width:15%'>수량</th><th style='width:15%'>주문수량</th></tr>");
				$.each(result, function(index, pro) {
					var price = Math.round(pro.product.price * 0.7);
					
					$tr.append("<tr id='no-"+pro.product.no+"'>"
							  +"<td>"+pro.product.no+"<input type='hidden' name='no' class='form-control' value='"+pro.product.no+"'/></td>"
							  +"<td>"+pro.product.name+"</td>"
						   	  +"<td>"+comma(pro.product.price)+"<input type='hidden' name='price' class='form-control' value='"+pro.product.price +"'/></td>"
							  +"<td class='price'>"+comma(price)+"</td>"
						   	  +"<td>"+pro.qty+"</td>"
						   	  +"<td><input type='number' name='qty' id='qty' class='form-control' value = '0' style='text-align: right'/></td>"
							  +"</tr>")
				}); 
			}
		}); 
	});
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
});
</script>
<title>Big Store</title>
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
		<div class="container" style="margin-top:10px">
			<h1>발주 신청서</h1>
			<hr>
			
			<form action="orderApp.do" method="post" role="form">
			<div class="well" style="opacity:0.8">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th colspan="3" style="width: 50%">거래처명</th>
								<td colspan="3" style="width: 50%">
									<select id="client" name="clientNo" class="form-control">
										<option selected>거래처를 선택하세요.</option>
										<c:forEach var="clients" items="${clientList}">
											<c:choose>
												<c:when test="${clients.isAdmit eq 'Y'}">
													<option value="${clients.no}">${clients.name }</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</td>
							</tr>
						</thead>
						<tbody id="order-table">
							<tr>
								<th style="width:20%">제품번호</th>
								<th style="width:20%">제품 명</th>
								<th style="width:15%">소비자가격</th>						
								<th style="width:15%" class='price'>공장도가격</th>
								<th style="width:15%">수량</th>
								<th style="width:15%">주문수량</th>
							</tr>
							<!-- 입력 -->
							
						</tbody>
					</table>
			</div>
				<div class="pull-right">
					<input type="submit" id="order" class="btn btn-warning" value="신청" />
					<a href="hqOrder.do" class="btn btn-default">취소</a>
				</div>
			</form>
		</div>
   </div>
</div>
</body>
</html>
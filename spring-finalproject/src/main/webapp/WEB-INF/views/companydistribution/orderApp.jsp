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
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#client").change(function() {
		
		var clno = $("#client option:selected").val();
		
		alert(clno);
		 $.ajax({
			type:"GET",
			url:"/FinalProject/json/pro/" + clno,
			dateType:"json",
			success:function(result) { 
				
				var $tr = $("#order-table");
				$tr.empty();
				
				$.each(result, function(index, pro) {
					$tr.append("<tr id='no-"+pro.no+"'><td>"+pro.no+"</td><td>"+제품명+"</td><td>"+가격+"</td><td>"+수량+"</td></tr>")
				}); 
			}
		}); 
	});
});
</script>
<title>Big Store</title>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-content-wrapper">
		
		<div class="container" style="margin-top:10px">
			<h1>발주 신청서</h1>
			<hr>
			
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="2" style="width: 50%">거래처명</th>
						<td colspan="2" style="width: 50%">
							<select id="client" class="form-control">
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
				<tbody>
					<tr>
						<th style="width:25%">제품번호</th>
						<th style="width:25%">제품 명</th>
						<th style="width:25%">가격</th>
						<th style="width:25%">수량</th>
					</tr>
					<!-- 입력 -->
				</tbody>
			</table>
			<div class="pull-right">
				<a href="hqOrderDetail.do" class="btn btn-primary">신청</a>
				<a href="hqOrder.do" class="btn btn-danger">취소</a>
			</div>
		</div>
   </div>
</div>
</body>
</html>
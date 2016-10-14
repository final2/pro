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
<style>
th,td {text-align:center;}
</style>
<title>Big Store</title>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-content-wrapper">
		
		<div class="container" style="margin-top:10px">
			<h1>발주 신청서 수정</h1>
			<hr>
			
			<form action="updateOrder.do" method="post" role="form">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>발주번호</th>
						<td>${orders.no }<input type="hidden" name="orderNo" class="form-control" value="${orders.no }" /> </td>
						<th>발주신청일자</th>
						<td><fmt:formatDate value="${orders.regdate }" pattern="yyyy-MM-dd"/><input type="hidden" name="orderDate" class="form-control" value="${orders.regdate }" /></td>
					</tr>
					<tr>
						<th>거래처명</th>
						<td>${orders.client.name }<input type="hidden" name="clientName" class="form-control" value="${orders.client.name }" /></td>
						<th>입고확인 여부</th>
						<c:choose>
							<c:when test="${orders.confirm== 'Y'}">
								<td id="yn">입고 완료</td>
							</c:when>
							<c:otherwise>
								<td id="yn">입고 대기</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="width:25%">제품번호</th>
						<th style="width:25%">제품명</th>
						<th style="width:25%">수량</th>
						<th style="width:25%">공장도가격</th>
					</tr>
					<c:forEach var="details" items="${details}">
						<tr>
							<td style="width:25%">${details.product.no }
								<input type="hidden" name="no" class="form-control" value="${details.product.no }" />
							</td>
							<td style="width:25%">${details.product.name }
								<input type="hidden" name="productName" class="form-control" value="${details.product.name }" />
							</td>
							<td style="width:25%">
								<input type="number" name="qty" class="form-control" value="${details.qty }" style="text-align: right" />
							</td>
							<td style="width:25%"><fmt:formatNumber value="${details.product.price }" pattern="#,###"/> 
								<input type="hidden" name="price" class="form-control" value="${details.product.price }" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pull-right">
				<input type="submit" class="btn btn-primary" value="확인" />
				<a href="hqOrder.do" class="btn btn-danger">취소</a>
			</div>
			</form>
		</div>
   </div>
</div>
</body>
</html>
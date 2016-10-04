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
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
	
		<div class="container" style="margin-top:10px">
			<h1>발주내용 상세 정보</h1>
			<hr>
			
			<table class="table table-bordered" >
				<thead>
					<tr>
						<th>발주번호</th>
						<td>${orders.no }</td>
						<th>발주신청일자</th>
						<td><fmt:formatDate value="${orders.regdate }" pattern="yyyy-MM-dd"/> </td>
					</tr>
					<tr>
						<th>거래처명</th>
						<td>${orders.client.name}</td>
						<th>입고확인 여부</th>
						<td>${orders.confirm }</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>제품번호</th>
						<th>제품명</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
					<c:forEach var="details" items="${details }">
						<tr>
							<td>${details.product.no }</td>
							<td>${details.product.name }</td>
							<td>${details.qty }</td>
							<td>${details.product.price }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pull-right">
				<c:url var="updateOrderURL" value="updateOrder.do">
					<c:param name="no" value="${orders.no }"></c:param>
				</c:url>
				<a href="${updateOrderURL }" class="btn btn-primary">수정</a>
				<a href="hqOrder.do" class="btn btn-danger">확인</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
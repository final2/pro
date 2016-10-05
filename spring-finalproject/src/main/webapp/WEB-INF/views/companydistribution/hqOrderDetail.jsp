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
						<td colspan="2">${orders.no }</td>
						<th>발주신청일자</th>
						<td><fmt:formatDate value="${orders.regdate }" pattern="yyyy-MM-dd"/> </td>
					</tr>
					<tr>
						<th>거래처명</th>
						<td colspan="2">${orders.client.name}</td>
						<th>입고확인 여부</th>
						<c:choose>
							<c:when test="${orders.confirm == 'Y'}">
								<td>입고 완료</td>
							</c:when>
							<c:otherwise>
								<td>입고 대기</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>제품번호</th>
						<th>제품명</th>
						<th>수량</th>
						<th>단가</th>
						<th>금액</th>
					</tr>
					<c:set var="sum" value="0" />
					<c:forEach var="details" items="${details }">
						<tr>
							<td>${details.product.no }</td>
							<td>${details.product.name }</td>
							<td><fmt:formatNumber value="${details.qty }" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${details.product.price }" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${details.qty * details.product.price }" pattern="#,###"/></td>
						</tr>
						<c:set var="sum" value="${sum + details.qty * details.product.price}" />
					</c:forEach>
						<tr>
							<th colspan="2">합계</th>
							<td colspan="3"><fmt:formatNumber value="${sum }" pattern="#,###"/> </td>
						</tr>
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
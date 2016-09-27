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
tbody th {text-align:center;}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		
		<div class="container" style="margin-top:10px">	
			<h1>거래처 상세정보</h1>
			<hr>
			
			<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="2">거래처번호</th>
							<td colspan="2">${clients.no }</td>
						</tr>
						<tr>
							<th>거래처 명</th>
							<td>${clients.name }</td>
							<th>거래 여부</th>
							<td>${clients.isAdmit }</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th colspan="2">제품명</th>
							<th colspan="2">수량</th>
						</tr>
						<c:forEach var="ds" items="${details}">
							<tr>
								<td colspan="2">${ds.product.name }</td>
								<td colspan="2"><fmt:formatNumber value="${ds.qty }" type="number" /></td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
			<div class="pull-right">
				<c:url var="updateURL" value="updateClient.do">
					<c:param name="no" value="${clients.no}" />
					<c:param name="pn" value="${param.pn }" />
				</c:url>
				<a href="${updateURL}" class="btn btn-primary">수정</a>
				<a href="clientList.do" class="btn btn-primary">목록</a>
			</div>
		</div>
   </div>
</div>
</body>
</html>
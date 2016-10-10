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
<script type="text/javascript">
</script>
<title>Big Store</title>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-content-wrapper">
		
		<div class="container" style="margin-top:10px">
			<h1>재고 리스트</h1>
			<hr>
			<table class="table table-bordered">
				<colgroup>
					<col width="20">
					<col width="30">
					<col width="35">
					<col width="15">
				</colgroup>
				<thead>
					<tr>
						<th>제조사 명</th>
						<th>상품 번호</th>
						<th>상품 명</th>
						<th>재고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${inven }">
						<tr>
							<td>${list.client.name }</td>
							<td>${list.product.no }</td>
							<td>${list.product.name }</td>
							<td>${list.qty }</td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
			<div class="pull-right">
				<a href="orderApp.do" class="btn btn-info">발주 신청</a>
			</div>
		</div>
   </div>
</div>
</body>
</html>
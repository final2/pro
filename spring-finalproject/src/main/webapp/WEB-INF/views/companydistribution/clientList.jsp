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
	<div id="page-context-wrapper">
		
		<div class="container" style="margin-top:10px">
			<h1>거래처 리스트</h1>
			<hr>
			<table class="table table-bordered" >
				<colgroup>
					<col width="25%">
					<col width="60%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>거래처 번호</th>
						<th>거래처 명</th>
						<th>거래 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="client" items="${clientList}">
						<c:url var="detailURL" value="clientDetail.do">
							<c:param name="no" value="${client.no}" />
						</c:url>
						<tr>
							<td>${client.no}</td>
							<td><a href="${detailURL}">${client.name}</a></td>
							<td>${client.isAdmit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pull-right">
				 <a href="addClient.do" class="btn btn-primary">거래처 등록</a>
			</div>
		</div>
   </div>
</div>
</body>
</html>
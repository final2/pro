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
			<h1>거래처 상세정보</h1>
			<hr>
			
			<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="2">거래처번호</th>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>거래처 명</th>
							<td></td>
							<th>거래 여부</th>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th colspan="2">제품명</th>
							<th colspan="2">수량</th>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td colspan="2"></td>
						</tr>
					</tbody>
			</table>
			<div class="pull-right">
				<a href="updateClient.do" class="btn btn-primary">수정</a>
				<a href="clientList.do" class="btn btn-primary">목록</a>
			</div>
		</div>
   </div>
</div>
</body>
</html>
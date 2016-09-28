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
			<h1>발주 상세 정보</h1>
			<hr>
			
			<table class="table table-bordered" >
				<thead>
					<tr>
						<th>발주번호</th>
						<td></td>
						<th>발주신청일자</th>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>거래처명</th>
						<th>제품번호/제품명</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div class="pull-right">
				<a href="updateOrder.do" class="btn btn-primary">수정</a>
				<a href="hqOrder.do" class="btn btn-danger">확인</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h1>발주내역</h1>
			<hr>
			<table class="table table-bordered" >
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="40%">
					<col width="10%">
				</colgroup>
				<tr>		
					<th>발주신청 일자</th>
					<th>발주번호</th>
					<th>거래처 번호 / 거래처명</th>
					<th>입고확인 여부</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<div class="pull-right">
				<a href="orderApp.do" class="btn btn-primary">발주 신청</a>
			</div>
		</div>
   </div>
</div>
</body>
</html>
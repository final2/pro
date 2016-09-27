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
						<th>발주번호</th>
						<td></td>
						<th>발주신청일자</th>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="2">거래처명</th>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>제품번호</th>
						<th>제품 명</th>
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
				<a href="hqOrderDetail.do" class="btn btn-primary">확인	</a>
				<a href="hqOrder.do" class="btn btn-danger">취소</a>
			</div>
		</div>
   </div>
</div>
</body>
</html>
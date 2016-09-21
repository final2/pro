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
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		
		<div class="container" style="margin-top:10">
			<h1>거래처 리스트</h1>
		<table class="table table-bordered" >
			<colgroup>
				<col width="25%">
				<col width="60%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>거래처번호</th>
					<th>거래처명</th>
					<th>거래여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<div class="text-right">
			 <a href="clientdetail.do" class="btn btn-primary">등록</a>
		</div>
		</div>
   </div>
</div>
</body>
</html>
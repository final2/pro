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
		<div class="container">
			<h1>거래처 등록</h1>
	
			<table class="table table-bordered">
				<tr>
					<th>거래처번호</th>
					<td></td>
				</tr>
			</table>
		</div>
   </div>
</div>
</body>
</html>
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
			<h1>거래처 등록</h1>
			<hr>
			<form action="addClient.do" method="post" role="form">
				<div class="form-group">
					<label>거래처 명</label>
					<input type="text" name="name" class="form-control">
				</div>
				<div class="form-group">
					<label>거래 여부</label>
					<input type="text" name="isAdmit" class="form-control">
				</div>
				<div class="pull-right">
					<input type="submit" class="btn btn-primary" value="등록" />
					<a href="clientList.do" class="btn btn-danger">취소</a>
				</div>
			</form>
		</div>
   </div>
</div>
</body>
</html>
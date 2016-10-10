<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.error-alert {width:600px; height:500px; position:relative; left:50%; margin-left:-200px;top:200px;}
	.alert-danger {line-height:55px; padding:10px;}
	.alert-danger:after {clear:both; content:""; display:block;}
	.alert {font-size:20px;}
</style>
</head>
<body>
	<%-- <%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %> --%>
	<div class="container error-alert">
		<h1>에러 페이지</h1>
		<div class="alert alert-danger">
			<strong>에러!</strong> <%=exception.getMessage() %>
			<p class=""><a href="notice.do" class="alert-link"><메인페이지></a>로 이동하기</p>
		</div>
	</div>
</body>
</html>
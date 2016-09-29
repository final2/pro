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
	<!-- 메신저 modal창 -->
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	<div id="page-context-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container">
			<h1>회사 일정</h1>
			<div class="well" style="opacity:0.8">
				<%@ include file="calendar.jsp" %>
			</div>			
		</div>
	</div>
</div>
</body>
</html>
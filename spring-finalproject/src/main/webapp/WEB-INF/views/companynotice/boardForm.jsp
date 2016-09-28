<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script src="resources/bootstrap/js/bootstrap.min.js"></script>

<!-- textarea editor 플러그인 참조 -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
<script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>
<style>
h1 {color: white;}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<!-- 메신저 modal창 -->
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-content-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container" style="margin-top:10px">
		<h1>공지사항 작성</h1>
		<hr>
		<div class="well" style="opacity:0.8">
			<form action="boardForm.do" method="post" role="form">
				<div class="form-group">
					<label>제목</label>
					<input type="text" name="title" class="form-control">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="ckeditor" name="content"></textarea>
				</div>
				<div class="pull-right">
					<a href="boardList.do?pn=1" class="btn btn-default">취소</a>
					<input type="submit" class="btn btn-default" value="작성">
				</div>
			</form>
		</div>
		</div>
	</div>
</div>
</body>
</html>
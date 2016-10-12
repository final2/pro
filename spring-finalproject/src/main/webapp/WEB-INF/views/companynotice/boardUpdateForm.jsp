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
<!-- textarea editor 플러그인 참조 -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
<script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>
<style type="text/css">
h1{color:white;}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<!-- 메신저 modal창 -->
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	<div id="page-context-wrapper">
	<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container">
			<h1>공지사항 수정</h1>
			<form role="form" action="boardUpdateForm.do?pn=${param.pn }&rn=${param.rn}" method="post">
				<div class="well" style="opacity:0.8;">
					<div>
						<label>번호</label>
						<input type="text" name="no" class="form-control" readonly="readonly" value="${board.no }">
					</div>
					<div>
						<label>날짜</label>
						<input type="text" class="form-control" readonly="readonly" value='<fmt:formatDate value="${board.regdate }" pattern="yyyy.MM.dd / hh:mm:ss"/>'>
					</div>
					<div>
						<label>제목</label>
						<input type="text" name="title" class="form-control" value="${board.title }">
					</div>
					<div>
						<label>내용</label>
						<textarea name="content" class="ckeditor">${board.content }</textarea>
					</div>
				</div>
				<div style="text-align:right">
					<c:url var="detailURL" value="boardDetail.do">
						<c:param name="no" value="${board.no }" />
						<c:param name="pn" value="${param.pn }" />
						<c:param name="rn" value="${param.rn }" />
					</c:url>
					<a href="${detailURL }" class="btn btn-default">취소</a>
					<input type="submit" class="btn btn-default" value="수정">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
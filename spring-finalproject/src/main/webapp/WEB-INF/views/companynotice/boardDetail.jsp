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
	<!-- 메신저 modal창 -->
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container">
		<h1>공지사항</h1>
		<div>
			<table class="table table-bordered">
				<tr>
					<th width="10%">번호</th>
					<td width="40%">${board.no }</td>
					<th width="10%">작성 날짜</th>
					<td width="40%"><fmt:formatDate value="${board.regdate }" pattern="yyyy.MM.dd / hh:mm:ss"/></td>		
				</tr>
				<tr>
					<th width="10%">제목</th>
					<td width="90%" colspan="3">${board.title }</td>
				</tr>
				<tr>
					<th width="10%">내용</th>
					<td width="90%" colspan="3">${board.content }</td>
				</tr>
			</table>
			<div class="pull-right">
				<c:url var="updateFormURL" value="boardUpdateForm.do">
					<c:param name="no" value="${board.no }" />
					<c:param name="pn" value="${param.pn }" />
				</c:url>
				<a href="${updateFormURL }" class="btn btn-default">수정</a>
				<a href="boardDelete.do" class="btn btn-default">삭제</a>
				<a href="boardList.do" class="btn btn-default">목록</a>
			</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>
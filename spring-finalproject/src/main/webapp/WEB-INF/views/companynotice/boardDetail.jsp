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
<style>
thead td,th{text-align:center;}
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
	<div id="page-context-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container">
		<h1 style="color:white">공지사항</h1>
			<div class="well" style="opacity:0.8;">
				<table class="table">
					<thead>
						<tr>
							<th width="5%">번호</th>
							<td width="10%">${board.no }</td>
							<th width="5%">제목</th>
							<td>${board.title }</td>
							<th width="10%">작성 날짜</th>
							<td width="15%"><fmt:formatDate value="${board.regdate }" pattern="yyyy.MM.dd / hh:mm:ss"/></td>		
						</tr>
					</thead>
					<tbody>					
						<tr>                                                                                                       
							<td width="100%" colspan="6">${board.content }</td>
						</tr>
					</tbody>
				</table>
				<hr>
			</div>
			<div class="pull-right"> 
				<c:url var="updateFormURL" value="boardUpdateForm.do">
					<c:param name="no" value="${board.no }" />
					<c:param name="pn" value="${param.pn }" />
				</c:url>
				<c:if test="UserLogin.dept eq 'director' ">
					<a href="${updateFormURL }" class="btn btn-default">수정</a>
					<a href="boardDelete.do" class="btn btn-default">삭제</a>
				</c:if>
				<a href="boardList.do" class="btn btn-default">목록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
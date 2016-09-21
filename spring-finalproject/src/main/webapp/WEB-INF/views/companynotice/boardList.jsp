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
th,td {text-align:center;}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		<div class="container">	
			<h1>공지 사항</h1>
			<table class="table table-hover">
				<colgroup>
					<col width="20%">
					<col width="50%">
					<col width="30%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>					
						<th>작성 날짜</th>					
					</tr>
				</thead>
				<tbody>
					<!-- 반복 -->
					<c:forEach var="board" items="${boardList}">
						<!-- detail 들어갈때 보내는 전송값 -->
						<c:url var="detailURL" value="boardDetail.do">
							<c:param name="no" value="${board.no }" />
						</c:url>
						<tr>
							<td>${board.no }</td>
							<td><a href="${detailURL }">${board.title }</a></td>
							<td><fmt:formatDate value="${board.regdate }" pattern="yyyy.MM.dd hh:mm"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pull-right">
				<a href="boardForm.do" class="btn btn-default">글쓰기</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
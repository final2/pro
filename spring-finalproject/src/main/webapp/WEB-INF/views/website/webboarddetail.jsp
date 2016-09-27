<!--
	웹페이지 공지사항 게시판
 -->
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
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<style>
th,td {text-align:center;}
</style>
<title>Introduce BigStore</title>
</head>

<body>
<div class="container" style="w3-center">
	<!-- 화면 사이즈 지정 -->
	<div class="w3-display-container" style="max-width:1080px;">
		<%@ include file="navbar.jsp" %>
	
		<div class="w3-container w3-padding-10  w3-margin-bottom">
			<!-- 공지테이블 상세 -->
			<div class="w3-container w3-teal">
	  			<h1>${boardDetail.title }</h1>
			</div>
			<table class="w3-table w3-striped w3-bordered w3-border">
				<tr>
				  <th>제목</th>
				  </tr>
				  <tr>
					<td>${boardDetail.title }</td>
				</tr>
				<tr>
				  <th>내용</th>
					</tr>
				  		<tr>
					<td>${boardDetail.content }</td>
				</tr>	
				<tr>
				  <th>날자</th>
				  </tr>
				  <tr>
					<td><fmt:formatDate value="${boardDetail.regdate }" pattern="yyyy.MM.dd hh:mm"/></td>
				</tr>
				
			</table>
		</div>
		
		<!--  footer -->
		<%@ include file="footer.jsp" %>	
	</div>
</div>
</body>
</html>
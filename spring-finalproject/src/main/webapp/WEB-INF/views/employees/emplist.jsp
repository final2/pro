<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/FinalProject/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/FinalProject/resources/jquery/jquery.js"></script>
<link href="/FinalProject/resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script src="/FinalProject/resources/bootstrap/js/bootstrap.min.js"></script>
<style>
	.container {position:relative; top:60px;}
	.container:after {clear:both; content:""; display:block;}

	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table { table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px; padding:0 !important;}
	th, td {text-align:center; vertical-align:middle !important;}
	
	td > .empBtn {width:100%; height:100%; display:block; background:#f5fbff; vertical-align:middle; line-height:50px; text-decoration:none; color:inherit;}
	
	.pageBox {width: 232px; position:absolute; left:50%; top:50%; margin-left:-116px; margin-top:550px;}
	
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>	
	<div id="page-content-wrapper">
		<div class="container">
			<h1>사원 리스트</h1>
			<table class="table table-bordered empBox table-striped" >
				<colgroup>
					<col style="width:22%;">
					<col style="width:18%;">
					<col style="width:25%;">
					<col style="width:15%;">
					<col style="width:20%;">
				</colgroup>
				<tr>
					<th class="info">사원번호</th>
					<th class="info">이름</th>
					<th class="info">부서명</th>
					<th class="info">직책</th>
					<th class="info">비고</th>
				</tr>
				<c:forEach var="empes" items="${empList }">
				<c:url var="detailURL" value="empdetail.do">
					<c:param name="no" value="${empes.no }"></c:param>
					<c:param name="pno" value="${param.pno }"></c:param>
				</c:url>
				<tr>
						<td>${empes.no }</td>
						<td><a href="${detailURL }" class="empBtn">${empes.name }</a></td>
						<td>${empes.dept }</td>
						<td>${empes.position }</td>
						<td>${empes.remarks }</td>
					
				</tr>
				</c:forEach>
			</table>
			
			<div class="empBox">
				<ul class="pagination pageBox">
					<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					<li><a href="empdetail.do?pno="1">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>
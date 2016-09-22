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
<!-- Bootstrap Core JavaScript -->
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
table {width:100%}
td{text-align: center;}
</style>
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	
	<div id="page-content-wrapper">
		<h1>Notice</h1>

		<div class="row" style="margin-top:10px">
			<div class="col-sm-6">
				<div style="border: thin solid black">
					<table class="table table-hover">
						<colgroup>
							<col width="60%">
							<col width="40%">
						</colgroup>
						<thead>
							<tr>
								<th><h3>공지사항</h3></th>
								<td><a href="boardList.do" class="pull-right">더보기</a></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boardList }">
								<c:url var="detailURL" value="boardDetail.do">
									<c:param name="no" value="${board.no }" />
								</c:url>
								<tr>
									<td><a href="">${board.title }</a></td>
									<td><fmt:formatDate value="${board.regdate }" pattern="yyyy.MM.dd hh:mm"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-sm-6">
				<div style="border: thin solid black">
					<table class="table table-hover">
						<colgroup>
							<col width="60%">
							<col width="40%">
						</colgroup>
						<thead>
							<tr>
								<th><h3>오늘의 일정</h3></th>
								<td><a href="" class="pull-right">더보기</a></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>제목</td>
								<td>날짜</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top:10px">
			<div class="col-sm-6">
				<div style="border: thin solid black">
					<table>
						<colgroup>
							<col width="60%">
							<col width="40%">
						</colgroup>
						<thead>
							<tr>
								<th><h3 style="margin-left:10px">회사 일정</h3></th>
								<td style="text-align:right;"><a href="" style="margin-right:10px;">더보기</a></td>
							</tr>
						</thead>
					</table>
					<div>
						<%@ include file="calendar.jsp" %>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div style="border: thin solid black">
					<table class="table table-hover">
						<colgroup>
							<col width="60%">
							<col width="40%">
						</colgroup>
						<thead>
							<tr>
								<th><h3>쪽지함</h3></th>
								<td><a href="" class="pull-right">더보기</a></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>제목</td>
								<td>날짜</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
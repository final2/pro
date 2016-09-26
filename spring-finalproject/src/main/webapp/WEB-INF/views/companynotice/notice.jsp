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
.disdiv {border-style:solid;
		 border-radius: 10px;
		 border-color:#00cac2;}
</style>
<title>Main</title>
<script type="text/javascript">
$(function() {
	$.ajax({
		type:'GET',
		url:'json/plan/now',
		dataType:'json',
		success:function(result) {
			var $tbody = $('#today-planList');
			$tbody.empty();
			
			$.each(result, function(index, plan) {
				if(plan.successed == 'N') {
					$tbody.append("<tr>"
									+"<td>"+plan.title+"</td>"
									+"<td>"+plan.contents+"</td></tr>")			
				}
			});
		}
	});
});
</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<!-- modal창 -->
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	
	<div id="page-content-wrapper">
		<h1>Notice</h1>

		<div class="row" style="margin-top:10px">
			<div class="col-sm-6">
				<div class="disdiv">
					<table class="table table-hover">
						<colgroup>
							<col width="60%">
							<col width="40%">
						</colgroup>
						<thead>
							<tr>
								<th><h3>공지사항</h3></th>
								<c:url var="boardListURL" value="boardList.do">
									<c:param name="pn" value="1" />
								</c:url>
								<td><a href="${boardListURL }" class="pull-right">더보기</a></td>
							</tr>
							<tr>
								<th style="text-align:center">제목</th>
								<th style="text-align:center">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boardList }">
								<c:url var="detailURL" value="boardDetail.do">
									<c:param name="no" value="${board.no }" />
									<c:param name="pn" value="1" />
								</c:url>
								<tr>
									<td><a href="${detailURL }">${board.title }</a></td>
									<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="disdiv">
					<table  class="table table-hover">
						<colgroup>
							<col width="30%">
							<col width="70%">
						</colgroup>
						<thead>
							<tr>
								<th><h3>오늘의 일정</h3></th>
								<td><a href="todayplan.do" class="pull-right">더보기</a></td>
							</tr>
							<tr>
								<th style="text-align:center">제목</th>
								<th style="text-align:center">내용</th>
							</tr>
						</thead>
						<tbody id="today-planList">
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top:10px">
			<div class="col-sm-6">
				<div class="disdiv">
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
				<div class="disdiv">
					<table class="table table-hover">
						<colgroup>
							<col width="60%">
							<col width="40%">
						</colgroup>
						<thead>
							<tr>
								<th><h3>쪽지함</h3></th>
								<td><a href="message.do" class="pull-right">더보기</a></td>
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
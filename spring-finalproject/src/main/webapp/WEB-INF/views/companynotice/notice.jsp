<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<style type="text/css">
h1 {color: white;}
table {width:100%}
td{text-align: center;}
.disdiv {border-style:solid;
		 border-radius: 10px;
		 border-color:#00cac2;}
</style>
<title>Main</title>
<script type="text/javascript">
$(function() {
	var loginUserNo = ${LoginUser.no};
	$.ajax({
		type:'GET',
		url:'json/plan/new/' + loginUserNo,
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
	<!-- 메신저 modal창 -->
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	
	<div id="page-content-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		
		<marquee>
			<h1>Notice</h1>
		</marquee>

		<div class="row" style="margin-top:10px">
			<div class="col-sm-6">
				<div class="disdiv well" style="opacity:0.8">
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
				<div class="disdiv well" style="opacity:0.8">
					<table  class="table table-hover">
						<colgroup>
							<col width="30%">
							<col width="70%">
						</colgroup>
						<thead>
							<tr>
								<th><h3>오늘의 일정</h3></th>
								<%-- <c:url var="todayplan" value="todayplan.do">
								</c:url> --%>
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
				<div class="disdiv well" style="opacity:0.8">
					<table>
						<colgroup>
							<col width="60%">
							<col width="40%">
						</colgroup>
						<thead>
							<tr>
								<th><h3 style="margin-left:10px">회사 일정</h3></th>
								<td style="text-align:right;"><a href="calendar.do" style="margin-right:10px;">설정</a></td>
							</tr>
						</thead>
					</table>
					<div>
						<%@ include file="calendarView.jsp" %>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="disdiv well" style="opacity:0.8">
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
							<tr>
								<th style="text-align:center">제목</th>
								<th style="text-align:center">날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>제목 리스트</td>
								<td>날짜 리스트</td>
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
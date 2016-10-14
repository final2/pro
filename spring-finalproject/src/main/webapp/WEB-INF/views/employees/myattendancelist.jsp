<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/FinalProject/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/FinalProject/resources/jquery/jquery.js"></script>
<style>
	.container {position:relative; top:70px; text-align:center;}
	.container:after {clear:both; content:""; display:block;}

	.container > h1 {text-align:left; margin-bottom:20px;}
	.container > h1 > a {text-decoration:none; color:inherit;}

	.searchbox .form-group {margin-bottom:0 !important;}
	.searchbox label {height:34px; line-height:34px;}
	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table { table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px; padding:0 !important;}
	th, td {text-align:center; vertical-align:middle !important;}
	
	td > .empBtn {width:100%; height:100%; display:block; background:#f5fbff; vertical-align:middle; line-height:50px; text-decoration:none; color:inherit;}
	
	.pageBox {margin-top:90px;}
	
</style>
<script type="text/javascript">
$(function() {
	
	
})
</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>	
	<div id="page-content-wrapper">
		<div class="container">
			<h1><a href="emplist.do">근태</a></h1>
			<div class="row">
				<div class="col-sm-offset-8 col-sm-4">
					<div class="col-sm-6 form-group">
						<a href="myattendance.do?work=attendance"  id="attBtn" class="btn btn-success form-control" >출근</a>
					</div>
					<div class="col-sm-6 form-group"  id="leavBtn">
						<a href="myattendance.do?work=leav" class="btn btn-danger form-control" >퇴근</a>
					</div>
				</div>
			</div>
			<div class="row selectBox">
				<div class="form-group">
					<div class="row">
						<a href="mytimetable.do?month=1">1월</a>
						<a href="mytimetable.do?month=2">2월</a>
						<a href="mytimetable.do?month=3">3월</a>
						<a href="mytimetable.do?month=4">4월</a>
						<a href="mytimetable.do?month=5">5월</a>
						<a href="mytimetable.do?month=6">6월</a>
						<a href="mytimetable.do?month=7">7월</a>
						<a href="mytimetable.do?month=8">8월</a>
						<a href="mytimetable.do?month=9">9월</a>
						<a href="mytimetable.do?month=10">10월</a>
						<a href="mytimetable.do?month=11">11월</a>
						<a href="mytimetable.do?month=12">12월</a>
					</div>
				</div>
			</div>
			<table class="table table-bordered empBox table-striped" >
				<colgroup>
					<col width="11%"/>
					<col width="12%"/>
					<col width="11%"/>
					<col width="12%"/>
					<col width="12%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="12%"/>
				</colgroup>
				<tr>
					<th class="info">날짜</th>
					<th class="info">부서명</th>
					<th class="info">이름</th>
					<th class="info">출근시간</th>
					<th class="info">퇴근시간</th>
					<th class="info">시간외근무</th>
					<th class="info">조퇴</th>
					<th class="info">지각</th>
					<th class="info">기록일</th>
				</tr>
				<c:forEach var="workTime" items="${workTimeList }">
					<tr>
						<td><fmt:formatDate value="${workTime.attendance }" pattern="yyyy-MM-dd"/> </td>
						<td>${workTime.emp.dept }</td>
						<td>${workTime.emp.name }</td>
						<td><fmt:formatDate value="${workTime.attendance }" pattern="HH:mm"/></td>
						<td><fmt:formatDate value="${workTime.leaving }" pattern="HH:mm"/></td>
						<td>${workTime.overtime }</td>
						<td>${workTime.earlyleave }</td>
						<td>${workTime.late}</td>
						<td><fmt:formatDate value="${workTime.regDate }" pattern="yyyy-MM-dd"/> </td>
					</tr>
				</c:forEach>
			</table>
			<ul class="pagination pageBox">
			<c:if test="${param.pno gt 1 }">
    			<li>
      				<a href="compattendance.do?pno=${param.pno - 1 }" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
      				</a>
    			</li>
    		</c:if>
    		<c:forEach var="num" begin="${navi.beginPage }" end="${navi.endPage }">
    			<c:choose>
    				<c:when test="${param.pno eq num }">
    					<li class="active"><a href="compattendance.do?pno=${num }">${num }</a></li>
    				</c:when>
    				<c:otherwise>
					    <li><a href="compattendance.do?pno=${num }">${num }</a></li>
    				</c:otherwise>
    			</c:choose>
    		</c:forEach>
    		<c:if test="${param.pno lt navi.totalPages}">
    			<li>
      				<a href="compattendance.do?pno=${param.pno + 1 }" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
      				</a>
    			</li>
    		</c:if>
			</ul>
		</div>
	</div>
</div>
</body>
</html>
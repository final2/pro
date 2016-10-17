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
	.container {position:relative; top:30px; text-align:center;}
	.container:after {clear:both; content:""; display:block;}

	.container > h1 {text-align:left; margin-bottom:20px;}
	.container > h1 > a {text-decoration:none; color:inherit;}

	.selectBox {margin-top:15px;}
	.searchbox .form-group {margin-bottom:0 !important;}
	.searchbox label {height:34px; line-height:34px;}
	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table { table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px; padding:0 !important;}
	th, td {text-align:center; vertical-align:middle !important;}
	
	td > .empBtn {width:100%; height:100%; display:block; background:#f5fbff; vertical-align:middle; line-height:50px; text-decoration:none; color:inherit;}
	
	.pageBox {margin-top:30px;}
	#attBtn2 {pointer-events: none;cursor: default;}
	.moonBtn {color: #fff; background-color: #5bc0de !important; border-color: #46b8da;}
	
</style>
<script type="text/javascript">
$(function() {
	
})
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
		<%@ include file="../companynotice/backgroundVideo.jsp" %>
		<div class="container">
			<h1><a href="emplist.do">근태</a></h1>
			<div class="well" style="opacity:0.8">
				<div class="row">
					<div class="col-sm-offset-8 col-sm-4">
						<div class="col-sm-6 form-group">
							<c:choose>
								<c:when test="${successAtt.attendance eq null}">
									<a href="myattendance.do?work=attendance"  id="attBtn1" class="btn btn-success form-control" >출근</a>
								</c:when>
								<c:otherwise>
									<a href="myattendance.do?work=attendance"  id="attBtn2" class="btn btn-warning form-control" >출근 완료</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-6 form-group"  id="leavBtn">
							<c:choose>
								<c:when test="${successAtt.leaving eq null}">
									<a href="myattendance.do?work=leav" id="attBtn1" class="btn btn-danger form-control" >퇴근</a>
								</c:when>
								<c:otherwise>
									<a href="myattendance.do?work=leav" id="attBtn2" class="btn btn-warning form-control" >퇴근 완료</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="selectBox">
					<div class="row">					
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '1' }">
									<a href="mytimetable.do?month=1" class="btn btn-info form-control">1월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=1" class="btn btn-primary form-control">1월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '2' }">
									<a href="mytimetable.do?month=2" class="btn btn-info form-control">2월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=2" class="btn btn-primary form-control">2월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '3' }">
									<a href="mytimetable.do?month=3" class="btn btn-info form-control">3월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=3" class="btn btn-primary form-control">3월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '4' }">
									<a href="mytimetable.do?month=4" class="btn btn-info form-control">4월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=4" class="btn btn-primary form-control">4월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '5' }">
									<a href="mytimetable.do?month=5" class="btn btn-info form-control">5월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=5" class="btn btn-primary form-control">5월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '6' }">
									<a href="mytimetable.do?month=6" class="btn btn-info form-control">6월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=6" class="btn btn-primary form-control">6월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '7' }">
									<a href="mytimetable.do?month=7" class="btn btn-info form-control">7월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=7" class="btn btn-primary form-control">7월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '8' }">
									<a href="mytimetable.do?month=8" class="btn btn-info form-control">8월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=8" class="btn btn-primary form-control">8월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '9' }">
									<a href="mytimetable.do?month=9" class="btn btn-info form-control">9월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=9" class="btn btn-primary form-control">9월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '10' }">
									<a href="mytimetable.do?month=10" class="btn btn-info form-control">10월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=10" class="btn btn-primary form-control">10월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '11' }">
									<a href="mytimetable.do?month=11" class="btn btn-info form-control">11월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=11" class="btn btn-primary form-control">11월</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-1 form-group">
							<c:choose>
								<c:when test="${ param.month == '12' }">
									<a href="mytimetable.do?month=12" class="btn btn-info form-control">12월</a>
								</c:when>
								<c:otherwise>
									<a href="mytimetable.do?month=12" class="btn btn-primary form-control">12월</a>
								</c:otherwise>
							</c:choose>
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
			</div>
		</div>
	</div>
</div>
</body>
</html>
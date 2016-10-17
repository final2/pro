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
		<div class="container">
			<h1><a href="emplist.do">급여 리스트</a></h1>
			<div class="row searchbox">
				<form role="form" action="compsalary.do">
					<div class="col-sm-offset-4 col-sm-2 form-group">
						<select name="opt" class="form-control">
							<option value="name">이름</option>
							<option value="paymentDate">월별</option>
							<option value="empNo">사원번호</option>
						</select>
					</div>
					<div class="col-sm-6 form-group">
						<label class="col-sm-2 text-right">검색어</label>
						<div class="col-sm-9">
							<input type="text" name="keyword" class="form-control"/>
						</div>
						<button type="submit" class="btn btn-primary col-sm-1">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</form>
			</div>
			<table class="table table-bordered empBox table-striped" >
				<colgroup>
					<col width="8%"/>
					<col width="8%"/>
					<col width="10%"/>
					<col width="8%"/>
					<col width="8%"/>
					<col width="8%"/>
					<col width="8%"/>
					<col width="8%"/>
					<col width="8%"/>
					<col width="8%"/>
					<col width="8%"/>
					<col width="10%"/>
				</colgroup>
				<tr>
					<th class="info">귀속연월</th>
					<th class="info">사원번호</th>
					<th class="info">이름</th>
					<th class="info">기본급</th>
					<th class="info">시간외수당</th>
					<th class="info">건강보험</th>
					<th class="info">장기요양</th>
					<th class="info">국민연금</th>
					<th class="info">고용/산재</th>
					<th class="info">지급총액</th>
					<th class="info">공제총액</th>
					<th class="info">실지급액</th>
				</tr>
				<c:forEach var="accountBook" items="${salaryList }">
					<tr>
						<td>${accountBook.paymentDate }</td>
						<td>${accountBook.emp.no }</td>
						<td>${accountBook.emp.name }</td>
						<c:set var="salary" value="${accountBook.salary }"/>
						<td><fmt:formatNumber type="number" value="${salary }"/></td>
						<td><fmt:formatNumber type="number" value="${accountBook.overtime }"/></td>
						<c:set var="insureHealth" value="${accountBook.insureHealth }"/>
						<c:set var="insureLonghealth" value="${accountBook.insureLonghealth }"/>
						<c:set var="insureSocial" value="${accountBook.insureSocial }"/>
						<c:set var="employeeInsure" value="${accountBook.employeeInsure }"/>
						<td><fmt:formatNumber type="number" value="${insureHealth }"/></td>
						<td><fmt:formatNumber type="number" value="${insureLonghealth }"/></td>
						<td><fmt:formatNumber type="number" value="${insureSocial }"/></td>
						<td><fmt:formatNumber type="number" value="${employeeInsure }"/></td>
						<c:set var="sum" value="${salary + accountBook.overtime}"/>
						<td><fmt:formatNumber type="number" value="${sum}"/></td>
						<c:set var="minus" value="${insureHealth + insureLonghealth + insureSocial + employeeInsure}"/> 
						<td><fmt:formatNumber type="number" value="${minus}"/></td>
						<td><fmt:formatNumber type="number" value="${sum - minus}"/></td>
					</tr>
				</c:forEach>
			</table>
			<ul class="pagination pageBox">
			<c:if test="${param.pno gt 1 }">
    			<li>
      				<a href="compsalary.do?pno=${param.pno - 1 }" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
      				</a>
    			</li>
    		</c:if>
    		<c:forEach var="num" begin="${navi.beginPage }" end="${navi.endPage }">
    			<c:choose>
    				<c:when test="${param.pno eq num }">
    					<li class="active"><a href="compsalary.do?pno=${num }">${num }</a></li>
    				</c:when>
    				<c:otherwise>
					    <li><a href="compsalary.do?pno=${num }">${num }</a></li>
    				</c:otherwise>
    			</c:choose>
    		</c:forEach>
    		<c:if test="${param.pno lt navi.totalPages}">
    			<li>
      				<a href="compsalary.do?pno=${param.pno + 1 }" aria-label="Next">
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
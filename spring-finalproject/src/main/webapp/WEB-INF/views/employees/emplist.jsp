<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/FinalProject/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/FinalProject/resources/jquery/jquery.js"></script>
<style>
	.container {position:relative; top:60px; text-align:center;}
	.container:after {clear:both; content:""; display:block;}

	.container > h1 {text-align:left;}
	.container > h1 > a {text-decoration:none; color:inherit;}

	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}

	.row label {height:34px; line-height:34px;}	
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
	<div id="page-content-wrapper">
		<div class="container">
			<h1><a href="emplist.do">사원 리스트</a></h1>
			<div class="row">
				<form role="form" action="emplist.do">
					<div class="col-sm-offset-4 col-sm-2 form-group">
						<select name="opt" class="form-control">
							<option value="empName">이름</option>
							<option value="department">부서명</option>
							<option value="position">직책</option>
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
			
			<ul class="pagination pageBox">
			<c:if test="${param.pno gt 1 }">
   			<li>
     				<a href="emplist.do?pno=${param.pno - 1 }" aria-label="Previous">
       				<span aria-hidden="true">&laquo;</span>
     				</a>
   			</li>
	   		</c:if>
	   		<c:forEach var="num" begin="${navi.beginPage }" end="${navi.endPage }">
	   			<c:choose>
	   				<c:when test="${param.pno eq num }">
	   					<li class="active"><a href="emplist.do?pno=${num }">${num }</a></li>
	   				</c:when>
	   				<c:otherwise>
					    <li><a href="emplist.do?pno=${num }">${num }</a></li>
	   				</c:otherwise>
	   			</c:choose>
	   		</c:forEach>
	   		<c:if test="${param.pno lt navi.totalPages}">
	   			<li>
	     				<a href="emplist.do?pno=${param.pno + 1 }" aria-label="Next">
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
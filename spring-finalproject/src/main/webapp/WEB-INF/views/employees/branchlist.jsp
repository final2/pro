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

	.container > h1 {text-align:left;}
	.container > h1 > a {text-decoration:none; color:inherit;}

	.row label {height:34px; line-height:34px;}
	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table { table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px; padding:0 !important;}
	th, td {text-align:center; vertical-align:middle !important;}
	
	td > .empBtn {width:100%; height:100%; display:block; background:#f5fbff; vertical-align:middle; line-height:50px; text-decoration:none; color:inherit;}
	
	.pageBox {margin-top:30px;}
	
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
		<%@ include file="../companynotice/backgroundVideo.jsp" %>
		<div class="container">
			<h1><a href="compbranchlist.do">지점 리스트</a></h1>
			<div class="well" style="opacity:0.8">
				<div class="row">
					<form role="form" action="compbranchlist.do">
						<div class="col-sm-offset-4 col-sm-2 form-group">
							<select name="opt" class="form-control">
								<option value="branch">지점명</option>
								<option value="manager">담당자명</option>
								<option value="address">지역명</option>
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
						<col style="width:14%;">
						<col style="width:14%;">
						<col style="width:20%;">
						<col style="width:14%;">
						<col style="width:20%;">
						<col style="width:18%;">
					</colgroup>
					<tr>
						<th class="info">지점번호</th>
						<th class="info">지점명</th>
						<th class="info">담당자</th>
						<th class="info">담당자 연락처</th>
						<th class="info">지점 연락처</th>
						<th class="info">지역</th>
					</tr>
					<c:forEach var="branch" items="${branchList }">
						<c:url var="detailURL" value="compbranchdetail.do">
							<c:param name="no" value="${branch.no }"></c:param>
							<c:param name="pno" value="${param.pno }"></c:param>
						</c:url>
						<tr>
							<td>${branch.no }</td>
							<td><a href="${detailURL }" class="empBtn">${branch.name }</a></td>
							<td>${branch.emp.name }</td>
							<td>${branch.emp.phone }</td>
							<td>${branch.phone }</td>
							<c:set var="address" value="${branch.address }"/>
							<c:set var="add1" value="${fn:substringBefore(address, '구')}" />
							<td>
								${add1 }구
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<ul class="pagination pageBox">
				<c:if test="${param.pno gt 1 }">
	    			<li>
	      				<a href="compbranchlist.do?pno=${param.pno - 1 }" aria-label="Previous">
	        				<span aria-hidden="true">&laquo;</span>
	      				</a>
	    			</li>
	    		</c:if>
	    		<c:forEach var="num" begin="${navi.beginPage }" end="${navi.endPage }">
	    			<c:choose>
	    				<c:when test="${param.pno eq num }">
	    					<li class="active"><a href="compbranchlist.do?pno=${num }">${num }</a></li>
	    				</c:when>
	    				<c:otherwise>
						    <li><a href="compbranchlist.do?pno=${num }">${num }</a></li>
	    				</c:otherwise>
	    			</c:choose>
	    		</c:forEach>
	    		<c:if test="${param.pno lt navi.totalPages}">
	    			<li>
	      				<a href="compbranchlist.do?pno=${param.pno + 1 }" aria-label="Next">
	        				<span aria-hidden="true">&raquo;</span>
	      				</a>
	    			</li>
	    		</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>
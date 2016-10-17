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
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<style>
h1{color:white;}
th,td {text-align:center;}
ul.pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
}
ul.pagination li {display: inline;}
ul.pagination li a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    border-radius: 5px;
}
ul.pagination li a.active {
    background-color: #97CCFB;
    color: white;
    border-radius: 5px;
    pointer-events: none;
    cursor: default;
}
ul.pagination li a:hover:not(.active) {background-color: #ddd;}
 .disabled {
        pointer-events: none;
        cursor: default;
        opacity: 0.6;
 }
</style>
<script type="text/javascript">
</script>
<title>Big Store</title>
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
		<div class="container" style="margin-top:10px">
			<h1>재고 리스트</h1>
			<hr>
			<div class="well" style="opacity:0.8">
			<table class="table table-bordered">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="35%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>제조사 명</th>
						<th>상품 번호</th>
						<th>상품 명</th>
						<th>재고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${inven }">
						<tr>
							<td>${list.client.name }</td>
							<td>${list.product.no }</td>
							<td>${list.product.name }</td>
							<td>${list.qty }</td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
			</div>
			<div class="pull-right">
				<c:if test="${LoginUser.dept eq 'PM' or LoginUser.dept eq 'Master'}">
					<a href="orderApp.do" class="btn btn-warning">발주 신청</a>
				</c:if>
			</div>
			
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageVo.pageNo gt 1}">
						<li>
							<a href="invenList.do?pn=${pageVo.pageNo - 1 }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageVo.beginPage }" end="${pageVo.endPage}">
						<c:choose>
							<c:when test="${pageVo.pageNo eq num }">
								<li><a class="active" href="invenList.do?pn=${num }">${num }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="invenList.do?pn=${num }">${num }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageVo.pageNo lt pageVo.totalPages }">
						<li>
							<a href="invenList.do?pn=${pageVo.pageNo + 1 }" aria-label="Next">
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
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
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet"></script>
<script type="text/javascript">

</script>
<style>
h1{color:white;}
th,td {text-align:center;}
</style>
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
	
	<div id="page-context-wrapper">
      <%@ include file="../companynotice/backgroundVideo.jsp" %>
		<div class="container" style="margin-top:10px">
			<h1>발주내역</h1>
			<hr>
			<div class="well" style="opacity:0.8">
				<table class="table table-bordered" >
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="40%">
						<col width="10%">
					</colgroup>
					<tr>		
						<th>발주신청 일자</th>
						<th>발주번호</th>
						<th>거래처 번호 / 거래처명</th>
						<th>입고확인 여부</th>
					</tr>
					<c:forEach var="order" items="${orderLists }">
						<c:url var="orderDetailURL" value="hqOrderDetail.do">
							<c:param name="no" value="${order.no}" />
						</c:url>
						<tr>
							<td><fmt:formatDate value="${order.regdate }" pattern="yyyy-MM-dd" /> </td>
							<td>${order.no }</td>
							<td><a href="${orderDetailURL}">${order.client.no } / ${order.client.name }</a></td>
							<c:choose>
								<c:when test="${order.confirm == 'Y'}">
									<td>입고 완료</td>
								</c:when>
								<c:otherwise>
									<td>입고 대기중</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
   </div>
</div>
</body>
</html>
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
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-content-wrapper">
		
		<div class="container" style="margin-top:10px">
			<h1>거래처 수정</h1>
			<hr>
			<form action="updateClient.do?pn=${param.pn }" method="post" role="form">
				<div>
					<label>거래처 번호</label>
					<input type="text" name="no" class="form-control" readonly="readonly" value="${client.no}">
				</div>
				<div>
					<label>거래처 명</label>
					<input type="text" name="name" class="form-control" value="${client.name}">
				</div>
				<div>
					<label>거래 여부</label><br />
					<input type="radio" name="isAdmit" value="Y" ${client.isAdmit eq 'Y' ? 'checked=checked': '' }> 거래중
					<input type="radio" name="isAdmit" value="N" ${client.isAdmit eq 'N' ? 'checked=chedked': '' }> 거래중지
				</div>
				<div class="pull-right">
					<c:url var="clientListURL" value="clientList.do">
						<c:param name="pn" value="${param.pn }" />
					</c:url>
					<a href="${clientListURL }" class="btn btn-danger">취소</a>
					<input type="submit" class="btn btn-primary" value="확인" />
				</div>
			</form>
		</div>
   </div>
</div>
</body>
</html>
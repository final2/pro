<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script type="text/javascript">
$(function() {
	
})
</script>
<style type="text/css">
h1{color:white;}
th{text-align:center; vertical-align:middle !important}
td{text-align:left; vertical-align:middle !important}
.imgBox {width:380px;}
.imgBox > img {width:100%;}
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
	<div id="page-context-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container">
			<h1>상품 상세 정보</h1>
			<div class="well">
				<table class="table">
					<colgroup>
						<col width="">
						<col width="20%">
						<col width="50%">
					</colgroup>
					<tr>
						<td rowspan="8" class="imgBox" style="text-align:center;">
							<c:choose>
								<c:when test="${fn:startsWith(product.image, 'http')}">
									<img style="width:90%; height:400px;" src="${product.image}"> 
								</c:when>
								<c:otherwise>
									<img style="width:90%; height:400px;" src="/FinalProject/resources/image/${product.image }">
								</c:otherwise>
							</c:choose>
						</td>							
						<th>제품 번호</th>
						<td>${product.no }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${product.name}</td>							
					</tr>
					<tr>
						<th>분류</th>
						<td>${product.smallCat.name}</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>${product.price}</td>
					</tr>
					<tr>
						<th>회사</th>
						<td>${product.maker}</td>
					</tr>
					<tr>
						<th>이벤트</th>
						<c:if test="${product.event.no eq 1}">
							<td>1 + 1</td>
						</c:if>
						<c:if test="${product.event.no eq 2}">
							<td>2 + 1</td>
						</c:if>
						<c:if test="${product.event.no eq 3}">
							<td>임의</td>
						</c:if>
						<c:if test="${product.event.no eq 9}">
							<td>행사 품목 아님 </td>
						</c:if>
					</tr>
					<tr>
						<th>연령제한</th>
						<c:if test="${product.limiteAge eq 'N'}">
							<td>없음</td>
						</c:if>
						<c:if test="${product.limiteAge eq 'Y'}">
							<td>청소년 구매 불가</td>
						</c:if>
					</tr>
					<tr>
						<th>메모</th>
						<td>${product.memo}</td>
					</tr>
				</table>
			</div>
			<div style="text-align:right">
				<c:url var="list" value="productList.do">
					<c:param name="pn" value="${param.pn }" />
					<c:param name="maker" value="${param.maker}" />
					<c:param name="smallCat" value="${param.smallCat}" />
					<c:param name="eventCode" value="${param.eventCode}" />
					<c:param name="limiteAge" value="${param.limiteAge}" />
				</c:url>
				<a class="btn btn-default" href="${list }">목록</a>
				<c:url var="update" value="updateProduct.do">
					<c:param name="no" value="${product.no }" />
					<c:param name="pn" value="${param.pn }" />
					<c:param name="maker" value="${param.maker}" />
					<c:param name="smallCat" value="${param.smallCat}" />
					<c:param name="eventCode" value="${param.eventCode}" />
					<c:param name="limiteAge" value="${param.limiteAge}" />
				</c:url>
				<c:if test="${LoginUser.dept eq 'PM' }">
					<a class="btn btn-default" href="${update }">수정</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
</body>
</html>
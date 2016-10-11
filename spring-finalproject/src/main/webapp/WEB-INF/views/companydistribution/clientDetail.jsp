<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script type="text/javascript">
$(function() {
	// 모달창 오픈시 기능
	$('#myModal').on('show.bs.modal', function (e) {
		  $("#name").val('${clients.name}')
		  $(".modal-body p").hide();
	});
	
	// 수정 버튼 기능
	$("form").submit(function() {
		if(!$.trim($("#name").val())) {
			$(".non").show();
			$("#name").focus();
			return false;
		}
		return true;
	});
});
</script>
<style>
.non{color: red;}
th,td {text-align:center;}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		
		<div class="container" style="margin-top:10px">	
			<h1>거래처 상세정보</h1>
			<hr>
			
			<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="2">거래처번호</th>
							<td colspan="2">${clients.no }</td>
						</tr>
						<tr>
							<th>거래처 명</th>
								<td>${clients.name }</td>
							<th>거래 여부</th>
							<c:choose>
								<c:when test="${clients.isAdmit == 'Y'}">
									<td>거래중</td>
								</c:when>
								<c:otherwise>
									<td>거래 중지</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th colspan="2">제품명</th>
							<th colspan="2">수량</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ds" items="${details}">
							<tr>
								<td colspan="2">${ds.product.name }</td>
								<td colspan="2"><fmt:formatNumber value="${ds.qty }" type="number" /></td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
			<div class="pull-right">
				<c:if test="${LoginUser.dept eq 'PM'}">
					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" id="btn" >수정</button>
				</c:if>
				<a href="clientList.do" class="btn btn-primary">확인</a>
			</div>
			
			<!-- 수정 모달 창 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
				<div class="modal-dialog">
				
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">거래처 수정</h4>
						</div>
						
						<form action="updateClient.do" method="post" role="form">
							<div class="modal-body">
								<div>
									<label>거래처 번호</label>
									<input type="text" name="no" class="form-control" readonly="readonly" value="${clients.no}">
								</div>
								<div>
									<label>거래처 명</label>
									<input type="text" name="name" id="name" class="form-control" value="${clients.name}">
									<p class="non"><strong>거래처명</strong>을 입력하세요.</p>
								</div>
								<div>
									<label>거래 여부</label><br />
									<input type="radio" name="isAdmit" value="Y" ${clients.isAdmit eq 'Y' ? 'checked=checked': '' }> 거래중
									<input type="radio" name="isAdmit" value="N" ${clients.isAdmit eq 'N' ? 'checked=chedked': '' }> 거래중지
								</div>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" id="add" value="확인" />
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
   </div>
</div>
</body>
</html>
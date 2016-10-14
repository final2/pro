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
	
	$("#search-btn").click(function() {
		var keyword = $("input:text[name='keyword']").val().trim();
		if(keyword == '') {
			keyword = 'null';
		} 
		
	});
});
</script>
<style>
h1{color:white;}
.price{background-color: #EBFBFF}
.non{color: red;}
th,td {text-align:center;}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		<%@ include file="../companynotice/backgroundVideo.jsp" %>
		<div class="container" style="margin-top:10px">	
			<h1>거래처 상세정보</h1>
			<hr>
			<div class="well" style="opacity:0.8">
			<div style="text-align:right">
			<form role="form" action="clientDetail.do?pn=1" method="POST">
				<div class="form-group col-sm-9">
					<input type="hidden" name="no" value="${param.no }">
					<input type="text" class="form-control" name="keyword" placeholder="상품명을 입력하세요.">
			    </div>
			    <div class="form-group col-sm-3">
			      <input type="submit" id="search-btn" class="btn btn-info form-control" value="검색" />
			    </div>
			</form>
			</div>
				<table class="table table-bordered">
						<colgroup>
						<col width="20%">
						<col width="15%">
						<col width="25%">
						<col width="20%">
						<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>거래처번호</th>
								<th>거래처 명</th>		
								<th>제품명</th>
								<th>거래처 가격</th>
								<th class="price">소비자 가격</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach var="product" items="${products}">
								<tr>
									<td>${product.clientNo }</td>
									<td>${product.maker }</td>
									<td>${product.name }</td>
									<td><fmt:formatNumber value="${product.price * 0.7}" type="number" /></td>
									<td class="price"><fmt:formatNumber value="${product.price}" type="number" /></td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
			</div>
			<div class="pull-right">
				<c:if test="${LoginUser.dept eq 'PM'}">
					<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" id="btn" >수정</button>
				</c:if>
				<a href="clientList.do" class="btn btn-default">목록</a>
			</div>
			
			<div class="text-center"> 
				<ul class="pagination">
				<c:if test="${pageVo.pageNo gt 1 }">
					<li>
						<a href="clientDetail.do?no=${param.no }&pn=${pageVo.pageNo - 1 }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageVo.beginPage }" end="${pageVo.endPage }">
					<c:choose>
						<c:when test="${pageVo.pageNo eq num }">
							<li><a class="active" href="clientDetail.do?no=${param.no }&pn=${num }">${num }</a></li>
						</c:when>
						<c:otherwise>				
							<li><a href="clientDetail.do?no=${param.no }&pn=${num }">${num }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageVo.pageNo lt pageVo.totalPages }" >
					<li>
						<a href="clientDetail.do?no=${param.no }&pn=${pageVo.pageNo + 1 }" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				</ul>
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
								<div>++
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
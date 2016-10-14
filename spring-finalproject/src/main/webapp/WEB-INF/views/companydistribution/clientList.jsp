

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
	// 모달창 오픈시 기본동작들
	$('#myModal').on('show.bs.modal', function (e) {
		$("#name").val("");
		$("#add").attr("disabled", "disabled");
		$(".modal-body p").hide();	
	});
	
	// 등록버튼 기능
	$("#add").submit(function() {
		if(!$(":input[name='name']").val()) {
			$(".modal-body p").hide();
			$(":input[name='name']").focus();
			return false;
		}
		return true;
	});
	
	// 중복체크 버튼 기능
	$("#ck").click(function() {
		var nameck = $.trim($("#name").val());
		if(nameck == "") {
			$(".modal-body p").hide();
			$(".non").show();			
			return false;
		}
		$.ajax({
			url:"json/nameck.do",
			data:{name:nameck},
			dataType:"json",
			success:function(data) {
				if(data.size == 1){
					$(".modal-body p").hide();
					$(".same").show();
					$("#name").val("");
					idnotoverlap = false;
				} else {
					$(".modal-body p").hide();
					$(".ok").show();
					$("#add").removeAttr("disabled");
					idnotoverlap = true;
				}
			}
		});
		
	});
});
</script>
<style>
.non, .same{color: red;}
.ok{color: blue;}
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
<title>Big Store</title>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		
		<div class="container" style="margin-top:10px">
			<h1>거래처 리스트</h1>
			<hr>
			<table class="table table-bordered" >
				<colgroup>
					<col width="25%">
					<col width="60%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>거래처 번호</th>
						<th>거래처 명</th>
						<th>거래 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="client" items="${clientList}">
						<c:url var="detailURL" value="clientDetail.do?pn=1">
							<c:param name="no" value="${client.no}" />
						</c:url>
						<tr>
							<td>${client.no}</td>
							<td><a href="${detailURL}">${client.name}</a></td>
							<c:choose>
								<c:when test="${client.isAdmit == 'Y'}">
									<td>거래중</td>
								</c:when>
								<c:otherwise>
									<td>거래 중지</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pull-right">
				<c:if test="${LoginUser.dept eq 'PM'}">
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="btn">거래처 등록</button>
				</c:if>
			</div>
			
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageVo.pageNo gt 1}">
						<li>
							<a href="clientList.do?pn=${pageVo.pageNo - 1 }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageVo.beginPage }" end="${pageVo.endPage}">
						<c:choose>
							<c:when test="${pageVo.pageNo eq num }">
								<li><a class="active" href="clientList.do?pn=${num }">${num }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="clientList.do?pn=${num }">${num }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageVo.pageNo lt pageVo.totalPages }">
						<li>
							<a href="clientList.do?pn=${pageVo.pageNo + 1 }" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
				</ul>
			</div>
			
			<!-- 등록 모달 창 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
				<div class="modal-dialog">
				
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"><strong>거래처 등록</strong></h4>
						</div>
						<form action="addClient.do" method="post" role="form">
							<div class="modal-body">
								<label>거래처 명 : </label>
								<button type="button" id="ck" class="btn btn-info btn-xs pull-right">중복확인</button>
								<input type="text" name="name" id="name" class="form-control" />
								<p class="non"><strong>거래처명</strong>을 입력하세요.</p>
								<p class="same">등록된<strong>거래처</strong>입니다.</p>
								<p class="ok">등록 가능합니다.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
								<input type="submit" class="btn btn-primary" id="add" value="등록" />
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
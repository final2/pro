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
<script type="text/javascript">
$(function() {
	var ProductSearch = {};
	
	ProductSearch['maker'] = ${productSearch.maker};
	ProductSearch['smallCat'] = ${productSearch.smallCat};
	ProductSearch['eventCode'] = ${productSearch.eventCode};
	ProductSearch['limiteAge'] = "${productSearch.limiteAge}";
	ProductSearch['dummy'] = new Date().getTime();
	
	var jsonData = JSON.stringify(ProductSearch);
	$.ajax({

		type:'POST',
		url:'json/product/get',
		contentType:'application/json',
		data:jsonData,
		dataType:'json',
		success:function(data) {
			var $maker = $("#maker");
			var $smallCat = $("#smallCat");
			var $event = $("#event");
			var ps = data.productSearch;
			console.log(data);
			$.each(data.clients, function(index, client) {
				if(ps.maker == client.no) {
					$maker.append("<option value="+client.no+" selected='selected'>"+client.name+"</option>");				
				} else {					
					$maker.append("<option value="+client.no+">"+client.name+"</option>");				
				}
			});
			
			$.each(data.smallCategorys, function(index, smallCat) {
				if(ps.smallCat == smallCat.no) {
					$smallCat.append("<option value="+smallCat.no+" selected='selected'>"+smallCat.name+"</option>");
				} else {
					$smallCat.append("<option value="+smallCat.no+">"+smallCat.name+"</option>");
				}
			});
			$.each(data.events, function(index, event) {
				if(event.type == "O") {
					if(ps.eventCode == event.no) {
						$event.append("<option value="+event.no+" selected='selected'>1 + 1</option>")					
					} else {
						$event.append("<option value="+event.no+">1 + 1</option>")					
					}
				} else if (event.type == "T" ) {
					if(ps.eventCode == event.no) {
						$event.append("<option value="+event.no+" selected='selected'>2 + 1</option>")											
					} else {
						$event.append("<option value="+event.no+">2 + 1</option>")																	
					}
				} else if (event.type == "E") {
					if(ps.eventCode == event.no) {
						$event.append("<option value="+event.no+" selected='selected'>임의 값</option>")						
					} else {
						$event.append("<option value="+event.no+">임의 값</option>")
					}
				} else {
					if(ps.eventCode == event.no) {
						$event.append("<option value="+event.no+" selected='selected'>없음</option>")
					} else {
						$event.append("<option value="+event.no+">없음</option>")						
					}
				}
			});
		}
	});
	
	$("button#search").click(function(event) {
		event.preventDefault();
		
		$(":input[name='pn']").val(1);		
		$("#searchform").submit()
		
		return false;
	});
	$("button#reset").click(function(event) {
		event.preventDefault();
		$("select").find(":first-child").attr("selected", "selected");
		$("#searchform").submit();
		return false;
	});
	
	$("ul.pagination a:not([aria-label])").on("click", function() {
		$(":input[name='pn']").val($(this).text());
		
		$("#searchform").submit();
		return false;
	});
	
	$("ul.pagination a[aria-label]").on("click", function() {
		console.log($(this));
		var currentPno = $(":input[name='pn']").val();
		
		if ($(this).attr("aria-label") == "Previous") {
			$(":input[name='pn']").val(currentPno - 1);
		} else if ($(this).attr("aria-label") == "Next") {
			$(":input[name='pn']").val(parseInt(currentPno) + 1);
		}
		
		$("#searchform").submit();
		return false;
	});
});
</script>
<style type="text/css">
h1{color:white;}
th, td{text-align:center}
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
    background-color: #4CAF50;
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
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	<div id="page-context-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container">
			<h1>상품 리스트</h1>
			<div class="panel panel-default well" style="opacity:0.8">
				<div class="panel panel-heading" style="height:10%">
						<form role="form" id="searchform" action="productList.do" method="get">
							<div class="row">
								<div class="col-sm-3">
									<label>제조사</label>
									<select class="form-control" id="maker" name="maker">
										<option class="select" selected='selected' value="0">선택</option>
									</select>
								</div>
								<div class="col-sm-3">
									<label>분류</label>
									<select class="form-control" id="smallCat" name="smallCat">
										<option class="select" selected='selected' value="0">선택</option>
									</select>
								</div>
								<div class="col-sm-3">
									<label>이벤트</label>
									<select class="form-control" id="event" name="eventCode">
									</select>
								</div>
								<div class="col-sm-3">
									<label>연령 제한</label>
									<select class="form-control" id="limite-age" name="limiteAge">
										<c:choose>
											<c:when test="${param.limiteAge eq 'Y' }">
												<option value="null">선택</option>
												<option value="N">없음</option>
												<option value="Y" selected='selected'>청소년 구매불가</option>										
											</c:when>
											<c:when test="${param.limiteAge eq 'N' }">
												<option value="null">선택</option>
												<option value="N" selected='selected'>없음</option>
												<option value="Y" >청소년 구매불가</option>										
											</c:when>
											<c:otherwise>
												<option value="null" selected='selected'>선택</option>
												<option value="N">없음</option>
												<option value="Y">청소년 구매불가</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
							</div>
							<div class="row">
								<div style="text-align:right; margin:10px 15px 0 0" >
									<input type="hidden" name="pn" value="${pageVo.pageNo }" />
									<button id="search" class="btn btn-xs btn-default">검색</button>
									<button id="reset" class="btn btn-xs btn-default">초기화</button>
								</div>
							</div>
						</form>					
				</div>
				<div class="panel panel-body">
					<table class="table table-hover">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="15%">
							<col width="45%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>제품 번호</th>
								<th>제조사</th>
								<th>소 분류</th>
								<th>제품 명</th>
								<th>제품 가격</th>
							</tr>					
						</thead>
						<tbody>
							<c:forEach var="product" items="${productList}">
								<tr>
									<td>${product.no}</td>
									<td>${product.maker}</td>
									<td>${product.smallCat.name}</td>
									<c:url var="Detail" value="productDetail.do">
										<c:param name="no" value="${product.no }" />
										<c:param name="pn" value="${param.pn }" />
										<c:param name="maker" value="${productSearch.maker}" />
										<c:param name="smallCat" value="${productSearch.smallCat}" />
										<c:param name="eventCode" value="${productSearch.eventCode}" />
										<c:param name="limiteAge" value="${productSearch.limiteAge}" />
									</c:url>
									<td><a href="${Detail}">${product.name}</a></td>
									<td>${product.price}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="text-center"> 
				<ul class="pagination">
				<c:if test="${pageVo.pageNo gt 1 }">
					<li>
						<a href="productList.do?pn=${pageVo.pageNo - 1 }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageVo.beginPage }" end="${pageVo.endPage }">
					<c:choose>
						<c:when test="${pageVo.pageNo eq num }">
							<li><a class="active" href="productList.do?pn=${num }">${num }</a></li>
						</c:when>
						<c:otherwise>				
							<li><a href="productList.do?pn=${num }">${num }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageVo.pageNo lt pageVo.totalPages }" >
					<li>
						<a href="productList.do?pn=${pageVo.pageNo + 1 }" aria-label="Next">
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
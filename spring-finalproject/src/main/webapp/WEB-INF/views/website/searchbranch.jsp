<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/css/branch.css">
<script type="text/javascript" src="resources/jquery/jquery.js" ></script>
	<style>
	html,body {margin: 0; padding:0; height:100%;  }
	#mainview {
		margin: auto;
		max-width:1080px;
		min-height: 100%; 
		// relative 선언을 통해 하단바의 absolute position 이 정확한 위치에 오도록 한다.
		position: relative;
		// content 시작 위치부터 그라디언트 효과가 나타나도록 한다.
		background: #0202F7 url('images/gr.jpg') 0 70px repeat-x;
	}
		 
 	#mainview #header {
		height: 100px;
		background-color: white;
	} 
		 
	#mainview #content {
		// 하단바가 표시되는 공간 부여
		min-height: 100%; 
		padding-bottom: 130px;
	}
		 
	#footer {
		// 하단바를 하단에 고정
		position: absolute;
		bottom: 0;
		width: 100%;
		height: 130px;
		background-color: silver;
	}

	</style>

<title>Introduce BigStore</title>

</head>
<body id="mypage">
<div id="mainview" >
	<div id="header" class="w3-display-container">
		<%@ include file="navbar.jsp" %>
	</div>
		
	<div id="content">
		
		<div class="w3-container w3-padding-0 w3-margin-top w3-margin-bottom">
			<h1>상품 목록</h1>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>이름</th>
						<th>제조사</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty products }">
						<tr>
							<td colspan="4" class="text-center">
								<strong>검색 결과가 존재하지 않습니다.</strong>
							</td>
						</tr>
					</c:if>
					<c:forEach var="product" items="${products }">
						<tr>
							<td>${product.no }</td>
							<td>${product.name }</td>
							<td>${product.maker }</td>
							<td>${product.price }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="row text-center">
			<form id="searchform" class="form-inline" method="get" action="list.do">
				<input type="hidden" name="pno" value="${navi.pageNo }" />
				<div class="form-group">
					<label class="sr-only" for="opt"></label>
					<select class="form-control" name="opt" id="opt">
						<option value="name"  ${param.opt eq 'name'? 'selected=selected' : ''}> 상품이름</option>
						<option value="maker" ${param.opt eq 'maker'? 'selected=selected' : ''}> 제조사</option>
					</select>
				</div>
				<div class="form-group">
					<label class="sr-only" for="keyword"></label>
					<input type="text" class="form-control" name="keyword" id="keyword" value="${param.keyword }">
				</div>
				<button class="btn  btn-primary">조회</button>
			</form>
		</div>
		
		<div class="row text-center">
			<ul class="pagination">
			<c:if test="${navi.pageNo gt 1 }">
    			<li>
      				<a href="list.do?pno=${navi.pageNo - 1 }" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
      				</a>
    			</li>
    		</c:if>
    		<c:forEach var="num" begin="${navi.beginPage }" end="${navi.endPage }">
    			<c:choose>
    				<c:when test="${navi.pageNo eq num }">
    					<li class="active"><a href="list.do?pno=${num }">${num }</a></li>
    				</c:when>
    				<c:otherwise>
					    <li><a href="list.do?pno=${num }">${num }</a></li>
    				</c:otherwise>
    			</c:choose>
    		</c:forEach>
    		<c:if test="${navi.pageNo lt navi.totalPages}">
    			<li>
      				<a href="list.do?pno=${navi.pageNo + 1 }" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
      				</a>
    			</li>
    		</c:if>
  			</ul>
		</div>
		
		
		
		
		
		
		
		
		
			<!-- 공지테이블 -->
<%-- 			<div class="w3-container w3-teal">
	  			<h1>공지사항</h1>
			</div>
			<table class="w3-table w3-striped w3-bordered w3-border">
				<colgroup>
					<col width="20%">
					<col width="50%">
					<col width="30%">
				</colgroup>
				<thead>
					<tr>
					  <th>번호</th>
					  <th>제목</th>
					  <th>날자</th>
					</tr>
				</thead>
				<tbody> --%>
				<!-- 반복 -->
<%-- 					<c:forEach var="webboard" items="${announcementList}">
						<!-- detail 들어갈때 보내는 전송값 -->
						<c:url var="detailNo" value="webBoardDetail.do">
							<c:param name="no" value="${webboard.no }" />
						</c:url>
						<tr>
							<td>${webboard.no }</td>
							<td><a href="${detailNo }">${webboard.title }</a></td>
							<td><fmt:formatDate value="${webboard.regdate }" pattern="yyyy.MM.dd hh:mm"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table> --%>
		</div>
	</div>
		<!-- footer -->
	<div id="footer">
		<%@ include file="footer.jsp" %>	
	</div>
</div>
</body>
</html>
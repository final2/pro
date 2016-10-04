<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="current_page" value="boardList" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script type="text/javascript">

</script>
<style>
h1 {color: white;}
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
	<%-- <!-- 메신저 modal창 -->
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div> --%>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container">	
			<h1>공지 사항</h1>
			<div class="well" style="opacity:0.8">
			
				<table class="table table-hover">
					<colgroup>
						<col width="20%">
						<col width="50%">
						<col width="30%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>					
							<th>작성 날짜</th>					
						</tr>
					</thead>
					<tbody>
						<!-- 반복 -->
						<c:forEach var="board" items="${boardList}">
							<!-- detail 들어갈때 보내는 전송값 -->
							<c:url var="detailURL" value="boardDetail.do">
								<c:param name="pn" value="${pageVo.pageNo }" />
								<c:param name="rn" value="${board.boardRank}" />
							</c:url>
							<tr>
								<td>${board.no }</td>
								<td><a href="${detailURL }">${board.title }</a></td>
								<td><fmt:formatDate value="${board.regdate }" pattern="yyyy.MM.dd / hh:mm:ss"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:if test="$LoginUser.dept eq 'director'">			
				<div class="text-right">
					<a href="boardForm.do" class="btn btn-default">글쓰기</a>
				</div>
			</c:if>
			<div class="text-center"> 
				<ul class="pagination">
				<c:if test="${pageVo.pageNo gt 1 }">
					<li>
						<a href="boardList.do?pn=${pageVo.pageNo - 1 }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageVo.beginPage }" end="${pageVo.endPage }">
					<c:choose>
						<c:when test="${pageVo.pageNo eq num }">
							<li><a class="active" href="boardList.do?pn=${num }">${num }</a></li>
						</c:when>
						<c:otherwise>				
							<li><a href="boardList.do?pn=${num }">${num }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageVo.pageNo lt pageVo.totalPages }" >
					<li>
						<a href="boardList.do?pn=${pageVo.pageNo + 1 }" aria-label="Next">
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
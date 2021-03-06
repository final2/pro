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
<style>
thead td,th{text-align:center;}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<!-- 메신저 modal창 -->
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container">
		<h1 style="color:white">공지사항</h1>
			<div class="well" style="opacity:0.8;">
				<table class="table">
					<thead>
						<tr>
							<th width="5%">번호</th>
							<td width="10%">${board.no }</td>
							<th width="5%">제목</th>
							<td>${board.title }</td>
							<th width="10%">작성 날짜</th>
							<td width="15%"><fmt:formatDate value="${board.regdate }" pattern="yyyy.MM.dd / hh:mm:ss"/></td>		
						</tr>
					</thead>
					<tbody>					
						<tr>                                                                                                       
							<td width="100%" colspan="6">${board.content }</td>
						</tr>
					</tbody>
				</table>
				<hr>
			</div>
			<div class="pull-right"> 
				<c:url var="updateFormURL" value="boardUpdateForm.do">
					<c:param name="no" value="${board.no }" />
					<c:param name="pn" value="${param.pn }" />
					<c:param name="rn" value="${param.rn }" />
				</c:url>
				<c:if test="${LoginUser.dept eq 'HR' or LoginUser.dept eq 'Master'}">
					<a href="${updateFormURL }" class="btn btn-default">수정</a>
					<a href="boardDelete.do?no=${board.no }&pn=${param.pn}" class="btn btn-default">삭제</a>
				</c:if>
				<a href="boardList.do" class="btn btn-default">목록</a>
			</div>
			<div style="text-align:center">
					<c:choose>
						<c:when test="${board.boardRank eq 1 and pageVo.pageNo eq 1 }">
							<a href="" class="btn btn-default disabled" aria-label="Next">
								<span aria-hidden="true">&lt;</span> 다음 게시글
							</a>
						</c:when>
						<c:when test="${board.boardRank eq 1 and pageVo.pageNo gt 1 }">
							<a href="boardDetail.do?pn=${pageVo.pageNo - 1 }&rn=10" class="btn btn-default" aria-label="Next">
								<span aria-hidden="true">&lt;</span> 다음 게시글
							</a>
						</c:when>
						<c:otherwise>
							<a href="boardDetail.do?pn=${pageVo.pageNo }&rn=${board.boardRank - 1}" class="btn btn-default" aria-label="Next">
								<span aria-hidden="true">&lt;</span> 다음 게시글
							</a>
						</c:otherwise>
					</c:choose>				
					<c:choose>
						<c:when test="${board.boardRank eq 10 and pageVo.pageNo eq pageVo.totalPages }">
							<a href="" class="btn btn-default disabled" aria-label="Previous">
								이전 게시글 <span aria-hidden="true">&gt;</span> 
							</a>
						</c:when>
						<c:when test="${board.boardRank eq 10 and pageVo.pageNo lt pageVo.totalPages }">
							<a href="boardDetail.do?pn=${pageVo.pageNo +1}&rn=1" class="btn btn-default" aria-label="Previous">
								이전 게시글 <span aria-hidden="true">&gt;</span> 
							</a>
						</c:when>
						<c:otherwise>
							<a href="boardDetail.do?pn=${pageVo.pageNo }&rn=${board.boardRank + 1}" class="btn btn-default" aria-label="Previous">
								이전 게시글  <span aria-hidden="true">&gt;</span> 
							</a>
						</c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
</div>
</body>
</html>
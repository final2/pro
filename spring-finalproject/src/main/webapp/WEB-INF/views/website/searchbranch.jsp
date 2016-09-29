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
			<!-- 공지테이블 -->
			<div class="w3-container w3-teal">
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
				<tbody>
				<!-- 반복 -->
					<c:forEach var="webboard" items="${announcementList}">
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
			</table>
		</div>
	</div>
		<!-- footer -->
	<div id="footer">
		<%@ include file="footer.jsp" %>	
	</div>
</div>
</body>
</html>
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
		height: 70px;
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
	
	th {
		font-size:150%;
		text-align:center;
		font-family: "궁서체";
	}
		li {
	    float: left;
	}
	
	li span {
	    display: block;
	    color: white;
	    text-align: center;
	    padding: 14px 16px;
	    text-decoration: none;
	}
	
	li span:hover:not(.active) {
	    background-color: #111;
	}
	
	.active {
	    background-color: #4CAF50;
	}
</style>
<script type="text/javascript">
$(function() {
	$("a[href*='announcement.do']").addClass("active");
});
</script>
<title>Introduce BigStore</title>

</head>
<body>
<div id="mainview">
	
	<div id="header" class="w3-display-container">
	<%@ include file="navbar.jsp" %>
	</div>
	<div id="content">
		<div class="w3-container w3-padding-0">
			<!-- 공지테이블 상세 -->
			<div class="w3-container w3-teal">
	  			<h3>${boardDetail.title }</h3>
			</div>
			<table class="w3-table w3-striped w3-bordered w3-border">
			<%-- 	<tr>
				  <th>제목</th>
				  </tr>
				  <tr>
					<td><span style="color:blue;text-align:center;font-size:120%;">${boardDetail.title }</span></td>
				</tr> --%>
				<tr>
				  <th>내용</th>
					</tr>
				  		<tr>
					<td>${boardDetail.content }</td>
				</tr>	
				<tr>
				  <th>날자</th>
				  </tr>
				  <tr>
					<td><fmt:formatDate value="${boardDetail.regdate }" pattern="yyyy.MM.dd hh:mm"/></td>
				</tr>
			</table>
			<div align="center" class="w3-container w3-padding-top">
				<a href="announcement.do"><input type="button" class="btn btn-primary" value="목록가기"></a>
			</div>
		</div>
	</div>
	<!--  footer -->
	<div id="footer">
		<%@ include file="footer.jsp" %>	
	</div>
</div>
</body>
</html>
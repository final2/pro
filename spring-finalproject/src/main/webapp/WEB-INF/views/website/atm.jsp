<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<title>Lotto BigStore</title>
</head>
<body>
<div class="container" style="w3-center">
	<div class="w3-display-container" style="max-width:1080px;">
	<%@ include file="navbar.jsp" %>
	
		<div class="w3-container w3-padding-10  w3-margin-bottom w3-margin-top" >
			<div class="w3-container w3-teal">
	  		<h1>ATM기기 설치점</h1>
			</div>
			<!-- 판매점 리스트 -->
			<div class="w3-half" style="min-height:450px;">
				<table class="w3-table w3-striped w3-bordered w3-border" >
					<thead>
					<tr>
					  <th class="w3-center">판매점명</th>
					  <th class="w3-center">주소</th>
					  <th class="w3-center">전화번호</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					  <td>Jill</td>
					  <td>Smith</td>
					  <td>50</td>
					</tr>
					</tbody>
				</table>	
			</div>
			<!-- 지도표시하기 -->
			<div class="w3-half" style="min-height:450px;">
			지도야 나와라!
			</div>
		</div>
		<!-- Footer -->
		<%@ include file="footer.jsp" %>
	</div>
</div>
</body>
</html>
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
<title>Introduce BigStore</title>
</head>
<body>
<div class="container" style="w3-center">
	<div class="w3-display-container" style="max-width:1080px;">
	<%@ include file="navbar.jsp" %>
	
		<div class="w3-container w3-padding-10  w3-margin-bottom w3-margin-top" >
			<div class="w3-container w3-teal">
	  		<h1>1+1 상품</h1>
			</div>
			
	        <div class="w3-display-container  w3-padding-64 w3-center" style="width:100%;min-height:300px;max-height:600px;">
	
			<!-- 반복 -->
			<ul style="overflow:hidden">
				<c:forEach var="product" items="${eventList}">
					<li style="float:left">
						<p>${product.no }</p>
						<img src="${product.image }" />
						<p>${product.price }</p>
						<p>${product.name }</p>
					</li>
				</c:forEach>
			</ul>
				
<!-- 	           <div class="w3-quarter">
	              <img src="resources/image/ohgamja.jpg" alt="감자깡" style="width:45%" class="w3-circle w3-hover-opacity">
	              <h3>상품명감자깡</h3>
	              <p>상품명가격1,500원</p>
	           </div>
	           <div class="w3-quarter">
	              <img src="resources/image/drinkyo.jpg" alt="감자깡" style="width:45%" class="w3-circle w3-hover-opacity">
	              <h3>상품명감자깡</h3>
	              <p>상품명가격1,500원</p>
	            </div>
	           <div class="w3-quarter">
	              <img src="resources/image/mccol.jpg" alt="감자깡" style="width:45%" class="w3-circle w3-hover-opacity">
	              <h3>상품명감자깡</h3>
	              <p>상품명가격1,500원</p>
	            </div>
	            <div class="w3-quarter">
	              <img src="resources/image/came.jpg" alt="감자깡" style="width:45%;" class="w3-circle w3-hover-opacity">
	              <h3>상품명감자깡</h3>
	              <p>상품명가격1,500원</p>
	            </div>   --> 
	      
	    </div>
		</div>
		<!-- Footer -->
		<%@ include file="footer.jsp" %>
	</div>
</div>
</body>
</html>
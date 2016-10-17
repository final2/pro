<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$("a[href*='intro.do']").addClass("active");
});
</script>
<title>Welcome BigStore</title>

</head>
<body id="mypage">
<div id="mainview" >
	<div id="header" class="w3-display-container">
		<%@ include file="navbar.jsp" %>
	</div>
		
	<div id="content">
		
	<div class="w3-container w3-padding-0 " style="min-height:530px;">
			<div class="w3-container w3-teal">
		  			<h1>회사소개</h1>
			</div>
			<div class="w3-container">
				<div class="w3-half w3-center" >
					<img src="resources/image/empimg/song.jpg" style="height:480px;"/>
				</div>
				
				<div class="w3-half w3-center w3-margin-top">
					<p>
					대한민국 구멍가게의 자존심</p>
					<p>
					First No1 Store
					</p>
					<p>
					BigStore~
					</p><p>
					맨날 맨날 가고 싶은 곳~ 
					</p><br><p style="font-weight: bolder;">
					엄마를 위한 간편 도시락,
					</p><br><p style="font-weight: bolder;">
					아빠를 위한 다양한 알콜~
					</p><br><p style="font-weight: bolder;">
					아이를 위한 각 종 주점부리
					</p>
					<br>
					<p>
					엄마랑 손잡고 아빠랑 손잡고 친구 손잡고 
					</p><p>
					너도 나도 열심히 오세요^^
					
					</p>
				</div>
			</div>
		</div>
	</div>
		<!-- footer -->
	<div id="footer">
		<%@ include file="footer.jsp" %>	
	</div>
</div>
</body>
</html>
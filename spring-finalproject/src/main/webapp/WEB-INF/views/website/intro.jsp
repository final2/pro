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
<title>Welcome BigStore</title>

</head>
<body id="mypage">
<div id="mainview" >
	<div id="header" class="w3-display-container">
		<nav class="w3-top" style="position:static;" >
			 <ul class="w3-navbar w3-theme-d2 w3-left-align w3-large" style="height:100px; padding:7px">
			    <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
			      <a class="w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
			    </li>
			    <li><a href="main.do" class="w3-black"><img alt="logo" src="resources/image/logo2.png" width="60px" />BigStore</a></li>

			    <li id="infoStore" class="w3-hide-small w3-right"><a href="searchBranch.do" class="w3-hover-white">서비스유형별안내</a></li>
			    <li class="w3-hide-small w3-right"><a href="announcement.do" class="w3-hover-white">공지사항</a></li>
			  <li class="w3-hide-small w3-right"><a href="intro.do" class="w3-hover-white">회사소개</a></li>
			  <li class="w3-hide-small w3-right"><a href="#" class="w3-hover-teal" title="Search"><i class="fa fa-search"></i></a></li>
			 </ul>
			
			<!-- Navbar on small screens -->
			<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:43px;">
			  <ul class="w3-navbar w3-left-align w3-large w3-theme">
			    <li><a href="intro.do">회사소개</a></li>
			    <li><a href="announcement.do">공지사항</a></li>
			    <li class="w3-dropdown-hover">
			    <a href="#" title="Notifications">서비스유형별안내 <i class="fa fa-caret-down"></i></a>
			    <div class="w3-dropdown-content w3-light-grey w3-card-4">
			      <a href="store.do?id=lotto">Lotto판매</a>
			      <a href="store.do">ATM</a>
			<!--       <a href="parcelService.do">편의서비스</a> -->
			      <a href="store.do">택배서비스</a>
			      <a href="store.do">직접조리식품</a>
			    </div>
			      </li>
			      <li class="w3-dropdown-hover">
			        <a href="#" title="Notifications">상품안내 <i class="fa fa-caret-down"></i></a>
			        <div class="w3-dropdown-content w3-light-grey w3-card-4">
			          <a href="oneplus.do?no=1">1+1상품</a>
			          <a href="twoplus.do?no=2">2+1상품</a>
			          <a href="event.do">덤증정상품</a>
			          <a href="event.do">선물추첨상품</a>
			        </div>
			      </li>
			  </ul>
			</div>
			</nav>
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
					</p>
					<p>
					엄마랑 손잡고 아빠랑 손잡고 친구 손잡고 
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/css/branch.css">
<script type="text/javascript" src="resources/jquery/jquery.js" ></script>
<title>Welcome BigStore</title>
<script type="text/javascript">
$(function() {
	// 첫화면에 1+1 상품 보이기
	var num = 1
	
	$.ajax({
		type:"GET",
		url:"main2.do",
		data: {no:num},		// 서버로 전송하는 데이타
		dateType:"json",
		success:function(result){
			
 			var $ul=$('#1plus1List');
			$ul.empty();
			
			$.each(result, function(index, pd) {
				$ul.append("<div class='w3-quarter'><p class='hidden' value='"+pd.no
						+"'></p><image src='"+pd.image+"' style='width:45%' class='w3-circle w3-hover-opacity'/><p>"
						+pd.price+"</p><p>"+pd.name+"</p></div>");
			} );
		}
	});
});
</script>
</head>
<body id="mypage">
<div class="w3-container">
	<div class="w3-display-container" style="max-width:1080px;">
	<nav class="w3-top" style="position:static" >
		 <ul class="w3-navbar w3-theme-d2 w3-left-align w3-large" style="height:100px">
		  <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
		    <a class="w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
		  </li>
		  <li><a href="main.do" class="w3-black"><img alt="logo" src="resources/image/logo2.png" width="60px" />BigStore</a></li>
		   <li class="w3-hide-small w3-dropdown-hover w3-right">
		    <a href="#" title="Notifications">서비스유형별안내 <i class="fa fa-caret-down"></i></a>
		    <div class="w3-dropdown-content w3-white w3-card-4">
		      <a href="lotto.do">Lotto판매</a>
		      <a href="atm.do">ATM</a>
		<!--       <a href="parcelService.do">편의서비스</a> -->
		      <a href="delivery.do">택배서비스</a>
		      <a href="makefood.do">직접조리식품</a>
		    </div>
		  </li>
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
		      <a href="lotto.do">Lotto판매</a>
		      <a href="atm.do">ATM</a>
		<!--       <a href="parcelService.do">편의서비스</a> -->
		      <a href="delivery.do">택배서비스</a>
		      <a href="makefood.do">직접조리식품</a>
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
	
	<div class="w3-row" ><!-- 왼쪽 200px와 나머지로 나눠 화면 구성 -->
	
	<!-- 좌측 메뉴바 -->
	<!-- 메뉴쪽-->
	    <div class="w3-col" style="width:20%;min-height:300px;max-height:600px;">
	         <nav class="w3-sidenav w3-teal w3-card-2 w3-xlarge" id="leftMenu" style="width:200px;height:300px;position:static!important">
	              <!-- <a href="oneplus.do?no=1" style="margin-top:10px;" >1+1상품</a> -->
	              <a href="#" style="margin-top:10px;" >1+1상품</a>
	              <a href="#" style="margin-top:10px;">2+1상품</a>
	              <a href="#" style="margin-top:10px;">덤증정상품</a>
	              <a href="#" style="margin-top:10px;">선물추첨상품</a>
	         </nav>
	    </div>
	<!-- 좌측메뉴바 끝-->
	
	<!-- 상단메뉴아래 사이드 메뉴와 제품 이미지 나열예정 jsp로 분리예정 -->
	    <div class="w3-rest" style="width:80%;min-height:300px;max-height:300px;overflow:auto;">
	        <div class="w3-display-container  ">
				<!-- ajax값 처음 뿌려질 위치 -->
	        	<ul id="1plus1List" >
	        	</ul>
	          
	        </div>
	    </div>
	</div>
	
		<!-- 검색창 -->
		<div class="w3-row-padding w3-center w3-padding-10 w3-panel w3-padding-xlarge">
		    <div class="w3-half w3-margin-bottom" >
		      <ul class="w3-ul w3-border w3-hover-shadow " style="max-width:480px;">
		        <li class="w3-theme">
		          <p class="w3-xlarge">지점검색</p>
		        </li>
		       <li class="w3-padding-16"><input class="w3-input w3-border w3-round-large" type="text" /></li>
		       <li><button class="w3-btn w3-teal w3-padding-large" ><i class="fa fa-check"></i> 검색</button></li>
		      </ul>
		    </div>
		
		    <div class="w3-half w3-margin-bottom " style="height:230px">
		      <ul class="w3-ul w3-border w3-hover-shadow " style="max-width:480px;">
		        <li class="w3-theme-l2">
		          <p class="w3-xlarge">서비스유형별검색</p>
		        </li>
		          <select class="w3-select" name="option">
		            <option value="" disabled selected>선택하세요</option>
		            <option value="1">Lotto판매</option>
		            <option value="2">ATM</option>
		            <option value="3">택배서비스</option>
		            <option value="3">직접조리식품</option>
		          </select>
		      </ul>
		    </div>
		</div>
		<!-- footer -->
		<%@ include file="footer.jsp" %>	
	</div>
</div>
</body>
</html>
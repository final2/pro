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
<title >Welcome BigStore</title>

<script type="text/javascript">
$(function() {
	// 첫화면에 1+1 상품 보이기
	eventProduct(1);

	/* 서브메뉴 선택 */	
	$("#leftMenu a").click(function() {
				
		$(this).siblings().find("a").removeClass("active");
		$(this).find("a").addClass("active").css('color','yellow');
		eventProduct($(this).attr("id"));
	}); 
	
	
	function eventProduct(evcode){
		var code = evcode || "1";
		$.ajax({
			type:"GET",
			url:"main2.do?",
			data: {no:code},		// 서버로 전송하는 데이타
			dateType:"json",
			success:function(result){
				console.log(result);
	 			var $ul=$('#eventList');
				$ul.empty();
				
				$.each(result, function(index, pd) {
					$ul.append("<div class='w3-quarter'><p class='hidden' value='"+pd.no
							+"'></p><image src='"+pd.image+"' style='width:45%' class='w3-circle w3-hover-opacity'/><p>"
							+pd.price+"</p><p>"+pd.name+"</p></div>");
				} );
			}
		});
	}
	
	$("select").change(function() {
		
	});
	
});
</script>
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
			          <a id="1">1+1상품</a>
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
		
		
	<div class="w3-row" ><!-- 왼쪽 200px와 나머지로 나눠 화면 구성 -->
	
	<!-- 좌측 메뉴바 -->
	<!-- 메뉴쪽-->
	    <div class="w3-col" style="width:20%;min-height:300px;max-height:600px;">
	         <nav id="leftMenu" class="w3-sidenav w3-teal w3-card-2 w3-xlarge" style="width:200px;height:300px;position:static!important">
	              <!-- <a href="oneplus.do?no=1" style="margin-top:10px;" >1+1상품</a> -->
	              <a id="1" href="#" style="margin-top:10px;" >1+1상품</a>
	              <a id="2" href="#" style="margin-top:10px;">2+1상품</a>
	              <a id="3" href="#" style="margin-top:10px;">덤증정상품</a>
	              <a id="9" href="#" style="margin-top:10px;">선물추첨상품</a>
	         </nav>
	    </div>
	<!-- 좌측메뉴바 끝-->
	
	<!-- 상단메뉴아래 사이드 메뉴와 제품 이미지 나열예정 jsp로 분리예정 -->
	    <div class="w3-rest" style="width:80%;min-height:300px;max-height:300px;overflow:auto;">
	        <div class="w3-display-container  ">
				<!-- 이벤트제품들이 뿌려질 위치 -->
	        	<ul id="eventList" >
	        	</ul>
	          
	        </div>
	    </div>
	</div>
	
		<!-- 검색창 -->
		<div class="w3-row-padding w3-center w3-padding-10 w3-panel w3-padding-xlarge">
		    <div class="w3-half" >
		      <ul class="w3-ul w3-border w3-hover-shadow " style="max-width:480px;">
		        <li class="w3-theme">
		          <p class="w3-xlarge">지점검색</p>
		        </li>
		       <li class="w3-padding-1"><input class="w3-input w3-border w3-round-large" type="text" /></li>
		       <li><button class="w3-btn w3-teal w3-padding-large" ><i class="fa fa-check"></i> 검색</button></li>
		      </ul>
		    </div>
		
		    <div class="w3-half  " >
		      <ul class="w3-ul w3-border w3-hover-shadow " style="max-width:480px;">
		        <li class="w3-theme-l2">
		          <p class="w3-xlarge">서비스유형별검색</p>
		        </li>
		          <select class="w3-select" name="option">
		            <option value="" disabled selected>선택하세요</option>
		            <option value="LOTTO">Lotto판매</option>
		            <option value="ATM">ATM</option>
		            <option value="PARCELSERVICE">택배서비스</option>
		            <option value="FRESHFOOD">직접조리식품</option>
		          </select>
		      </ul>
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
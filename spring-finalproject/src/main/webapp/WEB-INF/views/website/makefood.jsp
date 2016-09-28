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
<!-- 서브메뉴관련 --> 
	<style>
	/*body {margin: 0;}*/
	
	ul.topnav {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    overflow: hidden;
	    background-color: #333;
	}
	
	ul.topnav li {float: left;}
	
	ul.topnav li a {
	    display: block;
	    color: white;
	    text-align: center;
	    padding: 14px 16px;
	    text-decoration: none;
	}
	
	ul.topnav li a:hover:not(.active) {background-color: #111;}
	
	ul.topnav li a.active {background-color: #4CAF50;}
	
	ul.topnav li.right {float: right;}
	
	@media screen and (max-width: 600px){
	    ul.topnav li.right,
	    ul.topnav li {float: none;}
	}
	</style>
	
	
<!-- 지도 및 테이블 데이타 갱신 관련 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cfdcd22439144d2fe4a21b6375bed0fa&libraries=services"></script>
<script type="text/javascript">
// 지도 보이기
$(function() {
	
	$.ajax({
		type:"GET",
		url:"makeFood2.do",
		dateType:"json",
		success:function(data){
			//console.log(data);
			// 첫 화면에 보이는 지도
			var mapContainer = document.getElementById('map'),
				mapOption={
				center:new daum.maps.LatLng(37.5722920,126.9929130),
				level:8
				};
			var map=new daum.maps.Map(mapContainer,mapOption);
			
			// json으로 받아온 데이타중 주소를 좌표값으로 변환하여 위치를 표시하고 싶다
			// Geocoder는 주소 변환 api
			var geocoder = new daum.maps.services.Geocoder();
			
			// 테이블에 입력값 넣기
			$.each(data, function(index, item) {
				$("tbody").append("<tr><td>"+item.name+"</td><td>"+item.address+"</td><td>"+item.phone+"</td></tr>")
			
				//주소를 검색하여 좌표값들을 담아 marker에 position값으로 넣으면 지도에 표시된다
				geocoder.addr2coord(item.address, function(status, result) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
	
				        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });
				        
				        daum.maps.event.addListener(marker, 'click', function() {
				        	// 지점번호
				        	var no = item.no;
				        	
				        	// 지점번호에 해당하는 지점의 상세정보 조회하기(구현예정)
				        	$.ajax({
				        		type:"GET",
				        		url:"",
				        		dataType:"json",
				        		success: function(detail) {
				        			
				        			
				        		}
				        	});
				        	
				        });
	
				        // 인포윈도우로 장소에 대한 설명을 표시합니다 marker위에 지점명을 보여주고 싶다
				        var infowindow = new daum.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item.name+'</div>'
				        });

				        daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				        daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(new daum.maps.LatLng(37.5520169,126.9917114));
				    } 
				}); 
				
				
			})
			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
		}
	});
});
</script>
<title>food BigStore</title>
</head>
<body>
<div class="container" style="w3-center">
	<div class="w3-display-container" style="max-width:1080px;">
	<!-- 상단 메뉴바 -->
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
	<!-- 상단메뉴바 관련 script -->	
	<script>
	function w3_open() {
	    var x = document.getElementById("mySidenav");
	    x.style.width = "300px";
	    x.style.textAlign = "center";
	    x.style.fontSize = "40px";
	    x.style.paddingTop = "10%";
	    x.style.display = "block";
	}
	function w3_close() {
	    document.getElementById("mySidenav").style.display = "none";
	}
	
	// Used to toggle the menu on smaller screens when clicking on the menu button
	function openNav() {
	    var x = document.getElementById("navDemo");
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	    } else {
	        x.className = x.className.replace(" w3-show", "");
	    }
	}
	</script>
	
	<!-- 메뉴 하단부 시작  양옆 패딩값은 0으로 하고 위아래약간의 마진을 두었다-->	
	<div class="w3-container w3-padding-0   " >
	<!-- sub메뉴 -->
	<ul class="topnav">
  		<li><a href="#home">Lotto판매점</a></li>
  		<li><a href="#news">ATM 설치점</a></li>
  		<li><a href="#contact">택배 가능점</a></li>
  		<li><a href="#contact" class="active">조리식품판매점</a></li>
  		<li class="right"><a href="#about">About</a></li>
	</ul>
	<!-- sub메뉴 하단 표시부 -->
	<div class="w3-container w3-padding-0 w3-margin-0" style="height:100%;">
		<!-- 판매점 리스트 -->
		<div class="w3-half" style="height:100%;overflow:auto;">
			<table class="w3-table w3-striped w3-bordered w3-border" >
				<thead>
				<tr>
				  <th class="w3-center">판매점명</th>
				  <th class="w3-center">주소</th>
				  <th class="w3-center">전화번호</th>
				</tr>
				</thead>
				<tbody>
					<!-- 판매점 리스트 -->
				</tbody>
			</table>	
		</div>
		<!-- 지도표시하기 -->
		<div class="w3-container w3-half" style="height:540px">
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
	</div>
		</div>
	<!-- Footer 영역-->
		<%@ include file="footer.jsp" %>
	</div>
</div>
</body>
</html>
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
	
	/* 중간 네비바 */ 
	ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
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
	
	<!-- 규석씨 api키값 	bf6fd53fddf7f8f7309b459f43aceb86 -->
<!-- 지도 및 테이블 데이타 갱신 관련 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bf6fd53fddf7f8f7309b459f43aceb86&libraries=services"></script>
<script type="text/javascript">
// 지도 보이기
$(function() {
	
	displayMap("lotto");
	function displayMap(selectedId) {
		var id = selectedId || "lotto";
		var map = makeMap();
		
		$.ajax({
			type:"GET",
			url:"store.do?id=" + id,
			dataType:"json",
			success:function(data){
				console.log(data);
				$("tbody").empty();	
				$("#id a").addClass("active");
				// 테이블에 입력값 넣기
				$.each(data, function(index, item) {
					$("tbody").append("<tr><td>"+item.name+"</td><td>"+item.address+"</td><td>"+item.phone+"</td></tr>")
					
					$.ajax({
						url:"json/geo.do",
						data:{address:item.address},
						dataType:"json",
						success: function(geo) {
							
							addMarker(map, item, geo.lat, geo.lng)

						}
					});	
				})
			}
		}); 
	}
	
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
	
	function makeMap() {
		$("#map").empty();
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합
		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(new daum.maps.LatLng(37.5520169,126.9917114));
		
		return map;
	}
	
	function addMarker(map, store, lat, lng) {
		
		var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: new daum.maps.LatLng(lat, lng), // 마커를 표시할 위치
	        title : store.name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	    });
		
        daum.maps.event.addListener(marker, 'click', function() {
        	// 지점번호
        	var no = store.no;
        	$.ajax({
        		type:"GET",
        		url:"branchdetail.do?no="+no,
        		dataType:"json",
        		success: function(detail) {
        			
        			$("#panelTab").empty();
        			$("#panelTab").append(
        				"<table class='w3-table w3-striped w3-bordered w3-border'><tr><th><h3>지점상세안내</h3></th></tr><tr><th>지점명</th></tr><tr><td>"+detail.name+"</td></tr><tr><th>지점전화번호</th></tr><tr><td>"+phoneFomatter(detail.phone)+"</td></tr><tr><th>지점주소</th></tr><tr><td>"+detail.address+"</td></tr></table>"	
        			)
        		}
        	});
        	
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다 marker위에 지점명을 보여주고 싶다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+store.name+'</div>'
        });

        daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
/* 서브메뉴 선택 */	
	$("#store-gubun li").click(function() {
		$(this).siblings().find("span").removeClass("active");
		$(this).find("span").addClass("active");
		displayMap($(this).attr("id"));
		
	}); 
	
	
	function phoneFomatter(num,type){
	    
	    var formatNum = '';
	    
	    if(num.length==11){
	        if(type==0){
	            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
	        }else{
	            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	        }
	    }else if(num.length==8){
	        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
	    }else{
	        if(num.indexOf('02')==0){
	            if(type==0){
	                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
	            }else{
	                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
	            }
	        }else{
	            if(type==0){
	                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
	            }else{
	                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
	            }
	        }
	    }
	    return formatNum;
	    
	}
	
});
</script>
<title>지점 유형별 안내</title>
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
	      <span title="lotto.do">Lotto판매</span>
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
	<ul class="topnav" id="store-gubun">
  		<li id="LOTTO" ><span class="active">Lotto판매점</span></li>
  		<li id="ATM"><span>ATM 설치점</span></li>
  		<li id="PARCELSERVICE"><span>택배 가능점</span></li>
  		<li id="FRESHFOOD"><span >조리식품판매점</span></li>
  		<!-- <li class="right"><a href="#about">About</a></li> -->
	</ul>
	

<!-- sub메뉴 하단 표시부 -->
	<div  class="w3-container w3-padding-0 w3-margin-0" style="height:100%;">
		<!-- 판매점 리스트 -->
		<div id="panelTab" class="w3-half" style="height:100%;overflow:auto;">
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
		<div id="mapContainer" class="w3-container w3-half w3-padding-0" style="height:540px">
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
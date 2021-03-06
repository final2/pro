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
	<!-- cfdcd22439144d2fe4a21b6375bed0fa -->
	<!-- a7c0dab8230936242d3ea7be3a24efc5 boram -->
<!-- 지도 및 테이블 데이타 갱신 관련 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a7c0dab8230936242d3ea7be3a24efc5&libraries=services"></script>
<script type="text/javascript">
// 지도 보이기
$(function() {
	$("#store-gubun li").click(function(event) {
		event.preventDefault();
		
		var id = $(this).attr("id");
		
		return "website/searchtype.do?type="+id;
		
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
<div id="mainview" >
	<div id="header" class="w3-display-container">
		<%@ include file="navbar.jsp" %>
	</div>

	<div id="content">
		<!-- sub메뉴 -->
		<div class="w3-container w3-padding-0 " >
			<ul class="topnav" id="store-gubun">
		  		<li id="LOTTO"><span class="active">Lotto판매점</span></li>
		  		<li id="ATM"><span>ATM 설치점</span></li>
		  		<li id="PARCELSERVICE"><span>택배 가능점</span></li>
		  		<li id="FRESHFOOD"><span >조리식품판매점</span></li>
		  		<!-- <li class="right"><a href="#about">About</a></li> -->
			</ul>
		</div>	
	
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
				
		<div class="row text-center">
			<ul class="pagination">

  			</ul>
		</div>
	</div>
		<!-- footer -->
	<div id="footer">
		<%@ include file="footer.jsp" %>	
	</div>
</div>

</body>
</html>
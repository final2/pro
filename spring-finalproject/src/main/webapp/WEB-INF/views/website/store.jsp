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
$(function() {
	$("a[href*='searchBranch.do']").addClass("active");
	
	/* 서브메뉴 선택 */	
	$("#store-gubun li").click(function() {
		$(this).siblings().find("span").removeClass("active");
		$(this).find("span").addClass("active");
		displayMap($(this).attr("id"));
	}); 
	
	// 외부에서 링크로 페이지 들어올때 타입을 확인해서 표현하기 위해 사용
	$("#"+'${param.type}').trigger('click');
	
	// 선택된 유형에 따라 정보 불러오기
	function displayMap(selectedId) {
		var id = selectedId || "LOTTO";
		
		$.ajax({
			type:"GET",
			url:"store.do?id=" + id,
			dataType:"json",
			success:function(data){
				$("tbody").empty();	
				$("#id a").addClass("active");
				$(".pagination").empty();
				
				/* 페이지네이션 구현을 구해 준비 */
				var totalRows= Object.keys(data).length;
				var rows=7;
				var totalPages = parseInt(totalRows/rows)+1;
				var pages= 5;
				var pageNo=1;
				var beginIndex=(pageNo-1)*rows +1;
				var endIndex = pageNo*rows;
				var totalBlocks= parseInt(totalPages/pages);
			//	var beginPage = (block-1)*pages + 1;
			//	var endPage = block * pages;

				/* 페이지네이션 구현 */
					
					for(var i=1 ; i<= totalPages; i++){
						
						$(".pagination").append("<li><a>"+i+"</a></li>");
						
					}
					$(".pagination li:first").addClass("active");
				var map = makeMap();
				for( beginIndex-1 ; beginIndex<=endIndex ; beginIndex++){
					$("tbody").append("<tr><td>"+data[beginIndex].name+"</td><td>"+data[beginIndex].address+"</td><td>"+data[beginIndex].phone+"</td></tr>");
					(function(j) {
						$.ajax({
							url:"json/geo.do",
							data:{address:data[j].address},
							dataType:"json",
							success: function(geo) {
								addMarker(map, data[j], geo.lat, geo.lng)
							}
						});	
					})(beginIndex)
				}
				
				$(".pagination").on('click','a',function() {
					$("tbody").empty();	
					$(".pagination").find("li").removeClass("active");
					$(this).parent("li").addClass("active");
					pageNo = $(this).text();
					
					console.log(pageNo);
					
					rebeginIndex=rows*(pageNo-1)-1;
					endIndex=rebeginIndex+rows;
					var map = makeMap();
					for( beginIndex ; rebeginIndex < endIndex ; rebeginIndex++){
						$("tbody").append("<tr><td>"+data[rebeginIndex].name+"</td><td>"+data[rebeginIndex].address+"</td><td>"+data[rebeginIndex].phone+"</td></tr>");
						(function(k) {
							
							$.ajax({
								url:"json/geo.do",
								data:{address:data[k].address},
								dataType:"json",
								success: function(geo) {
									//var map = makeMap();
									addMarker(map, data[k], geo.lat, geo.lng);
								}
							});	
						})(rebeginIndex)
					}
				});
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
	        title : store, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	    });
		// 마커를 클릭했을때 
        daum.maps.event.addListener(marker, 'click', function() {
        	// 지점번호
        	var no = store.no;
        	$.ajax({
        		type:"GET",
        		url:"branchdetail.do?no="+no,
        		dataType:"json",
        		success: function(detail) {
        			
        			var detailContent ="";
        			detailContent = "<table class='w3-table w3-striped w3-bordered w3-border'>";
        			detailContent += "<tr><th class='background-color:#fff'><h3>지점상세안내</h3></th></tr>";
        			detailContent += "</tr><tr><th>지점명</th></tr>";
        			detailContent += "<tr><td><span style='font-size:130%;'>"+detail.name+"</span></td></tr>";
        			detailContent += "<tr><th>지점전화번호</th></tr>";
        			detailContent += "<tr><td>"+phoneFomatter(detail.phone)+"</td></tr>";
        			detailContent += "<tr><th>지점주소</th></tr>";
        			detailContent += "<tr><td>"+detail.address+"</td></tr></table>";
        			
        			
        			
        			
        			$("#panelTab").empty();
        			$("#panelTab").append(detailContent);
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
		<!-- 메뉴 하단부 시작  양옆 패딩값은 0으로 하고 위아래약간의 마진을 두었다-->	
		<!-- sub메뉴 -->
		<div class="w3-container w3-padding-0   " >
			<ul class="topnav" id="store-gubun">
		  		<li id="LOTTO" ><span class="active">Lotto판매점</span></li>
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
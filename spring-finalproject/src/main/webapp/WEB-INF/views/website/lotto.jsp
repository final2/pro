<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cfdcd22439144d2fe4a21b6375bed0fa&libraries=services"></script>
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script type="text/javascript">
// 지도 보이기
$(function() {
	
	$.ajax({
		type:"GET",
		url:"lotto2.do",
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
<title>택배가능지점 안내</title>
</head>
<body>
<div class="container" style="w3-center">
	<div class="w3-display-container" style="max-width:1080px;">
	<%@ include file="navbar.jsp" %>
	
		<div class="w3-container w3-margin-bottom w3-margin-top" >
			<div class="w3-container w3-teal">
	  		<h1>택배서비스</h1>
			</div>
			
			<div class="w3-margin-bottom w3-margin-top" id="leftside">
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
						<!-- 지점 리스트 나오는곳 -->
					</tbody>
				</table>	
			</div>
			<!-- 지도표시하기 -->
			<div class="w3-container w3-half" style="height:540px">
				<div id="map" style="width:100%;height:100%;"></div>
			</div>
			</div>
		</div>
		<!-- Footer -->
		<%@ include file="footer.jsp" %>
	
	</div>
</div>
</body>
</html>
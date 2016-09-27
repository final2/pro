<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>지도표시</title>

<meta charset="utf-8">

<script class="hidden" type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cfdcd22439144d2fe4a21b6375bed0fa"></script>
  </head>
  <body>
  	<div id="map" style="min-height:450px;">
  	<script>
		var mapContainer = document.getElementById('map');
		var mapOptions = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(mapContainer, mapOptions);
		
		var positions = [
		                 {
		                     title: '카카오', 
		                     latlng: new daum.maps.LatLng(33.450705, 126.570677)
		                 },
		                 {
		                     title: '생태연못', 
		                     latlng: new daum.maps.LatLng(33.450936, 126.569477)
		                 },
		                 {
		                     title: '텃밭', 
		                     latlng: new daum.maps.LatLng(33.450879, 126.569940)
		                 },
		                 {
		                     title: '근린공원',
		                     latlng: new daum.maps.LatLng(33.451393, 126.570738)
		                 }
		             ];
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new daum.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
	</script>	
  	</div>
  </body>
</html>
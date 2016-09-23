<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="resources/jquery/jquery.js"></script>
    <style type="text/css">
      html, body { height: 100%; margin: 0; padding: 0; }
      #map { height: 100%; }
    </style>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsDTlcI5XqzK67fSOu37B4wl-U8RzoJy4&sensor=true"></script>
  </head>
  <body onload="initialize()">

    <script>		
		function initialize() {
		    var mapOptions = {
          		center: new google.maps.LatLng(37.572914,126.992209), //좌표
          		zoom: 17, //확대정도
          		mapTypeId: google.maps.MapTypeId.ROADMAP //기본지도사용(위성지도및 기타지도도있음~)
        	};
        	var map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions);
        	
        	var marker = new google.maps.Marker({
        	    position: mapOptions,
        	    map: map,
        	    title: 'BigStore!'
        	  });
      		}
		
	</script>
    
	<div id="map_canvas" style="width:430px;height:540px;"></div>
  </body>
</html>



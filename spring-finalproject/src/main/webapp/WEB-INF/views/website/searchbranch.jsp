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
	nav li {
	    float: left;
	}
	
	nav li span {
	    display: block;
	    color: white;
	    text-align: center;
	    padding: 14px 16px;
	    text-decoration: none;
	}
	
	nav li span:hover:not(.active) {
	    background-color: #111;
	}
	
	.active {
	    background-color: #4CAF50;
}
	
</style>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a7c0dab8230936242d3ea7be3a24efc5&libraries=services"></script>
<script type="text/javascript">
$(function() {
	
	// 현재 화면의 위치 네이바에 표시
	$("a[href*='searchbranch.do']").addClass("active");
	
	// 검색 버튼을 눌럴ㅆ을때 이벤트
	$("button").click(function(event) {
		event.preventDefault();
		
		$(":input[name='pno']").val(1);		
		$("#searchform").submit()
		
		return false;
	});
	
	// 페이지네이션 구현
	$("ul.pagination a:not([aria-label])").on("click", function() {
		$(":input[name='pno']").val($(this).text());
		
		$("#searchform").submit();
		return false;
	});
	
	$("ul.pagination a[aria-label]").on("click", function() {
		var currentPno = $(":input[name='pno']").val();
		
		if ($(this).attr("aria-label") == "Previous") {
			$(":input[name='pno']").val(currentPno - 1);
		} else if ($(this).attr("aria-label") == "Next") {
			$(":input[name='pno']").val(parseInt(currentPno) + 1);
		}
		
		$("#searchform").submit();
		return false;
	});
	
	
	// 테이블의 지점 선택시 지도에 위치 표시
	$("tbody").on('click','tr',function(){
		
		if (!$("#map").hasClass("map-box")) {
			$("#map").addClass("map-box");
		}
		
		var a=$(this).find("td:nth-child(2)").text();
		var b=$(this).find("td:nth-child(1)").text();
		console.log(a);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addr2coord(a, function(status, result) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+b+'</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
	
	
	});

});
</script>
<style type="text/css">
	.map-box {
		width: 100%;
		height: 350px;
	}
</style>
<title>지점찾기</title>
</head>
<body>
<div id="mainview" >
	<div id="header" class="w3-display-container">
		<%@ include file="navbar.jsp" %>
	</div>

	<div id="content">

	
	<!-- sub메뉴 하단 표시부 -->
		<div  class="w3-container w3-padding-0 w3-margin-0" style="height:100%;">
			<!-- 판매점 리스트 -->
			<div id="panelTab" style="height:100%;overflow:auto;">
				<table class="w3-table w3-bordered w3-border table-hover" >
					<thead class="well">
						<tr>
						  <th class="w3-center" rowspan="2" align="center">판매점명</th>
						  <th class="w3-center" rowspan="2" align="center">주소</th>
						  <th class="w3-center" rowspan="2" align="center">전화번호</th>
						  <th class="w3-center" colspan="4">편의정보</th>
						 </tr>
						 <tr>
						  <th class="w3-center">Lotto</th>
						  <th class="w3-center">ATM</th>
						  <th class="w3-center">택배서비스</th>
						  <th class="w3-center">직접조리식품</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty branches }">
						<tr>
							<td colspan="7" class="w3-center">
								<strong>검색 결과가 존재하지 않습니다. 다시 검색해 주세요.</strong>
							</td>
						</tr>
					</c:if>
					<c:forEach var="branch" items="${branches }">
						<tr value="${branch.no }">
							<td>${branch.name }</td>
							<td>${branch.address }</td>
							<td>${branch.phone }</td>
							<td class="w3-center">${branch.lotto }</td>
							<td class="w3-center">${branch.atm }</td>
							<td class="w3-center">${branch.parcelService }</td>
							<td class="w3-center">${branch.freshFood }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>	
			<div id="map" class="" >
			</div>
		</div>
				
		<div class="row text-center w3-padding-top">
			<form id="searchform" class="form-inline" method="get" action="searchbranch.do">
				<input type="hidden" name="pno" value="${navi.pageNo }" />
				<div class="form-group">
					<label class="sr-only" for="opt"></label>
					<select class="form-control" name="opt" id="opt">
						<option value="name"  ${param.opt eq 'name'? 'selected=selected' : ''}> 지점명</option>
						<option value="address" ${param.opt eq 'address'? 'selected=selected' : ''}> 주소</option>
					</select>
				</div>
				<div class="form-group">
					<label class="sr-only" for="keyword"></label>
					<input type="text" class="form-control" name="keyword" id="keyword" value="${param.keyword }" >
				</div>
				<button class="btn  btn-primary">조회</button>
			</form>
		</div>
		
				<div class="row text-center">
			<ul class="pagination">
			<c:if test="${navi.pageNo gt 1 }">
    			<li>
      				<a href="list.do?pno=${navi.pageNo - 1 }" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
      				</a>
    			</li>
    		</c:if>
    		<c:forEach var="num" begin="${navi.beginPage }" end="${navi.endPage }">
    			<c:choose>
    				<c:when test="${navi.pageNo eq num }">
    					<li class="active"><a href="list.do?pno=${num }">${num }</a></li>
    				</c:when>
    				<c:otherwise>
					    <li><a href="list.do?pno=${num }">${num }</a></li>
    				</c:otherwise>
    			</c:choose>
    		</c:forEach>
    		<c:if test="${navi.pageNo lt navi.totalPages}">
    			<li>
      				<a href="list.do?pno=${navi.pageNo + 1 }" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
      				</a>
    			</li>
    		</c:if>
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
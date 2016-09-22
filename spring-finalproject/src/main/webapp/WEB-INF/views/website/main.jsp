<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Welcome BigStore</title>
</head>
<body id="mypage">

<div class="w3-container">
	<div class="w3-display-container" style="max-width:1080px;">
	<%@ include file="navbar.jsp" %>
	
	<div class="w3-row" ><!-- 왼쪽 200px와 나머지로 나눠 화면 구성 -->
	
	<!-- 좌측 메뉴바 -->
	<!-- 메뉴쪽-->
	    <div class="w3-col" style="width:200px;min-height:300px;max-height:600px;">
	         <nav class="w3-sidenav w3-teal w3-card-2 w3-xlarge" id="leftMenu" style="width:200px;height:300px;position:static!important">
	              <a href="oneplus.jsp" style="margin-top:10px;">1+1상품</a>
	              <a href="twoplus.jsp" style="margin-top:10px;">2+1상품</a>
	              <a href="event.jsp" style="margin-top:10px;">덤증정상품</a>
	              <a href="event.jsp" style="margin-top:10px;">선물추첨상품</a>
	         </nav>
	    </div>
	<!-- 좌측메뉴바 끝-->
	
	<!-- 상단메뉴아래 사이드 메뉴와 제품 이미지 나열예정 jsp로 분리예정 -->
	    <div class="w3-rest">
	        <div class="w3-display-container  w3-padding-64 w3-center" style="width:100%;min-height:300px;max-height:600px;">
	
	          <div class="w3-quarter">
	              <img src="resources/image/ohgamja.jpg" alt="감자깡" style="width:45%" class="w3-circle w3-hover-opacity">
	              <h3><!--상품명-->감자깡</h3>
	              <p><!--상품명가격-->1,500원</p>
	           </div>
	           <div class="w3-quarter">
	              <img src="resources/image/drinkyo.jpg" alt="감자깡" style="width:45%" class="w3-circle w3-hover-opacity">
	              <h3><!--상품명-->감자깡</h3>
	              <p><!--상품명가격-->1,500원</p>
	            </div>
	           <div class="w3-quarter">
	              <img src="resources/image/mccol.jpg"" alt="감자깡" style="width:45%" class="w3-circle w3-hover-opacity">
	              <h3><!--상품명-->감자깡</h3>
	              <p><!--상품명가격-->1,500원</p>
	            </div>
	            <div class="w3-quarter">
	              <img src="resources/image/came.jpg" alt="감자깡" style="width:45%;" class="w3-circle w3-hover-opacity">
	              <h3><!--상품명-->감자깡</h3>
	              <p><!--상품명가격-->1,500원</p>
	            </div>
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
		       <li class="w3-padding-16"><input class="w3-input w3-border w3-round-large" type="text" /></li><li><button class="w3-btn w3-teal w3-padding-large"><i class="fa fa-check"></i> 검색</button></li>
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

</body>
</html>
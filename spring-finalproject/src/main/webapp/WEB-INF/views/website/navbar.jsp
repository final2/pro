<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/website/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

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
      <a href="delivery.do">택배서비스</a>
      <a href="makefood.do">직접조리식품</a>
    </div>
      </li>
      <li class="w3-dropdown-hover">
        <a href="#" title="Notifications">상품안내 <i class="fa fa-caret-down"></i></a>
        <div class="w3-dropdown-content w3-light-grey w3-card-4">
          <a href="oneplus.do?no=1">1+1상품</a>
          <a href="twoplus.do">2+1상품</a>
          <a href="event.do">덤증정상품</a>
          <a href="event.do">선물추첨상품</a>
        </div>
      </li>
  </ul>
</div>
</nav>
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
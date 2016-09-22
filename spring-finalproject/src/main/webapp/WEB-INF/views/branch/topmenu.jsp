<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function printTime() {
    var clock = document.getElementById("clock");
    var now = new Date();
   
    clock.innerHTML = now.getFullYear() +
     "/"+(now.getMonth()+1)+"/"+now.getDate()+" "+now.getHours()+":"
     +now.getMinutes()+":"+now.getSeconds();
   
    // setTimeout함수를 통해 원하는 함수를 1초간격으로 출력해줌
    setTimeout("printTime()", 1000);
}

window.onload = printTime;
</script>

<nav class="navbar-branch">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#"><img src="resources/image/logo1.png" /></a>
	    </div>
	    
	    <div class="navbar-time">
	    	<span id="clock"></span>
	    	<p>홍길동</p>
	    </div>
	    
	    <ul class="nav navbar-nav pull-right">
	      <li class="${current_page eq 'branchsales' ? 'active' : '' }"><a href="branchsales.do">판매</a></li>
	      <li class="${current_page eq 'branchinven' ? 'active' : '' }"><a href="branchinven.do">재고</a></li>
	      <li><a href="#">행사물품</a></li>
	      <li><a href="#">결산</a></li>
	      <li class="${current_page eq 'branchorder' ? 'active' : '' }"><a href="branchorder.do">발주</a></li>
	      <li><a href="#">사용자등록</a></li>
	      <li><a href="#">로그아웃</a></li>
	    </ul>
	  </div>
	</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	      <a class="navbar-brand" href="branchsales.do"><img src="../resources/image/logo1.png" /></a>
	    </div>
	    
	    <div class="navbar-time">
	    	<span id="clock"></span>
	    	<p><sec:authentication property="principal.brEmp.name" /></p>
	    </div>
	    
	    <ul class="nav navbar-nav pull-right">
	      <li class="${current_page eq 'branchsales' ? 'active' : '' }"><a href="branchsales.do">판매</a></li>
	      <li class="${current_page eq 'branchwait' ? 'active' : '' }"><a href="branchwait.do">보류</a></li>
	      <li class="${current_page eq 'branchinven' ? 'active' : '' }"><a href="branchinven.do">재고</a></li>
	      <li class="${current_page eq 'branchevnet' ? 'active' : '' }"><a href="branchevent.do">행사물품</a></li>
	      <sec:authorize access="hasRole('MANAGER')">
	      <li class="${current_page eq 'branchaccount' ? 'active' : '' }"><a href="branchaccount.do">결산</a></li>
	      <li class="${current_page eq 'branchorder' ? 'active' : '' }"><a href="branchorder.do">발주</a></li>
	      <li class="${current_page eq 'branchaddemp' ? 'active' : '' }"><a href="branchaddemp.do">사용자등록</a></li>
	      </sec:authorize>
	      <li><a href="../branch/branchlogout.do">로그아웃</a></li>
	    </ul>
	  </div>
	</nav>
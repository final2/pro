<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Bootstrap Core JavaScript -->
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	#imgdiv {margin-top:10px; margin-bottom:20px;}
	.emp {color: white}
</style>

<!-- Sidebar -->

<div id="sidebar-wrapper">
    <ul class="sidebar-nav">
    	<li>
    		<div id="imgdiv">
    			<a href="notice.do">
    				<img alt="logo" src="resources/image/logo2.png" width="180px"/>
    			</a>
    		</div>
    	</li>
    	<li>
     		<div class="row" style="width:250px">
     			<div class="col-sm-5">
		      		<img id="myImg" width="80px" height="120px"
		      			src="/FinalProject/resources/image/empimg/${LoginUser.photo }" />
     			</div>
	     		<div class="col-sm-6">
		     			<div style="height:30px; font-size:10px" class="emp">소속 부서</div>
		     			<c:if test="${LoginUser.dept eq 'Master' }">
			     			<div style="height:30px; font-size:15px" class="emp">Master</div>		     				
		     			</c:if>
		     			<c:if test="${LoginUser.dept eq 'HR' }">
			     			<div style="height:30px; font-size:15px" class="emp">인사과</div>		     				
		     			</c:if>
		     			<c:if test="${LoginUser.dept eq 'management' }">
			     			<div style="height:30px; font-size:15px" class="emp">영업과</div>		     				
		     			</c:if>
		     			<c:if test="${LoginUser.dept eq 'PM' }">
			     			<div style="height:30px; font-size:15px" class="emp">물류과</div>		     				
		     			</c:if>
	    	 			<div style="height:30px; font-size:10px; " class="emp">이름</div>
	    	 			<div style="height:30px; font-size:15px" class="emp">${LoginUser.name }</div>	  
     			</div>
     		</div>
    	</li>
    	<li class="list">
    		<a>마이페이지 <span class="caret"></span></a>
    		<ul class="bar">
    			<li><a href="myprofile.do" >내정보</a></li>
    			<li><a href="mycompsalary.do?pno=1" >급여 대장</a></li>
    			<li><a href="mycompattendance.do" >근태 관리</a></li>
    		</ul>
    	</li>
    	<li>
    		<div>
	      		<a href="" data-toggle="modal" data-target="#messenger">메신저</a>
	      		<a href="company/logout.do">로그아웃</a>	
     		</div>
    	</li>
       <hr />
       <li class="list">
       		<a>물류 <span class="caret"></span></a>
       		<ul class="bar">
       			<li>
       				<a>물품 관리 <span class="caret"></span></a>
       				<ul class="in-bar">
       					<li><a href="productList.do?pn=1">물품 리스트</a></li>
       					<c:if test="${LoginUser.dept eq 'PM'  or LoginUser.dept eq 'Master' }">
	       					<li><a href="product.do">물품 등록</a></li>
       					</c:if>
       				</ul>	
       			</li>
       			<c:if test="${LoginUser.dept eq 'PM' or LoginUser.dept eq 'Master' }">
	       			<li><a href="hqOrder.do">출고 관리</a></li>
	       			<li><a href="invenList.do">재고 관리</a></li>
	       			<li><a href="clientList.do">거래처 관리 </a></li>
       			</c:if>
       		</ul>   		
       </li>
       <li class="list">
       		<a >인사 <span class="caret"></span></a>
       		<ul class="bar">
       			<li><a href="emplist.do?pno=1" >사원 조회</a></li>
       			<c:if test="${LoginUser.dept eq 'HR' or LoginUser.dept eq 'Master' }">
       				<li><a href="insertemp.do" >사원 등록</a></li>
       			</c:if>
	       			<c:url var="boardListURL" value="boardList.do">
						<c:param name="pn" value="1" />
					</c:url>
       			<li><a href="${boardListURL }" >공지 사항</a></li>
       			<li><a href="calendar.do" >회사 일정</a></li>
       			<li>
       				<a>지점 관리<span class="caret"></span></a>
       				<ul class="in-bar">
       					<li><a href="compbranchlist.do?pno=1" class="">지점 조회</a></li>
       					<c:if test="${LoginUser.dept eq 'HR' or LoginUser.dept eq 'Master' }">
	       					<li><a href="insertbranch.do" class="">지점 등록</a></li>
       					</c:if>
       				</ul>
       			</li>
       		</ul>			
       </li>
       <li class="list">
      		<c:if test="${LoginUser.dept eq 'HR' or LoginUser.dept eq 'Master' }">
	       		<a>급여 <span class="caret"></span></a>
	       		<ul class="bar">
	       			<li><a href="compsalary.do?pno=1" >급여 대장</a></li>
	       			<li><a href="insertsalary.do" >급여 지급</a></li>
	       			<li><a href="compattendance.do?pno=1" >근태 관리</a></li>
	       		</ul>		
      		</c:if>
       </li>
       <li>
       		<a href="chart.do">통계</a>		
       </li>
    </ul>
</div>
<script type="text/javascript">
$(function() {
	
	$("ul.bar").hide();
	$("ul.in-bar").hide();
	$(".sidebar-nav li.list > a").click(function() {
		$(this).parent().find("ul.bar").first().animate({
			height: 'toggle'
		});
		var active = $(this).attr('class');
		if(active == 'active') {
			$(this).removeAttr('class');			
		} else {
			$(this).attr('class', 'active');
		}
		
	});
	$(".sidebar-nav li.list ul.bar a").click(function() {
		$(this).parent().find("ul.in-bar").first().animate({
			height: 'toggle'
		});
		var active = $(this).attr('class');
		if(active == 'active') {
			$(this).removeAttr('class');			
		} else {
			$(this).attr('class', 'active');
		}
	});
	
	$("#menu-toggle").click(function(e) {
	    e.preventDefault();
	    $("#wrapper").toggleClass("toggled");
	});

});
</script>

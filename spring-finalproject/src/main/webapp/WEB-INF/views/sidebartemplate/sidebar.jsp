<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	#imgdiv {margin-top:10px; margin-bottom:10px;}
</style>

<!-- Sidebar -->

<div id="sidebar-wrapper">
    <ul class="sidebar-nav">
    	<li>
    		<div id="imgdiv">
    			<a href="notice.do">
    				<img alt="logo" src="resources/image/logo2.png" width="200px" height="150px"/>
    			</a>
    		</div>
    	</li>
    	<li>
	      		<a href="">로그인</a>
	     	<div id="login">
	      		<p>로그인 시 이미지</p>
	      		<a href="">내정보</a>
	      		<a href="">로그아웃</a>	
      		</div>	
    	</li>
       <hr />
       <li class="list">
       		<a>물류 <span class="caret"></span></a>
       		<ul class="bar">
       			<li>
       				<a>물품 관리 <span class="caret"></span></a>
       				<ul class="in-bar">
       					<li><a href="">물품 리스트</a></li>
       					<li><a href="">물품 등록</a></li>
       				</ul>	
       			</li>
       			<li><a href="">출고 관리</a></li>
       			<li>
       				<a>거래처 관리 <span class="caret"></span></a>
       				<ul class="in-bar">
       					<li><a href="">거래처  조회</a></li>
       					<li><a href="">거래처 등록</a></li>
       				</ul>
       			</li>
       		</ul>   		
       </li>
       <li class="list">
       		<a >인사 <span class="caret"></span></a>
       		<ul class="bar">
       			<li><a href="">사원 조회</a></li>
       			<li><a href="">사원 등록</a></li>
       			<li><a href="notice.do">공지 사항</a></li>
       			<li><a href="">회사 일정</a></li>
       			<li>
       				<a>지점 관리<span class="caret"></span></a>
       				<ul class="in-bar">
       					<li><a href="">지점 조회</a></li>
       					<li><a href="">지점 등록</a></li>
       				</ul>
       			</li>
       		</ul>			
       </li>
       <li class="list">
       		<a>급여 <span class="caret"></span></a>
       		<ul class="bar">
       			<li><a href="">급여 대장</a></li>
       			<li><a href="">급여 지급</a></li>
       		</ul>		
       </li>
       <li>
       		<a href="">게시판</a>		
       </li>
    </ul>
    <div class="sidebar-nav-btn"></div>
</div>
<script type="text/javascript">
$(function() {
	
	$("ul.bar").hide();
	$("ul.in-bar").hide();
	$(".sidebar-nav li.list > a").click(function() {
		console.log($(this).parent().find(".ul.bar").first());
		$(this).parent().find("ul.bar").first().animate({
			height: 'toggle'
		});
	});
	$(".sidebar-nav li.list ul.bar a").click(function() {
		$(this).parent().find("ul.in-bar").first().animate({
			height: 'toggle'
		});
	});
	
	$("#menu-toggle").click(function(e) {
	    e.preventDefault();
	    $("#wrapper").toggleClass("toggled");
	});

});
</script>

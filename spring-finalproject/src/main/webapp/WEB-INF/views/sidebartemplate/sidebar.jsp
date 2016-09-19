<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	
	$("ul.bar").hide();
	$(".sidebar-nav li.list").click(function() {
		$(this).find("ul.bar").first().animate({
			height: 'toggle'
		})
	}) 
})
</script>
<style type="text/css">
#imgdiv {margin-top:10px; margin-bottom:10px;}
</style>
</head>
<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
            	<li>
            		<div id="imgdiv">
            			<img alt="logo" src="resources/image/logo1.png" width="200px" height="150px"/>
            		</div>
            	</li>
            	<li>
        	     	<div>
    	         		<a href="">로그인</a>
    	         		<p>로그인 시 이미지</p>
    	         		<a href="">내정보</a>
    	         		<a href="">로그아웃</a>	
	             	</div>	
            	</li>
               <hr />
               <li class="list">
               		<a>물류</a>
               		<ul class="bar">
               			<li>
               				<a href="">물품 관리</a>
               				<ul class="in-bar">
               					<li><a href="">물품 리스트</a></li>
               					<li><a href="">물품 등록</a></li>
               				</ul>	
               			</li>
               			<li><a href="">출고 관리</a></li>
               			<li>
               				<a href="">지점 관리</a>
               				<ul class="in-bar">
               					<li><a href="">지점 조회</a></li>
               					<li><a href="">지점 등록</a></li>
               				</ul>
               			</li>
               		</ul>   		
               </li>
               <li class="list">
               		<a >인사</a>
               		<ul class="bar">
               			<li><a href="">사원 조회</a></li>
               			<li><a href="">사원 등록</a></li>
               			<li><a href="">공지 사항</a></li>
               			<li><a href="">회사 일정</a></li>
               		</ul>			
               </li>
               <li class="list">
               		<a>급여</a>
               		<ul class="bar">
               			<li><a href="">급여 대장</a></li>
               			<li><a href="">급여 지급</a></li>
               		</ul>		
               </li>
               <li>
               		<a>게시판</a>		
               </li>
            </ul>
        </div>
		<!-- /#sidebar-wrapper -->

     	<!--   Page Content -->
        <div id="page-content-wrapper">
        </div>
		<!-- /#page-content-wrapper -->


    </div>
</body>
</html>
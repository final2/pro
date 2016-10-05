<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="current_page" value="branchevnet" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/branch.css">
<script type="text/javascript" src="../resources/jquery/jquery.js" ></script>
<script type="text/javascript" src="../resources/jquery/money.js" ></script>
<script type="text/javascript">
$(function() {
	// 이벤트 탭메뉴
	$("#event-tabmenu li:first").addClass("active").trigger("click");
	
	$("#event-tab-1").siblings().hide();

	$("#event-tabmenu").on("click", "li", function() {
		$(this).addClass("active").siblings().removeClass("active");
		var i = $(this).index() + 1;
		$("#event-tab-"+i).siblings().hide();
		$("#event-tab-"+i).show();
	});
	
	// 1+1
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/event/1",
		dataType:"json",
		success:function(result) {
			$.each(result, function(idex, item) {
				var $tab1 = $("#event-tab-1");
				$tab1.append("<li><p class='event-flag1'><span>1+1</span></p>"
						+"<p class='event-img'><img src='"+item.image+"' /></p>"
						+"<p class='event-name'>"+item.name+"</p>"
						+"<p class='event-price'>"+formatNumber(item.price)+" 원</p></li>");
			});
		}
	});
	
	// 2+1
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/event/2",
		dataType:"json",
		success:function(result) {
			$.each(result, function(idex, item) {
				var $tab2 = $("#event-tab-2");
				$tab2.append("<li><p class='event-flag2'><span>2+1</span></p>"
						+"<p class='event-img'><img src='"+item.image+"' /></p>"
						+"<p class='event-name'>"+item.name+"</p>"
						+"<p class='event-price'>"+formatNumber(item.price)+" 원</p></li>");
			});
		}
	});
	
	// 전체
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/event/",
		dataType:"json",
		success:function(result) {
			$.each(result, function(idex, item) {
				var $tab3 = $("#event-tab-3");
				if (item.event.no == 1) {
					$tab3.append("<li><p class='event-flag1'><span>1+1</span></p>"
							+"<p class='event-img'><img src='"+item.image+"' /></p>"
							+"<p class='event-name'>"+item.name+"</p>"
							+"<p class='event-price'>"+formatNumber(item.price)+" 원</p></li>");
				} else {
					$tab3.append("<li><p class='event-flag2'><span>2+1</span></p>"
							+"<p class='event-img'><img src='"+item.image+"' /></p>"
							+"<p class='event-name'>"+item.name+"</p>"
							+"<p class='event-price'>"+formatNumber(item.price)+" 원</p></li>");
				}
				
			});
		}
	});
})
</script>
<title>지점 - 행사상품</title>
</head>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="brno" property="principal.brEmp.branch.no"/>
	<sec:authentication var="empno" property="principal.brEmp.no"/>
</sec:authorize>
<body id="emp-${empno }">
<div class="wrapper container" id="brno-${brno }">
	<div class="row">
		<div class="col-sm-12">
			<%@ include file="topmenu.jsp" %>
		</div>
	</div>
	
	<div class="row event-con">
		<div class="col-sm-12">
			<ul id="event-tabmenu">
				<li>1 + 1</li>
				<li>2 + 1</li>
				<li>전체보기</li> 
			</ul>
			
			<div class="tab-con">
				<ul id="event-tab-1">
				
				</ul>
				
				<ul id="event-tab-2">
				
				</ul>
				
				<ul id="event-tab-3">
				
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>
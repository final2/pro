<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style>
	.panel-body {
		opacity: 0.8;
	}
</style>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script src="//www.google.com/jsapi"></script>
<script type="text/javascript">
$(function() {
	
	
	$(".panel-body:not(:has('#datatable'))").hover(function() {
		$(this).css('background-color', '#EBFBFF');
	}, function() {
		$(this).css('background-color', '#ffffff');
	});
	
	function addZeros(num, digit) { 
		  var zero = '';
		  num = num.toString();
		  if (num.length < digit) {
		    for (i = 0; i < digit - num.length; i++) {
		      zero += '0';
		    }
		  }
		  return zero + num;
	}
	
	setInterval(function() {
		var currentDate = new Date();                                     
	    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() 
	    var amPm = 'AM'; 
	    var currentHours = addZeros(currentDate.getHours(),2); 
	    var currentMinute = addZeros(currentDate.getMinutes() ,2);
	    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	    
	    if(currentHours >= 12){ 
	    	amPm = 'PM';
	    	currentHours = addZeros(currentHours - 12,2);
	    }
		
	    var html = "<p style='font-size:40px; line-height:0.5;'>"+calendar+"</p>";
	    html += "<h3 style='line-height:0.5;'><span class='label label-default'>"+currentHours+":"+currentMinute+":"+currentSeconds+"</span></h3>"
	    $("#clock-box").html(html);		
	}, 1000);
});
</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3">
				<div class="panel panel-primary">
					<div class="panel-body">
						<div id="clock-box" class="text-center" style="margin-top: 40px;"></div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="row">
					<div class="panel panel-primary">
						<div class="panel-body">
							<div class="col-sm-3 sub-left">
							</div>
							<div class="col-sm-9 sub-right" style="text-align: center">
								<h1>BigStore Statistics</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5">
				<div class="row">
					<div class="col-sm-5" >
	     			   <%@ include file="salesyear.jsp" %>
					</div>
					<div class="col-sm-7">
						<div class="row" >
							<div class="col-sm-12">
			     			   <%@ include file="salesBr.jsp" %>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12" >
			     			   <%@ include file="salesPr.jsp" %>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-6">
			     	   <%@ include file="monthSales.jsp" %>
					</div>
					<div class="col-sm-6">
					   <%@ include file="salesDay.jsp" %>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<%@include file="datatable.jsp" %>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<%@ include file="customerage.jsp" %>
			</div>
			<div class="col-sm-3">
				<%@ include file="customergender.jsp" %>
			</div>
			<div class="col-sm-3">
				<%@ include file="getBuyCM.jsp" %>
			</div>
			<div class="col-sm-3">
				<%@ include file="cartegorysalesyear.jsp" %>
			</div>
		</div>
	</div>
</div>
</body>
</html>
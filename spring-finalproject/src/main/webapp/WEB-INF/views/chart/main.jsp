<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
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
	<div class="container">
		
		<div class="row">
			<div class="col-sm-3">
				<div id="clock-box" class="text-center" style="margin-top: 40px;"></div>
			</div>
			<div class="col-sm-9">
				<div class="row">
					<div class="col-sm-3 sub-left">
					</div>
					<div class="col-sm-9 sub-right">
						<span class="glyphicon glyphicon-signal" style="font-size:75px; margin-top:25px; margin-left:50px" ></span>
						<span class="glyphicon glyphicon-calendar" style="font-size:75px; margin-top:25px; margin-left:50px" ></span>
						<span class="glyphicon glyphicon-copyright-mark" style="font-size:75px; margin-top:25px; margin-left:50px" ></span>
						<span class="glyphicon glyphicon-align-left" style="font-size:75px;  margin-top:25px; margin-left:50px" ></span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5">
				<div class="row">
					<div class="col-sm-4 ">
	     			   <%@ include file="salesyear.jsp" %>
					</div>
					<div class="col-sm-8">
						<!-- 
							해당년도 원그래프(지점별 기여도) top 5 (나머지는 etc)

							해당년도 원그래프(품목별 기여도) TOP 5 (나머지는 etc)
						 -->
					</div>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-6">
						<!-- 
							월별 매출 (막대그래프) (상반기or하반기 택1)
						 -->
					</div>
					<div class="col-sm-6">
						<!-- 
							품목별 top5(막대그래프)
						 -->
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-3">
			<!-- 매출 총액 -->
			</div>
			<div class="col-sm-3">
			<!-- 이번년 순이익 -->
			</div>
			<div class="col-sm-3">
			<!-- 이번달 매출액 -->
			</div>
			<div class="col-sm-3">
			<!-- 이번달 순이익 -->
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<!-- 이번달 지점별 top 5(원그래프) -->
			</div>
			<div class="col-sm-3">
				<!-- 이번달 대분류별 매출(원그래프) -->
			</div>
			<div class="col-sm-3">
				<!-- 이번달 품목별 top 5(원그래프)  -->
			</div>
			<div class="col-sm-3">
				<!-- 이번달 거래순위(원그래프) -->
			</div>
		</div>
	</div>
</body>
</html>
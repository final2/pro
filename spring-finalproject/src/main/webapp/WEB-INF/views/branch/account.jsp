<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="current_page" value="branchaccount" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/branch.css">
<link rel="stylesheet" type="text/css" href="../resources/css/buttons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/jquery/jquery.js" ></script>
<script type="text/javascript" src="../resources/jquery/money.js" ></script>
<script type="text/javascript">
$(function() {
	var brno = $(".container").attr("id").replace("brno-", "");
	
	var today = new Date();
	var realToday = getTitleDay(today);
	today = getTitleDay(today);
	
	function getTitleDay(Date) {
		var todayYear = Date.getFullYear();
		var todayMonth = getTwo(Date.getMonth()+1);
		var todayDate = getTwo(Date.getDate());
		
		var newToday = todayYear + "-" + todayMonth + "-" + todayDate;
		return newToday;
	}
	
	/* 날짜 구하기(당일로부터 n만큼) */
	function getDay(date,num) {
		//Date객체는 달은 -1만큼 줄임
		if(date.substring(6,7) == "0") {
			var myDate = new Date(date.substring(0,4), parseInt(date.substring(4,6),10)-1, parseInt(date.substring(7,8),10)+parseInt(num,10));
		}
		else {
			var myDate = new Date(date.substring(0,4), parseInt(date.substring(4,6),10)-1, parseInt(date.substring(6,8),10)+parseInt(num,10));
		}
		//myDate.setDate(myDate.getDate() + Number(1));
		var result = formatDate(myDate);
		
		return result;
	}        	


	/* 날짜 Format */
	function formatDate(date) {
	    var mymonth = date.getMonth()+1;//변환시 반드시 1 넣기!!
	    var myweekday = date.getDate();

	    return (date.getFullYear() + ((mymonth < 10) ? "0" : "") + mymonth + ((myweekday < 10) ? "0" : "") + myweekday);			
	}

	function getTwo(Date) {
		var str = Date.toString();
		
		if (str.length == 1) {
			str = "0" + str;
		}
		
		return str;
	}
	
	$("#today").append(today);
	
	// 날짜별 리스트 조회하기
	var salesList = function() {
		$.ajax({		
			type:"GET",
			url:"/FinalProject/json/acct/"+brno+"/date/"+today,
			dataType:"json",
			success:function(result) {
				var $tbody = $(".account-con tbody").empty();

				var sum = 0;
				$.each(result, function(index, item) {
					var no = index + 1;
					sum += item.psum;
					$tbody.append("<tr><td>"+no+"</td><td>"
							+item.brEmp.name+"</td><td>"
							+item.no+"</td><td>"
							+formatNumber(item.psum)+"</td></tr>");
				});
				
				$(".ac-sum").empty().append(formatNumber(sum));
			}
		})
	}
	
	salesList();
	
	// 날짜 이전버튼
	$(".account-con").on("click",".back", function(event){
		var $titleday = $("#today").text().replace(/-/g, "");
		var day = getDay($titleday, -1);
		console.log(day)
		var date = parse(day);
		today = getTitleDay(date);
		$("#today").empty().append(today);
		salesList();
	});
	
	// 날짜 다음버튼
	$(".account-con").on("click",".next", function(event){
		if ($("#today").text() == realToday) {
			$(this).attr("disabled");
		} else {
			var $titleday = $("#today").text().replace(/-/g, "");
			var day = getDay($titleday, 1);
			console.log(day)
			var date = parse(day);
			today = getTitleDay(date);
			$("#today").empty().append(today);
			salesList();
		}
	});
		
	function parse(str) {
	    var y = str.substr(0, 4);
	    var m = str.substr(4, 2);
	    var d = str.substr(6, 2);
	    return new Date(y,m-1,d);
	}
})
</script>
<title>지점 - 결산</title>
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

	<div class="row account-con">
		<div class="col-sm-12">
			<h3><button class="button-01 back">이전날짜</button><span id="today"></span><button class="button-01 next">다음날짜</button></h3>
			
			<table class="table table-bordered">
				<colgroup>
					<col width="10%" />
					<col width="30%" />
					<col width="30%" />
					<col width="30%" />
				</colgroup>
				
				<thead>
					<tr>
						<th>번호</th>
						<th>담당자</th>
						<th>판매번호</th>
						<th>합계(원)</th>
					</tr>
				</thead>
				
				<tbody>
					<!-- 날짜별 판매 리스트 -->
				</tbody>
				
				<tfoot>
					<tr>
						<td colspan="2">총 합계(원)</td>
						<td colspan="2" class="ac-sum"></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
</body>
</html>
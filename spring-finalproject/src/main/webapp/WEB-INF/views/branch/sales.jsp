<%@page import="com.finalproject.model.LargeCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.finalproject.service.BranchService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="current_page" value="branchsales" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/css/branch.css">
<script type="text/javascript" src="resources/jquery/jquery.js" ></script>
<script type="text/javascript" src="resources/jquery/money.js" ></script>
<script type="text/javascript">
$(function() {
	// 화면 띄우자마자 물품목록 띄우기
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/lcat/",
		dataType:"json",
		success:function(result) {
			var $ul = $('#sales-lc');
			$ul.empty();
			
			$.each(result, function(index, lc){
				$ul.append("<li id='no-"+lc.no+"'>"+lc.name+"</li>");
			});
			
			$("#sales-lc li:first").addClass("active").trigger("click");
			
			var lcno = $("#sales-lc li:first").attr("id").replace("no-", "");
			$.ajax({
				type:"GET",
				url:"/FinalProject/json/scat/" + lcno,
				dataType:"json",
				success:function(result) {
					var $ul = $('#sales-sc');
					$ul.empty();
					
					$.each(result, function(index, sc) {
						$ul.append("<li id='no-"+sc.no+"'>"+sc.name+"</li>");
					});
					
					$("#sales-sc li:first").addClass("active").trigger("click");
				}
			})
		}
	});
	
	// 대분류 클릭시 소분류 조회하기
	$("#sales-lc").on("click", "li", function() {
		$(this).addClass('active').siblings().removeClass('active');
		
		var lcno = $(this).attr("id").replace("no-", "");
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/scat/" + lcno,
			dataType:"json",
			success:function(result) {
				var $ul = $('#sales-sc');
				$ul.empty();
				
				$.each(result, function(index, sc) {
					$ul.append("<li id='no-"+sc.no+"'>"+sc.name+"</li>");
				});
				
			}
		})
	});

	// 소분류 클릭시 물품 조회하기
	$("#sales-sc").on("click", "li", function() {
		$(this).addClass('active').siblings().removeClass('active');
		
		var scno = $(this).attr("id").replace("no-", "");
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/pt/" + scno,
			dataType:"json",
			success:function(result) {
				var $ul = $("#sales-pt");
				$ul.empty();
				
				$.each(result, function(index, pt) {
					$ul.append("<li id='no-"+pt.no+"'>"+"<p>"+pt.name+"</p><p class='sales-pt-price'>"+formatNumber(pt.price)+"</p></li>")
				});
			}
		})
	})
	
	// 숫자 천단위 콤마 추가
	function isNumeric(num, opt){
		  num = String(num).replace(/^\s+|\s+$/g, "");
		  if(typeof opt == "undefined" || opt == "1"){
		    var regex = /^[+\-]?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
		  }else if(opt == "2"){
		    var regex = /^(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
		  }else if(opt == "3"){
		    var regex = /^[0-9]+(\.[0-9]+)?$/g;
		  }else{
		    var regex = /^[0-9]$/g;
		  }
		  if( regex.test(num) ){
		    num = num.replace(/,/g, "");
		    return isNaN(num) ? false : true;
		  }else{ return false;  }
		}
		 
		function getNumeric(str, opt){
		  if(isNumeric(str, opt)){
		    str = String(str).replace(/^\s+|\s+$/g, "").replace(/,/g, "");
		    return Number(str);
		  }else{
		    return str;
		  }
		}
		
	function formatNumber(str, opt){
		  var rstr = "", sign = "";
		  if(isNumeric(str, opt)){
		    str = String(getNumeric(str, opt));
		    if(str.substr(0, 1) == "-" ){
		      sign = "-";
		      str = str.substr(1);
		    }
		    var arr = str.split(".");
		    for(var ii = 0 ; ii < arr[0].length ; ii++){
		      if( ii % 3 == 0 && ii > 0){
		        rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + "," + rstr;
		      }else{
		        rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + rstr;
		      }
		    }
		    rstr = sign + rstr;
		    return arr.length > 1 ? rstr + "." + arr[1] : rstr;
		  }else{
		    return str;
		  }
		}
});
</script>
<title>지점 - 판매</title>
</head>
<body>
<div class="wrapper container">
	<div class="row">
		<div class="col-sm-12">
			<%@ include file="topmenu.jsp" %>
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-sm-5 sales-left">
			<table class="table table-bordered">
				<colgroup>
					<col width="15%" />
					<col width="40%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>삭제</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>과자</td>
						<td>2000</td>
						<td><input type="text" value="1" name="qty" /></td>
						<td><a href=""><span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
				</tbody>
			</table>
			
			<p class="sales-sum">총 합계: 15,000 원</p>
			
			<form role="form">
				<div>
					<div class="col-xs-8 sales-search-btn">
						<input type="text" class="form-control" name="pno" placeholder="품목번호를 입력하세요" />
					</div>
					<input type="submit" class="btn btn-warning" value="추가" />
				</div>
			</form>
			
			
		</div>
		
		<div class="col-sm-7 sales-right">
			<ul id="sales-lc">
				<!-- 대분류 리스트 -->
			</ul>
			
			<ul id="sales-sc">
				<!-- 소분류 리스트 -->
			</ul>
			
			<ul id="sales-pt">
				<!-- 물품 리스트 -->
			</ul>
			
			<ul id="sales-btn-list">
				<li>일괄 취소</li>
				<li>보류</li>
				<li>결제</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>
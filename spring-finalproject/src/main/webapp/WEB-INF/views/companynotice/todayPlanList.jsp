<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script src="resources/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function() {
	$.ajax({
		type:'GET',
		url:'json/plan/now',
		dataType:'json',
		success:function(result) {
			var $tbody = $('.todayList');
			$tbody.empty();
			
			$.each(result, function(index, plan) {
				if(plan.successed == 'Y' && $("#success-check").is(":checked")) {
					                   
				$tbody.append("<tr>"
								+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
								+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
								+"<td><button class='active success btn btn-primary btn-xs' style='margin-right:5px' disabled='disabled'>완료</button>"
									+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")					
				} else {
					$tbody.append("<tr>"
									+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
									+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
									+"<td><button class='success btn btn-primary btn-xs' style='margin-right:5px'>완료</button>"
										+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")			
				}
			});
		}
	});
	//날짜 선택 조회하기
	$("#mydate-btn").click(function() {
		var date = $("#mydate").val();
		if(date == '') {
			alert("날짜를 선택해주세요.");
			return false;
		}
		var todayPlan = {};
		todayPlan['regdate'] = date;
		
		var jsonData = JSON.stringify(todayPlan);
		
		$.ajax({
			type:'POST',
			url:'json/plan/date',
			contentType:'application/json',
			data:jsonData,
			dataType:'json',
			success:function(result) {
				console.log(result);
				var $tbody = $('.todayList');
				$tbody.empty();
				
				$.each(result, function(index, plan) {
					if(plan.successed == 'Y' && $("#success-check").is(":checked")) {
						                   
					$tbody.append("<tr>"
									+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
									+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
									+"<td><button class='active success btn btn-primary btn-xs' style='margin-right:5px' disabled='disabled'>완료</button>"
										+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")					
					} else {
						$tbody.append("<tr>"
										+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
										+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
										+"<td><button class='success btn btn-primary btn-xs' style='margin-right:5px'>완료</button>"
											+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")			
					}
				});
			}
		});
	});
	
	//오늘의 할일 삭제하기
	$("tbody.todayList").on("click", "tr td button.delete", function(event) {
		event.stopPropagation();
		var todayplanNo = $(this).parent().parent().find('td:first').text();
	
		$.ajax({
			type:'DELETE',
			url:'json/plan/delete/' + todayplanNo,
			dataType:'json',
			success:function(result) {
				alert("삭제 되었습니다.")
				var $tbody = $('.todayList');
				$tbody.empty();
				
				$.each(result, function(index, plan) {
					if(plan.successed == 'Y' && $("#success-check").is(":checked")) {
						
						$tbody.append("<tr>"
										+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
										+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
										+"<td><button class='active success btn btn-primary btn-xs' style='margin-right:5px' disabled='disabled'>완료</button>"
											+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")					
					} else {
						$tbody.append("<tr>"
										+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
										+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
										+"<td><button class='success btn btn-primary btn-xs' style='margin-right:5px'>완료</button>"
											+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")			
					}
				});
			}
		});
	});
	//오늘의 할일 완료하기
	$("tbody.todayList").on("click","tr td button.success", function() {
		event.stopPropagation();
		var todayplanNo = $(this).parent().parent().find('td:first').text();
		
		$.ajax({
			type:'POST',
			url:'json/plan/update/' + todayplanNo,
			dataType:'json',
			success:function(result) {
				alert("완료 되었습니다.")
				var $tbody = $('.todayList');
				$tbody.empty();
				
				$.each(result, function(index, plan) {
					if(plan.successed == 'Y') {
						$tbody.append("<tr>"
										+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
										+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
										+"<td><button class='active success btn btn-primary btn-xs' style='margin-right:5px' disabled='disabled'>완료</button>"
											+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")					
					} else {
						$tbody.append("<tr>"
										+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
										+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
										+"<td><button class='success btn btn-primary btn-xs' style='margin-right:5px'>완료</button>"
											+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")			
					}
				});
			}
		})
	});
	
	//오늘의 할일 추가하기
	$("#addPlan").click(function() {
		var title = $("#title").val().trim();
		var contents = $("#contents").val().trim();
		if(title == '' || contents == '') {
			alert("title and contents write please")
			return false;
		}
		var todayPlan = {};
		todayPlan['title'] = title;
		todayPlan['contents'] = contents;
		
		var jsonData = JSON.stringify(todayPlan);
		
		$.ajax({
			type:'POST',
			url:'json/plan/addPlan',
			contentType:'application/json',
			data:jsonData,
			dataType:'json',
			success:function(result) {
				alert("오늘의 할 일이 추가되었습니다.")
				var $tbody = $('.todayList');
				$tbody.empty();
				
				$.each(result, function(index, plan) {
					if(plan.successed == 'Y' && $("#success-check").is(":checked")) {
						
						$tbody.append("<tr>"
										+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
										+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
										+"<td><button class='active success btn btn-primary btn-xs' style='margin-right:5px' disabled='disabled'>완료</button>"
										+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")					
					} else {
						$tbody.append("<tr>"
										+"<td>"+plan.no+"</td><td>"+plan.title+"</td>"
										+"<td>"+plan.contents+"</td><td>"+plan.regdate+"</td>"
										+"<td><button class='success btn btn-primary btn-xs' style='margin-right:5px'>완료</button>"
											+"<button class='delete btn btn-warning btn-xs'>삭제</button></td></tr>")			
					}
				});
			}
		});
	});
	$("#success-check").click(function() {
		if($("#success-check").attr("checked") == 'checked') {
			$("#success-check").removeAttr("checked");
			$("button.active").parent().parent().hide();
		} else {
			$("#success-check").attr("checked","checked");
			$("button.active").parent().parent().show();;
		}
		
	});
});
</script>
<style>
th,td{text-align:center;}
input[type=text] {border-radius:5px;}
#title {width:20%}
#contents {width:60%;}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		<div class="container">
			<div class="panel panel-default">
				<div class="panel panel-heading well">
					<div>
						<input id="mydate" type="date" name="tdate">
						<button id="mydate-btn" class="btn btn-primary btn-xs">선택</button>
						<span class="pull-right">
							완료된 것 표시하기<input type="checkbox" id="success-check" checked="checked">
						</span>
					</div>
					<hr>
					<div>
						<label>제목:</label>
						<input type="text" id="title" name="title">
						<label> 내용:</label>
						<input type="text" id="contents" name="contents">
						<button id="addPlan" class="btn btn-primary btn-xs">추가하기</button>
					</div>
				</div>
				<div class="panel panel-body">
					<table class="table">
						<colgroup>
							<col width="5%">
							<col width="15%">
							<col width="50">
							<col span="2" width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th colspan="2">작성일</th>								
							</tr>
						</thead>
						<tbody class="todayList">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
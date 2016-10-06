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
<style>
	html,body {margin: 0; padding:0; height:100%;  }
	#mainview {
		margin: auto;
		max-width:1080px;
		min-height: 100%; 
		// relative 선언을 통해 하단바의 absolute position 이 정확한 위치에 오도록 한다.
		position: relative;
		// content 시작 위치부터 그라디언트 효과가 나타나도록 한다.
		background: #0202F7 url('images/gr.jpg') 0 70px repeat-x;
	}
		 
 	#mainview #header {
		height: 100px;
		background-color: white;
	} 
		 
	#mainview #content {
		// 하단바가 표시되는 공간 부여
		min-height: 100%; 
		padding-bottom: 130px;
	}
		 
	#footer {
		// 하단바를 하단에 고정
		position: absolute;
		bottom: 0;
		width: 100%;
		height: 130px;
		background-color: silver;
	}
</style>
<script type="text/javascript">
$(function() {
	$("button").click(function(event) {
		event.preventDefault();
		
		$(":input[name='pno']").val(1);		
		$("#searchform").submit()
		
		return false;
	});
	
	$("ul.pagination a:not([aria-label])").on("click", function() {
		$(":input[name='pno']").val($(this).text());
		
		$("#searchform").submit();
		return false;
	});
	
	$("ul.pagination a[aria-label]").on("click", function() {
		var currentPno = $(":input[name='pno']").val();
		
		if ($(this).attr("aria-label") == "Previous") {
			$(":input[name='pno']").val(currentPno - 1);
		} else if ($(this).attr("aria-label") == "Next") {
			$(":input[name='pno']").val(parseInt(currentPno) + 1);
		}
		
		$("#searchform").submit();
		return false;
	});
});
</script>

<title>지점찾기</title>
</head>
<body>
<div id="mainview" >
	<div id="header" class="w3-display-container">
		<%@ include file="navbar.jsp" %>
	</div>

	<div id="content">

	
	<!-- sub메뉴 하단 표시부 -->
		<div  class="w3-container w3-padding-0 w3-margin-0" style="height:100%;">
			<!-- 판매점 리스트 -->
			<div id="panelTab" style="height:100%;overflow:auto;">
				<table class="w3-table w3-striped w3-bordered w3-border" >
					<thead>
					<tr>
					  <th class="w3-center" rowspan="2" align="center">판매점명</th>
					  <th class="w3-center" rowspan="2" align="center">주소</th>
					  <th class="w3-center" rowspan="2" align="center">전화번호</th>
					  <th class="w3-center" colspan="4">편의정보</th>
					 </tr>
					 <tr>
					  <th class="w3-center">Lotto</th>
					  <th class="w3-center">ATM</th>
					  <th class="w3-center">택배서비스</th>
					  <th class="w3-center">직접조리식품</th>
					</tr>
					</thead>
					<tbody>
						<!-- 판매점 리스트 -->
						<td></td>
					</tbody>
				</table>
			</div>	

		</div>
				
		<div class="row text-center">
			<ul class="pagination">

  			</ul>
		</div>
	</div>
		<!-- footer -->
	<div id="footer">
		<%@ include file="footer.jsp" %>	
	</div>
</div>

</body>
</html>
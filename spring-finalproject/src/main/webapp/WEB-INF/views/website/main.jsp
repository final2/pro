<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/css/branch.css">
<script type="text/javascript" src="resources/jquery/jquery.js" ></script>
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
	
	div.img {
    border: 1px solid #ccc;
	}
	
	div.img:hover {
	    border: 1px solid #777;
	}
	
	div.img img {
	    width: 100%;
	    height: auto;
	}
	
	div.desc {
	    padding: 15px;
	    text-align: center;
	}
	</style>

<title>Welcome BigStore</title>
<link rel="BigStore" href="resources/image/bs2.ico" />
<script type="text/javascript">
$(function() {
	eventProduct(1);
	
	$("#leftMenu a").click(function() {
				
		$(this).siblings().find("a").removeClass("active");
		$(this).find("a").addClass("active").css('color','yellow');
		eventProduct($(this).attr("id"));
	}); 
	
	
	function eventProduct(evcode){
		var code = evcode || "1";
		
		$.ajax({
			type:"GET",
			url:"main2.do",
			data: {no:code},		// 서버로 전송하는 데이타
			dateType:"json",
			success:function(result){
	 			var $ul=$('#eventList');
				$ul.empty();
				
				$.each(result, function(index, pd) {
					$ul.append("<div class='w3-quarter'><p class='hidden' value='"+pd.no
							+"'></p><img src='"+pd.image+"' style='width:45%; ' class='w3-circle w3-hover-opacity'/><p>"
							+pd.price+"</p><p>"+pd.name+"</p></div>");
				} );
			}
		});
	}
	 /* 셀렉트 옵션 선택시 페이지 이동 */
	$("select").change(function() {
		
	});
	
	 
	$("#search").click(function() {
		
		
		
		
		
	});
});
</script>
</head>
<body id="mypage">
<div id="mainview" >
	<div id="header" class="w3-display-container">
		<%@ include file="navbar.jsp" %>
	</div>
		
	<div id="content">
		<div class="w3-row" ><!-- 왼쪽 200px와 나머지로 나눠 화면 구성 -->
		
			<!-- 좌측 메뉴바 -->
			<!-- 메뉴쪽-->
		    <div class="w3-col" style="width:20%;min-height:300px;max-height:600px;">
		         <nav id="leftMenu" class="w3-sidenav w3-teal w3-card-2 w3-xlarge" style="width:200px;height:300px;position:static!important">
		              <!-- <a href="oneplus.do?no=1" style="margin-top:10px;" >1+1상품</a> -->
		              <a id="1" href="#" style="margin:6px;">1+1상품</a>
		              <a id="2" href="#" style="margin:6px;">2+1상품</a>
		              <a id="3" href="#" style="margin:6px;">덤증정상품</a>
		              <a id="9" href="#" style="margin:6px;">선물추첨상품</a>
		         </nav>
		    </div>
			<!-- 좌측메뉴바 끝-->
		
		<!-- 상단메뉴아래 사이드 메뉴와 제품 이미지 나열예정 jsp로 분리예정 -->
		    <div class="w3-rest" >
		        <div class="w3-display-container" style="width:100%;min-height:300px;max-height:300px;overflow:auto;">
					<!-- 이벤트제품들이 뿌려질 위치 -->
		        	<ul id="eventList" >
		        	</ul>
		        </div>
		    </div>
		</div>
	
		<!-- 검색창 -->
		<div class="w3-row-padding w3-center w3-padding-10 w3-panel w3-padding-xlarge">
		    
		    <!--  검색창  -->
		<div class="w3-half row text-center ">
			<form id="searchform" class="form-inline w3-hover-shadow w3-padding-top w3-padding-bottom" method="get" action="searchbranch.do">
				<%-- <input type="hidden" name="pno" value="${navi.pageNo }" /> --%>
				<div class="form-group">
					<label class="sr-only" for="opt"></label>
					<select class="form-control" name="opt" id="opt">
						<option value="name"  ${param.opt eq 'name'? 'selected=selected' : ''}> 지점명</option>
						<option value="address" ${param.opt eq 'address'? 'selected=selected' : ''}> 주소</option>
					</select>
				</div>
				<div class="form-group">
					<label class="sr-only" for="keyword"></label>
					<input type="text" class="form-control" name="keyword" id="keyword" value="${param.keyword }">
				</div>
				<button class="btn  btn-primary">조회</button>
			</form>
		</div>  
		    
		    
		    <!-- 검색 기준 -->
<!-- 		    <div class="w3-half" >
		      <ul class="w3-ul w3-border w3-hover-shadow " style="max-width:480px;">
		        <li class="w3-theme">
		          <p class="w3-xlarge">지점검색</p>
		        </li>
		       <li class="w3-padding-1"><input class="w3-input w3-border w3-round-large" type="text" /></li>
		       <li><button id="search" class="w3-btn w3-teal w3-padding-large" ><i class="fa fa-check"></i> 검색</button></li>
		      </ul>
		    </div>  -->
		    
<!-- 서비스유형별검색 선택창 -->		
 		    <div class="w3-half  " >
		      <ul class="w3-ul w3-border w3-hover-shadow " style="max-width:480px;">
		        <li class="w3-theme-l2">
		          <p class="w3-xlarge">서비스유형별검색</p>
		        </li>
		          <select class="w3-select" name="option" onchange="location.href=this.value">
		            <option value="" disabled selected>선택하세요</option>
		            <option value=""id="LOTTO">Lotto판매</option>
		            <option value=""id="ATM">ATM</option>
		            <option value=""id="PARCELSERVICE">택배서비스</option>
		            <option value=""id="FRESHFOOD">직접조리식품</option>
		          </select>
		      </ul>
		    </div> 
		</div>
	</div>
		<!-- footer -->
	<div id="footer">
		<%@ include file="footer.jsp" %>	
	</div>
</div>
</body>
</html>
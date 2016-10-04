<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<title>QnA MAil</title>
<style>
	input[type=text], select {
	    width: 100%;
	    padding: 12px 20px;
	    margin: 8px 0;
	    display: inline-block;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
	
	input[type=submit] {
	    width: 100%;
	    background-color: #4CAF50;
	    color: white;
	    padding: 14px 20px;
	    margin: 8px 0;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	}
	
	input[type=submit]:hover {
	    background-color: #45a049;
	}
	
	/* div {
	    border-radius: 5px;
	    background-color: #f2f2f2;
	    padding: 20px;
	} */
	
	 #styled {
		width : 100%;
		height : 260px;
		padding: 12px 20px;
	    margin: 8px 0;
	    display: inline-block;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	
	}
	
	
	
</style>
</head>
<body>
<div class="w3-display-container" style="width:1080px;">
    <%@ include file="navbar.jsp" %>
	<div class="w3-container w3-padding-10  w3-margin-bottom">
	

	<h1>질문하기</h1>
	<form method="post" action="send.do">
		<label for="from">보내는 사람</label>
		<input type="text" id="from" name="from" /><br />
		<label for="to">받는 사람</label>
		<input type="text" id="to" name="to" /><br />
		<label for="subject">제목</label>
		<input type="text" id="subject" name="subject" /><br />
		<label for="style-textarea">내용</label>
		<textarea id="styled" name="style-textarea" onfocus="this.value='';setbg('#e5fff3');" onblur="setbg('white')">여기에 내용을 적어 주세요</textarea>
		<input type="submit" value="보내기" /><br />
	</form>






	</div>
	<!-- Footer -->
	<footer class="w3-container w3-padding-10 w3-theme-d1 w3-center">
 
 	<div class="w3-quarter">
    <h3>저희 BigStore는 </h3>
    <p>고객을 가족같이 여기는 마음으로 사랑과 정성을 담아 상품을 준비했습니다. 삶에 작은 기쁨을 드리는 업체로 항상 노력하겠습니다. 감사합니다.</p>
    </div>
    <div class="w3-threequarter">
      <div class="w3-treequater w3-right" style="width:350px">
        <div class="w3-col m8">
        <div class="w3-padding-16"><span class=" w3-border-teal w3-bottombar">Contact Us</span></div>
          <p>종로구 봉익동 디아망빌딩 4층</p>
          <p><i class="fa fa-map-marker w3-text-teal"></i>  서울시 종로구</p>
          <p><i class="fa fa-phone w3-text-teal"></i>  +00 1515151515</p>
          <p><i class="fa fa-envelope-o w3-text-teal"></i>  test@test.com</p>
        </div>
      </div>
    </div>

</footer>
</div>
</body>
</html>
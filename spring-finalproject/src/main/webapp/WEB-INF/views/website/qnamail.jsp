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
	
	div  {
	    border-radius: 5px;
	    background-color: #f2f2f2;
	    padding: 10px;
	}
	
	 #text {
		width : 100%;
		height : 160px;
		padding: 12px 20px;
	    margin: 8px 0;
	    display: inline-block;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	
	}
	
	#title {
		background-color: #45A049 !important;
	}
	
</style>
<script type="text/javascript">
$(function() {
	
	$(":submit").click(function(event) {
		event.preventDefault();
		var texts= $("#from").val();
			texts += $("#text").val();
		$.ajax({
			url:"send.do",
			data:{to:"lovelyzenak@gmail.com", from:"lovelyzenak@gmail.com", 
				subject:$("#subject").val(), text:texts},
			dataType:"text",
			success: function(result) {
				self.close();
			}
		});
	}) ;
})

</script>
</head>
<body>
<div class="w3-display-container w3-padding-10" style="width:100%;">
  
	<div id="title" class="w3-container w3-teal">
	  		<h1><span style="color:white;">궁금한것 물어보기</span></h1>
	</div>
	<div class="w3-container w3-padding-10  w3-margin-bottom">
		<form id="sendform" method="post" action="send.do">
			<!-- <label for="from" >받는 사람</label> -->
			<input type="hidden" id="to" name="to" value="lovelyzenak@gmail.com" /><br />
			<label for="to" >보내는 사람</label>
			<input type="text" id="from" name="from"  onfocus="this.value='';" value="이메일 aaa@bbb.com의 형식으로 적어주세요"/><br />  
			<label for="subject">제목</label>
			<input type="text" id="subject" name="subject" /><br />
			<label for="style-textarea">내용</label>
			<textarea id="text" name="text" onfocus="this.value='';" >여기에 내용을 적어 주세요</textarea>
			<input type="submit" value="보내기" /><br />
		</form>
	</div>
</div>
</body>
</html>
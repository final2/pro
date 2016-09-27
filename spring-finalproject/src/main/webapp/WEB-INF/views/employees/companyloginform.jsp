<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<style>
	body { background:#3f4249;}
	.login-ct {width:700px; height:500px; position:absolute; top:50%; margin-top:-250px;  left:50%; margin-left:-350px; background:#fff; padding:20px 0;}
	.login-logo {width:90%; margin:0 auto; border-bottom:8px solid #e8e8e8; margin-bottom:20px; position:relative;}
	.login-logo:after {clear:both; content:""; display:block;}
	.login-logo .logo-img { width:150px; margin-bottom:10px; float:left;}
	.login-logo .logo-img > img {width:100%;}
	.login-logo > p { width:250px; position:absolute; right:0; bottom:0; font-size:17px; text-align:right; font-weight:bold;}
	.login-box {width:90%; margin:0 auto;}
	.login-left {width:33%; height:320px; float:left; overflow:hidden; border-radius:5px;}
	.login-left > img {height:100%; vertical-align:middle; margin-left:-52%;}
	.loginform {width:67%; float:right; margin-top:80px;}
	.login-right { width:95%; float:right; background:#fff; border: 1px solid transparent; border-radius: 2px; }
	.login-right > .row > label {margin-right:15px;}
	.login-right > .row-mid {margin:15px -15px 30px -15px;}
</style>
<script type="text/javascript">
$(function() {
	
	$(".loginform").submit(function() {
		var empId = $("input[name='empID']").val().replace(/ /g, '');;
		var empPwd = $("input[name='empPWD']").val().replace(/ /g, '');;
		
		if(!empId) {
			alert("id를 입력해주세요.");
			return false;
		} 
		if(!empPwd) {
			alert("password를 입력해주세요.");
			return false;
		}
		
		return true;
	});
	
});
</script>
<title>Big Store</title>
</head>
<body>
	<div class="container login-ct">
		<div class="login-logo">
			<div class="logo-img">
				<img src="/FinalProject/resources/image/logo2.png"/>
			</div>
			<p>Big Store 본사홈페이지</p>
		</div>
		<div class="login-box">
			<div class="login-left">
				<img src="/FinalProject/resources/image/company00.jpg"/>
			</div>
			<form role="form" method="post" action="companylogin.do" class="loginform" >
				<div class="login-right">
					<div class="row">
						<label class="col-sm-3">ID</label>
						<input type="text" name="no" class="col-sm-8"/>
					</div>
					<div class="row row-mid">
						<label class="col-sm-3">password</label>
						<input type="password" name="password" class="col-sm-8"/>
					</div>
					<div class="text-right">
						<input type="submit" class="btn btn-primary" value="로그인"/>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
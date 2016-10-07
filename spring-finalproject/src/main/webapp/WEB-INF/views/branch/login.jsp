<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/branch.css">
<script type="text/javascript" src="../resources/jquery/jquery.js" ></script>
<title>지점 - 로그인</title>
</head>
<body>
<div class="container login-box">
	<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-4">
			<p class="login-logo"><img src="../resources/image/logo2.png" /></p>
			<form method="post" action="branchlogin.do">
				<div class="form-group">
					<input type="text" name="username" class="form-control" placeholder="아이디를 입력하세요" />
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요" />
				</div>
				<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
				<button type="submit" class="btn btn-primary form-control">로그인</button>
			</form>
		</div>
		<div class="col-sm-4">
		</div>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/branch.css">
<script type="text/javascript" src="../resources/jquery/jquery.js" ></script>
<title>지점</title>
</head>
<body>
<div class="container wrapper">
	<div class="row">
		<div class="col-sm-6 main-left">
			<img src="../resources/image/company.jpg" />
		</div>
		<div class="col-sm-6 main-right">
			<div class="main-user">
				<p><sec:authentication property="principal.brEmp.name"/></p>
			</div>
			
			<div class="row main-btn">
				<div class="col-sm-4">
					<a class="btn btn-primary btn-lg btn-block" href="branchsales.do">판매</a>
				</div>
				<div class="col-sm-4">
					<a class="btn btn-primary btn-lg btn-block" href="branchinven.do">재고</a>
				</div>
				<div class="col-sm-4">
					<a class="btn btn-primary btn-lg btn-block" href="branchevent.do">행사물품</a>
				</div>
			</div>
			<sec:authorize access="hasRole('MANAGER')">
			<div class="row main-btn">
				<div class="col-sm-4">
					<a class="btn btn-primary btn-lg btn-block">결산</a>
				</div>
				<div class="col-sm-4">
					<a class="btn btn-primary btn-lg btn-block" href="branchorder.do">발주</a>
				</div>
				<div class="col-sm-4">
					<a class="btn btn-primary btn-lg btn-block" href="branchaddemp.do">사용자등록</a>
				</div>
			</div>
			</sec:authorize>
			
			<div class="main-logo">
				<img src="../resources/image/logo2.png" />
			</div>
		</div>
	</div>
</div>
</body>
</html>
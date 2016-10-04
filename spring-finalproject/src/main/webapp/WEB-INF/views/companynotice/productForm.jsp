<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script>
$(function() {
	$.ajax({
		type:'GET',
		url:'json/product/get',
		success:function() {
		}
		
	})
})	
</script>
<style type="text/css">
h1 {color: white;}
div.row{margin:10px}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<div id="page-context-wrapper">
		<!-- Background 불러오기 -->
		<%@ include file="backgroundVideo.jsp" %>
		<div class="container">
			<h1>물품 등록</h1>
			<div class="well">
				<form role="form" action="" method="post" >
					<div class="row">
						<div class="col-sm-8">
							<label>상품 이름</label>
							<input type="text" name="name" class="form-control" />						
						</div>
						<div class="col-sm-4">
							<label>상품 이미지</label>
							<input type="file" name="image" class="form-control"/>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label>회사</label>
							<select name="maker" class="form-control"> 
								<option></option>
							</select>					
						</div>
						<div class="col-sm-6">
							<label>분류</label>
							<select name="smallCat" class="form-control">
								<c:forEach var="smallCat" items="${smallCategorys }">	
									<option id="${smallCat.no }">${smallCat.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label>이벤트</label>
							<select class="form-control">
								<option></option>
							</select>
						</div>
						<div class="col-sm-6">
							<label>연령제한</label>
							<select class="form-control">
								<option></option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label>가격</label>
							<input type="number" name="price" class="form-control" />	
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label>메모</label>	
							<textarea rows="" cols="5" name="memo" class="form-control"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12" style="text-align:right">						
							<a href="" class="btn btn-default">취소</a>
							<input class="btn btn-default" type="submit" value="등록"/>				
						</div>
					</div>		
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
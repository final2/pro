<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="current_page" value="branchinven" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/css/branch.css">
<script type="text/javascript" src="resources/jquery/jquery.js" ></script>
<script type="text/javascript">
$(function() {
	
})
</script>
<title>지점 - 재고</title>
</head>
<body>
<div class="wrapper container">
	<div class="row">
		<div class="col-sm-12">
			<%@ include file="topmenu.jsp" %>
		</div>
	</div>
	
	<div class="row inven-search">
		<div class="col-sm-6 col-sm-offset-3">
			<form role="form" class="form-inline">
				<div class="form-group col-sm-3">
					<select name="inven-search" class="form-control">
						<option>검색조건</option>
						<option value="name">상품명</option>
						<option value="qty">수량</option>
						<option value="cat">카테고리</option>
					</select>
				</div>
				
				<div class="col-sm-6 form-group inven-keyword">
					<input type="text" class="form-control" name="keyword" />
				</div>
				
				<div class="form-group col-sm-2">
					<input type="submit" class="btn btn-success" value="검색" />
				</div>
			</form>
		</div>
	</div>
	
	<div class="row inven-list">
		<div class="col-sm-8 col-sm-offset-2">
			<table class="table table-bordered">
				<colgroup>
					<col width="10%" />
					<col width="55%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>품목명</th>
						<th>재고</th>
						<th>주문수량</th>						
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>1</td>
						<td>감자깡</td>
						<td>0</td>
						<td><input type="text" value="1" name="qty" /></td>
					</tr>
				</tbody>
			</table>
			
			<div class="pull-right">
				<a href="" class="btn btn-default btn-lg">발주 추가</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
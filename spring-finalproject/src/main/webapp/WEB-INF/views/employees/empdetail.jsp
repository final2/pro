<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/FinalProject/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/FinalProject/resources/jquery/jquery.js"></script>
<link href="/FinalProject/resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">
<script src="/FinalProject/resources/bootstrap/js/bootstrap.min.js"></script>
<style>
	#page-content-wrapper:after {clear:both; content:""; display:block;}
	.container {position:relative; top:20px; margin-bottom:20px;}
	.container:after {clear:both; content:""; display:block;}

	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table {table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px; line-height:50px; vertical-align:middle !important;}
	th {text-align:center; }

	td.branchBtn-box {padding:8px 0 !important; }
	td > select {width:100%; height:100%;border:none; padding:0 8px !important;}
	td > select:focus {outline:none;}
	td > select > option {width:100%; height:100%;border-bottom:1px solid #ddd; line-height:50px;}
	
	.ptBox { margin:0; padding:0 !important;}
	.ptBox .ptImg {height:100%; overflow:hidden;  text-align:center;}
	.ptBox .ptImg:after {clear:both; content:""; display:block; }
	.ptBox > .ptImg > #thumnail { width:auto; margin:0 auto;height:100% !important; vertical-align:middle; text-align:center;}
	
	.formBtnBox {clear:both; margin-top:60px;}
	.formBtn {width:50%; float:left; text-align:center;}
	.formBtn > a { width:50%; padding:10px 0;}
	
	.branchList {width:100%;}
	
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<div id="page-content-wrapper">	
		<div class="container">
			<h1>사원 상세조회</h1>
			<div class="empBox">
				<table class="table table-bordered" >
					<colgroup>
						<col style="width:22%;">
						<col style="width:4%;">
						<col style="width:13%;">
						<col style="width:17%;">
						<col style="width:20%;">
						<col style="width:14%;">
						<col style="width:10%;">
					</colgroup>
					<tr>
						<th colspan="7" class="info">사원번호 : ${emp.no }</th>
					</tr>
					<tr>
						<th rowspan="5" class="ptBox">
							<div class="ptImg">
								<img id="thumnail" src="/FinalProject/resources/image/empimg/${emp.photo }" />
							</div>
						</th>
						<th colspan="2" class="info">성명</th>
						<td>${emp.name }</td>
						<th class="info">입사일자</th>
						<td><fmt:formatDate value="${emp.hireDate }" pattern="yyyy-MM-dd "/></td>
						<th class="info">성별</th>
					</tr>
					<tr>
						<th colspan="2" class="info">연락처</th>
						<td>${emp.phone }</td>
						<th class="info">최종학력</th>
						<td></td>
						<td rowspan="2"></td>
					</tr>
					<tr>
						<th colspan="2" class="info">Email</th>
						<td>${emp.email }</td>
						<th class="info">생년월일</th>
						<td><fmt:formatDate value="${emp.birth }" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<th rowspan="2" class="info">주소</th>
						<th class="info">주민등록상 거주지</th>
						<td colspan="2"></td>
						<th class="info">근무무서</th>
						<td>${emp.dept }</td>
					</tr>
					<tr>
						<th class="info">실거주지</th>
						<td colspan="2">${emp.address }</td>
						<th class="info">직책</th>
						<td>${emp.position }</td>
					</tr>
				</table>
				<table class="table table-bordered" >
					<thead>
						<h3>학력</h3>
					</thead>
					<tbody>
						<colgroup>
							<col style="width:22%;">
							<col style="width:22%;">
							<col style="width:14%;">
							<col style="width:14%;">
							<col style="width:14%;">
							<col style="width:14%;">
						</colgroup>
						<tr>
							<th class="info">기간</th>
							<th class="info">학교명</th>
							<th class="info">전공</th>
							<th class="info">이수구분</th>
							<th class="info">소재지</th>
							<th class="info">기타</th>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-6">
						<table class="table table-bordered">
							<thead>
								<h3>어학능력</h3>
							</thead>
							<tbody>
								<colgroup>
									<col style="width:60%;">
									<col style="width:40%;">
								</colgroup>
								<tr>
									<th class="info">외국어명</th>
									<th class="info">점수</th>
								</tr>
								<tr>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-bordered">
							<thead>
								<h3>자격면허</h3>
							</thead>
							<tbody>
								<colgroup>
									<col style="width:60%;">
									<col style="width:40%;">
								</colgroup>
								<tr>
									<th class="info">종류/등급</th>
									<th class="info">취득년월</th>
								</tr>
								<tr>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="formBtnBox">
					<div class="formBtn">
						<a href="" class="btn btn-primary">수정</a>
					</div>
					<div class="formBtn">
						<a href="" class="btn btn-default">목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
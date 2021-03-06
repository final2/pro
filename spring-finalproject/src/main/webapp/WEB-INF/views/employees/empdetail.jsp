<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/FinalProject/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/FinalProject/resources/jquery/jquery.js"></script>
<style>
	#page-content-wrapper:after {clear:both; content:""; display:block;}
	.container {position:relative; top:20px; margin-bottom:20px;}
	.container:after {clear:both; content:""; display:block;}

	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table {table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px; line-height:50px; vertical-align:middle !important;}
	th, td {text-align:center; }

	td.branchBtn-box {padding:8px 0 !important; }
	td > select {width:100%; height:100%;border:none; padding:0 8px !important;}
	td > select:focus {outline:none;}
	td > select > option {width:100%; height:100%;border-bottom:1px solid #ddd; line-height:50px;}
	
	.ptBox { margin:0; padding:0 !important;}
	.ptBox .ptImg {height:100%; overflow:hidden;  text-align:center;}
	.ptBox .ptImg:after {clear:both; content:""; display:block; }
	.ptBox > .ptImg > #thumnail { width:100% !important; margin:0 auto;height:100% !important; vertical-align:middle; text-align:center;}
	
	.formBtnBox {clear:both; margin:0 auto; margin-top:30px;}
	.formBtnBox {clear:both; content:""; display:block;}
	.formBtn {width:50%; margin:0 auto; text-align:center;}
	.formBtn > a { width:50%; padding:10px 0;}
	
	.formBtn1 {width:50%; text-align:center; float:left;}
	.formBtn1 > a { width:50%; padding:10px 0;}
	
	.branchList {width:100%;}
	
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/sidebartemplate/sidebar.jsp" %>
	<a href="#menu-toggle" class="btn btn-default btn-xs" id="menu-toggle">side bar</a>
	<!-- 메신저 modal창 -->
	<div class="modal fade" id="messenger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<%@ include file="../message/messagebutton.jsp" %>
	</div>
	
	<div id="page-content-wrapper">	
		<%@ include file="../companynotice/backgroundVideo.jsp" %>
		<div class="container">
			<h1>사원 상세조회</h1>
			<div class="well" style="opacity:0.8">
				<div class="empBox">
					<table class="table table-bordered" >
						<colgroup>
							<col style="width:22%;">
							<col style="width:15%;">
							<col style="width:20%;">
							<col style="width:15%;">
							<col style="width:18%;">
							<col style="width:10%;">
						</colgroup>
						<tr>
							<th rowspan="6" class="ptBox">
								<div class="ptImg">
								<c:choose>
									<c:when test="${empDetail.emp.photo eq null}">
										<img id="thumnail" src="/FinalProject/resources/image/no-image.png" />
									</c:when>
									<c:otherwise>
										<img id="thumnail" src="/FinalProject/resources/image/empimg/${empDetail.emp.photo }" />
									</c:otherwise>
								</c:choose>
								</div>
							</th>
							<th class="info">사원번호</th>
							<td>${empDetail.emp.no }</td>
							<th class="info">근무부서</th>
							<td>${empDetail.emp.dept }</td>
							<th class="info">근무형태</th>
						</tr>
						<tr>
							<th class="info">성명</th>
							<td>${empDetail.emp.name }</td>
							<th class="info">직책</th>
							<td>${empDetail.emp.position }</td>
							<td rowspan="2">${empDetail.emp.workingStatus }</td>
						</tr>
						<tr>
							<th class="info">생년월일</th>
							<td><fmt:formatDate value="${empDetail.emp.birth }" pattern="yyyy-MM-dd"/></td>
							<th class="info">Email</th>
							<td>${empDetail.emp.email }</td>
						</tr>
						<tr>
							<th class="info">입사일자</th>
							<td><fmt:formatDate value="${empDetail.emp.hireDate }" pattern="yyyy-MM-dd "/></td>
							<th class="info">연락처</th>
							<td colspan="2">${empDetail.emp.phone }</td>
						</tr>
						<tr>
							<th class="info">주소</th>
							<td colspan="4">${empDetail.emp.address }</td>
						</tr>
						<tr>
							<th class="info">비고</th>
							<td colspan="4">${empDetail.emp.remarks }</td>
						</tr>
					</table>
					<table class="table table-bordered" >
						<thead>
							<h3>학력</h3>
						</thead>
						<%-- <tbody>
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
					<c:choose>
						<c:when test="${ empty  empDetail.careerList }">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>	
							</tr>
						</c:when>
						<c:when test="${ !empty  empDetail.careerList }">
							<c:forEach var="career" items="${empDetail.careerList }">
							<tr>
								<td>${career.term }</td>
								<td>${career.school }</td>
								<td>${career.major }</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</c:forEach>
						</c:when>
					</c:choose>
						</tbody> --%>
						<tbody>
							<colgroup>
								<col style="width:30%;">
								<col style="width:30%;">
								<col style="width:20%;">
								<col style="width:20%;">
							</colgroup>
							<tr>
								<th class="info">기간</th>
								<th class="info">학교명</th>
								<th class="info">전공</th>
								<th class="info">기타</th>
							</tr>
					<c:choose>
						<c:when test="${ empty  empDetail.careerList }">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:when>
						<c:when test="${ !empty  empDetail.careerList }">
							<c:forEach var="career" items="${empDetail.careerList }">
							<tr>
								<td>${career.term }</td>
								<td>${career.school }</td>
								<td>${career.major }</td>
								<td></td>
							</tr>
							</c:forEach>
						</c:when>
					</c:choose>
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
							<c:choose>
								<c:when test="${ empty  empDetail.languageList }">
									<tr>
										<td></td>
										<td></td>	
									</tr>
								</c:when>
								<c:when test="${ !empty  empDetail.languageList }">
									<c:forEach var="language" items="${empDetail.languageList }">
									<tr>
										<td>${language.language }</td>
										<td>${language.grade }</td>
									</tr>
									</c:forEach>
								</c:when>
							</c:choose>
								</tbody>
							</table>
						</div>
						<div class="col-sm-6">
							<table class="table table-bordered">
								<thead>
									<h3>자격증</h3>
								</thead>
								<tbody>
									<colgroup>
										<col style="width:60%;">
										<col style="width:40%;">
									</colgroup>
									<tr>
										<th class="info">종류/등급</th>
										<th class="info">기관명</th>
									</tr>
							<c:choose>
								<c:when test="${ empty  empDetail.licenseList }">
									<tr>
										<td></td>
										<td></td>
									</tr>	
								</c:when>
								<c:when test="${ !empty  empDetail.licenseList }">
								<c:forEach var="license" items="${empDetail.licenseList }">
									<tr>
										<td>${license.license }</td>
										<td>${license.licenseOffice }</td>
									</tr>
								</c:forEach>
								</c:when>
							</c:choose>
								</tbody>
							</table>
						</div>
					</div>
					<div class="formBtnBox">
					<c:choose>
						<c:when test="${LoginUser.dept eq 'HR'}">
							<div class="formBtn1">
								<c:url var="updateURL" value="empupdate.do">
									<c:param name="no" value="${empDetail.emp.no }"></c:param>
								</c:url>
								<a href="${updateURL }" class="btn btn-primary">수정</a>
							</div>
							<div class="formBtn1">
								<a href="emplist.do" class="btn btn-default">목록</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="formBtn">
								<a href="emplist.do" class="btn btn-default">목록</a>
							</div>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
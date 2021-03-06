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
<style type="text/css">
	.container {position:relative; top:30px;}
	.container:after {clear:both; content:""; display:block;}

	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table { table-layout:fixed; word-break:break-all;}
	.brachBox {margin-bottom:40px;}
	tr {clear:both;}
	th, td {height:50px; }
	th {text-align:center; vertical-align:middle !important;}
	td {vertical-align:middle !important;}
	
	.ptBox {width:70%; text-align:center;}
	.ptImg {width:100%; height:299px; overflow:hidden; position:relative;}
	.ptImg:after {clear:both; content:""; display:block; }
	.ptImg > #thumnail { width:100% !important; height:100%; vertical-align:middle; text-align:center; border:1px solid #ddd;}
	.photoBtn {width:99%;}
	.photoBtn label { width:100%; vertical-align: middle; cursor: pointer; text-align:center;}
	/* 파일 필드 숨기기 */
	.photoBtn input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;}
	
	.ckBox {text-align:center;}

	#brempTable td, #brempUpdate td {text-align:center;}
	
	.formBtnBox {clear:both; margin:0 auto; margin-top:40px;}
	.formBtnBox:after {clear:both; content:""; display:block;}
	.formBtn {width:50%; margin:0 auto; text-align:center;}
	.formBtn > a { width:50%; padding:10px 0;}
	
	.formBtn1 {width:33%; text-align:center; float:left;}
	.formBtn1 > a { width:50%; padding:10px 0;}
	
	.formBtn2 {width:50%; text-align:center; float:left;}
	.formBtn2 > a, .formBtn2 > input { width:50%; padding:10px 0;}
	
</style>
<script type="text/javascript">
$(function() {
	
	$("#brempUpdate").hide();
	$(".btnBox2").hide();
	$("#brEmpUpdateBtn").on("click", function() {
		$("#brempTable").hide();
		$("#brempUpdate").show();
		$(".btnBox1").hide();
		$(".btnBox2").show();
		$("input[name='workingState']").val().replace()
	})
	
	$("#brEmpUpdate").on("click", function() {
		$(".workingState")
	})
	
});
</script>
<title>Insert title here</title>
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
			<h1>지점 상세</h1>
			<div class="well" style="opacity:0.8">
				<table class="table table-bordered brachBox">
					<colgroup>
						<col style="width:15%">
						<col style="width:8%">
						<col style="width:15%">
						<col style="width:8%">
						<col style="width:15%">
						<col style="width:8%">
						<col style="width:31%">
					</colgroup>
					<tr>
						<th class="info">지점명</th>
						<td colspan="5">${branch.name }</td>
						<td rowspan="7" class="ptBox">
							<c:choose>
								<c:when test="${branch.img eq null}">
									<div class="ptImg"><img id="thumnail" src="/FinalProject/resources/image/no-image2.png" /></div>
								</c:when>
								<c:otherwise>
									<div class="ptImg"><img id="thumnail" src="/FinalProject/resources/image/branchimg/${branch.img }" align="middle"/></div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th class="info">담당자</th>
						<td colspan="5">${branch.emp.name }</td>
					</tr>
					<tr>
						<th class="info">전화번호</th>
						<td colspan="5">${branch.phone }</td>
					</tr>
					<c:set var="address" value="${branch.address }"/>
					<tr>
						<th class="info">주소</th>
						<c:set var="add1" value="${fn:substringBefore(address,'구')}"/>
						<td colspan="5">${add1 }구</td>
					</tr>
					<tr>
						<th class="info">상세주소</th>
						<c:set var="add2" value="${fn:substringAfter(address,'구 ')}"/>
						<td colspan="5">${add2 }</td>
					</tr>
					<tr>
						<th class="info">ATM</th>
						<c:set var="check1" value="${branch.atm }"/>
						<c:choose>
						    <c:when test="${check1 eq 'Y'}">
						        <td class="ckBox"><span class="glyphicon glyphicon-ok"></span></td>
						    </c:when>						
						    <c:otherwise>
						    	<td class="ckBox"></td>
						    </c:otherwise>
						</c:choose>
						<th class="info">직접조리식품</th>
						<c:set var="check2" value="${branch.freshFood }"/>
						<c:choose>
						    <c:when test="${check2 eq 'Y'}">
						        <td class="ckBox"><span class="glyphicon glyphicon-ok"></span></td>
						    </c:when>						
						    <c:otherwise>
						    	<td class="ckBox"></td>
						    </c:otherwise>
						</c:choose>
						<th class="info">로또</th>
						<c:set var="check3" value="${branch.lotto }"/>
						<c:choose>
						    <c:when test="${check3 eq 'Y'}">
						        <td class="ckBox"><span class="glyphicon glyphicon-ok"></span></td>
						    </c:when>						
						    <c:otherwise>
						    	<td class="ckBox"></td>
						    </c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th class="info">택배서비스</th>
						<c:set var="check4" value="${branch.parcelService }"/>
						<c:choose>
						    <c:when test="${check4 eq 'Y'}">
						        <td class="ckBox"><span class="glyphicon glyphicon-ok"></span></td>
						    </c:when>						
						    <c:otherwise>
						    	<td class="ckBox"></td>
						    </c:otherwise>
						</c:choose>
						<th class="info">생활편의</th>
						<c:set var="check5" value="${branch.lifeService }"/>
						<c:choose>
						    <c:when test="${check5 eq 'Y'}">
						        <td class="ckBox"><span class="glyphicon glyphicon-ok"></span></td>
						    </c:when>						
						    <c:otherwise>
						    	<td class="ckBox"></td>
						    </c:otherwise>
						</c:choose>
						<th class="info">&nbsp;</th>
						<td class="ckBox">&nbsp;</td>
					</tr>
				</table>
				<div id="brempTable">
					<h3 class="text-center">지점사원 목록</h3>
					<table class="table table-bordered">
						<tbody>
							<colgroup>
								<col style="width:22%;">
								<col style="width:18%;">
								<col style="width:25%;">
								<col style="width:15%;">
								<col style="width:20%;">
							</colgroup>
							<tr>
								<th class="info">사원번호</th>
								<th class="info">이름</th>
								<th class="info">연락처</th>
								<th class="info">직급</th>
								<th class="info">비고</th>
							</tr>
							<c:choose>
								<c:when test="${!empty brEmpList}">
									<c:forEach var="brEmp" items="${brEmpList }">
										<c:url var="detailURL" value="branchempdetail.do">
											<c:param name="no" value="${brEmp.no }"></c:param>
											<c:param name="pno" value="${param.pno }"></c:param>
										</c:url>
										<tr>
											<td>${brEmp.no }</td>
											<td><a href="${detailURL }" class="empBtn">${brEmp.name }</a></td>
											<td>${brEmp.phone }</td>
											<td>${brEmp.grade }</td>
											<td>${brEmp.remarks }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center">
											<p>지점 사원이 없습니다.</p>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- 지점사원 수정 -->
				<form role="form" action="updatebranchemp.do?no=${branch.no }&pno=${param.pno }" method="post">
					<div id="brempUpdate">
						<h3 class="text-center">지점사원 목록</h3>
						<table class="table table-bordered">
							<thead>
							</thead>
							<tbody>
								<colgroup>
									<col style="width:9%;">
									<col style="width:19%;">
									<col style="width:16%;">
									<col style="width:22%;">
									<col style="width:15%;">
									<col style="width:19%;">
								</colgroup>
								<tr>
									<th class="info">퇴사여부</th>
									<th class="info">사원번호</th>
									<th class="info">이름</th>
									<th class="info">연락처</th>
									<th class="info">직급</th>
									<th class="info">비고</th>
								</tr>
								<c:forEach var="brEmp" items="${brEmpList }">
									<c:url var="detailURL" value="branchempdetail.do">
										<c:param name="no" value="${brEmp.no }"></c:param>
										<c:param name="pno" value="${param.pno }"></c:param>
									</c:url>
									<tr>
										<td><input type="checkbox" name="workingState" value="${brEmp.no }"/></td>
										<td>${brEmp.no }</td>
										<td><a href="${detailURL }" class="empBtn">${brEmp.name }</a></td>
										<td>${brEmp.phone }</td>
										<td>${brEmp.grade }</td>
										<td>${brEmp.remarks }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!--  --><div class="formBtnBox btnBox2">
					<c:choose>
						<c:when test="${LoginUser.dept eq 'HR'}">
							<div class="formBtn2">
								<input type="submit" id="brEmpUpdate" class="btn btn-primary" value="퇴사완료"/>
							</div>
							<div class="formBtn2">
								<a href="compbranchlist.do" class="btn btn-default">목록</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="formBtn">
								<a href="compbranchlist.do" class="btn btn-default">목록</a>
							</div>
						</c:otherwise>
					</c:choose>
					</div> <!--  -->
				</form>
				<div class="formBtnBox btnBox1">
				<c:choose>
					<c:when test="${LoginUser.dept eq 'HR'}">
						<div class="formBtn1">
							<c:url var="changeURL" value="updatebranch.do">
								<c:param name="no" value="${branch.no }"></c:param>
								<c:param name="pno" value="${param.pno }"></c:param>
							</c:url>
							<a href="${changeURL }" class="btn btn-primary">지점 수정</a>
						</div>
						<div class="formBtn1">
							<a href="#" id="brEmpUpdateBtn" class="btn btn-primary">지점사원 수정</a>
						</div>
						<div class="formBtn1">
							<a href="compbranchlist.do" class="btn btn-default">목록</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="formBtn">
							<a href="compbranchlist.do" class="btn btn-default">목록</a>
						</div>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/FinalProject/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/FinalProject/resources/jquery/jquery.js"></script>
<style>
	.container {position:relative; top:150px;}
	.container:after {clear:both; content:""; display:block;}

	.empBox {width:100%; margin:15px auto 15px auto;}
	.empBox:after {clear:both; content:""; display:block;}
	
	table { table-layout:fixed; word-break:break-all;}
	tr {clear:both;}
	th, td {height:50px; padding:0 !important;}
	th {text-align:center; vertical-align:middle !important;}
	td > input, td > select {width:100%; height:100%;border:none; padding:0 8px !important;}
	td > input:focus, td > select:focus {outline:none;}
	
	td > .empBtn {width:100%; height:100%; display:block; background:#f5fbff; vertical-align:middle; line-height:50px; text-decoration:none; color:inherit;}
	
	.pageBox {width: 232px; position:absolute; left:50%; top:50%; margin-left:-116px; margin-top:550px;}
	
	.ptBox {width:70%; text-align:center;}
	.ptImg {width:100%;  overflow:hidden;  text-align:center;}
	.ptImg:after {clear:both; content:""; display:block; }
	.ptImg > #thumnail { width:100% !important; margin:0 auto; vertical-align:middle; text-align:center; border:1px solid #ddd;}
	.photoBtn {width:100%;}
	.photoBtn:after {clear:both; content:""; display:block; }
	.photoBtn label { width:100%; vertical-align: middle; cursor: pointer; text-align:center;}
	/* 파일 필드 숨기기 */
	.photoBtn input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;}

	.formBtnBox {clear:both; margin-top:60px;}
	.formBtnBox:after {}
	.formBtn {width:50%; float:left; text-align:center;}
	.formBtn > input { width:50%; padding:10px 0;}
	
</style>
<script type="text/javascript">
$(function() {
	function readURL(input) {
		var url = input.value;
		var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
		if (input.files && input.files[0] && (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) {
		    var reader = new FileReader();
	
		    reader.onload = function (e) {
		        $('#thumnail')
			        .attr('src', e.target.result)
	                .css('height', '100%').css('display', 'block').css('margin', '0 auto'). css('text-align', 'center');
		    }
		    
		    //alert(url);
		    reader.readAsDataURL(input.files[0]);
		    
		}
		else{
		     $('#thumnail').attr('src', '/FinalProject/resources/image/no-image.png');
		  }
	}
	
	$("#ptFile").on("change", function() {
		readURL(this);
		
	});
})
</script>
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
			<h1>지점사원 수정</h1>
			<div class="well" style="opacity:0.8">
				<form role="form" action="insertbranchemp.do" method="post">
					<table class="table table-bordered empBox table-striped" >
						<colgroup>
							<col style="width:14%;">
							<col style="width:18%;">
							<col style="width:18%;">
							<col style="width:14%;">
							<col style="width:18%;">
							<col style="width:18%;">
						</colgroup>
						<tr>
							<th class="info">비밀번호</th>
							<td colspan="4"><input type="password" name="password" value="${brEmp.password }" /></td>
							<td rowspan="4">
								<div class="ptImg">
									<img id="thumnail" src="/FinalProject/resources/image/brempimg/${brEmp.images }" />
								</div>
								<div class="photoBtn btn btn-primary" >
									<label for="ptFile">이미지 등록</label> 
			  						<input type="file" id="ptFile" class="upload-hidden" name="images" accept="image/gif, image/jpeg, image/png"> 
								</div>
							</td>
						</tr>
						<tr>
							<th class="info">이름</th>
							<td colspan="4"><input type="text" name="name" value="${brEmp.name }" /></td>
						</tr>
						<tr>
							<th class="info">연락처</th>
							<td colspan="4"><input type="text" name="phone" value="${brEmp.phone }" /></td>
						</tr>
						<tr>
							<th class="info">주소</th>
							<td colspan="4"><input type="text" name="address" value="${brEmp.address }" /></td>
						</tr>
						<tr>
							<th class="info">이메일</th>
							<td colspan="2"><input type="text" name="email" value="${brEmp.email }" /></td>
							<th class="info">생년월일</th>
							<td colspan="2"><input type="date" name="birth" value="${brEmp.birth }" /></td>
						</tr>
						<tr>
							<th class="info">직책</th>
							<td colspan="2"><input type="text" name="grade" value="${brEmp.grade }" /></td>
							<th class="info">근무지점</th>
							<td colspan="2">
								<select name="branchNo">
									<c:forEach var="branch" items="${branchList }">
										<option value="${branch.no }">${branch.name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>
					<div class="formBtnBox">
						<div class="formBtn">
							<c:url>
							
							<input type="submit" class="btn btn-primary" value="완료"/>
							</c:url>
						</div>
						<div class="formBtn">
							<input type="reset" class="btn btn-default" value="취소"/>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
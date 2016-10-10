<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script type="text/javascript">
$(function() {
	
	var clientNo = ${product.clientNo};
	var smallCategory = ${product.smallCat.no};
	var eventCode = ${product.event.no};
	
	$.ajax({
		type:'GET',
		url:'json/product/getSelect',
		dataType:'json',
		success:function(data) {
			var $maker = $("select[name='clientNo']");
			var $smallCat = $("select[name='smallCat']");
			var $event = $("select[name='event']");
			
			$.each(data.clients, function(index, client) {
				if(clientNo == client.no) {					
					$maker.append("<option value="+client.no+" selected='selected'>"+client.name+"</option>");
				} else {
					$maker.append("<option value="+client.no+">"+client.name+"</option>");					
				}
			});
			
			$.each(data.smallCategorys, function(index, smallCat) {
				if(smallCategory == smallCat.no) {
					$smallCat.append("<option value="+smallCat.no+" selected='selected'>"+smallCat.name+"</option>");					
				} else {
					$smallCat.append("<option value="+smallCat.no+">"+smallCat.name+"</option>");					
				}
			})
			$.each(data.events, function(index, event) {
				if(eventCode.type == "O") {
					if(event == event.no) {
						$event.append("<option value="+event.no+" selected='selected'>1 + 1</option>")						
					} else {
						$event.append("<option value="+event.no+">1 + 1</option>")						
					}
				} else if (event.type == "T" ) {
					if(eventCode == event.no) {
						$event.append("<option value="+event.no+" selected='selected'>2 + 1</option>")					
					} else {
						$event.append("<option value="+event.no+">2 + 1</option>")					
					}
				} else if (event.type == "E") {
					if(eventCode == event.no) {
						$event.append("<option value="+event.no+" selected='selected'>임의 값</option>")										
					} else {
						$event.append("<option value="+event.no+">임의 값</option>")										
					}
				} else {
					$event.append("<option value="+event.no+" selected='selected'>없음</option>")						
				}
			})
		}
		
	});
	
	function readURL(input) {
		var url = input.value;
		var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
		if (input.files && input.files[0] && (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) {
		    var reader = new FileReader();
	
		    reader.onload = function (e) {
		        $('#imgview')
			        .attr('src', e.target.result);
	                //.css('height', '100%');
		    }
		    
		    //alert(url);
		    reader.readAsDataURL(input.files[0]);
		}
		else{
		     $('#imgview').attr('src', '/FinalProject/resources/image/no-image.png');
		  }
	}
	
	$("#image").change(function() {
		readURL(this);	
	})
	
	
	$("#updateBtn").click(function() {
		var file = $('#image')[0].files[0];
		if (!file){
			var url = "${product.image}";
			$("#imageurl").val(url);
		}
		$("#updateForm").submit();
		return false;
	});
});
</script>
<style type="text/css">
h1 {color: white;}
th {text-align:center; vertical-align:middle !important}
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
			<h1>상품 정보 수정</h1>
			<c:url var="update" value="updateProduct.do">
				<c:param name="no" value="${param.no }" /> 
				<c:param name="pn" value="${param.pn }" />
				<c:param name="maker" value="${param.maker}" />
				<c:param name="smallCat" value="${param.smallCat}" />
				<c:param name="eventCode" value="${param.eventCode}" />
				<c:param name="limiteAge" value="${param.limiteAge}" />
			</c:url>
			<form id="updateForm" role="form" action="${update }" method="post" enctype="multipart/form-data">
				<div class="well">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="10%">
							<col width="40%">
						</colgroup>
						<tr>
							<th>제품 번호</th>
							<td><input type="text" name="no" class="form-control" value="${product.no }" readonly="readonly" disabled="disabled"></td>
							<td rowspan="3" colspan="2" style="text-align:center">
								<c:choose>
									<c:when test="${fn:startsWith(product.image, 'http')}">								
										<img id="imgview" style="width:90%; height:300px;" src="${product.image }">
									</c:when>
									<c:otherwise>
										<img id="imgview" style="width:90%; height:300px;" src="/FinalProject/resources/image/${product.image }">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>제품 명</th>
							<td><input type="text" name="name" class="form-control" value="${product.name }"  /></td>
						</tr>
						<tr>
							<th style="vertical-align:top !important;">메모</th>
							<td><textarea name="memo" class="form-control" rows="10" cols="">${product.memo }</textarea></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" name="price" class="form-control" value="${product.price }"></td>
							<th>사진 변경</th>
							<td>
								<input id="image" type="file" name="image" class="form-control" accept="image/gif, image/jpeg, image/png" >
								<input id="imageurl" type="hidden" name="imageurl" class="form-control" value="">
							</td>
						</tr>
						<tr>
							<th>제조사</th>
							<td><select id="maker" name="clientNo" class="form-control"></select></td>
							<th>제품 분류</th>
							<td><select id="smallCat" name="smallCat" class="form-control"></select></td>
						</tr>
						<tr>
							<th>이벤트</th>
							<td><select id="event" name="event" class="form-control"></select></td>
							<th>연령 제한</th>
							<td>
								<select id="limiteAge" name="limiteAge" class="form-control">
								<c:choose>
									<c:when test="${product.limiteAge == Y }">
										<option value="N">없음</option>
										<option value="Y" selected='selected'>청소년 구매불가</option>										
									</c:when>
									<c:otherwise>
										<option value="N" selected='selected'>없음</option>
										<option value="Y">청소년 구매불가</option>
									</c:otherwise>
								</c:choose>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div style="text-align:right">
					<c:url var="Detail" value="productDetail.do">
						<c:param name="no" value="${param.no }" />
						<c:param name="pn" value="${param.pn }" />
						<c:param name="maker" value="${param.maker}" />
						<c:param name="smallCat" value="${param.smallCat}" />
						<c:param name="eventCode" value="${param.eventCode}" />
						<c:param name="limiteAge" value="${param.limiteAge}" />
					</c:url>
					<a href="${Detail }" class="btn btn-default">취소</a>
					<button id="updateBtn" class="btn btn-default">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
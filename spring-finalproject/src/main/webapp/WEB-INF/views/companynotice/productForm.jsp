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
		url:'json/product/getSelect',
		dataType:'json',
		success:function(data) {
			var $maker = $("select[name='clientNo']");
			var $smallCat = $("select[name='smallCat']");
			var $event = $("select[name='event']");
			
			$.each(data.clients, function(index, client) {
				$maker.append("<option value="+client.no+">"+client.name+"</option>");
			});
			
			$.each(data.smallCategorys, function(index, smallCat) {
				$smallCat.append("<option value="+smallCat.no+">"+smallCat.name+"</option>");
			})
			$.each(data.events, function(index, event) {
				if(event.type == "O") {
					$event.append("<option value="+event.no+">1 + 1</option>")
				} else if (event.type == "T" ) {
					$event.append("<option value="+event.no+">2 + 1</option>")					
				} else if (event.type == "E") {
					$event.append("<option value="+event.no+">임의 값</option>")										
				} else {
					$event.append("<option value="+event.no+">없음</option>")
				}
			})
		}
		
	});
	
	$("button#add").click(function() {
		if($("#name").val().trim() == '') {
			alert("상품명을 입력해주세요.");
			return false;
		}
		if($("#price").val().trim() == '') {
			alert("가격을 입력해주세요.");
			return false
		}
		
		$("#form").submit();
		alert("등록 되었습니다.");
	});
	
	$("#reset").click(function() {
		$("#name").val("");
		$("#price").val("");
		$("#memo").val("");
		$("select").find(":first-child").attr("selected", "selected");
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
	
	
});	
</script>
<style type="text/css">
h1 {color: white;}
th {text-align:center; vertical-align:middle !important;}
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
			
			<form id="form" role="form" action="product.do" method="post" enctype="multipart/form-data">
				<div class="well">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="10%">
							<col width="40%">
						</colgroup>
						<tr>
							<th>제품 명</th>
							<td><input type="text" id="name" name="name" class="form-control" required="required" /></td>
							<td rowspan="3" colspan="2" style="text-align:center;"><img id="imgview" style="width:80%; height:300px;" src=""></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="number" id="price" name="price" class="form-control" required="required"/>	</td>
						</tr>
						<tr>
							<th rowspan="2" style="vertical-align:top !important;">메모</th>
							<td rowspan="2"><textarea id="memo" name="memo" rows="12" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th>사진 등록</th>
							<td><input type="file" id="image" name="image" class="form-control" accept="image/gif, image/jpeg, image/png"/></td>
						</tr>
						<tr>
							<th>제조사</th>
							<td><select id="maker" name="clientNo" class="form-control"> </select></td>
							<th>제품 분류</th>
							<td><select id="smallCat" name="smallCat" class="form-control"></select></td>
						</tr>
						<tr>
							<th>이벤트</th>
							<td><select id="event" name="event" class="form-control"></select></td>
							<th>연령 제한</th>
							<td>
								<select id="limite-age" name="limiteAge" class="form-control">
									<option value="N">없음</option>
									<option value="Y">청소년 구매불가</option>
								</select>
							</td>
						</tr>				
					</table>
				</div>
				<div style="text-align:right;">
					<a id="reset" class="btn btn-default">취소</a>
					<button id="add" class="btn btn-default">등록</button>
				</div>
			</form>
			
			
			<!-- <div class="well">
				<form id="form" role="form" action="product.do" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col-sm-8">
							<label>상품 이름</label>
							<input type="text" id="name" name="name" class="form-control" required="required" />						
						</div>
						<div class="col-sm-4">
							<label>상품 이미지</label>
							<input type="file" id="image" name="image" class="form-control" accept="image/gif, image/jpeg, image/png"/>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label>제조사</label>
							<select id="maker" name="clientNo" class="form-control"> 
							</select>					
						</div>
						<div class="col-sm-6">
							<label>분류</label>
							<select id="smallCat" name="smallCat" class="form-control"> 
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label>이벤트</label>
							<select id="event" name="event" class="form-control">
							</select>
						</div>
						<div class="col-sm-6">
							<label>연령제한</label>
							<select id="limite-age" name="limiteAge" class="form-control">
								<option value="N">없음</option>
								<option value="Y">청소년 구매불가</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label>가격</label>
							<input type="number" id="price" name="price" class="form-control" required="required"/>	
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label>메모</label>	
							<textarea id="memo" name="memo" cols="5" class="form-control"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12" style="text-align:right">						
							<a id="reset" class="btn btn-default">취소</a>
							<button id="add" class="btn btn-default">등록</button>		
						</div>
					</div>		
				</form>
			</div> -->
		</div>
	</div>
</div>
</body>
</html>
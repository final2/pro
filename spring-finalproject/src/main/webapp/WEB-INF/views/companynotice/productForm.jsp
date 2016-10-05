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
	
	
	/* $("form").submit(function(event) {
		event.preventDefault();
		
		var name = $("#name").val().trim();
		var image = $("#image").val();
		var clientNo = $("#maker").val();
		var maker = $("#maker option:selected").text();
		var smallCat = $("#smallCat").val();
		var event = $("#event").val();
		var limiteAge = $("#limite-age").val();
		var price = $("#price").val().trim();
		var memo = $("#memo").val();
		
		if(name == '') {
			alert("상품명을 입력해주세요.");
			return false;
		}
		if(price == '') {
			alert("가격을 입력해주세요.");
			return false
		}
		var product = {};
		product["name"] = name;
		product["image"] = image;
		product["maker"] = maker;
		product["price"] = price;
		product["memo"] = memo;
		product["limiteAge"] = limiteAge;
		product["event"] = {'no':event}; 
		product["smallCat"] = {'no':smallCat};
		product["clientNo"] = clientNo;
		
		var jsonData = JSON.stringify(product);
		
		$.ajax({
			type:'POST',
			url:'json/product/add',
			contentType:'application/json',
			data:jsonData,
			success:function() {
				alert("successed");
				$("#name").val("");
				$("#price").val("");
				$("#memo").val("");
				$("select").find(":first-child").attr("selected", "selected")
			}
		})
	})*/	
	
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
});	
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
								<option value="Y">청소년 이용불가</option>
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
			</div>
		</div>
	</div>
</div>
</body>
</html>
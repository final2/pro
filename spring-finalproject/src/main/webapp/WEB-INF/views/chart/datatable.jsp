<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getsalesyear/",
		DataType:"json",
		success:function(result){
			var $tbody = $('#datatable');
			var nowyear = Number(result).toLocaleString('en');
			$tbody.append(
					"<th class='text-center' style='vertical-align:middle'><h4>올해 총매출</h4>"+nowyear+"</th>"
					);
		}
	});
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getsalesyear/",
		DataType:"json",
		success:function(result){
			var $tbody = $('#datatable');
			var profityear = result*0.3;
			var profityearresult = Number(profityear).toLocaleString('en');
		
			$tbody.append(
					"<th class='text-center' style='vertical-align:middle'><h4>올해 순이익</h4>"+profityearresult+"</th>"
					);
		}
	});
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getsalesmonth/",
		DataType:"json",
		success:function(result){
			var $tbody = $('#datatable');
			var nowmonth = Number(result).toLocaleString('en');
		
			$tbody.append(
					"<th class='text-center' style='vertical-align:middle'><h4>이번달 매출</h4>"+nowmonth+"</th>"
					);
		}
	});
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getsalesmonth/",
		DataType:"json",
		success:function(result){
			var $tbody = $('#datatable');
			var profitmonth = result*0.3;
			var profitmonthresult = Number(profitmonth).toLocaleString('en');
		
			$tbody.append(
					"<th class='text-center' style='vertical-align:middle'><h4>이번달 순이익</h4>"+profitmonthresult+"</th>"
					);
		}
	});
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getsalesdays/",
		DataType:"json",
		success:function(result){
			var $tbody = $('#datatable');
			var days = Number(result).toLocaleString('en');
		
			$tbody.append(
					"<th class='text-center' style='vertical-align:middle'><h4>금일 매출</h4>"+days+"</th>"
					);
		}
	});
	
});
</script>
<div class="panel panel-primary">
	<div class="panel-body" id="">
		<div class="row">
			<table class="table table-bordered">
					<tr id="datatable">
					</tr>
			</table>
		</div>
	</div>
</div>

			
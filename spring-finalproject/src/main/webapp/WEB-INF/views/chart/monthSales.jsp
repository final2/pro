<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
google.charts.load('visualization', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart(){
	var jsonData=$.ajax({
		type:"GET",
		url:"/FinalProject/json/getMonth/",
		DataType:"json",
		async:false
	}).responseJSON;
	
	
	var arrayData = [];
	arrayData.push(["month", "price"]);
	
	$.each(jsonData, function(index, item) {	
		arrayData.push([item.name, item.price]);
	});
	var data = new google.visualization.arrayToDataTable(arrayData);
	var options = {
		      title: '월별 매출',
		      width: "100%",
		      height: 450
		    };
	var chart = new google.visualization.ColumnChart(document.getElementById('monthbarchart'));

    chart.draw(data, options);
    

	
};

</script>
<div class="panel panel-primary">
	<div class="panel-body">
		<div id = monthbarchart></div>
	</div>
</div>
	
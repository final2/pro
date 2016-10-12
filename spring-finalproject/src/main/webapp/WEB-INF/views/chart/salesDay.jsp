<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
google.charts.load('visualization', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart(){
	var jsonData=$.ajax({
		type:"GET",
		url:"/FinalProject/json/getSalesDay/",
		DataType:"json",
		async:false
	}).responseJSON;
	
	
	var arrayData = [];
	arrayData.push(["day", "price"]);
	
	$.each(jsonData, function(index, item) {	
		arrayData.push([item.name, item.price]);
	});
	console.log(arrayData);
	var data = new google.visualization.arrayToDataTable(arrayData);
	var options = {
		      title: '일별 매출',
		      width: "100%",
		      height: 450
		    };
	var chart = new google.visualization.LineChart(document.getElementById('salesdaybarchart'));

    chart.draw(data, options);
};

</script>
<div class="panel panel-primary">
	<div class="panel-body">
		<div id = salesdaybarchart></div>
	</div>
</div>
	
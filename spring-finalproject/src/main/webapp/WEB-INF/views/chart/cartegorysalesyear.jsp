<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
google.charts.load('visualization','1', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {

	var jsonData=$.ajax({
		type:"GET",
		url:"/FinalProject/json/getcategorysales/",
		DataType:"json",
		async:false
		}).responseJSON;
		
	
	var arrayData = [];
	arrayData.push(["name", "price"]);
	
	$.each(jsonData, function(index, item) {	
		arrayData.push([item.name, item.price]);
	});
	
		
    var data = new google.visualization.arrayToDataTable(arrayData);

    var options = {
    		title:'상품분류별 판매량', titleTextStyle:{fontSize:'20'},
      width: "100%",
      height: "100%",
		pieHole: 0.3
    };

    var chart = new google.visualization.PieChart(document.getElementById('cartegorypiechart'));

    chart.draw(data, options);
}
</script>
<div class="panel panel-primary">
	<div class="panel-body">
		<div id = cartegorypiechart></div>
	</div>
</div>

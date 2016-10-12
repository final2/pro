<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
google.charts.load('visualization','1', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {

	var jsonData=$.ajax({
		type:"GET",
		url:"/FinalProject/json/getBuyAges/",
		DataType:"json",
		async:false
		}).responseJSON;
		
	
	var arrayData = [];
	arrayData.push(["name", "price"]);
	
	$.each(jsonData, function(index, item) {	
		arrayData.push([item.name+"대", item.price]);
	});
	
		
    var data = new google.visualization.arrayToDataTable(arrayData);

    var options = {
    		title:'구매고객 연령비율', titleTextStyle:{fontSize:'20'},
      width: "100%",
      height: "100%",
		pieHole: 0.3
    };

    var chart = new google.visualization.PieChart(document.getElementById('agepiechart'));

    chart.draw(data, options);
    }
</script>
<div class="panel panel-primary">
	<div class="panel-body">
		<div id = agepiechart></div>
	</div>
</div>

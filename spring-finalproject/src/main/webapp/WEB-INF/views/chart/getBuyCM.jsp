<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
google.charts.load('visualization','1', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {

	var jsonData=$.ajax({
		type:"GET",
		url:"/FinalProject/json/getBuyCM/",
		DataType:"json",
		async:false
		}).responseJSON;
		
	
	var arrayData = [];
	arrayData.push(["name", "price"]);
	
	$.each(jsonData, function(index, item) {
		if(item.name=="M"){
			arrayData.push(["현금", item.price]);
		}else{
			arrayData.push(["카드", item.price]);
		}	
	});
	
		
    var data = new google.visualization.arrayToDataTable(arrayData);

    var options = {
    		title:'구매형태(카드,현금)', titleTextStyle:{fontSize:'20'},
      width: "100%",
      height: "100%"
    };

    var chart = new google.visualization.PieChart(document.getElementById('examplepiechart'));

    chart.draw(data, options);
    }
</script>
<div class="panel panel-primary">
	<div class="panel-body">
		<div id = examplepiechart></div>
	</div>
</div>

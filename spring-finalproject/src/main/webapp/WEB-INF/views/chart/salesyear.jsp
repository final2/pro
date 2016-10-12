<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getsalesyear/",
		DataType:"json",
		success:function(result){
			var now = result;
			var max = 10000000;
			var etc = max-now;
			google.charts.load('current', {'packages':['corechart']});
		    function drawChart() {
				var data = google.visualization.arrayToDataTable([
					['genel', {role:'data'},  { role: 'style' },  {role:'data'},  { role: 'style'} ],
					['현재매출액',now, 'color: #ff3232', etc, 'color: #e5e4e2']
				]);

				var options = {
					title:"누적매출액",
			        width: "100%",
			        height: 450,
			        legend: { position: 'top', maxLines: 3 },
			        bar: { groupWidth: '100%' },
			        isStacked: true
		        };

		        var chart = new google.visualization.ColumnChart(document.getElementById('salesyear'));
		        chart.draw(data, options);
		      }
		      google.charts.setOnLoadCallback(drawChart);
		}
	});
});
</script>
<div class="panel panel-primary">
	<div class="panel-body">
		<div id="salesyear"></div>
	</div>
</div>

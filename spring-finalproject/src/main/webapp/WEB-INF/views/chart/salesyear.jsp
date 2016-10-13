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
				['genel', '매출액', '목표까지남은금액'],
				['현재매출액',now,  etc]
			]); 

								
				var options = {
					title:'현재매출액', titleTextStyle:{fontSize:'20'},
			        width: "100%",
			        height: 450,
			        legend: { position: 'top', maxLines: 3 },
			        bar: { groupWidth: '100%' },
			        colors:['#ff3232','#e5e4e2'],
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
	<div class="panel-body" >
		<div id="salesyear"></div>
	</div>
	
	<button data-toggle="modal" data-target="#modalsalesyear">모달</button>
	
	<div class="modal fade" id="modalsalesyear" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">올해 매출</h4></div>
				<div class="modal-bady">
					<h1>모오다알</h1>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-inverse" data-dismiss="modal">Close</button>
			      		
				</div>
			</div>
		</div>
	</div>
</div>

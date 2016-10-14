<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	google.charts.load('visualization','1', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
	
		var jsonData=$.ajax({
			type:"GET",
			url:"/FinalProject/json/getsalesBr/",
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
        		title:'지점별매출', titleTextStyle:{fontSize:'20'},
          width: "100%",
          height: "100%"
        };

        var chart = new google.visualization.PieChart(document.getElementById('brpiechart'));

        chart.draw(data, options);
	}
	$(function(){
		var $detailBr = $("#salesBr");
		$detailBr.empty();
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/getsalesBrDetail/",
			DataType:"json",
			success:function(result){
				$.each(result, function(index, rm){
					var price = Number(rm.price).toLocaleString('en');
					$detailBr.append(
						"<tr>"+
						"<th>"+rm.rank+"</th>"+
						"<th>"+rm.name+"</th>"+
						"<th class='text-right'>"+price+"	원</th>"+
						"</tr>"
					);
				});
			}
		});
	});
	
</script>
<div class="panel panel-primary">
	<div class="panel-body" data-toggle="modal" data-target="#modalBR">
		<div id = brpiechart></div>
	</div>
	<div class="modal fade" id="modalBR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">지점별 매출 순위</h4></div>
				<div class="modal-bady">
					<table class="table table-hover" style="width: 400px; margin-left: 100px; margin-top: 20px">
						<thead>
							<tr>
								<th>순위</th>
								<th>지점명</th>
								<th>매출액</th>
							</tr>
						</thead>
						<tbody id="salesBr">
						
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-inverse" data-dismiss="modal">Close</button>
			      		
				</div>
			</div>
		</div>
	</div>
</div>


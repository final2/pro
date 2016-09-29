<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$.ajax({
	type:"GET",
	url:"/FinalProject/json/getsendlist/",
	dataType:"json",
	success:function(result) {
		var $tbody = $('#sendlist');
		$tbody.empty();
		$.each(result, function(index, sm) {
			/* 사원번호로 사원이름불러오기 */
			$.ajax({
				type:"GET",
				url:"/FinalProject/json/empbyno/"+sm.to,
				dataType:"json",
				success:function(emp){
					$tbody.append(
						"<tr id='messageNo-"+sm.no+"'>"+
						"<td class='text-center' style='vertical-align:middle'><span class='glyphicon glyphicon-envelope'></span></td>" +
						"<td class='text-center' style='vertical-align:middle' id='no-"+sm.to+"'><h4></h4></td>"+
						"<td class='text-center' style='vertical-align:middle'><p>"+sm.contents+".</p></td>"+
						"<td class='text-center' style='vertical-align:middle'><p>"+sm.regdate+"</p></td>"+
						"</tr>"
					);
					var $td = $('#sendlist').find("td[id='no-"+sm.to+"']");
					
					$td.empty();
					$td.append("<h4>"+emp.name+"</h4>");
					
				}
			});
		});
	}
});
</script>
	<table class="table table-hover">
		<thead id="sendlistAll">
			<tr>
				<th class="text-center" style="vertical-align:middle">읽음</th>
				<th class="text-center" style="vertical-align:middle">받는이</th>
				<th class="text-center" style="vertical-align:middle">내용</th>
				<th class="text-center" style="vertical-align:middle">날짜</th>
			</tr>
		</thead>
		<tbody id="sendlist">
			<!-- sendlist -->
		</tbody>
	</table>

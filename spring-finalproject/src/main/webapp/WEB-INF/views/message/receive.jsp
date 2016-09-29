<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$.ajax({
	type:"GET",
	url:"/FinalProject/json/getreceivelist/",
	dataType:"json",
	success:function(result) {
		var $tbody = $('#recivelist');
		$tbody.empty();
		$.each(result, function(index, rm) {
			/* 사원번호로 사원이름불러오기 */
			$.ajax({
				type:"GET",
				url:"/FinalProject/json/empbyno/"+rm.from,
				dataType:"json",
				success:function(emp){
					$tbody.append(
						"<tr id='messageNo-"+rm.no+"'>"+
						"<td class='text-center' style='vertical-align:middle'><span class='glyphicon glyphicon-envelope'></span></td>" +
						"<td class='text-center' style='vertical-align:middle' id='no-"+rm.from+"'><h4></h4></td>"+
						"<td class='text-center' style='vertical-align:middle'><p>"+rm.contents+".</p></td>"+
						"<td class='text-center' style='vertical-align:middle'><p>"+rm.regdate+"</p></td>"+
						"</tr>"
					);
					var $td = $('#recivelist').find("td[id='no-"+rm.from+"']");
					
					$td.empty();
					$td.append("<h4>"+emp.name+"</h4>");
				}
			});
		});
	}
});

</script>
	<table class="table table-hover">
		<thead>
			<tr>
				<th class="text-center" style="vertical-align:middle">읽음</th>
				<th class="text-center" style="vertical-align:middle">보낸이</th>
				<th class="text-center" style="vertical-align:middle">내용</th>
				<th class="text-center" style="vertical-align:middle">날짜</th>
			</tr>
		</thead>
		<tbody id=recivelist>
		</tbody>
	</table>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getemplist/",
		dataType:"json",
		success:function(result) {
			var $tbody = $('#employeeList');
			$tbody.empty();
			$.each(result, function(index, emp) {
				$tbody.append(
					"<tr>"+
						"<td class='text-center' style='vertical-align:middle'>"+
							"<a href='#'><img border='0' height='80' width='60' alt='hong' src='/FinalProject/resources/image/empimg/"+emp.photo+"'></a>"+
						"</td>"+
						"<td class='text-center' style='vertical-align:middle'><h4>"+emp.name+"</h4></td>"+
						"<td class='text-center' style='vertical-align:middle'><h4>"+emp.position+".</h4></td>"+
						"<td class='text-center' style='vertical-align:middle'><button type='button' class='btn btn-default' id='no-"+emp.no+"'>쪽지보내기</button></td>"+
					"</tr>"
				);
			});
			$("#employeeList").on("click", "button[id^=no]", function() {
				$('#bodylist').hide();
				$('#bodywritemessage').show();
				
				var eno = $(this).attr("id").replace("no-","");
				var ename = $(this).parents("tr").find("td:eq(1)").text();
				$("[name='to']").val(eno);
			})
		}
	});
</script>
	<form class="navbar-form navbar-right" role="search">
		<div class="form-group">
			<select id="selectbox" title="검색"  style="height:34px; border-color:#ccc; border-radius:5px">
				<option selected="selected">이름</option>
				<option>직책</option>
				<option>부서</option>
			</select>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="검색">
		</div>
		<button type="submit" class="btn btn-default">찾기</button>
	</form>
	<table class="table table-hover">
	
		<tbody id="employeeList">
		</tbody>
	</table>

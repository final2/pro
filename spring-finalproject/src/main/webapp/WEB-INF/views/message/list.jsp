	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getemplist/",
		dataType:"json",
		success:function(result) {
			var $tbody = $('#employeeList');
			var loginstate = "Y";
			$tbody.empty();
			$.each(result, function(index, emp) {
				if(emp.loginState==loginstate){
					$tbody.append(
						"<tr>"+
							"<td class='text-center' style='vertical-align:middle; color:green;'>ON</td>"+
							"<td class='text-center' style='vertical-align:middle'>"+
								"<a href='#'><img border='0' height='80' width='60' alt='hong' src='/FinalProject/resources/image/empimg/"+emp.photo+"'></a>"+
							"</td>"+
							"<td class='text-center' style='vertical-align:middle'><h4>"+emp.name+"</h4></td>"+
							"<td class='text-center' style='vertical-align:middle'><h4>"+emp.position+"</h4></td>"+
							"<td class='text-center' style='vertical-align:middle'><button type='button' class='btn btn-default' id='no-"+emp.no+"'>쪽지보내기</button></td>"+
						"</tr>"
					);	
				}else{
					$tbody.append(
						"<tr>"+
							"<td class='text-center' style='vertical-align:middle; color:red;'>OFF</td>"+
							"<td class='text-center' style='vertical-align:middle'>"+
								"<a href='#'><img border='0' height='80' width='60' alt='hong' src='/FinalProject/resources/image/empimg/"+emp.photo+"'></a>"+
							"</td>"+
								"<td class='text-center' style='vertical-align:middle'><h4>"+emp.name+"</h4></td>"+
								"<td class='text-center' style='vertical-align:middle'><h4>"+emp.position+"</h4></td>"+
								"<td class='text-center' style='vertical-align:middle'><button type='button' class='btn btn-default' id='no-"+emp.no+"'>쪽지보내기</button></td>"+
							"</tr>"
						);	
				}
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
	
	
	$('#selecte').submit(function(event){
		event.preventDefault();
		var opt = $("#selectbox option:selected").val();
		var keyword = $("input[name='keyword']").val();
		if (!keyword) {
			$("input[name='keyword']").focus().attr("placeholder", "검색할 값을 입력하세요.");
			return;
		}
		$.ajax({
			type:"POST",
			url:"/FinalProject/json/searchEmp/opt/"+opt+"/keyword/"+keyword,
			dataType:"json",
			success:function(result){
				var $tbody = $('#employeeList');
				var loginstate = "Y";
				$tbody.empty();
				$.each(result, function(index, emp) {
					if(emp.loginState==loginstate){
						$tbody.append(
							"<tr>"+
								"<td class='text-center' style='vertical-align:middle; color:green;'>ON</td>"+
								"<td class='text-center' style='vertical-align:middle'>"+
									"<a href='#'><img border='0' height='80' width='60' alt='hong' src='/FinalProject/resources/image/empimg/"+emp.photo+"'></a>"+
								"</td>"+
								"<td class='text-center' style='vertical-align:middle'><h4>"+emp.name+"</h4></td>"+
								"<td class='text-center' style='vertical-align:middle'><h4>"+emp.position+"</h4></td>"+
								"<td class='text-center' style='vertical-align:middle'><button type='button' class='btn btn-default' id='no-"+emp.no+"'>쪽지보내기</button></td>"+
							"</tr>"
						);	
					}else{
						$tbody.append(
							"<tr>"+
								"<td class='text-center' style='vertical-align:middle; color:red;'>OFF</td>"+
								"<td class='text-center' style='vertical-align:middle'>"+
									"<a href='#'><img border='0' height='80' width='60' alt='hong' src='/FinalProject/resources/image/empimg/"+emp.photo+"'></a>"+
								"</td>"+
									"<td class='text-center' style='vertical-align:middle'><h4>"+emp.name+"</h4></td>"+
									"<td class='text-center' style='vertical-align:middle'><h4>"+emp.position+"</h4></td>"+
									"<td class='text-center' style='vertical-align:middle'><button type='button' class='btn btn-default' id='no-"+emp.no+"'>쪽지보내기</button></td>"+
								"</tr>"
							);	
					}
				});
			}
		})
	});
});
</script>
	<form id="selecte" class="navbar-form navbar-right" role="search">
		<div class="form-group">
			<select id="selectbox" title="검색"  style="height:34px; border-color:#ccc; border-radius:5px">
				<option value>검색조건</option>
				<option value="name">이름</option>
				<option value="position">직책</option>
				<option value="department">부서</option>
			</select>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="keyword" placeholder="검색">
		</div>
		<button type="submit" class="btn btn-default">찾기</button>
	</form>
	<table class="table table-hover">
	
		<tbody id="employeeList">
		</tbody>
	</table>

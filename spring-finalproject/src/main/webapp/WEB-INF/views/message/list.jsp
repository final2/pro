<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$('#write').click(function(){
		$('#bodylist').hide();
		$('#bodywritemessage').show();
	});	
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
			<tr>
				<td class="text-center" style="vertical-align:middle">
					<a href="#"><img border="0" height="80" width="60" alt="hong" src="resources/image/emp2.jpg"></a>
				</td>
				<td class="text-center" style="vertical-align:middle"><h4>홍길동</h4></td>
				<td class="text-center" style="vertical-align:middle"><h4>부장</h4></td>
				<td class="text-center" style="vertical-align:middle"><button type="button" class="btn btn-default" id="write">쪽지보내기</button></td>
			</tr>
			<tr>
				<td class="text-center">
					<a href="#"><img border="0" height="80" width="60" alt="hong" src="resources/image/employee.JPG"></a>
				</td>
				<td class="text-center" style="vertical-align:middle"><h4>김예지</h4></td>
				<td class="text-center" style="vertical-align:middle"><h4>대리</h4></td>
				<td class="text-center" style="vertical-align:middle"><button type="button" class="btn btn-default">쪽지보내기</button></td>
			</tr>
			<tr>
				<td class="text-center">
					<a href="#"><img border="0" height="80" width="60" alt="hong" src="resources/image/emp3.jpg"></a>
				</td>
				<td class="text-center" style="vertical-align:middle"><h4>장혜선</h4></td>
				<td class="text-center" style="vertical-align:middle"><h4>과장</h4></td>
				<td class="text-center" style="vertical-align:middle"><button type="button" class="btn btn-default">쪽지보내기</button></td>
			</tr>
		</tbody>
	</table>

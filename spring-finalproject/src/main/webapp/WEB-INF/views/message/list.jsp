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
		</tbody>
	</table>

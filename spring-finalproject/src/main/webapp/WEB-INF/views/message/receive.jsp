<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$('#receivemessage').click(function(){
		
		$('#bodyreceive').hide();
		$('#bodymessagedetail').show();
	});
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
			<!-- $('#receive').click(function(){})참조 -->
		</tbody>
	</table>

</body>
</html>
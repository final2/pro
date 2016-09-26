<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$('#send-form').submit(function(){
		$('#bodyreceive').hide();
		$('#bodysend').hide();
		$('#bodywritemessage').hide();
		$('#bodylist').show();
		
		// ajax
		
		return false;
	});
	$('#reset').click(function(){
		$('#bodyreceive').hide();
		$('#bodysend').hide();
		$('#bodywritemessage').hide();
		$('#bodylist').show();
		
	});
})
</script>
		<div class="well">
			<form role="form" id="send-form" method="post" action="post.do">
				<div class="form-group">
					<label>받는사람</label>
					<input type="text" class="form-control" name="to" />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea rows="5" class="form-control" name="contents"></textarea>
				</div>
				<div class="form-group" style="text-align:right" >
					<input type="submit" class="btn btn-default" value="저장" />
					<button type="reset" class="btn btn-default" id="reset">취소</button>
				</div>
			</form>
		</div>

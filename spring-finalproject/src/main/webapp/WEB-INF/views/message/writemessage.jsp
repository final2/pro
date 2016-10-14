<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$('#send-form').submit(function(event){

		
		event.preventDefault();
		
		
		var send = document.insert;
		var obj = new Object();
		var loginUserNo = ${LoginUser.no};
		obj.to = send.to.value;
		obj.contents = send.contents.value;
		obj.from = loginUserNo;
		
		$.ajax({
			type:"POST",
			url:"/FinalProject/json/insertmessage/",
			data:obj,
			dataType:"json",
			success:function(result){
				alert("성공적으로 보냈습니다.");
				$("#send").trigger("click");
			}
		});
		
		
	});
	$('#reset').click(function(){
		$('#bodyreceive').hide();
		$('#bodysend').hide();
		$('#bodywritemessage').hide();
		$('#bodylist').show();
	});
		$('#selectemp').click(function(){
		$('#bodyreceive').hide();
		$('#bodysend').hide();
		$('#bodywritemessage').hide();
		$('#bodylist').show();
	});
});
</script>
		<div class="well">
			<form role="form" name="insert" id="send-form" method="post" action="post.do">
				<div class="form-group" id="receiveemp">
					<label>받는사람</label>
					<button class="btn btn-default" type="reset" id="selectemp" style="margin-left: 385px;">사원찾기</button>
					<input type="text" class="form-control" name="to" />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea rows="5" class="form-control" name="contents"></textarea>
				</div>
				<div class="form-group" style="text-align:right" >
					<input type="submit" class="btn btn-default" value="보내기" />
					<button type="reset" class="btn btn-default" id="reset">취소</button>
				</div>
			</form>
		</div>

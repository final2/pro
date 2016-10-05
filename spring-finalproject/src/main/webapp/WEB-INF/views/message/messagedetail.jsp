<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$('#bodysend').on("click", "tr[id^=messageNo]", function() {
	$('#bodysend').hide();
	var messageno = $(this).attr("id").replace("messageNo-","");
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getmessagebyno/"+messageno,
		dataType:"json",
		success:function(detail){
			var $detail = $("#detail-form");
			$detail.empty();
			$.ajax({
				type:"GET",
				url:"/FinalProject/json/empbyno/"+detail.to,
				dataType:"json",
				success:function(emp){
					$detail.append(
						"<table class='table table-hover'>"
						+"<thead>"
						+"<tr>"
						+"<th>받은사람 : "+emp.name+"</th>"
						+"<th class='text-right'>"+detail.regdate+"</th>"
						+"</tr>"
						+"<tr><th colspan='2'>읽음여부 : "+detail.receiving+"</th></tr>"
						+"</thead>"
						+"<tbody>"
						+"<tr><th class='text-left' style='vertical-align:middle'>"+detail.contents+"</td></tr>"
						+"</tbody>"
						+"</table>"
					);
					$('#bodymessagedetail').show();	
				}
			});
		}
	});
});

$('#bodyreceive').on("click", "tr[id^=messageNo]", function() {
	$('#bodyreceive').hide();
	var messageno = $(this).attr("id").replace("messageNo-","");
	var $detail = $("#detail-form");
	$detail.empty();
	$.ajax({
		type:"GET",
		url:"/FinalProject/json/getmessagebyno/"+messageno,
		dataType:"json",
		success:function(detail){
			$.ajax({
				type:"GET",
				url:"/FinalProject/json/empbyno/"+detail.from,
				dataType:"json",
				success:function(emp){
					$detail.append(
						"<table class='table table-hover'>"
						+"<thead>"
						+"<tr id='sendid-"+emp.no+"'>"
						+"<th>보낸사람 : "+emp.name+"</th>"
						+"<th class='text-right'>"+detail.regdate+"</th>"
						+"</tr>"
						+"<tr><th colspan='2'>읽음여부 : "+detail.receiving+"</th></tr>"
						+"</thead>"
						+"<tbody>"
						+"<tr><th class='text-left' style='vertical-align:middle'>"+detail.contents+"</td></tr>"
						+"</tbody>"
						+"</table>"
					);
				}
			});
		}
	});
				$('#bodymessagedetail').show();	
});
</script>
	<div class="well" style="background-color:#fff">
		<form role="form" id="detail-form" method="get" action="getMessage.do">
			
		</form>
	</div>
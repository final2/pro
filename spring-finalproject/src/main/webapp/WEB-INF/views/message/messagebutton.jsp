<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$('#bodyreceive').hide();
	$('#bodysend').hide();
	$('#bodywritemessage').hide();
	$('#bodymessagedetail').hide();
	
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
							"<a href='#'><img border='0' height='80' width='60' alt='hong' src='resources/image/"+emp.photo+"'></a>"+
						"</td>"+
						"<td class='text-center' style='vertical-align:middle'><h4>"+emp.name+"</h4></td>"+
						"<td class='text-center' style='vertical-align:middle'><h4>"+emp.position+".</h4></td>"+
						"<td class='text-center' style='vertical-align:middle'><button type='button' class='btn btn-default'>쪽지보내기</button></td>"+
					"</tr>"
				);
			});
		}
	});
	$('#list').click(function(){
		$('#bodyreceive').hide();
		$('#bodysend').hide();
		$('#bodywritemessage').hide();
		$('#bodymessagedetail').hide();
		$('#bodylist').show();

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
								"<a href='#'><img border='0' height='80' width='60' alt='hong' src='resources/image/"+emp.photo+"'></a>"+
							"</td>"+
							"<td class='text-center' style='vertical-align:middle'><h4>"+emp.name+"</h4></td>"+
							"<td class='text-center' style='vertical-align:middle'><h4>"+emp.position+".</h4></td>"+
							"<td class='text-center' style='vertical-align:middle'><button type='button' class='btn btn-default'>쪽지보내기</button></td>"+
						"</tr>"
					);
				});
			}
		});
	});
	$('#receive').click(function(){
		$('#bodylist').hide();
		$('#bodysend').hide();
		$('#bodywritemessage').hide();
		$('#bodymessagedetail').hide();
		$('#bodyreceive').show();
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/getreceivelist/",
			dataType:"json",
			success:function(result) {
				var $tbody = $('#recivelist');
				$tbody.empty();
				$.each(result, function(index, rm) {
					$tbody.append(
						"<tr>"+
						"<td class='text-center' style='vertical-align:middle'><span class='glyphicon glyphicon-envelope'></span></td>" +
						"<td class='text-center' style='vertical-align:middle'><h4>"+rm.from+"</h4></td>"+
						"<td class='text-center' style=vertical-align:middle'><p>"+rm.contents+".</p></td>"+
						"<td class='text-center' style='vertical-align:middle'><p>"+ +"</p><p>"+ +"</p></td>"+
						"</tr>"
					);
				});
			}
		});
	});
	$('#send').click(function(){
		$('#bodywritemessage').hide();
		$('#bodylist').hide();
		$('#bodyreceive').hide();
		$('#bodymessagedetail').hide();
		$('#bodysend').show();
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/getsendlist/",
			dataType:"json",
			success:function(result) {
				var $tbody = $('#sendlist');
				$tbody.empty();
				$.each(result, function(index, rm) {
					$tbody.append(
						"<tr>"+
						"<td class='text-center' style='vertical-align:middle'><span class='glyphicon glyphicon-envelope'></span></td>" +
						"<td class='text-center' style='vertical-align:middle'><h4>"+rm.from+"</h4></td>"+
						"<td class='text-center' style=vertical-align:middle'><p>"+rm.contents+".</p></td>"+
						"<td class='text-center' style='vertical-align:middle'><p>"+ +"</p><p>"+ +"</p></td>"+
						"</tr>"
					);
				});
			}
		});
	});
	$('#writemessage').click(function(){
		$('#bodylist').hide();
		$('#bodyreceive').hide();
		$('#bodysend').hide();
		$('#bodymessagedetail').hide();
		$('#bodywritemessage').show();
	});
});
</script>
	<div class="modal-dialog">
			<div class="modal-content">
				<!-- 팝업창 헤더(메뉴바) -->
				<div class="modal-header">
					<nav class="navbar navbar-default" role="navigation">
						<div class="container-fluid">
					       	<div class="navbar-header">
					    		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
					    			<span class="sr-only">Toggle navigation</span>
					    			<span class="icon-bar"></span>
					    			<span class="icon-bar"></span>
					    			<span class="icon-bar"></span>
					    		</button>
					    		<a class="navbar-brand" href="#"><span style="width:100%; height:100%" class="glyphicon glyphicon-user"></span></a>
							</div>
					
						    <!-- Collect the nav links, forms, and other content for toggling -->
							<div class="navbar-collapse collapse" id="navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
									<li id="list"><a href="#">사원목록 <span class="sr-only">(current)</span></a></li>
									<li id="receive"><a href="#">받은쪽지</a></li>
									<li id="send"><a href="#">보낸쪽지</a></li>
									<li id="writemessage"><a href="#">쪽지쓰기</a></li>
								</ul>
						    </div><!-- /.navbar-collapse -->
						</div><!-- /.container-fluid -->
					</nav>
	    		</div>
	    		<!-- 쪽지함 center -->
	     		<div class="modal-body">
	     			<div id=bodylist>
	     			   <%@ include file="list.jsp" %>
	     			</div>
	     			<div id=bodyreceive>
					   <%@ include file="receive.jsp" %>
	     			</div>
	     			<div id=bodysend>
					   <%@ include file="send.jsp" %>
	     			</div>
	     			<div id=bodywritemessage>
					   <%@ include file="writemessage.jsp" %>
	     			</div>
	     			<div id=bodymessagedetail>
					   <%@ include file="messagedetail.jsp" %>
	     			</div>
	     		</div>
	   			<!-- 쪽지함 푸터 -->
	     		<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      		</div>
	      	</div>
		</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	/* 초기화면 */
	$('#bodyreceive').hide();
	$('#bodysend').hide();
	$('#bodywritemessage').hide();
	$('#bodymessagedetail').hide();
	
	/* 사원목록 클릭시 */
	$('#list').click(function(){
		$('#bodyreceive').hide();
		$('#bodysend').hide();
		$('#bodywritemessage').hide();
		$('#bodymessagedetail').hide();
		$('#bodylist').show();
	});
	
	/* 받은쪽지 클릭시 */
	$('#receive').click(function(){
		$('#bodylist').hide();
		$('#bodysend').hide();
		$('#bodywritemessage').hide();
		$('#bodymessagedetail').hide();
		$('#bodyreceive').show();
		
	});
	/* 보낸쪽지 클릭시 */
	$('#send').click(function(){
		$('#bodywritemessage').hide();
		$('#bodylist').hide();
		$('#bodyreceive').hide();
		$('#bodymessagedetail').hide();
		$('#bodysend').show();
		
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
					<nav class="navbar navbar-inverse" role="navigation">
						<div class="container-fluid">
					       	<div class="navbar-header">
					    		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
					    			<span class="sr-only">Toggle navigation</span>
					    			<span class="icon-bar"></span>
					    			<span class="icon-bar"></span>
					    			<span class="icon-bar"></span>
					    		</button>
					    		<a class="navbar-brand" href="#"><img alt="Brand" height="30" width="60" src="/FinalProject/resources/image/logo2.png"></a>
					    		
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
					<button type="button" class="btn btn-inverse" data-dismiss="modal">Close</button>
	      		</div>
	      	</div>
		</div>
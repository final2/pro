<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
var loginUserNo = ${LoginUser.no};
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
		var $navi = $('#page');
		var pno = $('#pNo').val();
		var $tbody = $('#receivelist');
		$tbody.empty();
		$navi.empty();
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/getreceivelist/"+pno,
			dataType:"json",
			success:function(result) {
				$.each(result, function(index, rm) {
					$.ajax({
						type:"GET",
						url:"/FinalProject/json/empbyno/"+rm.from,
						dataType:"json",
						success:function(emp){
							$tbody.append(
								"<tr id='messageNo-"+rm.no+"'>"+
								"<td class='text-center' style='vertical-align:middle'><span class='glyphicon glyphicon-envelope'></span></td>" +
								"<td class='text-center' style='vertical-align:middle' id='no-"+rm.from+"'><h4>"+emp.name+"</h4></td>"+
								"<td class='text-center' style='vertical-align:middle'><p>"+rm.contents+".</p></td>"+
								"<td class='text-center' style='vertical-align:middle'><p>"+rm.regdate+"</p></td>"+
								"</tr>"
							);
						}
					});
				});
			}
		});
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/receivetotal/"+pno,
			dataType:"json",
			success:function(result){
				$navi.empty();
				if(pno > 1){
					$navi.append(
						"<li>"+
						"<span class='glyphicon glyphicon-menu-left' id='minus' ara-hidden='true'></span>"+
						"</li>"
					);				
				}
				$.each(result, function(index, page){
					var pNo = $('#pNo').val();
					var no = index+1;
					if(page.beginPage<=no && index<page.endPage){
						if(no==pNo){
							$navi.append(
								"<li class='active'>"+
								"<span id='page-"+no+"' ara-hidden='true' >"+no+"</span>"+
								"</li>"
							);
						}else{
							$navi.append(
								"<li>"+
								"<span id='page-"+no+"' ara-hidden='true'>"+no+"</span>"+
								"</li>"
							);
						}
					}
					if(page.totalPages>1 && page.totalPages>pno && no==page.endPage){
						$navi.append(
							"<li>"+
							"<span class='glyphicon glyphicon-menu-right' id='plus' ara-hidden='true'></span>"+
							"</li>"
						);				
					}
				});
			}
		});
		$('#bodylist').hide();
		$('#bodysend').hide();
		$('#bodywritemessage').hide();
		$('#bodymessagedetail').hide();
		$('#bodyreceive').show();
	});
	$('#page').on("click", "span[id^=page-]", function(){
		var nowpNo = $(this).attr("id").replace("page-","")
		$('#pNo').val(nowpNo)
		$('#receive').trigger("click"); 
	});
	$('#page').on("click", "span[id^=plus]", function(){
		var nowpNo = $('#pNo').val();
		
		var nextNo = parseInt(nowpNo)+1
		$('#pNo').val(nextNo)
		$('#receive').trigger("click"); 
	});
	$('#page').on("click", "span[id^=minus]", function(){
		var nowpNo = $('#pNo').val();
		var beforeNo = nowpNo-1
		$('#pNo').val(beforeNo)
		$('#receive').trigger("click"); 
	});
	
	/* 보낸쪽지 클릭시 */
	$('#send').click(function(){
		var $navi = $('#page2');
		var pno = $('#pNo2').val();
		var $tbody = $('#sendlist');
		$tbody.empty();
		$navi.empty();
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/getsendlist/"+pno,
			dataType:"json",
			success:function(result) {
				$.each(result, function(index, sm) {
					/* 사원번호로 사원이름불러오기 */
					$.ajax({
						type:"GET",
						url:"/FinalProject/json/empbyno/"+sm.to,
						dataType:"json",
						success:function(emp){
							$tbody.append(
								"<tr id='messageNo-"+sm.no+"'>"+
								"<td class='text-center' style='vertical-align:middle'><span class='glyphicon glyphicon-envelope'></span></td>" +
								"<td class='text-center' style='vertical-align:middle' id='no-"+sm.to+"'><h4>"+emp.name+"</h4></td>"+
								"<td class='text-center' style='vertical-align:middle'><p>"+sm.contents+".</p></td>"+
								"<td class='text-center' style='vertical-align:middle'><p>"+sm.regdate+"</p></td>"+
								"</tr>"
							);
						}
					});
				});
			}
		});
		$.ajax({
			type:"GET",
			url:"/FinalProject/json/sendtotal/"+pno,
			dataType:"json",
			success:function(result){
				$navi.empty();
				if(pno > 1){
					$navi.append(
						"<li>"+
						"<span class='glyphicon glyphicon-menu-left' id='minus' ara-hidden='true'></span>"+
						"</li>"
					);				
				}
				$.each(result, function(index, page){
					var pNo = $('#pNo2').val();
					var no = index+1;
					if(page.beginPage<=no && index<page.endPage){
						if(no==pNo){
							$navi.append(
								"<li class='active'>"+
								"<span id='page-"+no+"' ara-hidden='true' >"+no+"</span>"+
								"</li>"
							);
						}else{
							$navi.append(
								"<li>"+
								"<span id='page-"+no+"' ara-hidden='true'>"+no+"</span>"+
								"</li>"
							);
						}
					}
					if(page.totalPages>1 && page.totalPages>pno && no==page.endPage){
						$navi.append(
							"<li>"+
							"<span class='glyphicon glyphicon-menu-right' id='plus' ara-hidden='true'></span>"+
							"</li>"
						);				
					}
				});
			}
		});
		$('#bodywritemessage').hide();
		$('#bodylist').hide();
		$('#bodyreceive').hide();
		$('#bodymessagedetail').hide();
		$('#bodysend').show();
	});
	$('#page2').on("click", "span[id^=page-]", function(){
		var nowpNo = $(this).attr("id").replace("page-","")
		$('#pNo2').val(nowpNo)
		$('#send').trigger("click"); 
	});
	$('#page2').on("click", "span[id^=plus]", function(){
		var nowpNo = $('#pNo2').val();
		var nextNo = parseInt(nowpNo)+1
		$('#pNo2').val(nextNo)
		$('#send').trigger("click"); 
	});
	$('#page2').on("click", "span[id^=minus]", function(){
		var nowpNo = $('#pNo2').val();
		var beforeNo = nowpNo-1
		$('#pNo2').val(beforeNo)
		$('#send').trigger("click"); 
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
					<input type="text" class="hidden" id="pNo" value="1" />
					<input type="text" class="hidden" id="pNo2" value="1" />
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
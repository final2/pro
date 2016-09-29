<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<!-- calendar css -->
<link rel="stylesheet" href="resources/fullcalendar/fullcalendar.css">
<script type="text/javascript" src="resources/jquery/moment.min.js"></script>
<script type="text/javascript" src="resources/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="resources/fullcalendar/locale-all.js"></script>
<script type="text/javascript">
$(function() {

	var loginUserNo = ${LoginUser.no}
	
	$("#calendar").fullCalendar({
		
		locale: 'ko',
		
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,listYear',
		},
		//저장된 일정 불러오기
		events:function(start, end, timezone, callback) {
			$.ajax({
				type:'GET',
				url:'json/calendar/' + loginUserNo,
				dataType:'json',
				success:function(data, text, request) {
					var events = [];
					$(data).each(function() {
						var empNo = $(this).attr('empNo');
							events.push({
								id: $(this).attr('empNo'),
								title: $(this).attr('title'),
								start: $(this).attr('startDate'),
								end: $(this).attr('endDate'),
							});
					});
					
					callback(events);
					
				}
			});
		}
	});
	
});
</script>
<style type="text/css">
#calendar .fc-sun {color:red;}
#calendar .fc-sat {color:blue;}
#calendar .holiday {color: red;}
</style>
<div id="calendar"></div>

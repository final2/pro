<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css"> -->
<!-- calendar css -->
<link rel="stylesheet" href="resources/fullcalendar/fullcalendar.css">
<!-- <link rel="stylesheet" href="resources/fullcalendar/fullcalendar.print.css"> -->
<!-- <script type="text/javascript" src="resources/jquery/jquery.js"></script> -->
<script type="text/javascript" src="resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="resources/jquery/moment.min.js"></script>
<script type="text/javascript" src="resources/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript">
$(function() {
	$("#calendar").fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,listYear'
		},
		defaultDate: '2016-09-12',
		navLinks: true, // can click day/week names to navigate views
		selectable: true,
		selectHelper: true,
		select: function(start, end) {
			var title = prompt('Event Title:');
			var eventData;
			if (title) {
				eventData = {
					title: title,
					start: start,
					end: end
				};
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			}
			$('#calendar').fullCalendar('unselect');
		},
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		

	});
	
	$("#calendar").fullcalendar('removeEvents');
});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>
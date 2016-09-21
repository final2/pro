<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<!-- calendar css -->
<link rel="stylesheet" href="resources/fullcalendar/fullcalendar.css">
<script type="text/javascript" src="resources/jquery/moment.min.js"></script>
<script type="text/javascript" src="resources/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="resources/fullcalendar/locale-all.js"></script>
<script type="text/javascript">
$(function() {
	$("#calendar").fullCalendar({
		
		locale: 'ko',
		
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,listYear',
		},
		
		defaultDate: '2016-09-12',
		/* navLinks: true, // can click day/week names to navigate views */
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
		eventMouseover: function(event, jsEvent, view) {
            if (view.name !== 'agendaDay') {
                $(jsEvent.target).attr('title', event.title);
            }
        },
        /* eventDestroy: function(event, element, view)
        {
            alert("removing stuff");
        },*/
        eventClick: function(calEvent, jsEvent, view)
        {
            var r=confirm("Delete " + calEvent.title);
            if (r===true)
              {
                  $('#calendar').fullCalendar('removeEvents', calEvent._id);
              }
        },
        resources: 'resources/json/events.json',
        /* eventRecive: function(event) {
        	var title = event.title;
        	var start = event.start.format("YYYY-MM-DD");
        	var end = event.end.format("YYYY-MM-DD");
        	$.ajax({
        		
        	});
        } */

	});
	
});
</script>
<style type="text/css">
#calendar .fc-sun {color:red;}
#calendar .fc-sat {color:blue;}
#calendar .holiday {color: red;}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>
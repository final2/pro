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
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	var loginUserNo = ${LoginUser.no}
	
	$("#calendar").fullCalendar({
		
		locale: 'ko',
		
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,listYear',
		},
		//defaultVie:'agendaWeek',
		//defaultDate: '2016-09-12',
		//저장된 일정 불러오기
		events:function(start, end, timezone, callback) {
			$.ajax({
				type:'GET',
				url:'json/calendar/' + loginUserNo,
				dataType:'json',
				success:function(data, text, request) {
					var events = [];
					$(data).each(function(index, calendar) {
						if(calendar.employee.no == loginUserNo) {	
							events.push({
								id: calendar.no,
								title: calendar.title,
								start: calendar.startDate,
								end: calendar.endDate,
								className: calendar.employee.no.toString(),
								editable:true,
								color : '#00ff7f'
							});
						} else {
							events.push({
								id: calendar.no,
								title: calendar.title,
								start: calendar.startDate,
								end: calendar.endDate,
								className: calendar.employee.no.toString()
								});
						}
					});
					callback(events);
					
				}
			});
		},
		
		/* navLinks: true, // can click day/week names to navigate views */
		selectable: true,
		selectHelper: true,
		//선택시 일정 추가 가능
		select: function(start, end, timezone, callback) {
			var title = prompt('Event Title:');
			if (title) {
				var eventData={};
				eventData['title'] = title;
				eventData['startDate'] = new Date(start);
				eventData['endDate'] = new Date(end);
				eventData['employee'] =  {'no':loginUserNo};
				var jsonData = JSON.stringify(eventData);
					$.ajax({
						type:"POST",
						url:'json/calendar/add',
						contentType:'application/json',
						data:jsonData,
						dataType:'json',
						success:function() {
							alert("add Successfully")
							$('#calendar').fullCalendar('refetchEvents');
						}
						/* success:function(data) {
							alert("add Succesfully")
							var events = [];
							/$(data).each(function(index, calendar) {
								events.push({
									id: calendar.no,
									title: calendar.title,
									start: calendar.startDate,
									end: calendar.endDate,
									className: calendar.employee.no,
									editable:true,
									allDay: allDay
								});
							});
							$('#calendar').fullCalendar('renderEvent', events, true); // stick? = true
						}	 */				
				});
			} 
				$('#calendar').fullCalendar('unselect');
		},
		//표시된 일정 변경 가능 여부
		//일정 옮기기
		eventDrop: function(event, delta, revertFunc) {
			if(loginUserNo != event.className) {
				alert("It is not your writed the Plan");
	            revertFunc();
			} 
			alert(event.title + " was dropped on " + event.start.format() + " ~ " + event.end.format());
			if (!confirm("Are you sure about this change?")) {
	            revertFunc();
	        }	
		
			var eventDatas = {};
			eventDatas['no'] = event.id;
			eventDatas['startDate'] = new Date(event.start);
			eventDatas['endDate'] = new Date(event.end);
			var jsonData = JSON.stringify(eventDatas);
			
			$.ajax({
				type:'POST',
				url:'json/calendar/update',
				contentType:'application/json',
				data:jsonData,
				dataType:'json',
				success:function(data) {
					alert("update Succesfully");
				}
			});
		},
		//일정 변경
		eventResize: function( event, delta, revertFunc, jsEvent, ui, view ) {
				if (loginUserNo != event.className) {				
				alert("It is not your writed the Plan");
				revertFunc();
			}
			alert(event.title + " end is now " + event.end.format());

	        if (!confirm("is this okay?")) {
	            revertFunc();
	        }
	        var eventDatas = {};
			eventDatas['no'] = event.id;
			eventDatas['startDate'] = event.start.format();
			eventDatas['endDate'] = event.end.format();
			var jsonData = JSON.stringify(eventDatas);
			
			$.ajax({
				type:'POST',
				url:'json/calendar/update',
				contentType:'application/json',
				data:jsonData,
				dataType:'json',
				success:function(data) {
					alert("update Succesfully");
				}
			});
		},
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
        eventClick: function(calEvent, jsEvent, view) {
        	if(calEvent.className != loginUserNo) {  		
        		alert("It is not your writed the Plan");
        		return false;
        	}
            var r=confirm("Do you really want to delete " + calEvent.title + " Plan ? ");
            if (r===true) {
            	$.ajax({
            		type:'POST',
            		url:'json/calendar/delete/' + calEvent.id,
            		dataType:'json',
            		success:function(data) {
            			alert("Removed Succesfully");
            		}
            	}); 
		        $('#calendar').fullCalendar('removeEvents', calEvent.id);
            }
        }

	});
	
});
</script>
<style type="text/css">
#calendar .fc-sun {color:red;}
#calendar .fc-sat {color:blue;}
#calendar .holiday {color: red;}
</style>
<title>Calendar</title>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>
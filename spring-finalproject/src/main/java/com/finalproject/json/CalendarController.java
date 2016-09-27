package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.dao.CalendarDao;
import com.finalproject.model.Calendar;

@Controller
public class CalendarController {

	@Autowired
	private CalendarDao calendarDao;
	
	@RequestMapping(value="/calendar/add", method=RequestMethod.POST) 
	public @ResponseBody List<Calendar> getCalendar(@RequestBody Calendar calendar) {
		System.out.println(calendar.getStartDate() + " " + calendar.getEndDate());
		return calendarDao.getCalendarList();
	}
}

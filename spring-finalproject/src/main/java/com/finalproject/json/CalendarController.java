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
	
	@RequestMapping(value="/calendar/", method=RequestMethod.GET)
	public @ResponseBody List<Calendar> getCalendarPlan() {
		return calendarDao.getCalendarList();
	}
	
	@RequestMapping(value="/calendar/add", method=RequestMethod.POST) 
	public @ResponseBody List<Calendar> addCalendarPlan(@RequestBody Calendar calendar) {
		calendarDao.insertCalendar(calendar);
		return calendarDao.getCalendarList();
	}
	
	@RequestMapping(value="/calendar/delete/{no}", method=RequestMethod.POST)
	public @ResponseBody void removeCalendarPlan(@RequestBody int no) {
		calendarDao.removeCalendar(no);
	}
	
	@RequestMapping(value="/calendar/update", method=RequestMethod.POST)
	public @ResponseBody void updateCalendarPlan(@RequestBody Calendar calendar) {
		calendarDao.updateCalendar(calendar);
	}
}

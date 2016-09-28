package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Calendar;

public interface CalendarDao {

	void insertCalendar(Calendar calendar);
	void removeCalendar(int no);
	void updateCalendar(Calendar calendar);
	List<Calendar> getCalendarList();
	
}

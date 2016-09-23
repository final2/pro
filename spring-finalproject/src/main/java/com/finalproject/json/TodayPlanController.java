package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.TodayPlanDao;
import com.finalproject.model.TodayPlan;

@RestController
public class TodayPlanController {
	
	@Autowired
	private TodayPlanDao todayDao;
	
	@RequestMapping(value="/todayplan/", method=RequestMethod.GET )
	public List<TodayPlan> todayPlan() {
		return todayDao.getTodayPlanList();
	}
}

package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.dao.TodayPlanDao;
import com.finalproject.model.TodayPlan;

@Controller
public class TodayPlanController {
	
	@Autowired
	private TodayPlanDao todayDao;
	
	@RequestMapping(value="/plan/now", method=RequestMethod.GET )
	public @ResponseBody List<TodayPlan> todayPlan() {
		return todayDao.getTodayPlanListByEmpNo(90000006);
	}
	@RequestMapping(value="/plan/new", method=RequestMethod.GET)
	public @ResponseBody List<TodayPlan> newPlan() {
		return todayDao.getNewPlanList(90000006);
	}
	
	@RequestMapping(value="/plan/date", method=RequestMethod.POST)
	public @ResponseBody List<TodayPlan> datePlan(@RequestBody TodayPlan todayPlan) {
		todayPlan.setEmpNo(90000006);
		return todayDao.getTodayPlanListByDate(todayPlan);
	}
	
	@RequestMapping(value="/plan/delete/{todayplanNo}", method=RequestMethod.DELETE)
	public @ResponseBody List<TodayPlan> deletePlan(@PathVariable int todayplanNo) {
		todayDao.removeTodayPlan(todayplanNo);
		return todayDao.getTodayPlanList();
	}
	
	@RequestMapping(value="/plan/update/{todayplanNo}", method=RequestMethod.POST)
	public @ResponseBody List<TodayPlan> successPlan(@PathVariable int todayplanNo) {
		todayDao.updateTodayPlan(todayplanNo);
		return todayDao.getTodayPlanList();
	}
	
	@RequestMapping(value="/plan/addPlan", method=RequestMethod.POST)
	public @ResponseBody List<TodayPlan> addPlan(@RequestBody TodayPlan todayPlan) {
		todayDao.addTodayPlan(todayPlan);
		return todayDao.getTodayPlanList();
	}
}

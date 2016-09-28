package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.dao.TodayPlanDao;
import com.finalproject.model.TodayPlan;

@Controller
public class TodayPlanController {
	
	@Autowired
	private TodayPlanDao todayDao;
	
	@RequestMapping(value="/plan/now/{empNo}", method=RequestMethod.POST )
	public @ResponseBody List<TodayPlan> todayPlan(@PathVariable int empNo ) {
		return todayDao.getTodayPlanListByEmpNo(empNo);
	}
	@RequestMapping(value="/plan/new/{empNo}", method=RequestMethod.GET)
	public @ResponseBody List<TodayPlan> newPlan(@PathVariable int empNo) {
		return todayDao.getNewPlanList(empNo);
	}
	
	@RequestMapping(value="/plan/date", method=RequestMethod.POST)
	public @ResponseBody List<TodayPlan> datePlan(@RequestBody TodayPlan todayPlan) {
		return todayDao.getTodayPlanListByDate(todayPlan);
	}
	
	@RequestMapping(value="/plan/delete", method=RequestMethod.DELETE)
	public @ResponseBody List<TodayPlan> deletePlan(@RequestBody TodayPlan todayPlan) {
		todayDao.removeTodayPlan(todayPlan.getNo());
		return todayDao.getTodayPlanListByEmpNo(todayPlan.getEmpNo());
	}
	
	@RequestMapping(value="/plan/update", method=RequestMethod.POST)
	public @ResponseBody List<TodayPlan> successPlan(@RequestBody TodayPlan todayPlan) {
		todayDao.updateTodayPlan(todayPlan.getNo());
		return todayDao.getTodayPlanListByEmpNo(todayPlan.getEmpNo());
	}
	
	@RequestMapping(value="/plan/addPlan", method=RequestMethod.POST)
	public @ResponseBody List<TodayPlan> addPlan(@RequestBody TodayPlan todayPlan) {
		todayDao.addTodayPlan(todayPlan);
		return todayDao.getTodayPlanListByEmpNo(todayPlan.getEmpNo());
	}
}

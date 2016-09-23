package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.TodayPlan;

public interface TodayPlanDao {

	//오늘의 할일 추가하기
	void addTodayPlan(TodayPlan todayPlan);
	//오늘의 할일 삭제하기
	void removeTodayPlan(TodayPlan todayPlan);
	//오늘의 할일 전체 조회하기
	List<TodayPlan> getTodayPlanList();
	//오늘의 할일 사원 번호별 조회하기
	List<TodayPlan> getTodayPlanListByEmpNo(int empNo);
}

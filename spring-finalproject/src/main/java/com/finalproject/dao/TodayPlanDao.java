package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.TodayPlan;

public interface TodayPlanDao {

	//오늘의 할일 추가하기
	void addTodayPlan(TodayPlan todayPlan);
	//오늘의 할일 삭제하기
	void removeTodayPlan(int no);
	//오늘의 할일 전체 조회하기
	List<TodayPlan> getTodayPlanList();
	//최근에 추가한 할 일 5개
	List<TodayPlan> getNewPlanList(int no);
	//오늘의 할일 사원번호별 조회하기
	List<TodayPlan> getTodayPlanListByEmpNo(int empNo);
	//오늘의 할일 사원 번호&날짜별 조회하기
	List<TodayPlan> getTodayPlanListByDate(TodayPlan todayPlan);
	//오늘의 할일 완료하기
	void updateTodayPlan(int no);
}

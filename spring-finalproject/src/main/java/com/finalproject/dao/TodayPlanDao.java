package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.TodayPlan;

public interface TodayPlanDao {

	//로그인 사원 오늘의 할일 추가하기
	void addTodayPlan(TodayPlan todayPlan);
	//로그인 사원 오늘의 할일 삭제하기
	void removeTodayPlan(int no);
	//로그인 사원 오늘 가장 최근 등록한 할 일 5개
	List<TodayPlan> getNewPlanList(int no);
	//로그인 사원 오늘의 할일 조회하기
	List<TodayPlan> getTodayPlanListByEmpNo(int empNo);
	//로그인 사원 오늘의 할일 날짜별 조회하기
	List<TodayPlan> getTodayPlanListByDate(TodayPlan todayPlan);
	//로그인 사원 오늘의 할일 완료하기
	void updateTodayPlan(int no);
}

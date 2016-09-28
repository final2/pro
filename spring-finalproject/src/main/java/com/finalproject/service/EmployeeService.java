package com.finalproject.service;

import java.util.List;

import com.finalproject.model.Branch;
import com.finalproject.model.Employee;

public interface EmployeeService {

	// 사원등록
	void insertEmployee(Employee emp);
	
	// 모든 사원 조회
	List<Employee> getAllEmployees();
	
	// 사원번호로 해당사원 조회
	Employee getEmployeeByNo(int empNo);
	
	// 사원번호로 담당지점 조회
	List<Branch> getBranchListByNo(int empNo);
	
	// 로그인 확인
	Employee empLogin(int empNo, String password);
	
	// 모든 지점 조회
	List<Branch> getAllBranch();
}

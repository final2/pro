package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Branch;
import com.finalproject.model.Employee;

public interface EmployeeDao {

	// 사원등록
	void insertEmployee(Employee emp);
	// 모든 사원 조회
	List<Employee> getAllEmployees();
	// 사원번호로 해당사원 조회
	Branch getEmployeeByNo(int no);
	// 로그인시 사원번호 확인
	Employee loginByNo(int no);
	// 모든 지점 조회
	List<Branch> getAllBranch();

}
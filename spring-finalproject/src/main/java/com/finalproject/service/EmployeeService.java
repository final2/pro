package com.finalproject.service;

import java.util.List;

import com.finalproject.model.AccountBook;
import com.finalproject.model.Branch;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.Employee;
import com.finalproject.model.RegisterEmp;

public interface EmployeeService {

	// 현재 사원번호 확인하기
	int empSeqCheck();
	
	// 사원등록
	void registerEmployee(Employee emp);
	
	// 모든 사원 조회
	List<Employee> getAllEmployees();
	
	// 사원번호로 해당사원 조회
	Employee getEmployeeByNo(int empNo);
	
	// 사원 급여대장 등록
	void insertSalary(AccountBook accountBook);
	
	
	// 로그인 확인
	Employee empLogin(int empNo, String password);
	// 로그아웃
	void empLogout(int empNo);
	
	
	// 지점 등록
	void insertBranch(Branch branch);
	
	// 모든 지점 조회
	List<Branch> getAllBranch();
	
	// 담당자와 모든 지점 조회
	List<Branch> getAllBranchByEmp();
	
	// 지점명으로 지점번호 조회
	Branch getBranchByBranchNo(int branchNo);
	
	// 지점 사원 등록
	void insertBranchEmp(BranchEmp branchEmp);
}

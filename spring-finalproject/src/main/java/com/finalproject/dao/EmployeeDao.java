package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.AccountBook;
import com.finalproject.model.Branch;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.Career;
import com.finalproject.model.Employee;

public interface EmployeeDao {

	// 현재 사원번호 확인하기
	int empSeqCheck();
	// 사원등록시 사원정보 등록
	void insertEmployee(Employee emp);
	// 사원등록시 사원학력 등록
	void insertCareer(Career career);
	// 사원 급여대장 등록
	void insertSalary(AccountBook accountBook);
	
	// 모든 사원 조회
	List<Employee> getAllEmployees();
	// 사원번호로 해당사원 조회
	Employee getEmployeeByNo(int empNo);
	//List<Branch> getBranchListByEmpNo(int empNo);
	
	// 로그인시 사원번호 확인
	Employee loginByNo(int empNo);
	// 로그인 상태로 변경
	void loginStateByNo(int empNo);
	// 로그아웃 상태로 변경
	void logoutstateByNo(int empNo);
	
	
	// 지점 등록
	void insertBranch(Branch branch);
	// 모든 지점 조회
	List<Branch> getAllBranch();
	// 담당자와 같이 모든지점 조회
	List<Branch> getAllBranchByEmp();
	// 지점번호로 지점 조회
	Branch getBranchByBranchNo(int branchNo);
	
	// 지점사원 등록
	void insertBranchEmp(BranchEmp branchEmp);
}
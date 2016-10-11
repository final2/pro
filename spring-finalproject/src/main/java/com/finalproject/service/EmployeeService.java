package com.finalproject.service;

import java.util.List;

import com.finalproject.model.AccountBook;
import com.finalproject.model.Branch;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.Career;
import com.finalproject.model.Criteria;
import com.finalproject.model.Employee;
import com.finalproject.model.EmployeeDetail;
import com.finalproject.model.Languages;
import com.finalproject.model.Licenses;
import com.finalproject.model.RegisterEmp;

public interface EmployeeService {

	// 현재 사원번호 확인하기
	int empSeqCheck();
	
	// 사원등록
	void registerEmployee(Employee emp, List<Career> careerList, List<Licenses> licensesList, List<Languages> languageList);
	
	// 사원 급여대장 등록
	void insertSalary(AccountBook accountBook);
	
	// 모든 사원 조회
	List<Employee> getAllEmployees();
	// 모든 사원 조회
	List<Employee> getEmployees(Criteria criteria);
	
	// 사원 리스트 갯수 확인
	int getTotalEmpRows(Criteria criteria);
	
	// 사원번호로 해당사원 조회
	EmployeeDetail getEmployeeByEmpNo(int empNo);
	
	// 급여리스트 조회
	List<AccountBook> getAccountBooks(Criteria criteria);
	// 급여리스트 갯수 확인
	int getTotalSalaryRows(Criteria criteria);
	
	// 로그인 확인
	Employee empLogin(int empNo, String password);
	// 로그아웃
	void empLogout(int empNo);
	
	// 사원정보 수정
	void updateEmployee(Employee emp);
	
	
	// 지점 등록
	void insertBranch(Branch branch);
	
	// 모든 지점 조회
	List<Branch> getAllBranch();
	// 모든 지점 조회
	List<Branch> getBranch(Criteria criteria);
	// 지점 리스트 갯수 확인
	int getTotalBranchRows(Criteria criteria);
	
	// 담당자와 모든 지점 조회
	List<Branch> getAllBranchByEmp();
	
	// 지점명으로 지점번호 조회
	Branch getBranchByBranchNo(int branchNo);
	
	// 지점정보 수정
	void updateBranch(Branch branch);
	
	// 지점 사원 등록
	void insertBranchEmp(BranchEmp branchEmp);
	
	// 지점번호로 지점사원 조회
	List<BranchEmp> getBranchEmpByNo(int branchNo);
	
	// 지점사원번호로 지점사원 조회
	BranchEmp getBranchEmpByBrEmpNo(int brEmpNo);
	
	
}

package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.AccountBook;
import com.finalproject.model.Branch;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.Career;
import com.finalproject.model.Criteria;
import com.finalproject.model.Employee;
import com.finalproject.model.Languages;
import com.finalproject.model.Licenses;
import com.finalproject.model.WorkTime;

public interface EmployeeDao {

	// 현재 사원번호 확인하기
	int empSeqCheck();
	// 사원등록시 사원정보 등록
	void insertEmployee(Employee emp);
	// 사원등록시 사원학력 등록
	void insertAddCareer(Career career);
	// 사원등록시 사원자격증 등록
	void insertAddLicenses(Licenses license);
	// 사원등록시 사원어학능력 등록
	void insertAddLanguages(Languages language);
	// 사원 급여대장 등록
	void insertSalary(AccountBook accountBook);
	
	// 모든 사원 조회
	List<Employee> getAllEmployees();
	// 모든 사원 조회
	List<Employee> getEmployees(Criteria criteria);
	// 모든 사원 행 수
	int getTotalEmpRows(Criteria criteria);
	
	// 해당 사원정보 수정
	void updateEmployee(Employee emp);
	
	// 사원번호로 해당사원 조회
	Employee getEmployeeByNo(int empNo);
	// 사원번호로 학력 조회
	List<Career> getCareerListByNo(int empNo);
	// 사원번호로 자격증 조회
	List<Licenses> getLicenseListByNo(int empNo);
	// 사원번호로 어학능력 조회
	List<Languages> getLanguageListByNo(int empNo);
	
	//List<Branch> getBranchListByEmpNo(int empNo);
	
	// 급여리스트 조회
	List<AccountBook> getAccountBooks(Criteria criteria);
	// 급여 리스트 갯수 조회
	int getTotalSalaryRows(Criteria criteria);
	// 부서이름으로 해당 사원 조회
	List<Employee> getEmployeeByDept(String dept);
	// 사원번호로 급여와 근태조회
	WorkTime getEmpWorkTimeByNo(int empNo);
	
	// 근태리스트 조회
	List<WorkTime> getTimetable(Criteria criteria);
	// 사원번호로 근태리스트 조회
	List<WorkTime> getTimetableByNo(Criteria criteria);
	// 근태 리스트 갯수 조회
	int getTotalTimetablerows(Criteria criteria);
	// 출근시간 기록하기
	void attendanceByNo(WorkTime workTime);
	// 출근시간 가져오기
	WorkTime getAttendanceByNo(int empNo);
	// 퇴근시간 기록하기
	void leavByNo(WorkTime workTime);
	
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
	// 모든 지점 조회
	List<Branch> getBranch(Criteria criteria);
	// 모든 지점 행 수
	int getTotalBranchRows(Criteria criteria);
	
	// 담당자와 같이 모든지점 조회
	List<Branch> getAllBranchByEmp();
	// 지점번호로 지점 조회
	Branch getBranchByBranchNo(int branchNo);
	// 지점정보 수정
	void updateBranch(Branch branch);
	
	// 지점사원 등록
	void insertBranchEmp(BranchEmp branchEmp);
	// 지점 번호로 해당 지점 사원 조회
	List<BranchEmp> getBranchEmpByNo(int branchNo);
	// 지점사원번호로 지점 사원 조회
	BranchEmp getBranchEmpByBrEmpNo(int brEmpNo);
}
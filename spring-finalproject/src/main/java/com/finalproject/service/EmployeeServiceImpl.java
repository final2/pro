package com.finalproject.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.web.multipart.MultipartRequest;

import com.finalproject.dao.EmployeeDao;
import com.finalproject.model.AccountBook;
import com.finalproject.model.Branch;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.Career;
import com.finalproject.model.Employee;
import com.finalproject.model.RegisterEmp;


@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired private EmployeeDao empDao;
	
	@Override
	public int empSeqCheck() {
		int empNo = empDao.empSeqCheck(); 
		return empNo;
	}
	
	@Override
	public void registerEmployee(Employee emp) {
		empDao.insertEmployee(emp);
	}
	
	@Override
	public void insertSalary(AccountBook accountBook) {
		empDao.insertSalary(accountBook);
	}
	
	@Override
	public List<Employee> getAllEmployees() {
		List<Employee> empList = empDao.getAllEmployees();
		return empList;
	}

	@Override
	public Employee getEmployeeByNo(int empNo) {
		Employee emp = empDao.getEmployeeByNo(empNo);
		if (emp.getRetireDate() == null) {
						
			emp.setWorkingStatus("재직");
		}
		
		return emp;
		
	}
	
	@Override
	public List<Branch> getAllBranch() {
		List<Branch> branchNames = empDao.getAllBranch();
		return branchNames;
	}
	
	@Override
	public List<Branch> getAllBranchByEmp() {
		List<Branch> branchList = empDao.getAllBranchByEmp();
		return branchList;
	}
	
	@Override
	public Branch getBranchByBranchNo(int branchNo) {
		Branch branch = empDao.getBranchByBranchNo(branchNo);
		return branch;
	}
	
	@Override
	public void insertBranchEmp(BranchEmp branchEmp) {
		empDao.insertBranchEmp(branchEmp);
	}
	
	@Override
	public void empLogout(int empNo) {
		empDao.logoutstateByNo(empNo);
	}
	
	@Override
	public Employee empLogin(int empNo, String password) {
				
		empDao.loginStateByNo(empNo);
		
		Employee savedEmp = empDao.loginByNo(empNo);
		
		if (savedEmp == null) {
			throw new RuntimeException("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		
		
		String secretPassword = DigestUtils.md5DigestAsHex(password.getBytes());
		if (!savedEmp.getPassword().equals(secretPassword)) {
			throw new RuntimeException("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		return savedEmp;
	}
	
	@Override
	public void insertBranch(Branch branch) {
		empDao.insertBranch(branch);
	}

}

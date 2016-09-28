package com.finalproject.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.finalproject.dao.EmployeeDao;
import com.finalproject.model.Branch;
import com.finalproject.model.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired private EmployeeDao empDao;
	
	@Override
	public void insertEmployee(Employee emp) {
		String secretPassword = DigestUtils.md5DigestAsHex(emp.getPassword().getBytes());
		emp.setPassword(secretPassword);
		empDao.insertEmployee(emp);
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
	public List<Branch> getBranchListByNo(int empNo) {
		List<Branch> empBranchList = empDao.getBranchListByNo(empNo);
		return empBranchList;
		
	}
	
	@Override
	public Employee empLogin(int empNo, String password) {
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
	public List<Branch> getAllBranch() {
		List<Branch> branchNames = empDao.getAllBranch();
		return branchNames;
	}
	
	

}

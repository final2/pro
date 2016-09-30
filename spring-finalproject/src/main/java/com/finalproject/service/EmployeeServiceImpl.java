package com.finalproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.finalproject.dao.EmployeeDao;
import com.finalproject.model.Branch;
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
	public void registerEmployee(RegisterEmp regEmp) {
		String secretPassword = DigestUtils.md5DigestAsHex(regEmp.getPassword().getBytes());
		
		int empNo = empDao.empSeqCheck();
				
		Employee emp = new Employee();
		emp.setNo(empNo);
		emp.setPassword(secretPassword);
		emp.setName(regEmp.getName());
		emp.setPhone(regEmp.getPhone());
		emp.setBirth(regEmp.getBirth());
		emp.setSalary(regEmp.getSalary());
		emp.setDept(regEmp.getDept());
		emp.setPosition(regEmp.getPosition());
		emp.setAddress(regEmp.getAddress());
		
		empDao.insertEmployee(emp);
		
		
		List<Career> careeres = new ArrayList<>();

		System.out.println(regEmp.getCareer());
		
		for (String c : regEmp.getCareer()) {
			Career career = new Career();
			/*career.setNo(c[0]);
			career.setSchool(c.indexOf("1"));
			career.setMajor(c.indexOf("2"));
			career.setEmpNo(c.indexOf("3"));*/
		}
		
		//empDao.insertCareer(career);
		
		
				
		
		
		
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

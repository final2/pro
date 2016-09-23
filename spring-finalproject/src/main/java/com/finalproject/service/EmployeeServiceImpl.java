package com.finalproject.service;

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
		empDao.insertEmployee(emp);
	}

	@Override
	public List<Employee> getAllEmployees() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee getEmployeeByNo(int no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Employee empLogin(int no, String password) {
		Employee savedEmp = empDao.getEmployeeByNo(no);
	
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
		// TODO Auto-generated method stub
		return null;
	}

}

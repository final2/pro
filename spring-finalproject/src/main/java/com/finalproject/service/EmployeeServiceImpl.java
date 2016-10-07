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
import com.finalproject.model.EmployeeDetail;
import com.finalproject.model.Languages;
import com.finalproject.model.Licenses;
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
	public void registerEmployee(Employee emp, List<Career> careerList, List<Licenses> licensesList,
			List<Languages> languageList) {
		
		int seq = empDao.empSeqCheck();
		
		emp.setNo(seq);
		empDao.insertEmployee(emp);
		
		for (Career career : careerList) {
			career.setEmpNo(seq);
			empDao.insertAddCareer(career);
		}
		
		for (Licenses license : licensesList) {
			license.setEmpNo(seq);
			empDao.insertAddLicenses(license);
		}
		
		for (Languages language : languageList) {
			language.setEmpNo(seq);
			empDao.insertAddLanguages(language);
		}
		
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
	public EmployeeDetail getEmployeeByEmpNo(int empNo) {
		
		EmployeeDetail empDetail = new EmployeeDetail();
		
		Employee emp = empDao.getEmployeeByNo(empNo);
		List<Career> careerList = empDao.getCareerListByNo(empNo);
		List<Licenses> licenseList = empDao.getLicenseListByNo(empNo);
		List<Languages> languageList = empDao.getLanguageListByNo(empNo);
		
		if (emp.getRetireDate() == null) {
						
			emp.setWorkingStatus("재직");
		}
		
		empDetail.setEmp(emp);
		empDetail.setCareerList(careerList);
		empDetail.setLicenseList(licenseList);
		empDetail.setLanguageList(languageList);
		
		return empDetail;
		
	}
	
	@Override
	public void insertBranch(Branch branch) {
		empDao.insertBranch(branch);
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
	

}

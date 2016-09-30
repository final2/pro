package com.finalproject.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.model.Branch;
import com.finalproject.model.Employee;
import com.finalproject.model.EmployeeLoginCheck;
import com.finalproject.model.RegisterEmp;
import com.finalproject.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired private EmployeeService empService;

	
	// 본사 로그인페이지
	@RequestMapping(value="/companylogin.do", method=RequestMethod.GET)
	public String compLoginForm() {
		return "employees/companyloginform";
	}	
	
	@RequestMapping(value="/companylogin.do", method=RequestMethod.POST)
	public String compLogin(EmployeeLoginCheck employee, HttpSession session) {
		
		Employee emp = empService.empLogin(employee.getNo(), employee.getPassword());
		session.setAttribute("LoginUser", emp);
		return "redirect:/notice.do";
	}
	
	@RequestMapping("/emplist.do")
	public String empList(Model model) {
		
		List<Employee> empList = empService.getAllEmployees();
		model.addAttribute("empList", empList);
		System.out.println(empList);
		
		return "employees/emplist";
	}
	
	@RequestMapping("/empdetail.do")
	public String empDetail(@RequestParam(name="no") int empNo, Model model) {
		
		Employee emp = empService.getEmployeeByNo(empNo);
		List<Branch> branchs = empService.getBranchListByNo(empNo);
		
		model.addAttribute("emp", emp);
		System.out.println(emp);
		model.addAttribute("branchs", branchs);
		
		return "employees/empdetail";
	}

	// 사원등록 페이지 연결
	@RequestMapping(value="/insertemp.do", method=RequestMethod.GET)
	public String insertEmpForm(Model model) {
		
		int empNo = empService.empSeqCheck();
		model.addAttribute("empNo", empNo);
		/*List<Branch> branchNames = empService.getAllBranch();
		model.addAttribute("branchNames", branchNames);
		*/
		return "employees/insertempform";
	}
	
	@RequestMapping(value="/insertemp.do", method=RequestMethod.POST)
	public String insertEmp(RegisterEmp regEmp) {
		
		System.out.println(regEmp);
		empService.registerEmployee(regEmp);
		
		return "redirect:/emplist.do";
	}
	
}

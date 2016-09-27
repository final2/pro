package com.finalproject.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalproject.model.Branch;
import com.finalproject.model.Employee;
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
	public String compLogin(Employee employee, HttpSession session) {
		System.out.println("no:" + employee.getNo()); 
		System.out.println("pwd:" + employee.getPassword()); 
		
		Employee emp = empService.empLogin(employee.getNo(), employee.getPassword());
		session.setAttribute("LoginUser", emp);
		return "redirect:/notice.do";
	}
	
	@RequestMapping("/emplist.do")
	public String empList(Model model) {
		
		List<Employee> empList = empService.getAllEmployees();
		model.addAttribute("empList", empList);
		
		return "employees/emplist";
	}

	// 사원등록 페이지 연결
	@RequestMapping(value="/insertemp.do", method=RequestMethod.GET)
	public String insertEmpForm() {
		return "employees/insertempform";
	}
	
	@RequestMapping(value="/insertemp.do", method=RequestMethod.POST)
	public String inserEmp(Employee emp) {
		empService.insertEmployee(emp);
		return "redirect:/emplist.do";
	}
	
}

package com.finalproject.web;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.model.AccountBook;
import com.finalproject.model.Branch;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.Career;
import com.finalproject.model.Employee;
import com.finalproject.model.EmployeeDetail;
import com.finalproject.model.EmployeeLoginCheck;
import com.finalproject.model.Languages;
import com.finalproject.model.Licenses;
import com.finalproject.model.RegisterEmp;
import com.finalproject.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired private EmployeeService empService;

	
	@ExceptionHandler(RuntimeException.class)
	public String runtimeExceptionHandler(RuntimeException ex) {
		ex.printStackTrace();
		return "employees/error/error";
	}
	
	
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
	
	@RequestMapping(value="/company/logout.do")
	public String logout(HttpSession session) {
		
		Employee emp = (Employee)session.getAttribute("LoginUser");
		empService.empLogout(emp.getNo());
		
		session.invalidate();
		
		return "redirect:/companylogin.do";
	}
	
	@RequestMapping(value="/myprofile.do")
	public String myEmpDetail (HttpSession session, Model model ) {
		
		Employee emp = (Employee)session.getAttribute("LoginUser");
		EmployeeDetail empDetail = empService.getEmployeeByEmpNo(emp.getNo());
		
		model.addAttribute("empDetail", empDetail);
		
		return "employees/empdetail";
		
	}
	
	// 사원등록 페이지 연결
	@RequestMapping(value="/insertemp.do", method=RequestMethod.GET)
	public String insertEmpForm(Model model, HttpSession session) {
		
		Employee emp = (Employee)session.getAttribute("LoginUser");
		
		if (!emp.getDept().equals("HR") ) {
			
			throw new RuntimeException("사원등록은 인사관리 부서만 접근 가능합니다.");
		}
		
		int empNo = empService.empSeqCheck();
		model.addAttribute("empNo", empNo);
		List<Branch> branchNames = empService.getAllBranch();
		model.addAttribute("branchNames", branchNames);
		
		return "employees/insertempform";
	}
	
	@RequestMapping(value="/insertemp.do", method=RequestMethod.POST)
	public String insertEmp(RegisterEmp regEmp, @RequestParam("photo") MultipartFile upfile) throws Exception {
		
		String secretPassword = DigestUtils.md5DigestAsHex(regEmp.getPassword().getBytes());

		Employee emp = new Employee();
		emp.setPassword(secretPassword);
		emp.setName(regEmp.getName());
		emp.setPhone(regEmp.getPhone());
		emp.setBirth(regEmp.getBirth());
		emp.setEmail(regEmp.getEmail());
		emp.setSalary(regEmp.getSalary());
		emp.setDept(regEmp.getDept());
		emp.setPosition(regEmp.getPosition());
		emp.setAddress(regEmp.getAddress());
		
		if (!upfile.isEmpty()) {
			
			Files.copy(upfile.getInputStream(), Paths.get("C:\\Users\\yun\\git\\pro\\spring-finalproject\\src\\main\\webapp\\resources\\image\\empimg", upfile.getOriginalFilename()));
			
			emp.setPhoto(upfile.getOriginalFilename());
		
		} 
		
		List<Career> careerList = new ArrayList<>();
		
		for (int i=0; i<regEmp.getSchools().length; i++) {
			Career career = new Career();
			career.setSchool(regEmp.getSchools()[i]);
			career.setMajor(regEmp.getMajors()[i]);
			
			careerList.add(career);
		}
		
		List<Licenses> licensesList = new ArrayList<>();
		
		for (int i=0; i<regEmp.getLicenses().length; i++) {
			Licenses license = new Licenses();
			license.setLicense(regEmp.getLicenses()[i]);
			license.setLicenseOffice(regEmp.getLicenseOffices()[i]);
			
			licensesList.add(license);
		}
		
		List<Languages> languageList = new ArrayList<>();

		for (int i=0; i<regEmp.getLanguages().length; i++) {
			Languages language = new Languages();
			language.setLanguage(regEmp.getLanguages()[i]);
			language.setGrade(regEmp.getGrades()[i]);
			
			languageList.add(language);
		}
		
		empService.registerEmployee(emp, careerList,  licensesList, languageList);
		
		return "redirect:/emplist.do";
	}
	
	@RequestMapping(value="/emplist.do")
	public String empList(Model model) {
		
		List<Employee> empList = empService.getAllEmployees();
		model.addAttribute("empList", empList);
		
		return "employees/emplist";
	}
	
	@RequestMapping(value="/empdetail.do")
	public String empDetail(@RequestParam(name="no") int empNo, Model model) {
		
		EmployeeDetail empDetail = empService.getEmployeeByEmpNo(empNo);
		model.addAttribute("empDetail", empDetail);
		
		return "employees/empdetail";
	}
	
	@RequestMapping(value="/empupdate.do", method=RequestMethod.GET)
	public String empUpdateForm(@RequestParam(name="no") int empNo, Model model) {
		
		EmployeeDetail empDetail = empService.getEmployeeByEmpNo(empNo);
		model.addAttribute("empDetail", empDetail);
		
		return "employees/updateempform";
	}
	
	@RequestMapping(value="/empupdate.do", method=RequestMethod.POST)
	public String empUpdate(EmployeeDetail empDetail) {
		
		return "redirect:/empdetail.do";
	}
	
	
	@RequestMapping(value="/insertbranch.do", method=RequestMethod.GET)
	public String insertBranchForm(Model model) {
		
		List<Employee> empList = empService.getAllEmployees();
		model.addAttribute("empList", empList);
		
		return "employees/insertbranchform";
	}
	
	
	@RequestMapping(value="/insertbranch.do", method=RequestMethod.POST)
	public String insertBranch(Branch branch, @RequestParam("img") MultipartFile upfile) throws Exception {
		
		if (!upfile.isEmpty()) {
			
			Files.copy(upfile.getInputStream(), Paths.get("C:\\Users\\yun\\git\\pro\\spring-finalproject\\src\\main\\webapp\\resources\\image\\branchimg", upfile.getOriginalFilename()));
			
			branch.setImg(upfile.getOriginalFilename());
		
		} 
		
		empService.insertBranch(branch);
		
		return "redirect:/compbranchlist.do";
	}
	
	@RequestMapping(value="/compbranchlist.do")
	public String branchList(Model model) {
		
		List<Branch> branchList = empService.getAllBranchByEmp();
		
		model.addAttribute("branchList", branchList);
		
		return "employees/branchlist"; 
		
	}
	
	@RequestMapping(value="/compbranchdetail.do")
	public String branchDetail(@RequestParam(name="no") int branchNo, Model model) {
		Branch branch = empService.getBranchByBranchNo(branchNo);
		
		model.addAttribute("branch", branch);
		
		return "employees/branchdetail";
	}
	
	@RequestMapping(value="/insertbranchemp.do", method=RequestMethod.GET)
	public String insertBranchEmpForm(Model model) {
		List<Branch> branchList = empService.getAllBranch();
		model.addAttribute("branchList", branchList);
		return "employees/insertbranchempform";
	}
	
	@RequestMapping(value="/insertbranchemp.do", method=RequestMethod.POST)
	public String insertBranchEmp(BranchEmp branchEmp) {
		empService.insertBranchEmp(branchEmp);
		return "redirect:/branchemplist";
	}
	
	@RequestMapping(value="/insertsalary.do", method=RequestMethod.GET)
	public String insertSalaryForm(Model model) {
		List<Employee> empList = empService.getAllEmployees();
		model.addAttribute("empList", empList);
		
		return "employees/insertsalaryform";
	}
	
	@RequestMapping(value="/insertsalary.do", method=RequestMethod.POST)
	public String insertSalary(AccountBook accountBook) {
		//empService.
		return "redirect:/insertsalarylist";
	}
}

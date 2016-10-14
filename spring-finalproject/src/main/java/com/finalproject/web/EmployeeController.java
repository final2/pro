package com.finalproject.web;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.dao.EmployeeDao;
import com.finalproject.model.AccountBook;
import com.finalproject.model.Branch;
import com.finalproject.model.BranchAddForm;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.BranchEmpAddForm;
import com.finalproject.model.Career;
import com.finalproject.model.Criteria;
import com.finalproject.model.Employee;
import com.finalproject.model.EmployeeDetail;
import com.finalproject.model.EmployeeLoginCheck;
import com.finalproject.model.Languages;
import com.finalproject.model.Licenses;
import com.finalproject.model.PageVo;
import com.finalproject.model.RegisterEmp;
import com.finalproject.model.WorkTime;
import com.finalproject.model.WorkingStateBrEmp;
import com.finalproject.service.EmployeeService;



@Controller
public class EmployeeController {

	@Autowired private EmployeeService empService;
	@Autowired private EmployeeDao empDao;

	@Value("${emp.image.file.path}")
	String imageDirectory;
	
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
		
		return "employees/myempdetail";
		
	}
	
	@RequestMapping(value="/changepassword.do", method=RequestMethod.POST)
	public String myChangePwd(String password, HttpSession session) {
		Employee emp = (Employee)session.getAttribute("LoginUser");
		
		Employee chahgeemp = new Employee();
		chahgeemp.setNo(emp.getNo());
		chahgeemp.setPassword(password);
		
		System.out.println(chahgeemp);
		//empService.updateEmployeePwd(chahgeemp);
		return null;
		//return "redirect:/companylogin.do"; 
	}
	
	@RequestMapping(value="/mycompsalary.do")
	public String salaryList(HttpSession session, Criteria criteria, @RequestParam(name="pno", required=false, defaultValue="1") int pageNo, Model model) {
		
		Employee emp = (Employee)session.getAttribute("LoginUser");
		
		if (pageNo < 1) {
			return "redirect:/compsalary.do?pno=1";
		}
		
		int rows = 10;
		int pages = 5;
		int beginIndex = (pageNo - 1) * rows + 1;
		int endIndex = pageNo * rows;
		
		int totalRows = empService.getTotalSalaryRows(criteria);
		
		PageVo pagination = new PageVo(rows, pages, pageNo, totalRows);
		
		if(pageNo > pagination.getTotalPages()) {
			return "redirect:/compsalary.do?pno=" + pagination.getTotalPages();
		}
		
		criteria.setBeginIndex(beginIndex);
		criteria.setEndIndex(endIndex);
		
		List<AccountBook> accountBookList = empService.getAccountBooks(criteria);

		List<AccountBook> myAccountBookList = new ArrayList<>();
		
		for (AccountBook ab : accountBookList) {
			if (ab.getEmp().getNo() == emp.getNo()) {
				AccountBook accountBook = new AccountBook();
				Employee employee = new Employee();
				accountBook.setNo(ab.getNo());
				accountBook.setPaymentDate(ab.getPaymentDate());
				accountBook.setSalary(ab.getSalary());
				accountBook.setOvertime(ab.getOvertime());
				accountBook.setInsureHealth(ab.getInsureHealth());
				accountBook.setInsureLonghealth(ab.getInsureLonghealth());
				accountBook.setInsureSocial(ab.getInsureSocial());
				accountBook.setEmployeeInsure(ab.getEmployeeInsure());
				employee.setNo(ab.getEmp().getNo());
				employee.setName(ab.getEmp().getName());
				accountBook.setEmp(employee);
				
				myAccountBookList.add(accountBook);
			}
		}
		
		model.addAttribute("salaryList", myAccountBookList);
		model.addAttribute("navi", pagination);
		
		return "employees/mysalarylist";
	}
	
	@RequestMapping(value="/mycompattendance.do")
	public String myAttendanceListForm(Criteria criteria, Model model, HttpSession session) {
		
		Employee emp = (Employee)session.getAttribute("LoginUser");
		
		SimpleDateFormat DateFormat = new SimpleDateFormat ("yyyy-MM-dd");
		Date now = new Date();
		String today = DateFormat.format (now);
		
		
		String year = today.substring(0, 4);
		String month = today.substring(5, 7);
		String day = today.substring(8);
		int dd = Integer.parseInt(month)+1;
		String nextMonth = String.valueOf(dd);
		String beginDate = year + "-" + month + "-" + "01";
		String endDate = year + "-" + nextMonth + "-" + "01";
		
		criteria.setBeginDate(beginDate);
		criteria.setEndDate(endDate);
		criteria.setEmpNo(emp.getNo());
		
		
		List<WorkTime> workTimeList = empService.getTimetableByNo(criteria);
		
		model.addAttribute("workTimeList", workTimeList);
		
		return "employees/myattendancelist";
	}
	
	@RequestMapping(value="/mytimetable.do")
	public String myTimetableForm(Criteria criteria, Model model, HttpSession session,
			@RequestParam(name="month") String selectMonth) {
		
		Employee emp = (Employee)session.getAttribute("LoginUser");
		
		SimpleDateFormat DateFormat = new SimpleDateFormat ("yyyy-MM-dd");
		Date now = new Date();
		String today = DateFormat.format (now);
		
		
		String year = today.substring(0, 4);
		int nm = Integer.parseInt(selectMonth) + 1;
		String nextMonth = String.valueOf(nm);
		String beginDate = year + "-" + selectMonth + "-" + "01";
		System.out.println("지정달:" + beginDate);
		String endDate = year + "-" + nextMonth + "-" + "01";

		criteria.setBeginDate(beginDate);
		criteria.setEndDate(endDate);
		criteria.setEmpNo(emp.getNo());
		
		
		List<WorkTime> workTimeList = empService.getTimetableByNo(criteria);
		
		model.addAttribute("workTimeList", workTimeList);
		
		return "employees/myattendancelist";
	}
	
	@RequestMapping(value="/myattendance.do")
	public String myAttendance(Criteria criteria, Model model, HttpSession session, 
			@RequestParam("work") String work) throws Exception{
		
		Employee emp = (Employee)session.getAttribute("LoginUser");
		
		if (work.equals("attendance")) {
			WorkTime workTime = new WorkTime();
			Employee employee = new Employee();
			
			employee.setNo(emp.getNo());
			workTime.setEmp(employee);
			
			empService.attendanceByNo(workTime);
		}
		
		if (work.equals("leav")) {
			WorkTime workTime = new WorkTime();
			Employee employee = new Employee();

			WorkTime wk = empService.getAttendanceByNo(emp.getNo());

			SimpleDateFormat timeFormat = new SimpleDateFormat("HHmm");
			Date leav = new Date();
			String attTime = timeFormat.format(wk.getAttendance());
			String leavTime = timeFormat.format(leav);
			
			
			int athh = Integer.parseInt(attTime.substring(0, 2));
			int atmm = Integer.parseInt(attTime.substring(2, 4));
			
			int lthh = Integer.parseInt(leavTime.substring(0, 2));
			int ltmm = Integer.parseInt(leavTime.substring(2, 4));
			
			int attTimeNum = Integer.parseInt(attTime);
			int leavTimeNum = Integer.parseInt(leavTime);
					
			if (attTimeNum >= 900) {
				workTime.setLate("1");
				int workt = (lthh - athh) * 60 + ltmm - atmm;
				if (workt >= 540) {
					int overtime = workt - 540;
					workTime.setOvertime(overtime);
					workTime.setEarlyleave("0");
				} else {
					workTime.setEarlyleave("1");
					workTime.setOvertime(0);
				}	

			} else {
				workTime.setLate("0");
				int workt = (lthh - athh) * 60 + ltmm + 60 - atmm;
				if (workt >= 540) {
					int overtime = workt - 540;
					workTime.setOvertime(overtime);
					workTime.setEarlyleave("0");
				} else {
					workTime.setEarlyleave("1");
					workTime.setOvertime(0);
				}

			}
			
			employee.setNo(emp.getNo());
			workTime.setEmp(employee);
			workTime.setLeaving(leav);
			
			empService.leavByNo(workTime);
			
		}
		
		SimpleDateFormat DateFormat = new SimpleDateFormat ("yyyy-MM-dd");
		Date now = new Date();
		String today = DateFormat.format (now);
		
		
		String year = today.substring(0, 4);
		String month = today.substring(5, 7);
		String day = today.substring(8, 10);
		int dd = Integer.parseInt(month)+1;
		String nextMonth = String.valueOf(dd);
		String beginDate = year + month + "01";
		String endDate = year + nextMonth + "01";
		
		criteria.setBeginDate(beginDate);
		criteria.setEndDate(endDate);
		criteria.setEmpNo(emp.getNo());
		
		List<WorkTime> workTimeList = empService.getTimetableByNo(criteria);
		
		model.addAttribute("workTimeList", workTimeList);
		
		return "employees/myattendancelist";
	}
	
	// 사원등록 페이지 연결
	@RequestMapping(value="/insertemp.do", method=RequestMethod.GET)
	public String insertEmpForm(Model model, HttpSession session) {
		
		Employee emp = (Employee)session.getAttribute("LoginUser");
		
		if (emp == null) {
			
			throw new RuntimeException("로그인이 필요한 서비스입니다.");
		}
		
		
		int empNo = empService.empSeqCheck();
		model.addAttribute("empNo", empNo);
		List<Branch> branchNames = empService.getAllBranch();
		model.addAttribute("branchNames", branchNames);
		
		if (emp.getDept().equals("HR") || emp.getDept().equals("Master")) {
			
			return "employees/insertempform";
			
		} else {
			
			throw new RuntimeException("사원등록은 인사관리 부서만 접근 가능합니다.");
		}
		
		//return "employees/insertempform";
		
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
			
			/*Files.copy(upfile.getInputStream(), Paths.get("C:\\Users\\yun\\git\\pro\\spring-finalproject\\src\\main\\webapp\\resources\\image\\empimg", upfile.getOriginalFilename()));*/
			Files.copy(upfile.getInputStream(), Paths.get(imageDirectory, upfile.getOriginalFilename()));
			
			emp.setPhoto(upfile.getOriginalFilename());
		
		} 
		
		List<Career> careerList = new ArrayList<>();
		
		if (regEmp.getTerms() != null && regEmp.getSchools() != null && regEmp.getMajors() != null) {
			
			for (int i=0; i<regEmp.getSchools().length; i++) {
				Career career = new Career();
				career.setTerm(regEmp.getTerms()[i]);
				career.setSchool(regEmp.getSchools()[i]);
				career.setMajor(regEmp.getMajors()[i]);
				
				careerList.add(career);
				
			}
		}
		
		
		List<Licenses> licensesList = new ArrayList<>();
		
		if(regEmp.getLicenses() != null && regEmp.getLicenseOffices() != null) {
			
			for (int i=0; i<regEmp.getLicenses().length; i++) {
				Licenses license = new Licenses();
				license.setLicense(regEmp.getLicenses()[i]);
				license.setLicenseOffice(regEmp.getLicenseOffices()[i]);
				
				licensesList.add(license);
			}
		}
		
		
		List<Languages> languageList = new ArrayList<>();

		if (regEmp.getLanguages() != null && regEmp.getGrades() != null) {
			
			for (int i=0; i<regEmp.getLanguages().length; i++) {
				Languages language = new Languages();
				language.setLanguage(regEmp.getLanguages()[i]);
				language.setGrade(regEmp.getGrades()[i]);
				
				languageList.add(language);
			}
		}
		
		empService.registerEmployee(emp, careerList,  licensesList, languageList);
		
		return "redirect:/emplist.do";
	}
	
	@RequestMapping(value="/emplist.do")
	public String empList(Criteria criteria, @RequestParam(name="pno", required=false, defaultValue="1") int pageNo, Model model) {
		
		if(pageNo < 1) {
			return "redirect:/emplist.do?pno=1";
		}
		
		int rows = 10;
		int pages = 5;
		int beginIndex = (pageNo - 1) * rows + 1;
		int endIndex = pageNo * rows;
		
		int totalRows = empService.getTotalEmpRows(criteria);
		
		PageVo pagination = new PageVo(rows, pages, pageNo, totalRows);
		
		if (pageNo > pagination.getTotalPages()) {
			return "redirect:/emplist.do?pno=" + pagination.getTotalPages();
		}
		
		criteria.setBeginIndex(beginIndex);
		criteria.setEndIndex(endIndex);
		
		List<Employee> empList = empService.getEmployees(criteria);
		model.addAttribute("empList", empList);
		model.addAttribute("navi", pagination);
		
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
		/*
		Employee emp = new Employee();
		emp.setAddress(empDetail.get)
		empService.updateEmployee(emp);
		 */
		
		return "redirect:/empdetail.do";
	}
	
	
	@RequestMapping(value="/insertbranch.do", method=RequestMethod.GET)
	public String insertBranchForm(Model model) {
		
		List<Employee> empList = empService.getAllEmployees();
		model.addAttribute("empList", empList);
		
		return "employees/insertbranchform";
	}
	
	
	@RequestMapping(value="/insertbranch.do", method=RequestMethod.POST)
	public String insertBranch(BranchAddForm brForm, @RequestParam("img") MultipartFile upfile) throws Exception {
		
		Branch branch = new Branch();
		Employee emp = new Employee();
		emp.setNo(brForm.getEmpNo());
		
		branch.setName(brForm.getName());
		branch.setPhone(brForm.getPhone());
		branch.setAddress(brForm.getAddress());
		branch.setAtm(brForm.getAtm());
		branch.setFreshFood(brForm.getFreshFood());
		branch.setLotto(brForm.getLotto());
		branch.setParcelService(brForm.getParcelService());
		branch.setLifeService(brForm.getLifeService());
		branch.setEmp(emp);
		
		if (!upfile.isEmpty()) {
			
			Files.copy(upfile.getInputStream(), Paths.get("C:\\Users\\yun\\git\\pro\\spring-finalproject\\src\\main\\webapp\\resources\\image\\branchimg", upfile.getOriginalFilename()));
			
			branch.setImg(upfile.getOriginalFilename());
		
		} 
		
		empService.insertBranch(branch);
		
		return "redirect:/compbranchlist.do";
	}
	
	@RequestMapping(value="/compbranchlist.do")
	public String branchList(Criteria criteria, @RequestParam(name="pno", required=false, defaultValue="1") int pageNo, Model model) {
		
		if (pageNo < 1) {
			return "redirect:/compbranchlist.do?pno=1";
		}
		
		int rows = 10;
		int pages = 5;
		int beginIndex = (pageNo - 1) * rows + 1;
		int endIndex = pageNo * rows;
		
		int totalRows = empService.getTotalBranchRows(criteria);
		
		PageVo pagination = new PageVo(rows, pages, pageNo, totalRows);
		
		if(pageNo > pagination.getTotalPages()) {
			return "redirect:/compbranchlist.do?pno=" + pagination.getTotalPages();
		}
		
		criteria.setBeginIndex(beginIndex);
		criteria.setEndIndex(endIndex);
		
		List<Branch> branchList = empService.getBranch(criteria);

		model.addAttribute("branchList", branchList);
		model.addAttribute("navi", pagination);
		
		return "employees/branchlist"; 
		
	}
	
	@RequestMapping(value="/compbranchdetail.do")
	public String branchDetail(@RequestParam(name="no") int branchNo, Model model) {
		Branch branch = empService.getBranchByBranchNo(branchNo);
		List<BranchEmp> brEmpList = empService.getBranchEmpByNo(branchNo);
		
		model.addAttribute("branch", branch);
		model.addAttribute("brEmpList", brEmpList);
		
		return "employees/branchdetail";
	}
	
	@RequestMapping(value="/updatebranch.do", method=RequestMethod.GET)
	public String branchUpdateForm(@RequestParam(name="no") int branchNo, Model model) {

		Branch branch = empService.getBranchByBranchNo(branchNo);
		List<Employee> empList = empService.getAllEmployees();
		
		model.addAttribute("branch", branch);
		model.addAttribute("empList", empList);
		
		return "employees/updatebranchform";
	}
	
	@RequestMapping(value="/updatebranch.do", method=RequestMethod.POST)
	public String branchUpdateForm(BranchAddForm brForm, @RequestParam("img") MultipartFile upfile) throws Exception {
		
		Branch branch = new Branch();
		Employee emp = new Employee();
		
		branch.setNo(brForm.getNo());
		branch.setName(brForm.getName());
		branch.setPhone(brForm.getPhone());
		branch.setAddress(brForm.getAddress());
		branch.setAtm(brForm.getAtm());
		branch.setFreshFood(brForm.getFreshFood());
		branch.setLotto(brForm.getLotto());
		branch.setLifeService(brForm.getLifeService());
		branch.setParcelService(brForm.getParcelService());

		emp.setNo(brForm.getEmpNo());
		branch.setEmp(emp);
		
		if (!upfile.isEmpty()) {
			
			Files.copy(upfile.getInputStream(), Paths.get("C:\\Users\\yun\\git\\pro\\spring-finalproject\\src\\main\\webapp\\resources\\image\\branchimg", upfile.getOriginalFilename()));
			
			branch.setImg(upfile.getOriginalFilename());
		
		}
		
		empService.updateBranch(branch);
		
		return "redirect:/compbranchdetail.do";
	}
	
	@RequestMapping(value="/insertbranchemp.do", method=RequestMethod.GET)
	public String insertBranchEmpForm(Model model) {
		List<Branch> branchList = empService.getAllBranch();
		model.addAttribute("branchList", branchList);
		return "employees/insertbranchempform";
	}
	
	@RequestMapping(value="/insertbranchemp.do", method=RequestMethod.POST)
	public String insertBranchEmp(BranchEmpAddForm branchEmpAdd, @RequestParam("image")  MultipartFile upfile) throws Exception {
		
		BranchEmp branchEmp = new BranchEmp();
		Branch branch = new Branch();
		
		branchEmp.setEmail(branchEmpAdd.getEmail());
		branchEmp.setAddress(branchEmpAdd.getAddress());
		branchEmp.setPhone(branchEmpAdd.getPhone());
		branchEmp.setGrade(branchEmpAdd.getGrade());
		branchEmp.setPassword(branchEmpAdd.getPassword());
		branchEmp.setName(branchEmpAdd.getName());
		branch.setNo(branchEmpAdd.getBranchNo());
		branchEmp.setBranch(branch);
		branchEmp.setBirth(branchEmpAdd.getBirth());
		branchEmp.setRemarks(branchEmpAdd.getRemarks());
		
		if (!upfile.isEmpty()) {
			
			Files.copy(upfile.getInputStream(), Paths.get("C:\\Users\\yun\\git\\pro\\spring-finalproject\\src\\main\\webapp\\resources\\image\\brempimg", upfile.getOriginalFilename()));
			
			branchEmp.setImages(upfile.getOriginalFilename());
		
		}
		
		empService.insertBranchEmp(branchEmp);
		
		return "redirect:/branchemplist";
	}
	
	@RequestMapping(value="/branchempdetail.do")
	public String branchEmpDetail(@RequestParam(name="no") int brEmpNo, Model model) {
		BranchEmp branchemp = empService.getBranchEmpByBrEmpNo(brEmpNo);
		
		model.addAttribute("brEmp", branchemp);
		
		return "employees/branchempdetail";
		
	}
	
	
	@RequestMapping(value="/updatebranchemp.do", method=RequestMethod.GET)
	public String updateBranchEmpForm(@RequestParam(name="no") int branchNo, Model model) {
		Branch branch = empService.getBranchByBranchNo(branchNo);
		List<BranchEmp> brEmpList = empService.getBranchEmpByNo(branchNo);
		
		model.addAttribute("branch", branch);
		model.addAttribute("brEmpList", brEmpList);
		
		return "employees/updatebranchempform";
	}
	
	@RequestMapping(value="/updatebranchemp.do", method=RequestMethod.POST)
	public String updateBranchEmp(@RequestParam(name="pno") int pageNo, @RequestParam(name="no") int brNo, WorkingStateBrEmp WorkingStateBrEmpList) {
		
		
		List<BranchEmp> branchEmpList = new ArrayList<>();
		
		if (WorkingStateBrEmpList.getWorkingState() != null) {
			
			for (int i=0; i<WorkingStateBrEmpList.getWorkingState().length; i++) {
				BranchEmp brEmp = new BranchEmp();
				brEmp.setNo(WorkingStateBrEmpList.getWorkingState()[i]);
				brEmp.setRemarks("퇴사");
				System.out.println("dd:"+brEmp.getNo());
				branchEmpList.add(brEmp);
				
			}
		}
		
		empService.updateBranchEmpByBrempNo(branchEmpList);
		
		return "redirect:/compbranchdetail.do?no="+brNo+"&pno="+pageNo;
	}
	
	
	@RequestMapping(value="/getemployeebydept.do", method=RequestMethod.GET)
	public @ResponseBody List<Employee> getEmployeeByDept(@RequestParam(name="dept") String dept) {
		return empDao.getEmployeeByDept(dept);
	}
	
	@RequestMapping(value="/getsalarybyno.do", method=RequestMethod.GET)
	public @ResponseBody AccountBook insertSalaryForm(@RequestParam(name="empNo") int empNo, Criteria criteria) {
		
		SimpleDateFormat DateFormat = new SimpleDateFormat ("yyyy-MM-dd");
		Date now = new Date();
		String today = DateFormat.format (now);
		
		String year = today.substring(0, 4);
		String month = today.substring(5, 7);
		String day = today.substring(8);
		int dd = Integer.parseInt(month)+1;
		String nextMonth = String.valueOf(dd);
		String beginDate = year + "-" + month + "-" + "01";
		String endDate = year + "-" + nextMonth + "-" + "01";
		
		criteria.setBeginDate(beginDate);
		criteria.setEndDate(endDate);
		criteria.setEmpNo(empNo);
		
		List<WorkTime> workTimeList = empDao.getEmpWorkTimeByNo(criteria);
		
		AccountBook accountBook = new AccountBook();
		for (WorkTime wt : workTimeList) {
			Employee emp = new Employee();
			int overtime = wt.getOvertime();
			overtime ++;
			emp.setNo(wt.getEmp().getNo());
			emp.setSalary(wt.getEmp().getSalary());
			accountBook.setOvertime(overtime-1);
			accountBook.setEmp(emp);
		}
		
		return accountBook;
	}
	
	@RequestMapping(value="/insertsalary.do", method=RequestMethod.GET)
	public String insertSalaryForm(Model model) {
		List<Employee> empList = empService.getAllEmployees();
		model.addAttribute("empList", empList);
		
		return "employees/insertsalaryform";
	}
	
	@RequestMapping(value="/insertsalary.do", method=RequestMethod.POST)
	public String insertSalary(AccountBook accountBook) {
		System.out.println(accountBook.getEmp().getNo());
		empService.insertSalary(accountBook);
		return "redirect:/compsalary.do";
	}
	
	@RequestMapping(value="/compsalary.do")
	public String salaryList(Criteria criteria, @RequestParam(name="pno", required=false, defaultValue="1") int pageNo, Model model) {
		
			
			if (pageNo < 1) {
				return "redirect:/compsalary.do?pno=1";
			}
			
			int rows = 10;
			int pages = 5;
			int beginIndex = (pageNo - 1) * rows + 1;
			int endIndex = pageNo * rows;
			
			int totalRows = empService.getTotalSalaryRows(criteria);
			
			PageVo pagination = new PageVo(rows, pages, pageNo, totalRows);
			
			if(pageNo > pagination.getTotalPages()) {
				return "redirect:/compsalary.do?pno=" + pagination.getTotalPages();
			}
			
			criteria.setBeginIndex(beginIndex);
			criteria.setEndIndex(endIndex);
			
			List<AccountBook> accountBookList = empService.getAccountBooks(criteria);
			
			model.addAttribute("salaryList", accountBookList);
			model.addAttribute("navi", pagination);
		
		
		return "employees/salarylist";
	}
	
	@RequestMapping(value="/compattendance.do")
	public String attendanceListForm(Criteria criteria, @RequestParam(name="pno", required=false, defaultValue="1") int pageNo, Model model) {
		
		if (pageNo < 1) {
			return "redirect:/compattendance.do?pno=1";
		}
		
		int rows = 10;
		int pages = 5;
		int beginIndex = (pageNo - 1) * rows + 1;
		int endIndex = pageNo * rows;
		
		int totalRows = empService.getTotalSalaryRows(criteria);
		
		PageVo pagination = new PageVo(rows, pages, pageNo, totalRows);
		
		if(pageNo > pagination.getTotalPages()) {
			return "redirect:/compattendance.do?pno=" + pagination.getTotalPages();
		}
		
		criteria.setBeginIndex(beginIndex);
		criteria.setEndIndex(endIndex);
		
		
		List<WorkTime> workTimeList = empService.getTimetable(criteria);
		
		
		model.addAttribute("workTimeList", workTimeList);
		//model.addAttribute("navi", pagination);
		
		return "employees/attendancelist";
	}
	
}


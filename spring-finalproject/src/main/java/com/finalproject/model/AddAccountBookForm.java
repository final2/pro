package com.finalproject.model;

public class AddAccountBookForm {

	private int no;
	private String paymentDate = "1";
	private String salary = "0";
	private String overtime = "0";
	private String insureHealth = "0";
	private String insureLonghealth = "0";
	private String insureSocial = "0";
	private String employeeInsure = "0";
	private Employee emp = new Employee();
	
	public AddAccountBookForm() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getOvertime() {
		return overtime;
	}

	public void setOvertime(String overtime) {
		this.overtime = overtime;
	}

	public String getInsureHealth() {
		return insureHealth;
	}

	public void setInsureHealth(String insureHealth) {
		this.insureHealth = insureHealth;
	}

	public String getInsureLonghealth() {
		return insureLonghealth;
	}

	public void setInsureLonghealth(String insureLonghealth) {
		this.insureLonghealth = insureLonghealth;
	}

	public String getInsureSocial() {
		return insureSocial;
	}

	public void setInsureSocial(String insureSocial) {
		this.insureSocial = insureSocial;
	}

	public String getEmployeeInsure() {
		return employeeInsure;
	}

	public void setEmployeeInsure(String employeeInsure) {
		this.employeeInsure = employeeInsure;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	
	
}

package com.finalproject.model;

public class AccountBook {

	private int no;
	private String paymentDate = "1";
	private int salary = 0;
	private int overtime = 0;
	private int insureHealth = 0;
	private int insureLonghealth = 0;
	private int insureSocial = 0;
	private int employeeInsure = 0;
	private Employee emp = new Employee();
	
	public AccountBook() {}

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

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getOvertime() {
		return overtime;
	}

	public void setOvertime(int overtime) {
		this.overtime = overtime;
	}

	public int getInsureHealth() {
		return insureHealth;
	}

	public void setInsureHealth(int insureHealth) {
		this.insureHealth = insureHealth;
	}

	public int getInsureLonghealth() {
		return insureLonghealth;
	}

	public void setInsureLonghealth(int insureLonghealth) {
		this.insureLonghealth = insureLonghealth;
	}

	public int getInsureSocial() {
		return insureSocial;
	}

	public void setInsureSocial(int insureSocial) {
		this.insureSocial = insureSocial;
	}

	public int getEmployeeInsure() {
		return employeeInsure;
	}

	public void setEmployeeInsure(int employeeInsure) {
		this.employeeInsure = employeeInsure;
	}

	public Employee getEmp() {
		return emp;
	}
	
	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	
	
}

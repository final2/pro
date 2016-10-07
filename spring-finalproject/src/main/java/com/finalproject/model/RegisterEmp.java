package com.finalproject.model;

import java.util.Date;

public class RegisterEmp {

	private int empNo;
	private String password;
	private String name;
	private String phone;
	private Date birth;
	private int salary;
	private String email;
	private String dept;
	private String position;
	private String address;
	private String[] terms = null;
	private String[] schools = null;
	private String[] majors = null;
	private String[] licenses = null;
	private String[] licenseOffices = null;
	private String[] languages = null;
	private String[] grades = null;
	
	public RegisterEmp() {}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String[] getTerms() {
		return terms;
	}
	
	public void setTerms(String[] terms) {
		this.terms = terms;
	}
	
	public String[] getSchools() {
		return schools;
	}

	public void setSchools(String[] schools) {
		this.schools = schools;
	}

	public String[] getMajors() {
		return majors;
	}

	public void setMajors(String[] majors) {
		this.majors = majors;
	}

	public String[] getLicenses() {
		return licenses;
	}
	
	public void setLicenses(String[] licenses) {
		this.licenses = licenses;
	}

	public String[] getLicenseOffices() {
		return licenseOffices;
	}
	
	public void setLicenseOffices(String[] licenseOffices) {
		this.licenseOffices = licenseOffices;
	}
	
	public String[] getLanguages() {
		return languages;
	}

	public void setLanguages(String[] languages) {
		this.languages = languages;
	}
	
	public String[] getGrades() {
		return grades;
	}
	
	public void setGrades(String[] grades) {
		this.grades = grades;
	}
	
	
	
	
}

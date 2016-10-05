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
	private String[] career = null;
	private String[] licenses = null;
	private String[] languages = null;
	
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
	public String[] getCareer() {
		return career;
	}
	public void setCareer(String[] career) {
		this.career = career;
	}
	public String[] getLicensesS() {
		return licenses;
	}
	public void setLicenses(String[] licenses) {
		this.licenses = licenses;
	}
	public String[] getLanguages() {
		return languages;
	}
	public void setLanguages(String[] languages) {
		this.languages = languages;
	}
	
	
	
	
	
}

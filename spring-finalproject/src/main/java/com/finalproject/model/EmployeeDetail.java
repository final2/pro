package com.finalproject.model;

import java.util.List;

public class EmployeeDetail {

	private Employee emp;
	private List<Career> careerList;
	private List<Licenses> licenseList;
	private List<Languages> languageList;
	
	public EmployeeDetail() {};

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public List<Career> getCareerList() {
		return careerList;
	}

	public void setCareerList(List<Career> careerList) {
		this.careerList = careerList;
	}

	public List<Licenses> getLicenseList() {
		return licenseList;
	}

	public void setLicenseList(List<Licenses> licenseList) {
		this.licenseList = licenseList;
	}

	public List<Languages> getLanguageList() {
		return languageList;
	}

	public void setLanguageList(List<Languages> languageList) {
		this.languageList = languageList;
	}
	
	
}

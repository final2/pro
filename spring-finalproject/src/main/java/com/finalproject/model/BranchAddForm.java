package com.finalproject.model;

public class BranchAddForm {

	private int no;
	private String name;
	private String phone;
	private String address;
	private String atm = "N";
	private String freshFood = "N";
	private String lotto = "N";
	private String parcelService = "N";
	private String lifeService = "N";
	private int empNo;
	
	public BranchAddForm() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAtm() {
		return atm;
	}

	public void setAtm(String atm) {
		this.atm = atm;
	}

	public String getFreshFood() {
		return freshFood;
	}

	public void setFreshFood(String freshFood) {
		this.freshFood = freshFood;
	}

	public String getLotto() {
		return lotto;
	}

	public void setLotto(String lotto) {
		this.lotto = lotto;
	}

	public String getParcelService() {
		return parcelService;
	}

	public void setParcelService(String parcelService) {
		this.parcelService = parcelService;
	}

	public String getLifeService() {
		return lifeService;
	}

	public void setLifeService(String lifeService) {
		this.lifeService = lifeService;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
	
}

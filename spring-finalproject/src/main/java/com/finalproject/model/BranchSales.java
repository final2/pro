package com.finalproject.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

public class BranchSales {

	private int no;
	@JsonFormat(shape=Shape.STRING, pattern="yyyy-MM-dd")
	private Date regdate;
	private int ages;
	private String gender;
	private String issaled;
	private String isreturned;
	private String payment;
	private BranchEmp brEmp;
	private Branch branch;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getAges() {
		return ages;
	}
	public void setAges(int ages) {
		this.ages = ages;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIssaled() {
		return issaled;
	}
	public void setIssaled(String issaled) {
		this.issaled = issaled;
	}
	public String getIsreturned() {
		return isreturned;
	}
	public void setIsreturned(String isreturned) {
		this.isreturned = isreturned;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public BranchEmp getBrEmp() {
		return brEmp;
	}
	public void setBrEmp(BranchEmp brEmp) {
		this.brEmp = brEmp;
	}
	public Branch getBranch() {
		return branch;
	}
	public void setBranch(Branch branch) {
		this.branch = branch;
	}
	
	
}

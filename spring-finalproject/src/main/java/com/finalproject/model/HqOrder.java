package com.finalproject.model;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

public class HqOrder {
	
	private int no;
	private int clientNo;
	private String confirm;
	@JsonFormat(shape=Shape.STRING, pattern="yyyy-MM-dd")
	private Date regdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getClientNo() {
		return clientNo;
	}
	public void setClientNo(int clientNo) {
		this.clientNo = clientNo;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}

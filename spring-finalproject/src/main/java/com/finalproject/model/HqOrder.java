package com.finalproject.model;

import java.util.Date;

public class HqOrder {
	
	private int no;
	private Client client;
	private String confirm;
	private Date regdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
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
	
	@Override
	public String toString() {
		return "HqOrder [no=" + no + ", client=" + client + ", confirm=" + confirm + ", regdate=" + regdate + "]";
	}

}

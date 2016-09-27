package com.finalproject.model;

import java.util.List;

public class Client {

	private int no;
	private String name;
	private String isAdmit;
	private List<ClientDetail> clientDetails;
	
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
	public String getIsAdmit() {
		return isAdmit;
	}
	public void setIsAdmit(String isAdmit) {
		this.isAdmit = isAdmit;
	}
	public List<ClientDetail> getClientDetails() {
		return clientDetails;
	}
	public void setClientDetails(List<ClientDetail> clientDetails) {
		this.clientDetails = clientDetails;
	}
	
}

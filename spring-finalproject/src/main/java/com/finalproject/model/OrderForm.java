package com.finalproject.model;

import java.util.Arrays;

public class OrderForm {

	private int clientNo;
	
	private int[] no;
	private int[] qty;
	private int[] price;
	
	public int getClientNo() {
		return clientNo;
	}
	public void setClientNo(int clientNo) {
		this.clientNo = clientNo;
	}
	public int[] getNo() {
		return no;
	}
	public void setNo(int[] no) {
		this.no = no;
	}
	public int[] getQty() {
		return qty;
	}
	public void setQty(int[] qty) {
		this.qty = qty;
	}
	public int[] getPrice() {
		return price;
	}
	public void setPrice(int[] price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "OrderForm [clientNo=" + clientNo + ", no=" + Arrays.toString(no) + ", qty=" + Arrays.toString(qty)
				+ ", price=" + Arrays.toString(price) + "]";
	}
	
}

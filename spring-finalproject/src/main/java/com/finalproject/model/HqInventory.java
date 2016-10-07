package com.finalproject.model;

public class HqInventory {

	private int no;
	private int qty;
	private int clientNo;
	private Product product;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getClientNo() {
		return clientNo;
	}
	public void setClientNo(int clientNo) {
		this.clientNo = clientNo;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	@Override
	public String toString() {
		return "HqInventory [no=" + no + ", qty=" + qty + ", clientNo=" + clientNo + ", product=" + product + "]";
	}

}

package com.finalproject.model;

public class HqOrderDetail {

	private int no;
	private int qty;
	private HqOrder hqOrder;
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
	public HqOrder getHqOrder() {
		return hqOrder;
	}
	public void setHqOrder(HqOrder hqOrder) {
		this.hqOrder = hqOrder;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	@Override
	public String toString() {
		return "HqOrderDetail [no=" + no + ", qty=" + qty + ", hqOrder=" + hqOrder + ", product=" + product + "]";
	}
	
}

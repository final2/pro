package com.finalproject.model;

public class BranchSalesDetail {

	private int no;
	private int qty;
	private BranchSales branchSales;
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
	public BranchSales getBranchSales() {
		return branchSales;
	}
	public void setBranchSales(BranchSales branchSales) {
		this.branchSales = branchSales;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}

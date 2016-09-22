package com.finalproject.model;

public class BranchOrderDetail {

	private int no;
	private int qty;
	private String warehousein;
	private String warehouseout;
	private BranchOrder order;
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
	public String getWarehousein() {
		return warehousein;
	}
	public void setWarehousein(String warehousein) {
		this.warehousein = warehousein;
	}
	public String getWarehouseout() {
		return warehouseout;
	}
	public void setWarehouseout(String warehouseout) {
		this.warehouseout = warehouseout;
	}
	public BranchOrder getOrder() {
		return order;
	}
	public void setOrder(BranchOrder order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}

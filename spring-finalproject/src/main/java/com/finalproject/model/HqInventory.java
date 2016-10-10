package com.finalproject.model;

public class HqInventory {

	private int no;
	private int qty;
	private Client client;
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
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	@Override
	public String toString() {
		return "HqInventory [no=" + no + ", qty=" + qty + ", client=" + client + ", product=" + product + "]";
	}
	
}

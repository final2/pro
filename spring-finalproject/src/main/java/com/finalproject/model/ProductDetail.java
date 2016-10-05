package com.finalproject.model;

import java.util.List;

public class ProductDetail {

	private List<Product> products;
	private List<Client> clients;
	private List<SmallCategory> smallCategorys;
	private List<Event> events;
	private ProductSearch productSearch;
	
	public ProductSearch getProductSearch() {
		return productSearch;
	}
	public void setProductSearch(ProductSearch productSearch) {
		this.productSearch = productSearch;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public List<Client> getClients() {
		return clients;
	}
	public void setClients(List<Client> clients) {
		this.clients = clients;
	}
	public List<SmallCategory> getSmallCategorys() {
		return smallCategorys;
	}
	public void setSmallCategorys(List<SmallCategory> smallCategorys) {
		this.smallCategorys = smallCategorys;
	}
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
	
	
	
}

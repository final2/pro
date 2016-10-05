package com.finalproject.model;

import java.util.List;

public class ProductPageVo {

	private List<Product> products;
	private PageVo pageVo;
	
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public PageVo getPageVo() {
		return pageVo;
	}
	public void setPageVo(PageVo pageVo) {
		this.pageVo = pageVo;
	}

	
	
}

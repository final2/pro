package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Product;

public interface ProductDao {

	//물품 등록
	void insertProduct(Product product);
	//전체 물픔 조회
	List<Product> getProductList();
}

package com.finalproject.service;

import java.util.List;

import com.finalproject.model.Client;
import com.finalproject.model.Product;
import com.finalproject.model.ProductSearch;

public interface ProductService {

		//물품 등록
		void addProduct(Product product);
		//제품 Page별 List
		List<Product> getProductPageList(ProductSearch productSearch);
		//제품 총 수 불러오기
		int getTotalProduct(ProductSearch productSearch);
		//해당 브랜드명 불러오기
		Client getClientByNo(int clientNo);
}

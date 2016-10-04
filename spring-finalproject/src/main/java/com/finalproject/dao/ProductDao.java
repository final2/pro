package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Client;
import com.finalproject.model.Event;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;

public interface ProductDao {

	//물품 등록
	void insertProduct(Product product);
	//전체 물픔 조회
	List<Product> getProductList();
	//클라이언트 조회
	List<Client> getClient();
	//Event 조회
	List<Event> getEvent();
	//스몰 클라이언트 조회
	List<SmallCategory> getSmallCategory();
}

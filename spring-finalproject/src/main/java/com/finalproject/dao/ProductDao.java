package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Client;
import com.finalproject.model.Event;
import com.finalproject.model.Product;
import com.finalproject.model.ProductPageVo;
import com.finalproject.model.ProductSearch;
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
	//제품 Page별 List
	List<Product> getProductPageList(ProductSearch productSearch);
	//제품 총 수 불러오기
	int getTotalProduct(ProductSearch productSearch);
	//클라이언트 명 불러오기
	Client getClientByNo(int clientNo);
	//제품 상세 정보
	Product getProductByNo(int no);
}

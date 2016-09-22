package com.finalproject.service;

import java.util.List;

import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;

public interface BranchService {

	// 대분류 조회하기
	List<LargeCategory> getAllLargeCats();
	
	// 대분류 번호로 소분류 조회하기
	List<SmallCategory> getSmallCatsByLargeNo(int no);
	
	// 소분류 번호로 물품 조회하기
	List<Product> getProductsBySmallNo(int no);
}

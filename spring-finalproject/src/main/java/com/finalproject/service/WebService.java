package com.finalproject.service;

import java.util.List;

import com.finalproject.model.Branch;
import com.finalproject.model.Product;
import com.finalproject.model.WebBoard;

public interface WebService {

	// 웹사이트 공지 조회
	List<WebBoard> getAllBoardList();
	
	// 웹사이트 공지 상세보기
	WebBoard getBoardByNo(int no);
	
	// event 제품 보기
	List<Product> getProductByEvent(int no);
	
	// 서비스 유형별 지점정보 불러오기
	List<Branch> getBranchByLotto();
	
	// ATM 지점정보 불러오기
	List<Branch> getBranchByATM();
	
	// 택배가능지점 불러오기
	List<Branch> getBranchByPARCELSERVICE();
	
	// 즉석제조식품 판매점 불러오기
	List<Branch> getBranchByFreshFood();
	
	// 지점 상세정보 불러오기
	Branch getBranchByNo(int no);
}

package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Branch;
import com.finalproject.model.Product;
import com.finalproject.model.WebBoard;

public interface WebsiteDao {

	// 웹페이지 공지 불러오기
	List<WebBoard> getAllBoard();
	
	// 웹 공지게시판 상세보기
	WebBoard getWBoardByNo(int no);
	
	// 이벤트 적용된 프로덕트 불러오기
	List<Product> getProductByEvent(int no);
	
	// Lotto 판매점 정보 불러오기
	List<Branch> getBranchByLotto();
	
	// ATM 판매점 정보 불러오기
	List<Branch> getBranchByATM();
	
	// 택배서비스 정보 불러오기
	List<Branch> getBranchByPARCELSERVICE();
	
	// 즉석식품 판매점 확인하기
	List<Branch> getBranchByFreshFood();
	
	// 지점 상세정보 불러오기
	Branch getBranchByNo(int no);
}

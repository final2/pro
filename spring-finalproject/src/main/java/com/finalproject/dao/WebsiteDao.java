package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Criteria;
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
	
	// 지점 전체정보 불러오기
	List<Branch> getAllBranch();
	
	// 유형별 지점정보 불러오기
	List<Branch> getBranchByType(String type);
	
	// 지점 상세정보 불러오기
	Branch getBranchByNo(int no);
	
	int getTotalRows(String type);
	
	// 지점명으로 찾기
	List<Branch> getBranchByName(String name);
	
	// 주소로 찾기
	List<Branch> getBranchByAddress(String name);
	
	int getTotalRows(Criteria criteria);
	List<Branch> getSearchBranch(Criteria criteria);

	Product getProductByNo(int no);
}

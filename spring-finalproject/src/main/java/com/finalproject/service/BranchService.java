package com.finalproject.service;

import java.util.List;

import com.finalproject.model.BranchEmp;
import com.finalproject.model.BranchInventory;
import com.finalproject.model.BranchOrder;
import com.finalproject.model.BranchOrderDetail;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;

public interface BranchService {
	
	// 지점 회원번호로 지점회원 조회하기
	BranchEmp getBrMemberByNo(int no);

	// 대분류 조회하기
	List<LargeCategory> getAllLargeCats();
	
	// 대분류 번호로 소분류 조회하기
	List<SmallCategory> getSmallCatsByLargeNo(int no);
	
	// 소분류 번호로 물품 조회하기
	List<Product> getProductsBySmallNo(int no);

	// 지점 발주대기 주문 상세 조회하기
	List<BranchOrderDetail> getWaitingOrder(int no);
	
	// 지점 발주대기 주문 상세에서 삭제하기
	void deleteWaitingByOrderDetailNo(int no);
	
	// 지점 발주대기 상품을 주문하기
	void addInventory(BranchInventory brInven);
	
	// 발주번호로 발주상세 조회하기
	BranchOrder getBranchOrderByNo(int no);
	
	// 발주 수정하기
	void updateBranchOrder(BranchOrder order);
	
	void updateInventory(BranchInventory brInven);
	
	BranchInventory getInventoryByProductNo(int no);
	
	BranchOrderDetail getOrderDetailByNo(int no);
}

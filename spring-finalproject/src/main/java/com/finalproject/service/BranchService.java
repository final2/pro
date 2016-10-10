package com.finalproject.service;

import java.util.List;
import java.util.Map;

import com.finalproject.model.Branch;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.BranchInventory;
import com.finalproject.model.BranchOrder;
import com.finalproject.model.BranchOrderDetail;
import com.finalproject.model.BranchSales;
import com.finalproject.model.BranchSalesDetail;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;

public interface BranchService {
	
	// 지점 회원번호로 지점회원 조회하기
	BranchEmp getBrMemberByNo(int no);

	// 대분류 조회하기
	List<LargeCategory> getAllLargeCats();
	List<LargeCategory> getAllLargeCatsByBranch(int brno);
	
	// 대분류 번호로 소분류 조회하기
	List<SmallCategory> getSmallCatsByLargeNo(int no);
	List<SmallCategory> getSmallCatsByBranchNo(int no);
	
	// 소분류 번호로 물품 조회하기
	List<Product> getProductsBySmallNo(int no);
	List<Product> getProductsBySmallCategoryAndBranchNo(Map<String, Object> map);
	
	// 물품번호로 재고조회하기
	List<BranchInventory> getBranchInvenByProductNo(Map<String, Object> map);

	// 지점 발주대기 주문 상세 조회하기
	List<BranchOrderDetail> getWaitingOrderDetail(int no);
	
	// 지점 발주대기 주문 상세에서 삭제하기
	void deleteWaitingByOrderDetailNo(int no);
	
	// 지점 발주대기 상품을 주문하기
	void addInventory(BranchInventory brInven);
	
	// 발주번호로 발주상세 조회하기
	BranchOrder getBranchOrderByNo(int no);
	
	// 발주 수정하기
	void updateBranchOrder(BranchOrder order);
	
	void updateInventory(BranchInventory brInven);
	
	BranchInventory getInventoryByProductNo(Map<String, Object> map);
	
	BranchOrderDetail getOrderDetailByNo(int no);
	
	List<BranchInventory> getAllInvenByBranchNo(int no);
	
	void addOrder(BranchOrder order);
	void addOrderDetail(BranchOrderDetail orderDetail);
	
	BranchOrderDetail getOrderDetailByProNo(Map<String, Object> map);
	
	void updateBranchOrderDetail(BranchOrderDetail detail);
	
	Product getProductByNo(int no);
	
	List<Product> getAllProductsFromCompany();
	
	List<Product> getProductsByKeyword(Map<String, Object> map);
	
	BranchOrder getBranchOrderByIsCartNo(int no);
	
	List<BranchInventory> getInvenByKeyword(Map<String, Object> map);
	
	List<BranchOrder> getOrdersByBranchNo(int brno);
	
	List<BranchOrderDetail> getOrderDetailsByOrderNo(int no);
	
	List<BranchOrder> getOrdersByRegDate(Map<String, Object>map);
	
	void addBranchSales(BranchSales sales);
	
	void addBranchSalesDetail(BranchSalesDetail salesDetail);
	
	BranchSales getBranchSalesByNotIsSaled(Map<String, Object> map);
	
	List<BranchSalesDetail> getBranchSalesDetailBySalesNo(int no);
	
	Branch getBranchByNo(int brno);
	
	BranchEmp getBrEmpByNo(int empno);
	
	void updateBranchSalesDetail(BranchSalesDetail salesDetail);
	
	void updateBranchSales (BranchSales branchSales);
	
	List<Product> getProductsByEventCode(int eventcode);
	
	List<Product> getAllEventProducts();
	
	void addBranchEmp(BranchEmp brEmp);
	
	List<BranchSales> getBranchSalesByDate(Map<String, Object> map);
	
	BranchSales getBranchSalesBySalesNo(int salesno);
	
	List<BranchSales> getBranchSalesIsReturnedByBranchNo(int brno);
	
	void deleteBranchSales(int salesno);
	
	void deleteBranchSalesDetail(int salesno);
}

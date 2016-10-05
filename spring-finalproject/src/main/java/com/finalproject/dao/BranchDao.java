package com.finalproject.dao;

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

public interface BranchDao {
	
	// 지점- 로그인
	BranchEmp getBrMemberByNo(int no);

	// 지점 - 판매
	List<LargeCategory> getAllLargeCats();
	List<LargeCategory> getAllLargeCatsByBranch(int brno);
	List<SmallCategory> getSmallCatsByLargeNo(int no);
	List<Product> getProductsBySmallNo(int no);
	List<BranchInventory> getBranchInvenByProductNo(Map<String, Object> map);
	
	// 지점 - 발주
	List<BranchOrderDetail> getWaitingOrderDetail(int no);
	BranchOrderDetail getOrderDetailByNo(int no);
	void deleteWaitingByOrderDetailNo(int no);
	void addInventory(BranchInventory brInven);
	BranchOrder getBranchOrderByNo(int no);
	void updateBranchOrder(BranchOrder order);
	void updateInventory(BranchInventory brInven);
	BranchInventory getInventoryByProductNo(int no);
	
	// 지점 - 재고
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
	List<BranchOrder> getOrdersByRegDate(Map<String, Object> map);
	
	// 지점 - 판매
	void addBranchSales(BranchSales sales);
	void addBranchSalesDetail(BranchSalesDetail salesDetail);
	BranchSales getBranchSalesByNotIsSaled(Map<String, Object> map);
	List<BranchSalesDetail> getBranchSalesDetailBySalesNo(int no);
	Branch getBranchByNo(int brno);
	BranchEmp getBrEmpByNo(int empno);
	void updateBranchSalesDetail(BranchSalesDetail salesDetail);
	void updateBranchSales (BranchSales branchSales);
	
	// 지점 - 이벤트
	List<Product> getProductsByEventCode(int eventcode);
	List<Product> getAllEventProducts();
	
	// 지점 - 사용자 등록
	void addBranchEmp(BranchEmp brEmp);
}

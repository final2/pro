package com.finalproject.dao;

import java.util.List;
import java.util.Map;

import com.finalproject.model.BranchEmp;
import com.finalproject.model.BranchInventory;
import com.finalproject.model.BranchOrder;
import com.finalproject.model.BranchOrderDetail;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;

public interface BranchDao {
	
	// 지점- 로그인
	BranchEmp getBrMemberByNo(int no);

	// 지점 - 판매
	List<LargeCategory> getAllLargeCats();
	List<SmallCategory> getSmallCatsByLargeNo(int no);
	List<Product> getProductsBySmallNo(int no);
	
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
	BranchOrder getBranchOrderByIsCartNo(int no);
	
	List<BranchInventory> getInvenByKeyword(Map<String, Object> map);
	List<BranchOrder> getOrdersByBranchNo(int brno);
}

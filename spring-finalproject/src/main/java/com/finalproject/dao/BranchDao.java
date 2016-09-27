package com.finalproject.dao;

import java.util.List;

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
	List<BranchOrderDetail> getWaitingOrder(int no);
	BranchOrderDetail getOrderDetailByNo(int no);
	void deleteWaitingByOrderDetailNo(int no);
	void addInventory(BranchInventory brInven);
	BranchOrder getBranchOrderByNo(int no);
	void updateBranchOrder(BranchOrder order);
	void updateInventory(BranchInventory brInven);
	BranchInventory getInventoryByProductNo(int no);
}

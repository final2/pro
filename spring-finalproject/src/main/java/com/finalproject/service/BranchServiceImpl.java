package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.BranchDao;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.BranchInventory;
import com.finalproject.model.BranchOrder;
import com.finalproject.model.BranchOrderDetail;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;

@Service
public class BranchServiceImpl implements BranchService {
	
	@Autowired private BranchDao branchDao;
	
	
	@Override
	public BranchEmp getBrMemberByNo(int no) {
		return branchDao.getBrMemberByNo(no);
	}

	@Override
	public List<LargeCategory> getAllLargeCats() {
		return branchDao.getAllLargeCats();
	}

	@Override
	public List<SmallCategory> getSmallCatsByLargeNo(int no) {
		return branchDao.getSmallCatsByLargeNo(no);
	}

	@Override
	public List<Product> getProductsBySmallNo(int no) {
		return branchDao.getProductsBySmallNo(no);
	}

	@Override
	public List<BranchOrderDetail> getWaitingOrder(int no) {
		return branchDao.getWaitingOrder(no);
	}

	@Override
	public void deleteWaitingByOrderDetailNo(int no) {
		branchDao.deleteWaitingByOrderDetailNo(no);
	}

	@Override
	public void addInventory(BranchInventory brInven) {
		branchDao.addInventory(brInven);
	}

	@Override
	public BranchOrder getBranchOrderByNo(int no) {
		return branchDao.getBranchOrderByNo(no);
	}

	@Override
	public void updateBranchOrder(BranchOrder order) {
		branchDao.updateBranchOrder(order);
	}

	@Override
	public void updateInventory(BranchInventory brInven) {
		branchDao.updateInventory(brInven);;
	}

	@Override
	public BranchInventory getInventoryByProductNo(int no) {
		return branchDao.getInventoryByProductNo(no);
	}

	@Override
	public BranchOrderDetail getOrderDetailByNo(int no) {
		return branchDao.getOrderDetailByNo(no);
	}

}

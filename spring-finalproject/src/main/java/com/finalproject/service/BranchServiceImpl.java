package com.finalproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.BranchDao;
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
	public List<LargeCategory> getAllLargeCatsByBranch(int brno) {
		return branchDao.getAllLargeCatsByBranch(brno);
	}

	@Override
	public List<SmallCategory> getSmallCatsByLargeNo(int no) {
		return branchDao.getSmallCatsByLargeNo(no);
	}
	
	@Override
	public List<SmallCategory> getSmallCatsByBranchNo(int no) {
		return branchDao.getSmallCatsByBranchNo(no);
	}

	@Override
	public List<Product> getProductsBySmallNo(int no) {
		return branchDao.getProductsBySmallNo(no);
	}
	
	@Override
	public List<Product> getProductsBySmallCategoryAndBranchNo(Map<String, Object> map) {
		return branchDao.getProductsBySmallCategoryAndBranchNo(map);
	}
	
	@Override
	public List<Product> getAllProductsFromCompany() {
		return branchDao.getAllProductsFromCompany();
	}
	
	@Override
	public List<Product> getProductsByKeyword(Map<String, Object> map) {
		return branchDao.getProductsByKeyword(map);
	}
	
	@Override
	public List<BranchInventory> getBranchInvenByProductNo(Map<String, Object> map) {
		return branchDao.getBranchInvenByProductNo(map);
	}

	@Override
	public List<BranchOrderDetail> getWaitingOrderDetail(int no) {
		return branchDao.getWaitingOrderDetail(no);
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
	public BranchInventory getInventoryByProductNo(Map<String, Object> map) {
		return branchDao.getInventoryByProductNo(map);
	}

	@Override
	public BranchOrderDetail getOrderDetailByNo(int no) {
		return branchDao.getOrderDetailByNo(no);
	}

	@Override
	public List<BranchInventory> getAllInvenByBranchNo(int no) {
		return branchDao.getAllInvenByBranchNo(no);
	}

	@Override
	public void addOrder(BranchOrder order) {
		branchDao.addOrder(order);
	}

	@Override
	public void addOrderDetail(BranchOrderDetail orderDetail) {
		branchDao.addOrderDetail(orderDetail);
	}

	@Override
	public void updateBranchOrderDetail(BranchOrderDetail detail) {
		branchDao.updateBranchOrderDetail(detail);
	}

	@Override
	public BranchOrderDetail getOrderDetailByProNo(Map<String, Object> map) {
		return branchDao.getOrderDetailByProNo(map);
	}

	@Override
	public Product getProductByNo(int no) {
		return branchDao.getProductByNo(no);
	}

	@Override
	public BranchOrder getBranchOrderByIsCartNo(int no) {
		return branchDao.getBranchOrderByIsCartNo(no);
	}

	@Override
	public List<BranchInventory> getInvenByKeyword(Map<String, Object> map) {
		return branchDao.getInvenByKeyword(map);
	}

	@Override
	public List<BranchOrder> getOrdersByBranchNo(int brno) {
		return branchDao.getOrdersByBranchNo(brno);
	}

	@Override
	public List<BranchOrderDetail> getOrderDetailsByOrderNo(int no) {
		return branchDao.getOrderDetailsByOrderNo(no);
	}

	@Override
	public List<BranchOrder> getOrdersByRegDate(Map<String, Object> map) {
		return branchDao.getOrdersByRegDate(map);
	}

	@Override
	public void addBranchSales(BranchSales sales) {
		branchDao.addBranchSales(sales);
	}
	
	@Override
	public void addBranchSalesDetail(BranchSalesDetail salesDetail) {
		branchDao.addBranchSalesDetail(salesDetail);
	}

	@Override
	public BranchSales getBranchSalesByNotIsSaled(Map<String, Object> map) {
		return branchDao.getBranchSalesByNotIsSaled(map);
	}

	@Override
	public List<BranchSalesDetail> getBranchSalesDetailBySalesNo(int no) {
		return branchDao.getBranchSalesDetailBySalesNo(no);
	}

	@Override
	public Branch getBranchByNo(int brno) {
		return branchDao.getBranchByNo(brno);
	}

	@Override
	public BranchEmp getBrEmpByNo(int empno) {
		return branchDao.getBrEmpByNo(empno);
	}

	@Override
	public void updateBranchSalesDetail(BranchSalesDetail salesDetail) {
		branchDao.updateBranchSalesDetail(salesDetail);
	}
	
	@Override
	public void updateBranchSales(BranchSales branchSales) {
		branchDao.updateBranchSales(branchSales);
	}
	
	@Override
	public List<Product> getProductsByEventCode(int eventcode) {
		return branchDao.getProductsByEventCode(eventcode);
	}
	
	@Override
	public List<Product> getAllEventProducts() {
		return branchDao.getAllEventProducts();
	}
	
	@Override
	public void addBranchEmp(BranchEmp brEmp) {
		branchDao.addBranchEmp(brEmp);
	}
	
	@Override
	public List<BranchSales> getBranchSalesByDate(Map<String, Object> map) {
		return branchDao.getBranchSalesByDate(map);
	}
	
	@Override
	public BranchSales getBranchSalesBySalesNo(int salesno) {
		return branchDao.getBranchSalesBySalesNo(salesno);
	}
	
	@Override
	public List<BranchSales> getBranchSalesIsReturnedByBranchNo(int brno) {
		return branchDao.getBranchSalesIsReturnedByBranchNo(brno);
	}
	
	@Override
	public void deleteBranchSales(int salesno) {
		branchDao.deleteBranchSales(salesno);
	}
	
	@Override
	public void deleteBranchSalesDetail(int salesno) {
		branchDao.deleteBranchSalesDetail(salesno);
	}
	
	@Override
	public BranchEmp getBranchEmpByEmail(String email) {
		return branchDao.getBranchEmpByEmail(email);
	}
}

package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.BranchDao;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;

@Service
public class BranchServiceImpl implements BranchService {
	
	@Autowired private BranchDao branchDao;

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

}

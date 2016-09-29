package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.WebsiteDao;
import com.finalproject.model.Branch;
import com.finalproject.model.Product;
import com.finalproject.model.WebBoard;

@Service
public class WebServiceImpl implements WebService{
	
	@Autowired
	private WebsiteDao websiteDao;

	@Override
	public List<WebBoard> getAllBoardList() {
		return websiteDao.getAllBoard();
	}

	@Override
	public WebBoard getBoardByNo(int no) {
		return websiteDao.getWBoardByNo(no);
	}

	@Override
	public List<Product> getProductByEvent(int no) {
		
		return websiteDao.getProductByEvent(no);
	}

	@Override
	public Branch getBranchByNo(int no) {
		return websiteDao.getBranchByNo(no);
	}

	@Override
	public List<Branch> getBranchByType(String type) {
		return websiteDao.getBranchByType(type);
	}

	@Override
	public List<Branch> getAllBranch() {
		return websiteDao.getAllBranch();
	}

}

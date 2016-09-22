package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.WebsiteDao;
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

	
}

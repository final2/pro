package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.WebBoard;

public interface WebsiteDao {

	// 웹페이지 공지 불러오기
	List<WebBoard> getAllBoard();
}

package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.WebBoard;

public interface WebsiteDao {

	// 웹페이지 공지 불러오기
	List<WebBoard> getAllBoard();
	
	// 웹 공지게시판 상세보기
	WebBoard getWBoardByNo(int no);
}

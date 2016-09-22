package com.finalproject.service;

import java.util.List;

import com.finalproject.model.WebBoard;

public interface WebService {

	// 웹사이트 공지 조회
	List<WebBoard> getAllBoardList();
	
	// 웹사이트 공지 상세보기
	WebBoard getBoardByNo(int no);
}

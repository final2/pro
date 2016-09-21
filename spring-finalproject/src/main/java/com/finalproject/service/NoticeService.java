package com.finalproject.service;

import java.util.List;

import com.finalproject.model.NoticeBoard;

public interface NoticeService {

	// 공지사항 추가
	void addNoticeBoard(NoticeBoard noticeBoard);
	// 공지사항 삭제
	void deleteNoticeBoard(int no);
	// 공지사항 업데이트
	void updateBoard(NoticeBoard noticeBoard);
	// 모든 공지사항 불러오기
	List<NoticeBoard> getNoticeBoardList();
	// 게시글 번호로 공지사항 불러오기
	NoticeBoard getNoticeBoardByNo(int no);
	
}

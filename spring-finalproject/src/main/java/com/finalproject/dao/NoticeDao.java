package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.NoticeBoard;
import com.finalproject.model.PageNo;

public interface NoticeDao {
	
	// 공지사항 추가
	void insertBoard(NoticeBoard noticeBoard);
	// 공지사항 삭제
	void delteBoard(int no);
	// 공지사항 업데이트
	void updateBoard(NoticeBoard noticeBoard);
	// 모든 공지사항 불러오기
	List<NoticeBoard> getNoticeBoard();
	// 게시글 번호로 공지사항 불러오기
	NoticeBoard getNoticeBoardByNo(int no);
	// 최신 게시글 불러오기
	List<NoticeBoard> getNoticeToLatestBoard();
	// 공지글 총 수량
	PageNo getTotalBoard();
	// 페이지 번호에 해당하는 게시글 불러오기
	List<NoticeBoard> getBeginEndBoard(PageNo pageNo);
}

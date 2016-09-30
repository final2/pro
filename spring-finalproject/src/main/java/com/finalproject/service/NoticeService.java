package com.finalproject.service;

import java.util.List;
import java.util.Map;

import com.finalproject.model.NoticeBoard;
import com.finalproject.model.PageVo;
import com.finalproject.model.TodayPlan;

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
	// 최신 게시글 불러오기
	List<NoticeBoard> getLatestBoard();
	// 게시글 총 수량 불러오기
	int getTotalBoard(int pn);
	// 페이지당 게시글 랭크 불러오기
	int getBoardRank(PageVo pageVo);
	// 페이지번호당 공지 글 불러오기
	List<NoticeBoard> getBeginEndBoard(PageVo pageVo);
}

package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Employee;
import com.finalproject.model.Message;
import com.finalproject.model.NoticeBoard;
import com.finalproject.model.PageBoardDetail;
import com.finalproject.model.PageVo;

public interface NoticeDao {
	
	// 공지사항 추가
	void insertBoard(NoticeBoard noticeBoard);
	// 공지사항 삭제
	void deleteBoard(int no);
	// 공지사항 업데이트
	void updateBoard(NoticeBoard noticeBoard);
	// 모든 공지사항 불러오기
	List<NoticeBoard> getNoticeBoard();
	// 게시글 번호로 공지사항 불러오기
	NoticeBoard getNoticeBoardByNo(int no);
	// 최신 게시글 불러오기
	List<NoticeBoard> getNoticeToLatestBoard();
	// 공지글 총 수량
	int getTotalBoard();
	// 페이지당 순위에 해당하는 게시글 불러오기
	NoticeBoard getBoardRank(PageBoardDetail pageBoardDetail);
	// 페이지 번호에 해당하는 게시글 불러오기
	List<NoticeBoard> getBeginEndBoard(PageVo pageVo);
	// 로그인한 사용자의 오늘 받은 메시지 중 최신 5개 불러오기
	List<Message> getReceiveMessageList (int no);
	// 사원번호에 해당하는 사원 정보 불러오기
	Employee getEmpByNo(int no);
}

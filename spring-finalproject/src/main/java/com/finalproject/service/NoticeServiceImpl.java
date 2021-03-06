package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.NoticeDao;
import com.finalproject.model.Employee;
import com.finalproject.model.Message;
import com.finalproject.model.NoticeBoard;
import com.finalproject.model.PageBoardDetail;
import com.finalproject.model.PageVo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	// 공지사항 추가
	@Override
	public void addNoticeBoard(NoticeBoard noticeBoard) {
		noticeDao.insertBoard(noticeBoard);
	}
	// 공지사항 삭제
	@Override
	public void deleteNoticeBoard(int no) {
		noticeDao.deleteBoard(no);
	}
	// 공지사항 업데이트
	@Override
	public void updateBoard(NoticeBoard noticeBoard) {
		noticeDao.updateBoard(noticeBoard);
	}
	// 모든 공지사항 불러오기
	@Override
	public List<NoticeBoard> getNoticeBoardList() {
		return noticeDao.getNoticeBoard();
	}
	// 게시글 번호로 공지사항 불러오기
	@Override
	public NoticeBoard getNoticeBoardByNo(int no) {
		return noticeDao.getNoticeBoardByNo(no);
	}
	// 최신 게시글 불러오기
	@Override
	public List<NoticeBoard> getLatestBoard() {
		return noticeDao.getNoticeToLatestBoard();
	}
	// 게시글 총 수량 불러오기
	@Override
	public int getTotalBoard(int pn) {
		return noticeDao.getTotalBoard();
	}
	// 페이지번호당 공지 글 불러오기
	@Override
	public List<NoticeBoard> getBeginEndBoard(PageVo pageVo) {
		return noticeDao.getBeginEndBoard(pageVo);
	}
	// 페이지당 게시글 랭크 불러오기
	@Override
	public NoticeBoard getBoardRank(PageBoardDetail pageBoardDetail) {
		return noticeDao.getBoardRank(pageBoardDetail);
	}
	// 로그인한 사용자의 오늘 받은 메시지 중 최신 5개 불러오기
	@Override
	public List<Message> getReceiveMessages(int no) {
		return noticeDao.getReceiveMessageList(no);
	}
	// 사원번호에 해당하는 사원 정보 불러오기
	@Override
	public Employee getEmpByNo(int no) {
		return noticeDao.getEmpByNo(no);
	}
}

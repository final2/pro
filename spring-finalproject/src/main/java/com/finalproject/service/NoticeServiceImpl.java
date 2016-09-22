package com.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.NoticeDao;
import com.finalproject.model.NoticeBoard;
import com.finalproject.model.PageNo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public void addNoticeBoard(NoticeBoard noticeBoard) {
		noticeDao.insertBoard(noticeBoard);
	}
	@Override
	public void deleteNoticeBoard(int no) {
		noticeDao.delteBoard(no);
	}
	@Override
	public void updateBoard(NoticeBoard noticeBoard) {
		noticeDao.updateBoard(noticeBoard);
	}
	@Override
	public List<NoticeBoard> getNoticeBoardList() {
		return noticeDao.getNoticeBoard();
	}
	@Override
	public NoticeBoard getNoticeBoardByNo(int no) {
		return noticeDao.getNoticeBoardByNo(no);
	}
	@Override
	public List<NoticeBoard> getLatestBoard() {
		return noticeDao.getNoticeToLatestBoard();
	}
	
	@Override
	public PageNo getTotalBoard() {
		return noticeDao.getTotalBoard();
	}
	
	@Override
	public Map<String, Object> getBeginEndboard(int no) {
		
		Map<String, Object> map = new HashMap<>();
		// 게시글, 페이지 기본 설정 수
		int rowPerPage = 10;
		
		//게시글 총 수 불러오기
		PageNo pageNo = noticeDao.getTotalBoard();
		//페이지 총 수 계산
		int totalPageNo = (int)Math.ceil(pageNo.getBoardTotalNo()/(double)rowPerPage);
		//페이지 총 블록 수 계산
		int pageTotalBlock = (int)Math.ceil(totalPageNo/(double)rowPerPage);
		//현재 블록 계산
		int nowBlock = (int)Math.ceil(no/(double)rowPerPage);
		//페이지 시작 번호
		int beginPageNo = (nowBlock-1) * rowPerPage + 1;
		//페이지 끝 번호
		int endPageNo = 0;
		if(pageTotalBlock == nowBlock) {
			endPageNo = totalPageNo;
		} else {
			endPageNo = beginPageNo + 9;
		}
		//페이지당 게시글 시작 번호
		int beginBoardNo = (no-1) * rowPerPage + 1 ;
		//페이지당 게시글 끝 번호
		int endBoardNo = no * rowPerPage;
		
		pageNo.setPageTotalNo(totalPageNo);
		pageNo.setPageTotalBlockNo(pageTotalBlock);
		pageNo.setNowBlockNo(nowBlock);
		pageNo.setBeginPageNo(beginPageNo);
		pageNo.setEndPageNo(endPageNo);
		pageNo.setBeginBoardNo(beginBoardNo);
		pageNo.setEndBoardNo(endBoardNo);
		
		
		map.put("PageNo", pageNo);
		map.put("BeginEndBoardList", noticeDao.getBeginEndBoard(pageNo));
		
		return map;
	}
	
	
}

package com.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.NoticeDao;
import com.finalproject.dao.TodayPlanDao;
import com.finalproject.model.NoticeBoard;
import com.finalproject.model.PageVo;
import com.finalproject.model.TodayPlan;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private TodayPlanDao todayPlanDao;
	
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
	public int getTotalBoard(int pn) {
		return noticeDao.getTotalBoard();
	}
	
	@Override
	public List<NoticeBoard> getBeginEndBoard(PageVo pageVo) {
		return noticeDao.getBeginEndBoard(pageVo);
	}
	
}

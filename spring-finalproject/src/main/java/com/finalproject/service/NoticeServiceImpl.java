package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.NoticeDao;
import com.finalproject.model.NoticeBoard;

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
	
	
}

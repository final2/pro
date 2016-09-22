package com.finalproject.model;

public class PageNo {

	//게시글 총 수 
	private int boardTotalNo;
	//페이지 총 수
	private int pageTotalNo;
	//페이지 총 블록 수 
	private int pageTotalBlockNo;
	//현재 블록
	private int nowBlockNo;
	//페이지 시작 번호
	private int beginPageNo;
	//페이지 끝 번호
	private int endPageNo;
	//페이지당 게시글 시작 번호
	private int beginBoardNo;
	//페이지당 게시글 끝 번호
	private int endBoardNo;
	
	public int getBoardTotalNo() {
		return boardTotalNo;
	}
	public void setBoardTotalNo(int boardTotalNo) {
		this.boardTotalNo = boardTotalNo;
	}
	public int getPageTotalNo() {
		return pageTotalNo;
	}
	public void setPageTotalNo(int pageTotalNo) {
		this.pageTotalNo = pageTotalNo;
	}
	public int getPageTotalBlockNo() {
		return pageTotalBlockNo;
	}
	public void setPageTotalBlockNo(int pageTotalBlockNo) {
		this.pageTotalBlockNo = pageTotalBlockNo;
	}
	public int getNowBlockNo() {
		return nowBlockNo;
	}
	public void setNowBlockNo(int nowBlockNo) {
		this.nowBlockNo = nowBlockNo;
	}
	public int getBeginPageNo() {
		return beginPageNo;
	}
	public void setBeginPageNo(int beginPageNo) {
		this.beginPageNo = beginPageNo;
	}
	public int getEndPageNo() {
		return endPageNo;
	}
	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}
	public int getBeginBoardNo() {
		return beginBoardNo;
	}
	public void setBeginBoardNo(int beginBoardNo) {
		this.beginBoardNo = beginBoardNo;
	}
	public int getEndBoardNo() {
		return endBoardNo;
	}
	public void setEndBoardNo(int endBoardNo) {
		this.endBoardNo = endBoardNo;
	}
}

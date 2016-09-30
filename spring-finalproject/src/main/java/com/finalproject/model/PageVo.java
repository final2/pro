package com.finalproject.model;

public class PageVo {

	//페이지 번호
	private int pageNo;
	//현재 블록
	private int blockNo;
	
	//전체 페이지
	private int totalPages;
	//전체 블록수
	private int totalBlocks;
	
	//시작 페이지
	private int beginPage;
	//끝 페이지
	private int endPage;
	
	//게시글 시작 번호
	private int beginIndex;
	//게시글 끝 번호
	private int endIndex;
	
	public PageVo(int rows, int pages, int pageNo, int totalRows) {
		this.pageNo = pageNo;
		
		this.totalPages = (int)Math.ceil((double)totalRows/rows);
		this.totalBlocks = (int)Math.ceil((double)totalPages/pages);

		this.blockNo = (int)Math.ceil((double)pageNo/pages);
		this.beginPage = (blockNo - 1)*pages + 1;
		this.endPage = blockNo*pages;
		if (blockNo == totalBlocks) {
			endPage = totalPages;
		}
	}

	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBlockNo() {
		return blockNo;
	}
	public void setBlockNo(int blockNo) {
		this.blockNo = blockNo;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getTotalBlocks() {
		return totalBlocks;
	}
	public void setTotalBlocks(int totalBlocks) {
		this.totalBlocks = totalBlocks;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getBeginIndex() {
		return beginIndex;
	}


	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}


	public int getEndIndex() {
		return endIndex;
	}


	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	
	
	
}

package com.finalproject.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

public class NoticeBoard {

	private int no;
	private String title;
	private String content;
	private Date regdate;
	private int boardRank;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getBoardRank() {
		return boardRank;
	}
	public void setBoardRank(int boardRank) {
		this.boardRank = boardRank;
	}
	
	
	
}

package com.finalproject.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

public class BranchOrder {

	private int no;
	@JsonFormat(shape=Shape.STRING, pattern="yyyy-MM-dd")
	private Date regdate;
	private String note;
	private int branchNo;
	private String iscomplete;
	private String iscart;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getBranchNo() {
		return branchNo;
	}
	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}
	public String getIscomplete() {
		return iscomplete;
	}
	public void setIscomplete(String iscomplete) {
		this.iscomplete = iscomplete;
	}
	public String getIscart() {
		return iscart;
	}
	public void setIscart(String iscart) {
		this.iscart = iscart;
	}
	
	
}

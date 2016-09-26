package com.finalproject.model;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TodayPlan {

	private int no;
	@NotBlank(message="제목을 입력해주세요")
	private String title;
	@NotBlank(message="내용을 입력해주세요")
	private String contents;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date regdate;
	private int empNo;
	private char successed;
	
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@JsonFormat(pattern="yyyy-MM-dd")
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public char getSuccessed() {
		return successed;
	}
	public void setSuccessed(char successed) {
		this.successed = successed;
	}
	
	
	
	
	
}

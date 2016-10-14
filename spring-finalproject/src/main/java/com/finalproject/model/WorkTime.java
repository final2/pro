package com.finalproject.model;

import java.util.Date;

public class WorkTime {

	private int no;
	private Date attendance;
	private Date leaving;
	private String late = "0";
	private String earlyleave = "0";
	private int overtime = 0;
	private Date regDate;
	private Employee emp;
	
	public WorkTime() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getAttendance() {
		return attendance;
	}

	public void setAttendance(Date attendance) {
		this.attendance = attendance;
	}

	public Date getLeaving() {
		return leaving;
	}

	public void setLeaving(Date leaving) {
		this.leaving = leaving;
	}

	public String getLate() {
		return late;
	}

	public void setLate(String late) {
		this.late = late;
	}

	public String getEarlyleave() {
		return earlyleave;
	}

	public void setEarlyleave(String earlyleave) {
		this.earlyleave = earlyleave;
	}

	public int getOvertime() {
		return overtime;
	}

	public void setOvertime(int overtime) {
		this.overtime = overtime;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	
	
}

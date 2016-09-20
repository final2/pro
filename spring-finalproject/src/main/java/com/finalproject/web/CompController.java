package com.finalproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompController {

	// 회사 메인
	@RequestMapping("notice.do")
	public String main() {
		return "companynotice/notice";
	}
	
	@RequestMapping("calendar.do")
	public String Calendar() {
		return "companynotice/calendar";
	}
	@RequestMapping("calendar2.do")
	public String Calendar2() {
		return "companynotice/calendar2";
	}
}

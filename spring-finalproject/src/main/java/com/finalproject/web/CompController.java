package com.finalproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompController {

	// 본사 로그인페이지
	@RequestMapping("companylogin.do")
	public String compLogin() {
		return "companylogin";
	}
	
	// 회사 메인
	@RequestMapping("notice.do")
	public String main() {
		return "companynotice/notice";
	}
}

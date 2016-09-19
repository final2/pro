package com.finalproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompController {

	// 회사 메인
	@RequestMapping("compmain.do")
	public String main() {
		return "compmain";
	}
}

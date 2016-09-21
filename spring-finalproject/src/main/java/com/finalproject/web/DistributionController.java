package com.finalproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DistributionController {

	// 거래처 페이지
	@RequestMapping("client.do")
	public String client() {
		return "companydistribution/client";
	}
	
	// 거래처 등록페이지
	@RequestMapping("clientdetail.do")
	public String clientdetail() {
		return "companydistribution/clientdetail";
	}
	
}

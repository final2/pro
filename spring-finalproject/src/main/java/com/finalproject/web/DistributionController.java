package com.finalproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DistributionController {

	// 거래처 리스트 페이지
	@RequestMapping("clientList.do")
	public String clientList() {
		return "companydistribution/clientList";
	}
	
	// 거래처 수정 페이지
	@RequestMapping("updateClient.do")
	public String updateClient() {
		return "companydistribution/updateClient";
	}
	
	// 거래처 등록 페이지
	@RequestMapping("addClient.do")
	public String addClient() {
		return "companydistribution/addClient";
	}
	
}

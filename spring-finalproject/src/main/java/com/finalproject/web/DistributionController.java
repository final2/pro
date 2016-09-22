package com.finalproject.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalproject.model.Client;
import com.finalproject.service.DistributionService;

@Controller
public class DistributionController {

	@Autowired
	private DistributionService distributionService;
	
	// 거래처 리스트 페이지
	@RequestMapping("clientList.do")
	public String clientList(Model model) {
		List<Client> clientList = distributionService.getClientList();
		model.addAttribute("clientList", clientList);
		
		return "companydistribution/clientList";
	}
	
	// 거래처 수정 페이지
	@RequestMapping("updateClient.do")
	public String updateClient() {
		return "companydistribution/updateClient";
	}
	
	// 거래처 등록 페이지
	@RequestMapping(value="addClient.do", method=RequestMethod.GET)
	public String addClient() {
		return "companydistribution/addClient";
	}
	
	@RequestMapping(value="addClient.do", method=RequestMethod.POST)
	public String writeClient(Client client) {
		distributionService.addNewClient(client);
		return "redirect:/clientList.do";
	}
	
}

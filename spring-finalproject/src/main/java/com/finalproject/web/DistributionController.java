package com.finalproject.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.service.DistributionService;

@Controller
public class DistributionController {

	@Autowired
	private DistributionService distributionService;
	
	// 거래처 리스트 페이지
	@RequestMapping("clientList.do")
	public String clientList(Model model) {
		List<Client> clientList = distributionService.getClientList();
		model.addAttribute("List", clientList);
		
		return "companydistribution/clientList";
	}
	
	// 거래처 상세정보 페이지
	@RequestMapping("clientDetail.do")
	public String clientDetail(@RequestParam(name="no") int no, Model model) {
		List<ClientDetail> clientDetailes = distributionService.getClientByNo(no);
		model.addAttribute("detailes", clientDetailes);
		return "companydistribution/clientDetail";
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
	
	// 발주내역 리스트 페이지
	@RequestMapping("hqOrder.do")
	public String hqOrder() {
		return "companydistribution/hqOrder";
	}
	
	// 발주 상세정보 페이지
	@RequestMapping("hqOrderDetail.do")
	public String hqOrderDetail() {
		return "companydistribution/hqOrderDetail";
	}
	
	// 발주 신청 페이지
	@RequestMapping(value="orderApp.do", method=RequestMethod.GET)
	public String orderApp() {
		return "companydistribution/orderApp";
	}
	@RequestMapping(value="orderApp.do", method=RequestMethod.POST)
	public String writerOrder() {
		return "redirect:/hqOrder.do";
	}
	
	// 발주 신청 수정 페이지
	@RequestMapping("updateOrder.do")
	public String updateOrder() {
		return "companydistribution/updateOrder";
	}
}

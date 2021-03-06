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
import com.finalproject.model.ClientDetailPageVo;
import com.finalproject.model.HqInventory;
import com.finalproject.model.HqOrder;
import com.finalproject.model.HqOrderDetail;
import com.finalproject.model.OrderForm;
import com.finalproject.model.PageVo;
import com.finalproject.model.Product;
import com.finalproject.service.DistributionService;

@Controller
public class DistributionController {

	@Autowired
	private DistributionService distributionService;
	
/* 본사 =========================================================================================================== */
	// 재고 리스트
	/*@RequestMapping("/invenList.do")
	public String invenLists(Model model) {
		List<HqInventory> invenList = distributionService.getInvenLists();
		model.addAttribute("inven", invenList);
		
		return "companydistribution/hqInven";
	}*/

	@RequestMapping(value="/invenList.do", method=RequestMethod.GET)
	public String getBegunEndInvens(@RequestParam(name="pn", required=false, defaultValue="1")int pn, Model model) {
		
		if(pn<1) {
			return "redirect:/hqInven?pn=1";

		}
		int rows = 10;
		int pages = 5;
		int beginIndex = (pn - 1) * rows + 1;
		int endIndex = pn *rows;
		
		int totalInven = distributionService.getTotalInven(pn);
		
		PageVo pageVo = new PageVo(rows, pages, pn, totalInven);
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
		
		if(pn > pageVo.getTotalPages()) {
			return "companydistribution/hqInven?pn=" + pageVo.getTotalPages();
		}
		
		List<HqInventory> invens = distributionService.getBeginEndInvens(pageVo);
		
		model.addAttribute("inven", invens);
		model.addAttribute("pageVo", pageVo);
		
		return "companydistribution/hqInven";
	}
		
/* 거래처 ========================================================================================================= */
		
	// 거래처 리스트 페이지
	@RequestMapping(value="/clientList.do", method=RequestMethod.GET)
	public String getBeginEndClients(@RequestParam(name="pn", required=false, defaultValue="1") int pn, Model model) {
		// 페이지 번호가 1보다 작으면 1페이지로 리다이렉트
		if (pn < 1) {
			return "redirect:/clientList?pn=1";	
		}
		int rows = 10;
		int pages = 5;
		int beginIndex = (pn - 1)* rows + 1;
		int endIndex = pn*rows;
		
		// 전체 리스트 수 조회하기
		int totalLists = distributionService.getTotalClient(pn);
		// 페이지 객체 생성하기
		PageVo pageVo = new PageVo(rows, pages, pn, totalLists);
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
		
		if(pn > pageVo.getTotalPages()) {			
			return "companydistribution/clientList?pn=" + pageVo.getTotalPages();
		}
		
		List<Client> clients = distributionService.getBeginEndClients(pageVo);
		
		model.addAttribute("clientList", clients);
		model.addAttribute("pageVo", pageVo);
		
		return "companydistribution/clientList";
		
	}
	
	// 거래처 상세정보 페이지
	@RequestMapping("/clientDetail.do")
	public String clientDetail(ClientDetailPageVo cdpv,@RequestParam(name="pn", required=false, defaultValue="1")int pn, Model model) {
		Client clients = distributionService.getClientsByNo(cdpv.getNo());
		
		//List<ClientDetail> details = distributionService.getClientDetailsByNo(no);
		int rows = 10;
		int pages = 5;
		int beginIndex = (pn - 1)* rows + 1;
		int endIndex = pn*rows;
		// 전체 공지사항 수 조회하기
		int totalBoards = distributionService.ClientSearchTotalNo(cdpv);
		
		// 페이지 객체 생성하기
		PageVo pageVo = new PageVo(rows, pages, pn, totalBoards);
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
		
		cdpv.setPageVo(pageVo);
		
		List<Product> products = distributionService.ClientSearchPageList(cdpv);
		
		model.addAttribute("clients", clients);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("products", products);
		//model.addAttribute("details", details);
		
		return "companydistribution/clientDetail";
	}
	
	// 거래처 수정 페이지
	@RequestMapping(value="/updateClient.do", method=RequestMethod.GET)
	public String updateClient(int no, Model model) {
		Client client = distributionService.getClientsByNo(no);
		model.addAttribute("client", client);
		
		return "companydistribution/updateClient";
	}
	
	// 거래처 수정 페이지
	@RequestMapping(value="/updateClient.do", method=RequestMethod.POST)
	public String writerUpdate(Client client) {
		distributionService.updateClient(client);
		return "redirect:/clientDetail.do?no="+client.getNo();
	}
	
	// 거래처 등록 페이지
	@RequestMapping(value="/addClient.do", method=RequestMethod.GET)
	public String addClient() {
		return "companydistribution/addClient";
	}
	@RequestMapping(value="/addClient.do", method=RequestMethod.POST)
	public String writeClient(Client client) {
		distributionService.addNewClient(client);
		return "redirect:/clientList.do?pn=1";
	}

/* 발주 ========================================================================================================== */
	// 발주 리스트 페이지
	@RequestMapping("/hqOrder.do")
	public String orderLists(Model model) {
		List<HqOrder> orderList = distributionService.getHqOrderLists();
		model.addAttribute("orderLists", orderList);
		return "companydistribution/hqOrder";
	}
	
	// 발주 신청 페이지
	@RequestMapping(value="/orderApp.do", method=RequestMethod.GET)
	public String orderApp(Model model) {
		List<Client> clientList = distributionService.getClientList();
		model.addAttribute("clientList", clientList);
		
		return "companydistribution/orderApp";
	}
	@RequestMapping(value="/orderApp.do", method=RequestMethod.POST)
	public String writerOrder(OrderForm orderForm) {
		
		HqOrder hqOrder = new HqOrder();
		Client client = new Client();
		client.setNo(orderForm.getClientNo());
		
		int[] no = orderForm.getNo();
		int[] price = orderForm.getPrice();
		int[] qty = orderForm.getQty();
		
		hqOrder.setClient(client);
		int orderNo = distributionService.orderNo();
		hqOrder.setNo(orderNo);
		
		distributionService.NewOrder(hqOrder);
		
		for (int i=0;i<no.length ;i++){
			if(qty[i] != 0){
				HqOrderDetail orderDetail = new HqOrderDetail();
				orderDetail.setQty(qty[i]);
				orderDetail.setHqOrder(hqOrder);
				
				Product product = new Product();
				product.setNo(no[i]);
				product.setPrice(price[i]);
				orderDetail.setProduct(product);
				
				distributionService.NewProductOrder(orderDetail);
			}
		}
		return "redirect:/hqOrder.do";
	}
	
	// 발주 상세정보 페이지
	@RequestMapping("/hqOrderDetail.do")
	public String hqOrderDetail(@RequestParam(name="no")int no, Model model) {
		HqOrder orders = distributionService.getOrderByNo(no);
		
		List<HqOrderDetail> details = distributionService.getOrderDetailByNo(no);
		
		model.addAttribute("orders", orders);
		model.addAttribute("details", details);
		
		return "companydistribution/hqOrderDetail";
	}
	
	// 발주 신청 수정 페이지
	@RequestMapping(value="/updateOrder.do", method=RequestMethod.GET)
	public String updateOrderFom(@RequestParam(name="no") int no, Model model) {
		HqOrder orders = distributionService.getOrderByNo(no);
		List<HqOrderDetail> details = distributionService.getOrderDetailByNo(no);
		
		model.addAttribute("orders", orders);
		model.addAttribute("details", details);
		
		return "companydistribution/updateOrder";
	}
	@RequestMapping(value="/updateOrder.do", method=RequestMethod.POST)
	public String updateOrder(OrderForm orderForm) {
		
		HqOrderDetail hqOrderDetail = new HqOrderDetail();
		HqOrder hqOrder = new HqOrder();
		hqOrder.setNo(orderForm.getOrderNo());
		
		int[] no = orderForm.getNo();
		int[] price = orderForm.getPrice();
		int[] qty = orderForm.getQty();
		
		for(int i=0; i<no.length; i++) {

			if(qty[i] != 0) {
				hqOrderDetail.setQty(qty[i]);
				hqOrderDetail.setHqOrder(hqOrder);
				
				Product product = new Product();
				product.setNo(no[i]);
				product.setPrice(price[i]);
				hqOrderDetail.setProduct(product);
				
				distributionService.updateOrder(hqOrderDetail);
			}
		}
		return "redirect:/hqOrderDetail.do?no="+hqOrderDetail.getHqOrder().getNo();
	}
	
	// 입고여부 확인
	@RequestMapping("/orderConfirm.do")
	public String orderConfirm(int orderNo) {
		distributionService.addInventory(orderNo);
		return "redirect:/hqOrderDetail.do?no="+orderNo;
		
	}

}

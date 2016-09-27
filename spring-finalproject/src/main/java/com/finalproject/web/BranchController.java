package com.finalproject.web;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.model.BranchInventory;
import com.finalproject.model.BranchOrder;
import com.finalproject.model.BranchOrderDetail;
import com.finalproject.service.BranchService;


@Controller
public class BranchController {
	
	@Autowired BranchService brService;
	
	// 지점 로그인
	@RequestMapping("/branch/branchlogin.do")
	public String login() {
		return "branch/login";
	}
	
	// 지점 로그아웃
	@RequestMapping(value="/branch/branchlogout.do", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/branch/branchlogin.do";
    }
	
	@RequestMapping("/branch/denied.do")
	public String deniy() {
		return "branch/denied";
	}

	// 지점 메인
	@RequestMapping("/branch/branchmain.do")
	public String main() {
		return "branch/main";
	}
	
	// 지점 - 판매
	@RequestMapping("/branch/branchsales.do")
	public String sales() {
		return "branch/sales";
	}
	
	// 지점 - 재고
	@RequestMapping("/branch/branchinven.do")
	public String inventory() {
		return "branch/inventory";
	}
	
	// 지점 - 발주
	@RequestMapping("/branch/branchorder.do")
	public String order() {
		return "branch/order";
	}
	
	// 발주 전송하기
	@RequestMapping("/branch/orderupdate.do")
	public String orderUpdate(@RequestParam(name="no") int no) {
		
		List<BranchOrderDetail> detailList = brService.getWaitingOrder(no);
		
		for (BranchOrderDetail d : detailList){
			int productNo = d.getProduct().getNo();
			BranchInventory inven = brService.getInventoryByProductNo(productNo);
			
			if(inven.getProductNo() == d.getProduct().getNo()) {
				inven.setQty(inven.getQty() + d.getQty());
				brService.updateInventory(inven);
			} 
			
			if(inven.getProductNo() != d.getProduct().getNo()) {
				inven = new BranchInventory();
				inven.setQty(d.getQty());
				inven.setBranchNo(d.getOrder().getBranchNo());
				inven.setProductNo(d.getProduct().getNo());
				brService.addInventory(inven);
			}
		}
		
		BranchOrder order = brService.getBranchOrderByNo(no);
		order.setIscart("Y");		
		brService.updateBranchOrder(order);
			
		return "branch/order";
	}
	
	
	
}

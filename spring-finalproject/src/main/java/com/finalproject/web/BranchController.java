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
import com.finalproject.model.Product;
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
	
	// 발주 전송하기 : 발주 수정하기
	@RequestMapping("/branch/orderupdate.do")
	public String orderUpdate(@RequestParam(name="brno") int brno, @RequestParam(name="no") int no) {
		
		BranchOrder order = brService.getBranchOrderByNo(no);
		order.setIscart("Y");		
		brService.updateBranchOrder(order);
			
		return "branch/order";
	}
	
	
	// 발주 전송하기 : 재고에 저장
	@RequestMapping("/branch/invenupdate.do")
	public String invenUpdate(@RequestParam(name="no") int no) {
		
		List<BranchOrderDetail> detailList = brService.getOrderDetailsByOrderNo(no);
		BranchOrder order = brService.getBranchOrderByNo(no);
		
		for (BranchOrderDetail d : detailList){
			int productNo = d.getProduct().getNo();
			BranchInventory inven = brService.getInventoryByProductNo(productNo);

			if(inven != null && inven.getProduct().getNo() == d.getProduct().getNo()) {
				inven.setQty(inven.getQty() + d.getQty());
				brService.updateInventory(inven);
			} else {
				inven = new BranchInventory();
				inven.setQty(d.getQty());
				inven.setBranchNo(order.getBranchNo());
				
				Product product = brService.getProductByNo(d.getProduct().getNo());
				inven.setProduct(product);
				brService.addInventory(inven);
			}
		}
		
		order.setIscomplete("Y");		
		brService.updateBranchOrder(order);
		
		return "branch/order";
	}

	// 지점 - 행사상품
	@RequestMapping("/branch/branchevent.do")
	public String event() {
		return "branch/event";
	}
}

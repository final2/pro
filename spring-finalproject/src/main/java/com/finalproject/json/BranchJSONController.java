package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.model.BranchOrderDetail;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;
import com.finalproject.service.BranchService;

@RestController
public class BranchJSONController {
	
	@Autowired BranchService brService;
	
	// 전체 대분류 조회
	@RequestMapping(value="/lcat/", method=RequestMethod.GET)
	public List<LargeCategory> getAllLargeCats() {
		return brService.getAllLargeCats();
	}
	
	// 대분류 번호로 소분류 조회
	@RequestMapping(value="/scat/{no}", method=RequestMethod.GET)
	public List<SmallCategory> getSmallCatsByLargeNo(@PathVariable("no") int no) {
		return brService.getSmallCatsByLargeNo(no);
	}
	
	// 소분류 번호로 물품 조회
	@RequestMapping(value="/pt/{no}", method=RequestMethod.GET)
	public List<Product> getProductsBySmallNo(@PathVariable("no") int no) {
		return brService.getProductsBySmallNo(no);
	}
	
	// 발주대기 주문 조회
	@RequestMapping(value="/wor/{no}", method=RequestMethod.GET)
	public List<BranchOrderDetail> getWaitingOrder(@PathVariable("no") int no) {
		return brService.getWaitingOrder(no);
	}

	// 발주대기 목록에서 삭제
	@RequestMapping(value="/wor/{no}", method=RequestMethod.DELETE)
	public List<BranchOrderDetail> deleteOrderDetailByNo(@PathVariable("no") int no) {
		brService.deleteWaitingByOrderDetailNo(no);
		BranchOrderDetail detail = brService.getOrderDetailByNo(no);
		return brService.getWaitingOrder(detail.getOrder().getNo());
	}
	
}

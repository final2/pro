package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.dao.DistributionDao;
import com.finalproject.model.Client;
import com.finalproject.model.ClientDetailPageVo;
import com.finalproject.model.HqInventory;
import com.finalproject.model.HqOrder;
import com.finalproject.model.PageVo;
import com.finalproject.model.Product;
import com.finalproject.service.DistributionService;

@Controller
public class DistributionJSONController {

	@Autowired DistributionService disService;
	
	@Autowired DistributionDao dDao;
	
	// 거래처 번호로 물품 조회
	@RequestMapping(value="/pro/{no}", method=RequestMethod.GET)
	public @ResponseBody List<HqInventory> getProductByNo(@PathVariable("no")int no) {
		return disService.getInvenByNo(no);
	}
		
	// 입고 여부 변경
	@RequestMapping(value="/con/{no}", method=RequestMethod.GET)
	public @ResponseBody HqOrder updateConfirm(@PathVariable("no")int orderNo) {
		HqOrder order = disService.getOrderByNo(orderNo);
		disService.updateCon(order);
		return disService.getOrderByNo(orderNo);
	}
	
	// 거래처명 중복 체크
	@RequestMapping("/nameck.do")
	public @ResponseBody String namecheck(String name){
		
		Client checkName = disService.getNameCheck(name);
		
		if (checkName != null) {
			return "{\"size\":1}";
		}
		return "{\"size\":0}";
	}
	
	@RequestMapping(value="/clientDetail/search/{pn}", method=RequestMethod.POST)
	public @ResponseBody List<Product> clientDetailBykeyword(@RequestBody ClientDetailPageVo cdpv,@PathVariable int pn) {
		
		int rows = 10;
		int pages = 5;
		int beginIndex = (pn - 1)* rows + 1;
		int endIndex = pn*rows;
		// 전체 공지사항 수 조회하기
		int totalBoards = dDao.ClientSearchTotalNo(cdpv);
		
		// 페이지 객체 생성하기
		PageVo pageVo = new PageVo(rows, pages, pn, totalBoards);
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
		
		cdpv.setPageVo(pageVo);
		
		return dDao.ClientSearchPageList(cdpv);
		
	}
	
}

package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.acls.model.Sid;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.model.HqOrder;
import com.finalproject.service.DistributionService;

@RestController
public class DistributionJSONController {

	@Autowired DistributionService disService;
	
	// 거래처 번호로 물품 조회
	@RequestMapping(value="/pro/{no}", method=RequestMethod.GET)
	public List<ClientDetail> getProductByNo(@PathVariable("no")int no) {
		return disService.getClientDetailsByNo(no);
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
	
}

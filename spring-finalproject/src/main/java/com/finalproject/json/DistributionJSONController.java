package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.model.ClientDetail;
import com.finalproject.service.DistributionService;

@RestController
public class DistributionJSONController {

	@Autowired DistributionService disService;
	
	// 거래처 번호로 물품 조회
		@RequestMapping(value="/pro/{no}", method=RequestMethod.GET)
		public List<ClientDetail> getProductByNo(@PathVariable("no")int no) {
			return disService.getClientDetailsByNo(no);
		}
}
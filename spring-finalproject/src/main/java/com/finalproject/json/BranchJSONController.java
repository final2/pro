package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.BranchDao;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;

@RestController
public class BranchJSONController {
	
	@Autowired BranchDao branchDao;
	
	@RequestMapping(value="/lcat/", method=RequestMethod.GET)
	public List<LargeCategory> getAllLargeCats() {
		return branchDao.getAllLargeCats();
	}
	
	@RequestMapping(value="/scat/{no}", method=RequestMethod.GET)
	public List<SmallCategory> getSmallCatsByLargeNo(@PathVariable("no") int no) {
		return branchDao.getSmallCatsByLargeNo(no);
	}
	
	@RequestMapping(value="/pt/{no}", method=RequestMethod.GET)
	public List<Product> getProductsBySmallNo(@PathVariable("no") int no) {
		return branchDao.getProductsBySmallNo(no);
	}

}

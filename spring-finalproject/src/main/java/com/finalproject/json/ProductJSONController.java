package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.dao.ProductDao;
import com.finalproject.model.Client;
import com.finalproject.model.Event;
import com.finalproject.model.SmallCategory;

@Controller
public class ProductJSONController {

	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(value="/product/get", method=RequestMethod.GET)
	public @ResponseBody void getSelect(Model model) {
		List<Client> clients = productDao.getClient();
		List<Event> events =  productDao.getEvent();
		List<SmallCategory> smallCategorys =  productDao.getSmallCategory();
		
		model.addAttribute("clients", clients);
		model.addAttribute("events", events);
		model.addAttribute("smallCategorys", smallCategorys);
	}
}

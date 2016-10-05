package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.dao.ProductDao;
import com.finalproject.model.Client;
import com.finalproject.model.Event;
import com.finalproject.model.PageVo;
import com.finalproject.model.Product;
import com.finalproject.model.ProductDetail;
import com.finalproject.model.ProductPageVo;
import com.finalproject.model.ProductSearch;
import com.finalproject.model.SmallCategory;

@Controller
public class ProductJSONController {

	//private static String UPLOAD_DIRECTORY = "resources/image";
	
	@Autowired
	private ProductDao productDao;
	
	//제품 리스트 제조사, 분류 불러오기
	@RequestMapping(value="/product/get", method=RequestMethod.POST)
	public @ResponseBody ProductDetail getSelect(@RequestBody ProductSearch productSearch) {
		
		List<Client> clients = productDao.getClient();
		List<Event> events =  productDao.getEvent();
		List<SmallCategory> smallCategorys =  productDao.getSmallCategory();
		
		ProductDetail productDetail = new ProductDetail();
		productDetail.setClients(clients);
		productDetail.setEvents(events);
		productDetail.setSmallCategorys(smallCategorys);
		productDetail.setProductSearch(productSearch);
		
		return productDetail;
	}
	//제품 등록 제조사 분류 불러오기
	@RequestMapping(value="/product/getSelect", method=RequestMethod.GET)
	public @ResponseBody ProductDetail getProductSelect() {
		List<Client> clients = productDao.getClient();
		List<Event> events =  productDao.getEvent();
		List<SmallCategory> smallCategorys =  productDao.getSmallCategory();
		
		ProductDetail productDetail = new ProductDetail();
		productDetail.setClients(clients);
		productDetail.setEvents(events);
		productDetail.setSmallCategorys(smallCategorys);
		
		return productDetail;
	}

}

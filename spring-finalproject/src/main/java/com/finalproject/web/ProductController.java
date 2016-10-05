package com.finalproject.web;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.model.Client;
import com.finalproject.model.Event;
import com.finalproject.model.PageVo;
import com.finalproject.model.Product;
import com.finalproject.model.ProductRegister;
import com.finalproject.model.ProductSearch;
import com.finalproject.model.SmallCategory;
import com.finalproject.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	//ProductAdd 페이지 이동
	@RequestMapping(value="/product.do")
	public String product() {
		return "companynotice/productForm";
	}
	
	@RequestMapping(value="/product.do", method=RequestMethod.POST)
	public String productAdd(ProductRegister productRegister, @RequestParam("image")MultipartFile upfile ) throws Exception {
		Product product = new Product();
		
		Client client = productService.getClientByNo(productRegister.getClientNo());
		Event event = new Event();
		event.setNo(productRegister.getEvent());
		SmallCategory smallCat = new SmallCategory();
		smallCat.setNo(productRegister.getSmallCat());
		
		product.setName(productRegister.getName());
		product.setPrice(productRegister.getPrice());
		product.setMemo(productRegister.getMemo());
		product.setLimiteAge(productRegister.getLimiteAge());
		product.setSmallCat(smallCat);
		product.setEvent(event);
		product.setMaker(client.getName());
		product.setClientNo(client.getNo());
		
		if (!upfile.isEmpty()) {
			Files.copy(upfile.getInputStream(), Paths.get("C:\\Users\\YoungRok\\git\\pro\\spring-finalproject\\src\\main\\webapp\\resources\\image", upfile.getOriginalFilename()));

			product.setImage(upfile.getOriginalFilename());
		}
		
		productService.addProduct(product);
		
		return "redirect:/product.do";
	}
	
	//ProuctList 페이지 이동
	@RequestMapping("/productList.do")
	public String productList(@RequestParam(name="pn", required=false, defaultValue="1")int pn, ProductSearch productSearch,  Model model) {
		if(pn < 1) {
			return "redirect:/productList.do?pn=1";
		}
		int rows = 20;
		int pages = 10;
		int beginIndex = (pn - 1)* rows + 1;
		int endIndex = pn*rows;
		// 전체 공지사항 수 조회하기
		int totalBoards = productService.getTotalProduct(productSearch);
		
		// 페이지 객체 생성하기
		PageVo pageVo = new PageVo(rows, pages, pn, totalBoards);
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
		
		productSearch.setBeginIndex(beginIndex);
		productSearch.setEndIndex(endIndex);
		
		if(pn > pageVo.getTotalPages()) {			
			return "redirect:/productList.do?pn=" + pageVo.getTotalPages();
		}		
		
		List<Product> getProductPageList = productService.getProductPageList(productSearch);
		
		model.addAttribute("productSearch", productSearch);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("productList", getProductPageList);
		
		
		return "companynotice/productList";
	}
	
	@RequestMapping(value="/productDetail.do", method=RequestMethod.GET) 
	public String productDetail() {
		return "companynotice/productDetail";
	}
}

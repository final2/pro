package com.finalproject.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.model.Branch;
import com.finalproject.model.Product;
import com.finalproject.model.WebBoard;
import com.finalproject.service.WebService;

@Controller
public class WebController {
	
	@Autowired
	private WebService webservice;

	//웹 메인페이지
	@RequestMapping("main.do")
	public String main(){
		return "website/main";
	} 
	//웹 메인페이지 우측중앙 
	@RequestMapping("main2.do")
	public @ResponseBody List<Product> main2(@RequestParam(name="no") int no){
		return webservice.getProductByEvent(no);
	}
	
	//atm설치점
	@RequestMapping("atm2.do")
	public @ResponseBody List<Branch> atm2(){
		return webservice.getBranchByATM();
	}
	//atm설치점
	@RequestMapping("delivery2.do")
	public @ResponseBody List<Branch> delivery2(){
		return webservice.getBranchByPARCELSERVICE();
	}
	//lotto판매점
	@RequestMapping("lotto2.do")
	public @ResponseBody List<Branch> lotto2(){
		return webservice.getBranchByLotto();
	}
	// 즉석 조리식품 판매점 
	@RequestMapping("makeFood2.do")
	public @ResponseBody List<Branch> makeFood2(){
		return webservice.getBranchByFreshFood();
	}
	//회사소개
	@RequestMapping("intro.do")
	public String intro(){
		return "website/intro";
	}
	//공지사항
	@RequestMapping("announcement.do")
	public String announcement(Model model){
		List<WebBoard> boardList= webservice.getAllBoardList();
		model.addAttribute("announcementList", boardList);
		return "website/announcement";
	}
	//이벤트상품조회
	@RequestMapping("oneplus.do")
	public String oneplus(@RequestParam(name="no") int no,Model model){
		List<Product> eventList=webservice.getProductByEvent(no);
		model.addAttribute("eventList",eventList);
		return "website/oneplus";
	}
	//로또판매점조회
	@RequestMapping("lotto.do")
	public String lotto(Model model){
		List<Branch> branchList = webservice.getBranchByLotto();
		model.addAttribute("brList",branchList);
		return "website/lotto";
	}
	//atm설치점
	@RequestMapping("atm.do")
	public String atm(Model model){
		List<Branch> atmList =webservice.getBranchByATM();
		model.addAttribute("atmList",atmList);
		return "website/atm";
	}
	//즉석식품판매점
	@RequestMapping("makefood.do")
	public String makefood(Model model){
		List<Branch> makeList =webservice.getBranchByFreshFood();
		model.addAttribute("makeList",makeList);
		return "website/makefood";
	}
	//택배가능점
	@RequestMapping("delivery.do")
	public String delivery(Model model){
		List<Branch> deliveryList =webservice.getBranchByPARCELSERVICE();
		model.addAttribute("deliveryList",deliveryList);
		return "website/delivery";
	}
	//공지사항세부
	@RequestMapping("webBoardDetail.do")
	public String webBoardDetail(@RequestParam(name="no") int no,Model model){
		WebBoard board= webservice.getBoardByNo(no);
		model.addAttribute("boardDetail",board);
		return "website/webboarddetail";
	}
	//문의사항
	@RequestMapping("qnamail.do")
	public String qnamail(){
		return "website/qnamail";
	}
	//지점검색
	@RequestMapping("searchbranch.do")
	public String searchbranch(){
		return "website/searchbranch";
	}
	//지점유형별검색
	@RequestMapping("searchtype.do")
	public String searchtype(){
		return "website/searchtype";
	}
}

package com.finalproject.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//지점유형별검색
	@RequestMapping("searchBranch.do")
	public String searchBranch(){
		return "website/store";
	}
	// 지점유형별 검색
	@RequestMapping("store.do")
	public @ResponseBody List<Branch> store(@RequestParam(name="id") String id){

		return webservice.getBranchByType(id);
	}
	

	// 지점상세검색
	@RequestMapping("branchdetail.do")
	public @ResponseBody Branch branchDetail(@RequestParam(name="no") int no){
		return webservice.getBranchByNo(no);
		
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

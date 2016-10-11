package com.finalproject.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.model.Criteria;
import com.finalproject.model.PageVo;
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
	//공지사항세부
	@RequestMapping("webBoardDetail.do")
	public String webBoardDetail(@RequestParam(name="no") int no,Model model){
		WebBoard board= webservice.getBoardByNo(no);
		model.addAttribute("boardDetail",board);
		return "website/webboarddetail";
	}
	//이벤트상품조회
	@RequestMapping("oneplus.do")
	public String oneplus(@RequestParam(name="no") int no,Model model){
		List<Product> eventList=webservice.getProductByEvent(no);
		model.addAttribute("eventList",eventList);
		return "website/oneplus";
	}
	// 상품 상세 조회
	@RequestMapping("getProduct.do")
	public @ResponseBody Product product(@RequestParam(name="no") int no){
		return webservice.getProductByNo(no);
	}

	//지점유형별검색
	@RequestMapping("searchtype.do")
	public String searchtype(@RequestParam(name="type") String type,Model model){
		System.out.println(type);
		List<Branch> branches = webservice.getBranchByType(type);
		model.addAttribute("branchByType", branches);
		return "website/searchtype";
	}
	
	@RequestMapping("/searchbranch.do")
	public String searchbranch(Criteria criteria,
		@RequestParam(name="pno", required=false, defaultValue="1")int pageNo,
		Model model) {
		
		// 페이지 번호가 1보다 작으면 1페이지로 리다이렉트
		if (pageNo < 1) {
			return "redirect:/searchbranch.do?pno=1";
		}
		int rows = 10;
		int pages = 5;
		int beginIndex = (pageNo - 1)*rows + 1;
		int endIndex = pageNo*rows;
		
		// 전체 데이타 건수 조회하기
		int totalRows = webservice.getTotalRows(criteria);
		System.out.println("totalRows"+totalRows);
		
		// 페이지 내비게이션 정보 생성하기
		PageVo pagination = new PageVo(rows, pages, pageNo, totalRows);
		
		// 페이지번호가 너무 크면 맨 마지막 페이지로 리다이렉트
		//if (pageNo > pagination.getTotalPages()) {
		//	return "redirect:/list.do?pno=" + pagination.getTotalPages();
		//}

		// 데이타 조회하기
		criteria.setBeginIndex(beginIndex);
		criteria.setEndIndex(endIndex);
		List<Branch> branches = webservice.getSearchBranch(criteria);
		System.out.println("branches 사이즈"+branches.size());
		
		// 화면에 값 전달하기
		model.addAttribute("branches", branches);
		model.addAttribute("navi", pagination);
		
		return "website/searchbranch";
	}
}

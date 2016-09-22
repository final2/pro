package com.finalproject.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	//로또판매점
	@RequestMapping("lotto.do")
	public String lotto(){
		return "website/lotto";
	}
	//atm설치점
	@RequestMapping("atm.do")
	public String atm(){
		return "website/atm";
	}
	//즉석식품판매점
	@RequestMapping("makefood.do")
	public String makefood(){
		return "website/makefood";
	}
	//택배가능점
	@RequestMapping("delivery.do")
	public String delivery(){
		return "website/delivery";
	}
}

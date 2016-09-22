package com.finalproject.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalproject.model.NoticeBoard;
import com.finalproject.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	//Notice메인
	@RequestMapping(value="notice.do", method=RequestMethod.GET)
	public String main(Model model) {
		List<NoticeBoard> noticeBoardList = noticeService.getNoticeBoardList();
		model.addAttribute("boardList", noticeBoardList);
		
		return "companynotice/notice";
	}
	
	// 공지사항 작성폼 들어가기
	@RequestMapping(value="boardForm.do", method=RequestMethod.GET)
	public String boardForm() {
		return "companynotice/boardForm";
	}
	
	// 공지사항 작성후 전송값 받기
	@RequestMapping(value="boardForm.do", method=RequestMethod.POST)
	public String writeBoard(NoticeBoard noticeBoard) {
		noticeService.addNoticeBoard(noticeBoard);
		return "redirect:/boardList.do";
	}
	
	// 공지사항 리스트 불러오기
	@RequestMapping("boardList.do")
	public String getBoardList(Model model) {
		List<NoticeBoard> noticeBoardList = noticeService.getNoticeBoardList();
		model.addAttribute("boardList", noticeBoardList);
		
		return "companynotice/boardList";
	}
	
	
}

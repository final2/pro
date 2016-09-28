package com.finalproject.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.model.NoticeBoard;
import com.finalproject.model.TodayPlan;
import com.finalproject.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	/*@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd hh:mm"), false));
	}*/
	
	//Notice메인, 최신 공지사항 불러오기
	@RequestMapping(value="/notice.do", method=RequestMethod.GET)
	public String main(Model model) {
		List<NoticeBoard> noticeBoardList = noticeService.getLatestBoard();
		model.addAttribute("boardList", noticeBoardList);
		
		return "companynotice/notice";
	}
	
	// 공지사항 작성폼 들어가기
	@RequestMapping(value="/boardForm.do", method=RequestMethod.GET)
	public String boardForm() {
		return "companynotice/boardForm";
	}
	
	// 공지사항 작성후 전송값 받기
	@RequestMapping(value="/boardForm.do", method=RequestMethod.POST)
	public String writeBoard(NoticeBoard noticeBoard) {
		noticeService.addNoticeBoard(noticeBoard);
		return "redirect:/boardList.do";
	}
	// 공지사항 페이지당 게시글 불러오기
	@RequestMapping(value="/boardList.do", method=RequestMethod.GET)
	public String getBeginEndBoard(int pn, Model model) {
		
		Map<String, Object> map = noticeService.getBeginEndboard(pn);
		model.addAttribute("boardList", map.get("BeginEndBoardList"));
		model.addAttribute("pageNo", map.get("PageNo"));
		
		return "companynotice/boardList";
	}

	/*// 공지사항 리스트 불러오기
	@RequestMapping("boardList.do")
	public String getBoardList(Model model) {
		List<NoticeBoard> noticeBoardList = noticeService.getNoticeBoardList();
		model.addAttribute("boardList", noticeBoardList);
		
		return "companynotice/boardList";
	}*/
	
	// 공지사항 디테일
	@RequestMapping("/boardDetail.do")
	public String getBoardDetail(@RequestParam(name="no") int no, Model model) {
		NoticeBoard noticeBoard = noticeService.getNoticeBoardByNo(no);
		model.addAttribute("board", noticeBoard);
		
		return "companynotice/boardDetail";
	}
	
	//공지사항 업데이트 폼
	@RequestMapping(value="/boardUpdateForm.do", method=RequestMethod.GET)
	public String getBoardUpdate(int no, Model model) {
		NoticeBoard noticeBoard = noticeService.getNoticeBoardByNo(no);
		model.addAttribute("board", noticeBoard);
		
		return "companynotice/boardUpdateForm";
	}
	
	//공지사항 업데이트
	@RequestMapping(value="/boardUpdateForm.do", method=RequestMethod.POST)
	public String updateBoard(NoticeBoard noticeBoard) {
		noticeService.updateBoard(noticeBoard);
		return "redirect:/boardDetail.do?no="+noticeBoard.getNo();
	}
	
	//TodayPlan 페이지 이동 
	@RequestMapping(value="/todayplan.do", method=RequestMethod.GET)
	public String todayPlan() {
		return "companynotice/todayPlanList";
	}
	
	//Calendar 페이지 이동
	@RequestMapping(value="/calendar.do", method=RequestMethod.GET)
	public String calendar() {
		return "companynotice/calendarForm";
	}
	
	@RequestMapping(value="video.do", method=RequestMethod.GET)
	public String video() {
		return "companynotice/backgroundVideo";
	}

	
}

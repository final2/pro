package com.finalproject.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.model.Employee;
import com.finalproject.model.Message;
import com.finalproject.model.MessageEmp;
import com.finalproject.model.NoticeBoard;
import com.finalproject.model.PageBoardDetail;
import com.finalproject.model.PageVo;
import com.finalproject.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	/*@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd hh:mm"), false));
	}*/
	
	//Notice메인, 최신 공지사항 불러오기, 받은 메시지 불러오기
	@RequestMapping(value="/notice.do", method=RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		
		Employee emp = (Employee)session.getAttribute("LoginUser");

		List<NoticeBoard> noticeBoardList = noticeService.getLatestBoard();
		List<Message> getMessageByNo = noticeService.getReceiveMessages(emp.getNo());
		
		List<MessageEmp> reciveMessage = new ArrayList<>();
		if(getMessageByNo != null) {			
			MessageEmp messageEmp;
			for(Message message : getMessageByNo) {
				messageEmp = new MessageEmp();
				Employee employee = noticeService.getEmpByNo(message.getFrom());
				messageEmp.setEmployee(employee);
				messageEmp.setMessage(message);
				
				reciveMessage.add(messageEmp);
			}
		}
		
		model.addAttribute("boardList", noticeBoardList);
		model.addAttribute("messageList", reciveMessage);
		
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
	public String getBeginEndBoard(@RequestParam(name="pn", required=false, defaultValue="1")int pn, Model model) {
		
		if(pn < 1) {
			return "companynotice/boardList?pn=1";
		}
		
		int rows = 10;
		int pages = 5;
		int beginIndex = (pn - 1)* rows + 1;
		int endIndex = pn*rows;
		// 전체 공지사항 수 조회하기
		int totalBoards = noticeService.getTotalBoard(pn);
		
		// 페이지 객체 생성하기
		PageVo pageVo = new PageVo(rows, pages, pn, totalBoards);
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
		
		if(pn > pageVo.getTotalPages()) {			
			return "companynotice/boardList?pn=" + pageVo.getTotalPages();
		}
		
		List<NoticeBoard> boards = noticeService.getBeginEndBoard(pageVo);

		model.addAttribute("boardList", boards);
		model.addAttribute("pageVo", pageVo);
		
		return "companynotice/boardList";
	}
	
	// 공지사항 디테일
	@RequestMapping("/boardDetail.do")
	public String getBoardDetail(int pn, int rn, Model model) {
		
		if(pn < 1 && rn < 1) {
			return "companynotice/boardDetail?pn=1&rn=1";
		}
		
		int rows = 10;
		int pages = 5;
		int beginIndex = (pn - 1)* rows + 1;
		int endIndex = pn*rows; 
		// 전체 공지사항 수 조회하기
		int totalBoards = noticeService.getTotalBoard(pn);
		
		// 페이지 객체 생성하기
		PageVo pageVo = new PageVo(rows, pages, pn, totalBoards);
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
				
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setBoardRank(rn);
		PageBoardDetail pageBoardDetail = new PageBoardDetail();
		pageBoardDetail.setPageVo(pageVo);
		pageBoardDetail.setNoticeBoard(noticeBoard);
		
		
		NoticeBoard board = noticeService.getBoardRank(pageBoardDetail);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("board", board);
		
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
	public String updateBoard(NoticeBoard noticeBoard, int pn, int rn) {
		noticeService.updateBoard(noticeBoard);
		return "redirect:/boardDetail.do?pn="+pn+"&rn=" + rn;
	}
	
	@RequestMapping(value="/boardDelete.do", method=RequestMethod.GET)
	public String boardDelete(int no, int pn) {
		noticeService.deleteNoticeBoard(no);
		return "redirect:/boardList.do?pn=" + pn;
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

	
}

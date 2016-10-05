package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.MessageDao;
import com.finalproject.model.Employee;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Message;
import com.finalproject.model.PageMessage;
import com.finalproject.model.PageVo;
import com.finalproject.service.MessageService;

@RestController
public class MessageJSONController {
	
	@Autowired MessageDao messageDao;
	
	@RequestMapping(value="/getemplist/", method=RequestMethod.GET)
	public List<Employee> getAllEmployeelist(){
		return messageDao.getEmployeeList();
	}
	@RequestMapping(value="/getreceivelist/{no}", method=RequestMethod.GET)
	public @ResponseBody List<Message> getReceiveList(@PathVariable("no")int pno, Employee emp){
		System.out.println("로그인아이디값"+emp.getNo());
		System.out.println("로그인아이디값"+emp.getDept());
		System.out.println("로그인아이디값"+emp.getName());
		PageMessage pm = new PageMessage();
		pm.setNo(emp.getNo());
		
		if(pno < 1) {
			pno=1;
		}
		int rows = 5;
		int pages = 5;
		int beginIndex = (pno - 1)* rows + 1;
		int endIndex = pno*rows;
		
		int totalMessage = messageDao.getTotalReceive(emp.getNo());
		System.out.println("토탈페이지"+totalMessage);
		PageVo pageVo = new PageVo(rows, pages, pno, totalMessage);
		
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
		pm.setPageVo(pageVo);
		
		return messageDao.getReceiveMessages(pm);	
	}
	@RequestMapping(value="/getsendlist/{no}", method=RequestMethod.GET)
	public List<Message> getSendList(@PathVariable("no") int no){
		return messageDao.getSendMessages(no);
	}
	@RequestMapping(value="/empbyno/{no}", method=RequestMethod.GET)
	public Employee getEmp(@PathVariable("no") int no){
		return messageDao.getEmp(no);
	}
	@RequestMapping(value="/getmessagebyno/{no}", method=RequestMethod.GET)
	public Message getMessage(@PathVariable("no") int no){
		return messageDao.getMessagesByNo(no);
	}
	@RequestMapping(value="/insertmessage/", method=RequestMethod.POST)
	public @ResponseBody Message insertMessage(Message message){
		messageDao.addMessage(message);
		return message;
	}
}
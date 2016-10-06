package com.finalproject.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.MessageDao;
import com.finalproject.model.Employee;
import com.finalproject.model.Message;
import com.finalproject.model.PageMessage;
import com.finalproject.model.PageVo;

@RestController
public class MessageJSONController {
	
	@Autowired MessageDao messageDao;
	
	@RequestMapping(value="/getemplist/", method=RequestMethod.GET)
	public List<Employee> getAllEmployeelist(Employee emp){
		return messageDao.getEmployeeList(emp.getNo());
	}
	@RequestMapping(value="/getreceivelist/{no}", method=RequestMethod.GET)
	public @ResponseBody List<Message> getReceiveList(@PathVariable("no")int pno, Employee emp){
		PageMessage pm = new PageMessage();
		pm.setNo(emp.getNo());
		if(pno < 1) {
			pno=1;
		}
		int rows = 5;
		int pages = 5;
		int totalMessage = messageDao.getTotalReceive(emp.getNo());
		PageVo pageVo = new PageVo(rows, pages, pno, totalMessage);
		
		int beginIndex = (pno - 1)* rows + 1;
		int endIndex = pno*rows;
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
		pm.setPageVo(pageVo);
		
		return messageDao.getReceiveMessages(pm);	
	}
	@RequestMapping(value="/receivetotal/{no}", method=RequestMethod.GET)
	public @ResponseBody List<PageVo> receivetotal(@PathVariable("no")int pno, Employee emp){
		List<PageVo> pageVoList = new ArrayList<PageVo>();
		int rows = 5;
		int pages = 5;
		int totalMessage = messageDao.getTotalReceive(emp.getNo());
			PageVo pageVo = new PageVo(rows, pages, pno, totalMessage);
			for(int i=1; i<=pageVo.getTotalPages(); i++){
				pageVoList.add(pageVo);	
			}

		return pageVoList;
	}
	
	@RequestMapping(value="/getsendlist/{no}", method=RequestMethod.GET)
	public List<Message> getSendList(@PathVariable("no") int pno, Employee emp){
		PageMessage pm = new PageMessage();
		pm.setNo(emp.getNo());
		if(pno < 1) {
			pno=1;
		}
		int rows = 5;
		int pages = 5;
		int totalMessage = messageDao.getTotalSend(emp.getNo());
		PageVo pageVo = new PageVo(rows, pages, pno, totalMessage);
		
		int beginIndex = (pno - 1)* rows + 1;
		int endIndex = pno*rows;
		pageVo.setBeginIndex(beginIndex);
		pageVo.setEndIndex(endIndex);
		pm.setPageVo(pageVo);
		
		return messageDao.getSendMessages(pm);
	}
	@RequestMapping(value="/sendtotal/{no}", method=RequestMethod.GET)
	public @ResponseBody List<PageVo> sendtotal(@PathVariable("no")int pno, Employee emp){
		List<PageVo> pageVoList = new ArrayList<PageVo>();
		int rows = 5;
		int pages = 5;
		int totalMessage = messageDao.getTotalSend(emp.getNo());
			PageVo pageVo = new PageVo(rows, pages, pno, totalMessage);
			for(int i=1; i<=pageVo.getTotalPages(); i++){
				pageVoList.add(pageVo);	
			}

		return pageVoList;
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
	@RequestMapping(value="/searchEmp/opt/{opt}/keyword/{keyword}")
	public List<Employee> SearchEmp(Employee emp, @PathVariable("opt") String opt, @PathVariable("keyword") String keyword){
		Map<String, Object> map = new HashMap<>();
		map.put("no", emp.getNo());
		map.put("opt", opt);
		map.put("keyword", keyword);
		
		return messageDao.searchEmployee(map);
	}
}
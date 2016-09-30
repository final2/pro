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

@RestController
public class MessageJSONController {
	
	@Autowired MessageDao messageDao;
	
	@RequestMapping(value="/getreceivelist/{no}", method=RequestMethod.GET)
	public List<Message> getReceiveList(@PathVariable("no") int no){
		return messageDao.getReceiveMessages(no);	
	}
	@RequestMapping(value="/getsendlist/{no}", method=RequestMethod.GET)
	public List<Message> getSendList(@PathVariable("no") int no){
		return messageDao.getSendMessages(no);
	}
	@RequestMapping(value="/getemplist/", method=RequestMethod.GET)
	public List<Employee> getAllEmployeelist(){
		return messageDao.getEmployeeList();
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
package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.MessageDao;
import com.finalproject.model.Employee;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Message;

@RestController
public class MessageJSONController {
	
	@Autowired MessageDao messageDao;
	
	@RequestMapping(value="/getreceivelist/", method=RequestMethod.GET)
	public List<Message> getReceiveList(){
		return messageDao.getReceiveMessages();	
	}
	@RequestMapping(value="/getsendlist/", method=RequestMethod.GET)
	public List<Message> getSendList(){
		return messageDao.getReceiveMessages();	
	}
	@RequestMapping(value="/getemplist/", method=RequestMethod.GET)
	public List<Employee> getAllEmployeelist(){
		return messageDao.getEmployeeList();
	}
}

package com.finalproject.json;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.MessageDao;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Message;

@RestController
public class MessageJSONController {
	
	@Autowired MessageDao messageDao;
	
	@RequestMapping(value="/getsendlist/", method=RequestMethod.GET)
	public List<Message> getMessageList(){
		return messageDao.getReceiveMessages();	
	}
}

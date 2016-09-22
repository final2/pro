package com.finalproject.json;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.MessageDao;

@RestController
public class MessageJSONController {
	
	@Autowired MessageDao messageDao;

}

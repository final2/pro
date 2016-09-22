package com.finalproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	
	@RequestMapping("message.do")
	public String message() {
		return "message/message";
		
	}

}

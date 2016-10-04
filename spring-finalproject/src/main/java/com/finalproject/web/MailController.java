package com.finalproject.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.model.SendMail;
import com.finalproject.service.MailService;


@Controller
public class MailController {

	@Autowired
	private MailService mailService;
	
	/*	//문의사항
	@RequestMapping("qnamail.do")
	public String qnamail(){
		return "website/qnamail";
	}*/
	
	@RequestMapping("qnamail.do")
	public String form(){
		return "website/qnamail";
	}
	
	@RequestMapping("send.do")
	public String submit(SendMail sendMail){
		
		System.out.println(sendMail);
		mailService.sendMail(sendMail);
		
		return null;
	} 

}

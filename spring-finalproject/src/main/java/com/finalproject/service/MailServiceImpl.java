package com.finalproject.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.finalproject.model.SendMail;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void sendMail(SendMail sendMail) {
		System.out.println(sendMail.getText());
		/*
		 *  메일 발송하기  
		 *  	mailSender.send(MimeMessage);		- text, html, 첨부파일 전송가능
		 *  	mailSender.send(SimpleMailMessage)	- text만 전송가능
		 */
		
		/*
		 *  MimeMessagePreparator
		 *  	MimeMessage 객체를 제공하는 prepare()메소드가 있다.
		 *  	개발자는 prepare()메소드에서 MimeMessage객체에 
		 *  		보내는 사람, 받는사람, 메일 제목, 메일내용 등을 
		 *  		지정할 수 있다.
		 */
		// MimeMessage객체에 대한 전처리를 작업하기
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// 보내는 사람 지정
				mimeMessage.setFrom(sendMail.getFrom());
				// 받는 사람 지정하기
				mimeMessage.setRecipient(javax.mail.Message.RecipientType.TO, 
						new InternetAddress(sendMail.getTo()));
				// 제목 지정하기
				mimeMessage.setSubject(sendMail.getSubject(),"utf-8");
				// 내용 지정하기
				mimeMessage.setText(sendMail.getText(),"utf-8");
			}
		};
		
		// 메일 발송하기
		mailSender.send(preparator);
	}

}

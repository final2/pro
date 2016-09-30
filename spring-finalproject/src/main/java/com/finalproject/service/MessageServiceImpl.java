package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.MessageDao;
import com.finalproject.model.Employee;
import com.finalproject.model.Message;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired private MessageDao messageDao;

	@Override
	public List<Message> getReceiveMessageList(int no) {
		return messageDao.getReceiveMessages(no);
	}

	@Override
	public List<Employee> getAllEmployeeList() {
		return messageDao.getEmployeeList();
	}

	@Override
	public Employee getEmployeeByNo(int no) {
		return messageDao.getEmp(no);
	}

	@Override
	public Message getMessageByNo(int no) {
		// TODO Auto-generated method stub
		return messageDao.getMessagesByNo(no);
	}
	public void insertMessage(Message message){
		messageDao.addMessage(message);
	}

	@Override
	public List<Message> getSendMessageList(int no) {
		return messageDao.getSendMessages(no);
	}
}

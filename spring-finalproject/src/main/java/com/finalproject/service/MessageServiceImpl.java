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
	public List<Message> getMessageList() {
		return messageDao.getReceiveMessages();
	}

	@Override
	public List<Employee> getAllEmployeeList() {
		return messageDao.getEmployeeList();
	}
}

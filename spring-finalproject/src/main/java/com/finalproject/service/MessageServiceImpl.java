package com.finalproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.MessageDao;
import com.finalproject.model.Employee;
import com.finalproject.model.Message;
import com.finalproject.model.PageMessage;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired private MessageDao messageDao;

	@Override
	public List<Message> getReceiveMessageList(PageMessage pm) {
		return messageDao.getReceiveMessages(pm);
	}

	@Override
	public List<Employee> getAllEmployeeList(int no) {
		return messageDao.getEmployeeList(no);
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
	public List<Message> getSendMessageList(PageMessage pm) {
		return messageDao.getSendMessages(pm);
	}

	@Override
	public int getTotalReceiveList(int no) {
		return messageDao.getTotalReceive(no);
	}

	@Override
	public List<Employee> searchEmployee(Map<String, Object> map) {
		return messageDao.searchEmployee(map);
	}
}

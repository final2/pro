package com.finalproject.service;

import java.util.List;

import com.finalproject.model.Employee;
import com.finalproject.model.Message;

public interface MessageService {
	
	List<Message> getReceiveMessageList(int no);
	List<Message> getSendMessageList(int no);
	List<Employee> getAllEmployeeList();
	Employee getEmployeeByNo(int no);
	Message getMessageByNo(int no);
	void insertMessage(Message message);
}

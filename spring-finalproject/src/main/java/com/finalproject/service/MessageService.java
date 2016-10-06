package com.finalproject.service;

import java.util.List;
import java.util.Map;

import com.finalproject.model.Employee;
import com.finalproject.model.Message;
import com.finalproject.model.PageMessage;

public interface MessageService {
	
	List<Message> getReceiveMessageList(PageMessage pm);
	List<Message> getSendMessageList(PageMessage pm);
	List<Employee> getAllEmployeeList(int no);
	Employee getEmployeeByNo(int no);
	Message getMessageByNo(int no);
	void insertMessage(Message message);
	int getTotalReceiveList(int no);
	List<Employee> searchEmployee(Map<String, Object> map);
}

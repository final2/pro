package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Employee;
import com.finalproject.model.Message;
import com.finalproject.model.PageMessage;

public interface MessageDao {
	List<Message> getReceiveMessages(PageMessage pm);
	List<Message> getSendMessages(int no);
	Message getMessagesByNo(int no);
	List<Employee> getEmployeeList();
	Employee getEmp(int no);
	void addMessage(Message message);
	int getTotalReceive(int no);
}
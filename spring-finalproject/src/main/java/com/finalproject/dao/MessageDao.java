package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Employee;
import com.finalproject.model.Message;

public interface MessageDao {
	List<Message> getReceiveMessages();
	Message getMessagesByNo(int no);
	List<Employee> getEmployeeList();
	Employee getEmp(int no);
	void addMessage(Message message);
}

package com.finalproject.dao;

import java.util.List;
import java.util.Map;

import com.finalproject.model.Employee;
import com.finalproject.model.Message;
import com.finalproject.model.PageMessage;

public interface MessageDao {
	List<Message> getReceiveMessages(PageMessage pm);
	List<Message> getSendMessages(PageMessage pm);
	Message getMessagesByNo(int no);
	List<Employee> getEmployeeList(int no);
	Employee getEmp(int no);
	void addMessage(Message message);
	int getTotalReceive(int no);
	List<Employee> searchEmployee(Map<String, Object> map);
	int getTotalSend(int no);
	void updateMessage(int messageNo);
}
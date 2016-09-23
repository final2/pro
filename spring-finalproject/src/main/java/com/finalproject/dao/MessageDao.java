package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Employee;
import com.finalproject.model.Message;

public interface MessageDao {
	List<Message> getReceiveMessages();
	List<Employee> getEmployeeList();
}

package com.finalproject.service;

import java.util.List;

import com.finalproject.model.Employee;
import com.finalproject.model.Message;

public interface MessageService {
	
	List<Message> getMessageList();
	List<Employee> getAllEmployeeList();
}

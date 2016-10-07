package com.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.ChartDao;

@Service
public class ChartServiceImpl implements ChartService{
	@Autowired private ChartDao chartDao;
	@Override
	public int getSalesYear() {
		return chartDao.getSalesYear();
	}

}

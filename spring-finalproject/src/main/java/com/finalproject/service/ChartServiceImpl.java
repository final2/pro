package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.ChartDao;
import com.finalproject.model.SalesBrPr;

@Service
public class ChartServiceImpl implements ChartService{
	@Autowired private ChartDao chartDao;
	
	@Override
	public int getSalesYear(String year) {
		return chartDao.getSalesYear(year);
	}

	@Override
	public List<SalesBrPr> getSalesBr(String year) {
		return chartDao.getSalesBr(year);
	}
	@Override
	public List<SalesBrPr> getSalesPr(String year) {
		return chartDao.getSalesPr(year);
	}
	@Override
	public List<SalesBrPr> getMonth(){
		return chartDao.getMonth();
	}

	@Override
	public int getBuyTotal(String year) {
		return chartDao.getBuyTotal(year);
	}

	@Override
	public List<SalesBrPr> getSalesDay() {
		return chartDao.getSalesDay();
	}

	@Override
	public List<SalesBrPr> getBuyGender() {
		return chartDao.getBuyGender();
	}

	@Override
	public List<SalesBrPr> getBuyAges() {
		return chartDao.getBuyAges();
	}

}

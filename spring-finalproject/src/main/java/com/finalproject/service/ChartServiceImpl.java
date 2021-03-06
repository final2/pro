package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.ChartDao;
import com.finalproject.model.LSalesBrPr;
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
	public List<SalesBrPr> getSalesDays() {
		return chartDao.getSalesDays();
	}

	@Override
	public List<SalesBrPr> getBuyGender() {
		return chartDao.getBuyGender();
	}

	@Override
	public List<SalesBrPr> getBuyAges() {
		return chartDao.getBuyAges();
	}

	@Override
	public List<SalesBrPr> getBuyCM() {
		return chartDao.getBuyCM();
	}

	@Override
	public int getSalesMonth(String year) {
		return chartDao.getSalesMonth(year);
	}

	@Override
	public int getSalesDays(String year) {
		return chartDao.getSalesDay(year);
	}

	@Override
	public List<SalesBrPr> getCategorySales(String year) {
		return chartDao.getCategorySales(year);
	}

	@Override
	public List<LSalesBrPr> getSalesBrDetail(String year) {
		return chartDao.getSalesBrDetail(year);
	}

	@Override
	public List<LSalesBrPr> getSalesPrDetail(String year) {
		return chartDao.getSalesPrDetail(year);
	}

}

package com.finalproject.service;

import java.util.List;

import com.finalproject.model.SalesBrPr;

public interface ChartService {
	int getSalesYear(String year);
	List<SalesBrPr> getSalesBr(String year);
	List<SalesBrPr> getSalesPr(String year);
	int getBuyTotal(String year);
	List<SalesBrPr> getMonth();
	List<SalesBrPr> getSalesDay();
	List<SalesBrPr> getBuyGender();
	List<SalesBrPr> getBuyAges();
	List<SalesBrPr> getBuyCM();
	
}

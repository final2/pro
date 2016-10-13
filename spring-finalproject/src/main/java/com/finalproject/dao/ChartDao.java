package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.SalesBrPr;

public interface ChartDao {

	int getSalesYear(String year);
	int getSalesMonth(String year);
	int getSalesDay(String year);
	List<SalesBrPr> getSalesBr(String year);
	List<SalesBrPr> getSalesPr(String year);
	List<SalesBrPr> getCategorySales(String year);
	int getBuyTotal(String year);
	List<SalesBrPr> getMonth();
	List<SalesBrPr> getSalesDays();
	List<SalesBrPr> getBuyGender();
	List<SalesBrPr> getBuyAges();
	List<SalesBrPr> getBuyCM();
	
}

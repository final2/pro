package com.finalproject.service;

import java.util.List;

import com.finalproject.model.LSalesBrPr;
import com.finalproject.model.SalesBrPr;

public interface ChartService {
	int getSalesYear(String year);
	int getSalesMonth(String year);
	int getSalesDays(String year);
	List<SalesBrPr> getSalesBr(String year);
	List<LSalesBrPr> getSalesBrDetail(String year);
	List<SalesBrPr> getSalesPr(String year);
	List<LSalesBrPr> getSalesPrDetail(String year);
	List<SalesBrPr> getCategorySales(String year);
	int getBuyTotal(String year);
	List<SalesBrPr> getMonth();
	List<SalesBrPr> getSalesDays();
	List<SalesBrPr> getBuyGender();
	List<SalesBrPr> getBuyAges();
	List<SalesBrPr> getBuyCM();
	
}

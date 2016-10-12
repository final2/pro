package com.finalproject.json;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.ChartDao;
import com.finalproject.model.SalesBrPr;

@RestController
public class ChartJSONController {

	@Autowired ChartDao chartDao;
	
	@RequestMapping(value="/getsalesyear/", method=RequestMethod.GET)
	public int getSalesYear(){
		Calendar oCalendar = Calendar.getInstance( );
		int no = oCalendar.get(Calendar.YEAR);
		String year = Integer.toString(no);

		return chartDao.getSalesYear(year);
	}
	@RequestMapping(value="/getsalesBr/", method=RequestMethod.GET)
	public List<SalesBrPr> getSalesBr(){
		Calendar oCalendar = Calendar.getInstance( );
		int no = oCalendar.get(Calendar.YEAR);
		String year = Integer.toString(no);

		return chartDao.getSalesBr(year);
	}
	
	@RequestMapping(value="/getsalesPr/", method=RequestMethod.GET)
	public List<SalesBrPr> getSalesPr(){

		Calendar oCalendar = Calendar.getInstance( );
		int no = oCalendar.get(Calendar.YEAR);
		String year = Integer.toString(no);

		return chartDao.getSalesPr(year);
	}
	@RequestMapping(value="/getBuyTotal/", method=RequestMethod.GET)
	public int getBuyTotal(){
		Calendar oCalendar = Calendar.getInstance( );
		int no = oCalendar.get(Calendar.YEAR);
		String year = Integer.toString(no);
		
		return chartDao.getBuyTotal(year);
	}
	@RequestMapping(value="/getMonth/", method=RequestMethod.GET)
	public List<SalesBrPr> getMonth(){
		return chartDao.getMonth();
	}

	@RequestMapping(value="/getSalesDay/", method=RequestMethod.GET)
	public List<SalesBrPr> getSalesDay(){
		return chartDao.getSalesDay();
	}
	@RequestMapping(value="/getBuyGender/", method=RequestMethod.GET)
	public List<SalesBrPr> getBuyGender(){
		return chartDao.getBuyGender();
	}
	@RequestMapping(value="/getBuyAges/", method=RequestMethod.GET)
	public List<SalesBrPr> getBuyAges(){
		return chartDao.getBuyAges();
	}
}

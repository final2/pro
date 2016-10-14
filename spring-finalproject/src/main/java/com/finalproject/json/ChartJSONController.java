package com.finalproject.json;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.ChartDao;
import com.finalproject.model.LSalesBrPr;
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
	@RequestMapping(value="/getcategorysales/", method=RequestMethod.GET)
	public List<SalesBrPr> getCategorySales(){
		Calendar oCalendar = Calendar.getInstance( );
		int no = oCalendar.get(Calendar.YEAR);
		String year = Integer.toString(no);

		return chartDao.getCategorySales(year);
	}
	@RequestMapping(value="/getsalesmonth/", method=RequestMethod.GET)
	public int getSalesMonth(){
		Calendar oCalendar = Calendar.getInstance( );
		int Y = oCalendar.get(Calendar.YEAR);
		int M = oCalendar.get(Calendar.MONTH)+1;
		String month;
		if(M<10){
			month= "0"+Integer.toString(M);
		}else{
			month= Integer.toString(M);
		}
		String year = Integer.toString(Y)+month;

		return chartDao.getSalesMonth(year);
	}
	@RequestMapping(value="/getsalesdays/", method=RequestMethod.GET)
	public int getSalesDay(){
		Calendar oCalendar = Calendar.getInstance( );
		int Y = oCalendar.get(Calendar.YEAR);
		int M = oCalendar.get(Calendar.MONTH)+1;
		int D = oCalendar.get(Calendar.DAY_OF_MONTH);
		String month;
		if(M<10){
			month= "0"+Integer.toString(M);
		}else{
			month= Integer.toString(M);
		}
		String year = Integer.toString(Y)+month+Integer.toString(D);

		return chartDao.getSalesDay(year);
	}
	@RequestMapping(value="/getsalesBr/", method=RequestMethod.GET)
	public List<SalesBrPr> getSalesBr(){
		Calendar oCalendar = Calendar.getInstance( );
		int no = oCalendar.get(Calendar.YEAR);
		String year = Integer.toString(no);

		return chartDao.getSalesBr(year);
	}
	@RequestMapping(value="/getsalesBrDetail/", method=RequestMethod.GET)
	public List<LSalesBrPr> getSalesBrDetail(){
		Calendar oCalendar = Calendar.getInstance( );
		int no = oCalendar.get(Calendar.YEAR);
		String year = Integer.toString(no);

		return chartDao.getSalesBrDetail(year);
	}
	@RequestMapping(value="/getsalesPrDetail/", method=RequestMethod.GET)
	public List<LSalesBrPr> getSalesPrDetail(){
		Calendar oCalendar = Calendar.getInstance( );
		int no = oCalendar.get(Calendar.YEAR);
		String year = Integer.toString(no);

		return chartDao.getSalesPrDetail(year);
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
	public List<SalesBrPr> getSalesDays(){
		return chartDao.getSalesDays();
	}
	@RequestMapping(value="/getBuyGender/", method=RequestMethod.GET)
	public List<SalesBrPr> getBuyGender(){
		return chartDao.getBuyGender();
	}
	@RequestMapping(value="/getBuyAges/", method=RequestMethod.GET)
	public List<SalesBrPr> getBuyAges(){
		return chartDao.getBuyAges();
	}
	@RequestMapping(value="/getBuyCM/", method=RequestMethod.GET)
	public List<SalesBrPr> getBuyCM(){
		return chartDao.getBuyCM();
	}
}

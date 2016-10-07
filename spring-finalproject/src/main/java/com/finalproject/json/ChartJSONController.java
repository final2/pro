package com.finalproject.json;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.dao.ChartDao;

@RestController
public class ChartJSONController {

	@Autowired ChartDao chartDao;
	
	@RequestMapping(value="/getsalesyear/", method=RequestMethod.GET)
	public Object getSalesYear(){
		return null;
	}
}

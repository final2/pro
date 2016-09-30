package com.finalproject.json;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.service.GeoService;

@Controller
public class GeoController {

	@Autowired
	GeoService geoService;
	
	@RequestMapping("/geo.do")
	public @ResponseBody Map<String, Double> trans(String address) throws Exception {
		
		return geoService.trans(address);
	}
}

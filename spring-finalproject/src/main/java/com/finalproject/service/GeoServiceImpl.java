package com.finalproject.service;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

@Service
public class GeoServiceImpl implements GeoService {

	public Map<String, Double> trans(String address) throws Exception {
		
		Map<String, Double> map = new HashMap<>();
		
		String url = "https://apis.daum.net/local/geo/addr2coord";
		//url += "?apikey=bf6fd53fddf7f8f7309b459f43aceb86";
		url += "?apikey=cfdcd22439144d2fe4a21b6375bed0fa";
		url += "&q=" + URLEncoder.encode(address, "utf-8");
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document document = builder.parse(url);
		
		NodeList nodeList = document.getElementsByTagName("item");
		if (nodeList.getLength() == 0) {
			return null;
		}
		
		Element item = (Element)nodeList.item(0);
		String lat = item.getElementsByTagName("lat").item(0).getTextContent();
		String lng = item.getElementsByTagName("lng").item(0).getTextContent();
		
		map.put("lat", Double.parseDouble(lat));
		map.put("lng", Double.parseDouble(lng));
		
		return map;
	}
}

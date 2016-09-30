package com.finalproject.service;

import java.util.Map;

public interface GeoService {

	Map<String, Double> trans(String address) throws Exception;
}

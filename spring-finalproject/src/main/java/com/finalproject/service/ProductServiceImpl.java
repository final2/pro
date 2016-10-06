package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.ProductDao;
import com.finalproject.model.Client;
import com.finalproject.model.Product;
import com.finalproject.model.ProductSearch;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Override
	public void addProduct(Product product) {
		productDao.insertProduct(product);
	}
	@Override
	public List<Product> getProductPageList(ProductSearch productSearch) {
		return productDao.getProductPageList(productSearch);
	}
	@Override
	public int getTotalProduct(ProductSearch productSearch) {
		return productDao.getTotalProduct(productSearch);
	}
	
	@Override
	public Client getClientByNo(int clientNo) {
		return productDao.getClientByNo(clientNo);
	}
	@Override
	public Product getProductByNo(int no) {
		return productDao.getProductByNo(no);
	}
}

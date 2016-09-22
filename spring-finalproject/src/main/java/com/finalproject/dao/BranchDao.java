package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;

public interface BranchDao {

	List<LargeCategory> getAllLargeCats();
	List<SmallCategory> getSmallCatsByLargeNo(int no);
	List<Product> getProductsBySmallNo(int no);
}

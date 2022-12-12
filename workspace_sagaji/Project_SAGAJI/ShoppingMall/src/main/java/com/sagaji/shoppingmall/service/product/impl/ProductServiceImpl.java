package com.sagaji.shoppingmall.service.product.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sagaji.shoppingmall.service.product.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<Map<String, Object>> getCategoryProductList(int categoryCd) {
		return productDAO.getCategoryProductList(categoryCd);
	}
	
	@Override
	public Map<String, Object> getCategoryInfo(int categoryCd) {
		return productDAO.getCategoryInfo(categoryCd);
	}
	
	@Override
	public List<Map<String, Object>> getCategoryList() {
		return productDAO.getCategoryList();
	}
	
	@Override
	public List<Map<String, Object>> getPopularProductList() {
		return productDAO.getPopularProductList();
	}
	
	@Override
	public List<Map<String, Object>> getNewProductList() {
		return productDAO.getNewProductList();
	}
	
	@Override
	public List<Map<String, Object>> getProductList(String searchKeyword) {
		return productDAO.getProductList(searchKeyword);
	}
	
	@Override
	public void insertProduct(Map<String,Object> map) {
		productDAO.insertProduct(map);
	}

	@Override
	public void insertProductDetail(Map<String,Object> map) {
		productDAO.insertProductDetail(map);
	}
	
	@Override
	public void updateProduct(Map<String,Object> map) {
		productDAO.updateProduct(map);
	}
	
	@Override
	public void updateProductDetail(Map<String,Object> map) {
		productDAO.updateProductDetail(map);
	}

	@Override
	public void useYnProduct(Map<String,Object> map) {
		productDAO.useYnProduct(map);
	}
	
	@Override
	public int noCheck(Map<String,Object> map) {
		return productDAO.noCheck(map);
	}
	
	@Override
	public Map<String, Object> getUpdateDetail(Map<String, Object> map){
		return productDAO.getUpdateDetail(map);
	}
	
	@Override
	public Map<String, Object> getProductInfo(Map<String, Object> map){
		return productDAO.getProductInfo(map);
	}
}

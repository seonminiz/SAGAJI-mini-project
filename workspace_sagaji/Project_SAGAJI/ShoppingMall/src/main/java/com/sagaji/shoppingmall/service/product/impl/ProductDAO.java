package com.sagaji.shoppingmall.service.product.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Map<String, Object>> getCategoryProductList(int categoryCd) {
		return mybatis.selectList("ProductDAO.getCategoryProductList", categoryCd);
	}
	
	public Map<String, Object> getCategoryInfo(int categoryCd) {
		return mybatis.selectOne("ProductDAO.getCategoryInfo", categoryCd);
	}
	
	public List<Map<String, Object>> getCategoryList() {
		return mybatis.selectList("ProductDAO.getCategoryList");
	}
	
	public List<Map<String, Object>> getPopularProductList() {
		return mybatis.selectList("ProductDAO.getPopularProductList");
	}
	
	public List<Map<String, Object>> getNewProductList() {
		return mybatis.selectList("ProductDAO.getNewProductList");
	}
	
	public List<Map<String, Object>> getProductList(String searchKeyword) {
		return mybatis.selectList("ProductDAO.getProductList", searchKeyword);
	}

	public void insertProduct(Map<String,Object> map) {
		mybatis.insert("ProductDAO.insertProduct", map);
	}
	
	public void insertProductDetail(Map<String,Object> map) {
		mybatis.insert("ProductDAO.insertProductDetail", map);
	}
	
	public void updateProduct(Map<String,Object> map) {
		mybatis.update("ProductDAO.updateProduct", map);
	}
	
	public void updateProductDetail(Map<String,Object> map) {
		mybatis.update("ProductDAO.updateProductDetail", map);
	}
	
	public void useYnProduct(Map<String,Object> map) {
		mybatis.update("ProductDAO.useYnProduct", map);
	}
	
	public int noCheck(Map<String, Object> map) {
		return mybatis.selectOne("ProductDAO.noCheck", map);
	}
	
	public Map<String, Object> getUpdateDetail(Map<String, Object> map){
		return mybatis.selectOne("ProductDAO.getUpdateDetail", map);
	}
	
	public Map<String, Object> getProductInfo(Map<String, Object> map){
		return mybatis.selectOne("ProductDAO.getProductInfo", map);
	}
}
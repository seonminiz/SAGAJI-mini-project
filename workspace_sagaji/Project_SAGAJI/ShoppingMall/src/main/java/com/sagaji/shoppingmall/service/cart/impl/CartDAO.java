package com.sagaji.shoppingmall.service.cart.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sagaji.shoppingmall.vo.CartVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<Map<String, Object>> getCartList(String userId) {
		return mybatis.selectList("CartDAO.getCartList", userId);
	}
	
	public void deleteCart(String prdctNo, int prdctDetailNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("prdctNo", prdctNo);
		paramMap.put("prdctDetailNo", prdctDetailNo);
		
		mybatis.delete("CartDAO.deleteCart", paramMap);
		
	}
	
	public int insertCart(CartVO cartVO) {
		int checkCartCnt = mybatis.selectOne("CartDAO.checkCartCnt", cartVO);
		int result = 0;
		if(checkCartCnt < 1)
			result = mybatis.insert("CartDAO.insertCart", cartVO);
		else
			result = mybatis.update("CartDAO.updateCartCnt", cartVO);
		
		return result;
	}
	
	public String getCartTotalPrice(String userId) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("CartDAO.getCartTotalPrice", userId);
	}
}

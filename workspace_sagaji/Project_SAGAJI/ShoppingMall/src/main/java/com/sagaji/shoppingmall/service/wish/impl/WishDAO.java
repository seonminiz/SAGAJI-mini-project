package com.sagaji.shoppingmall.service.wish.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sagaji.shoppingmall.vo.WishVO;

@Repository
public class WishDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<WishVO> getWishList(Map<String, String> paramMap) {
		return mybatis.selectList("WishDAO.getWishList");
	}
	
	public void deleteWish(String prdctNo, int prdctDetailNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("prdctNo", prdctNo);
		paramMap.put("prdctDetailNo", prdctDetailNo);
		
		mybatis.delete("WishDAO.deleteWish", paramMap);
		
	}
	
	public int insertWish(WishVO wishVO) {
		int checkWishCnt = mybatis.selectOne("WishDAO.checkWishCnt", wishVO);
		int result = 0;
		if(checkWishCnt < 1)
			result = mybatis.insert("WishDAO.insertWish", wishVO);
		else
			result = mybatis.insert("WishDAO.updateWishCnt", wishVO);
		
		return result;
	}
}

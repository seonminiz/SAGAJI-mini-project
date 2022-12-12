package com.sagaji.shoppingmall.service.wish.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sagaji.shoppingmall.service.wish.WishService;
import com.sagaji.shoppingmall.vo.WishVO;

@Service
public class WishServiceImpl implements WishService {
	@Autowired
	private WishDAO wishDAO;
	
	@Override
	public List<WishVO> getWishList(Map<String, String> paramMap) {
		return wishDAO.getWishList(paramMap);
	}
	
	@Override
	public void deleteWish(String prdctNo, int prdctDetailNo) {
		wishDAO.deleteWish(prdctNo, prdctDetailNo);
	}
	
	@Override
	public int insertWish(WishVO wishVO) {
		return wishDAO.insertWish(wishVO);
	}
}

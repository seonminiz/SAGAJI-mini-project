package com.sagaji.shoppingmall.service.cart.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sagaji.shoppingmall.service.cart.CartService;
import com.sagaji.shoppingmall.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public List<Map<String, Object>> getCartList(String userId) {
		return cartDAO.getCartList(userId);
	}
	
	@Override
	public void deleteCart(String prdctNo, int prdctDetailNo) {
		cartDAO.deleteCart(prdctNo, prdctDetailNo);
	}
	
	@Override
	public int insertCart(CartVO cartVO) {
		return cartDAO.insertCart(cartVO);
	}

	@Override
	public String getCartTotalPrice(String userId) {
		// TODO Auto-generated method stub
		return cartDAO.getCartTotalPrice(userId);
	}
}
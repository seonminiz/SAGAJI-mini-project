package com.sagaji.shoppingmall.service.cart;

import java.util.List;
import java.util.Map;

import com.sagaji.shoppingmall.vo.CartVO;

public interface CartService {
	List<Map<String, Object>> getCartList(String userId);
	
	void deleteCart(String prdctNo, int prdctDetailNo);
	
	int insertCart(CartVO cartVO);
	
	String getCartTotalPrice(String userId);

}
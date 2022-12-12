package com.sagaji.shoppingmall.service.wish;

import java.util.List;
import java.util.Map;

import com.sagaji.shoppingmall.vo.WishVO;

public interface WishService {
	List<WishVO> getWishList(Map<String, String> paramMap);
	
	void deleteWish(String prdctNo, int prdctDetailNo);
	
	int insertWish(WishVO wishVO);

}

package com.sagaji.shoppingmall.common;

import java.util.HashMap;

import org.springframework.jdbc.support.JdbcUtils;

//Map을 카멜케이스 형식으로 받아온다!
@SuppressWarnings("serial")
public class CamelHashMap extends HashMap<String, Object> {
	@Override
	public Object put(String key, Object value) {
		return super.put(JdbcUtils.convertUnderscoreNameToPropertyName(key), value);
	}
}

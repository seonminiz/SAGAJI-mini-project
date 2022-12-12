package com.sagaji.shoppingmall.service.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sagaji.shoppingmall.vo.UserVO;
@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<UserVO> userList() {
		return mybatis.selectList("UserDAO.userList");
	}
	
	// 관리자 로그인 시, 회원 상세 정보 조회
	public UserVO getUserInfo(String userId) {
		return mybatis.selectOne("UserDAO.getUserInfo", userId);
	}

}

package com.sagaji.shoppingmall.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sagaji.shoppingmall.service.admin.AdminService;
import com.sagaji.shoppingmall.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService  {

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<UserVO> userList() {
		return adminDAO.userList();
	}
	
	// 관리자 로그인 시, 회원 상세 정보 조회
	@Override
	public UserVO getUserInfo(String userId) {
		
		return adminDAO.getUserInfo(userId);
	}

}

package com.sagaji.shoppingmall.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sagaji.shoppingmall.service.user.UserService;
import com.sagaji.shoppingmall.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	// 1. 회원가입 진행
	@Override
	public int join(UserVO userVO) {
		return userDAO.join(userVO);
	}

	// 2. 아이디 체크
	@Override
	public int idCheck(String userId) {
		return userDAO.idCheck(userId);
	}

	// 3. 로그인 처리
	@Override
	public UserVO login(UserVO userVO) {
		return userDAO.login(userVO);
	}

	// 5. 내정보 이동
	@Override
	public void myInfo(UserVO userVO) {
		userDAO.myInfo(userVO);
	}

	// 6. 내정보 수정
	@Override
	public void updateUser(UserVO userVO) {
		userDAO.updateUser(userVO);
	}

	// 7. 회원탈퇴(회원 사용 여부)
	@Override
	public void withdrawUser(UserVO userVO) {
		userDAO.withdrawUser(userVO);
		
	}
}

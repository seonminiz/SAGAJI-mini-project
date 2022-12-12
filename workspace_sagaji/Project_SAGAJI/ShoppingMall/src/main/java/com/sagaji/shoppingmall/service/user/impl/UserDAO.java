package com.sagaji.shoppingmall.service.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sagaji.shoppingmall.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 1. 회원가입 진행
	public int join(UserVO userVO) {
		return mybatis.insert("UserDAO.join", userVO);
	}

	// 2. 아이디 체크
	public int idCheck(String userId) {
		return mybatis.selectOne("UserDAO.idCheck", userId);
	}

	// 3. 로그인 처리
	public UserVO login(UserVO userVO) {
		return mybatis.selectOne("UserDAO.login", userVO);
	}

	// 5. 내정보 이동
	public void myInfo(UserVO userVO) {
		mybatis.selectOne("UserDAO.selectUser", userVO);
	}

	// 6. 내정보 수정
	public void updateUser(UserVO userVO) {
		mybatis.update("UserDAO.updateUser", userVO);

	}

	// 7. 회원탈퇴(회원 사용 여부)
	public void withdrawUser(UserVO userVO) {
		mybatis.update("UserDAO.withdrawUser", userVO);
		
	}

}

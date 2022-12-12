package com.sagaji.shoppingmall.service.admin;

import java.util.List;

import com.sagaji.shoppingmall.vo.UserVO;

public interface AdminService {

	List<UserVO> userList();
	
	// 관리자 로그인 시, 회원 상세 정보 조회
	UserVO getUserInfo(String userId);

}

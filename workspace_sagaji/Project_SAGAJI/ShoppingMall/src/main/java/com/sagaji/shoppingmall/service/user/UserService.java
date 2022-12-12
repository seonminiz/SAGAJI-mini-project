package com.sagaji.shoppingmall.service.user;

import com.sagaji.shoppingmall.vo.UserVO;

public interface UserService {

	// 1. 회원가입 진행
	int join(UserVO userVO);

	// 2. 아이디 체크
	int idCheck(String userId);

	// 3. 로그인 처리
	UserVO login(UserVO userVO);

	// 5. 내정보 이동
	void myInfo(UserVO userVO);

	// 6. 내정보 수정
	void updateUser(UserVO userVO);

	// 7. 회원탈퇴(회원 사용 여부)
	void withdrawUser(UserVO userVO);
}

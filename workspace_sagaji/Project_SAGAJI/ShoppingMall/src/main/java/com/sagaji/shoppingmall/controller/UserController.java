package com.sagaji.shoppingmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.sagaji.shoppingmall.service.user.UserService;
import com.sagaji.shoppingmall.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	// 1. 회원가입 진행
	@GetMapping("/join.do")
	public String joinView() {
		return "user/join";
	}

	@PostMapping(value = "/join.do", produces = "application/text; charset=UTF-8")
	public String join(UserVO userVO, Model model) {
		int joinResult = userService.join(userVO);

		if (joinResult == 0) {
			model.addAttribute("joinMsg", "회원가입에 실패하셨습니다. 관리자에게 문의해주세요.");
			return "user/join";
		} else {
			model.addAttribute("joinMsg", "회원가입에 성공했습니다. 로그인해주세요.");
			return "user/login";
		}
	}

	// 2. 아이디 체크
	@PostMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(UserVO userVO) throws JsonProcessingException {
		String returnStr = "";

		int idCnt = userService.idCheck(userVO.getUserId());

		if (idCnt > 0) {
			returnStr = "duplicatedId";
		} else {
			returnStr = "idOk";
		}

		return returnStr;
	}

	// 3. 로그인 처리
	@GetMapping("/login.do")
	public String login(UserVO userVO) {
		return "/user/login";
	}

	@PostMapping("/login.do")
	@ResponseBody
	// HttpSession: 현재 WAS에 접속한 유저의 세션정보를 담고있는 객체
	// 세션에서 사용할 데이터를 담아줄 수 있다.
	public String login(UserVO userVO, HttpSession session) {
		// 1. 아이디 체크
		int idCheck = userService.idCheck(userVO.getUserId());

		if (idCheck < 1) {
			return "idFail";
		} else {
			UserVO loginUser = userService.login(userVO);

			// 2. 비밀번호 체크
			if (loginUser == null) {
				return "pwFail";
			}

			// 3. 로그인 성공
			// 세션에 로그인한 유저의 정보를 담아서 관리
			session.setAttribute("loginUser", loginUser);
			return "loginSuccess";
		}
	}

	// 4. 로그아웃 처리
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

	// 5. 내정보 이동
	@GetMapping("/myInfo.do")
	public String myInfoView(HttpSession session) {
		return "user/myInfo";
	}
	
	@PostMapping("/myInfo.do")
	public String myInfo(UserVO userVO) {
		userService.myInfo(userVO);
		return "redirect:/user/myInfo";
	}

	// 6. 내정보 수정
	@PostMapping("/updateUser.do")
	
	public String updateUser(HttpSession session, UserVO userVO) {
		System.out.println(userVO.getUserType() + userVO.getUserUseYn());
		session.invalidate();
		userService.updateUser(userVO);

		return "redirect:/user/login.do";
	}

	// 7. 회원탈퇴(회원 사용 여부)
	@RequestMapping("/withdrawUser.do")
	public String withdrawUser(HttpSession session, UserVO userVO) {
		session.invalidate();
		userService.withdrawUser(userVO);

		return "redirect:/" ;
	}
}

package com.sagaji.shoppingmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sagaji.shoppingmall.service.admin.AdminService;
import com.sagaji.shoppingmall.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService AdminService;
	
	@RequestMapping("/userList.do")
	public String userList(Model model) {
		
		List<UserVO> UserList = AdminService.userList();
		
		model.addAttribute("userList", UserList);
		
		return "admin/userList";
	}
	
	// 관리자 로그인 시, 회원리스트에서 특정 userId 클릭 시, 해당 유저 정보 상세 화면으로 이동
	@GetMapping("/getUserInfo.do") 
	public String getUserInfo(@RequestParam("userId") String userId, Model model) {
		UserVO userInfo = AdminService.getUserInfo(userId);
		System.out.println(userInfo);
		model.addAttribute("userInfo", userInfo);
		
		return "admin/getUserInfo";
	}
}

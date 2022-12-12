package com.sagaji.shoppingmall.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sagaji.shoppingmall.service.wish.WishService;
import com.sagaji.shoppingmall.vo.UserVO;
import com.sagaji.shoppingmall.vo.WishVO;

public class WishController {
	@Autowired
	private WishService wishService;
	
	//목록 화면으로 이동
	@ResponseBody
	@RequestMapping(value="/getWishList.do")
	public String getWishList(Model model, @RequestParam Map<String, String> paramMap) {
		List<WishVO> wishList = wishService.getWishList(paramMap);
		
		model.addAttribute("wishList", wishList);
		
		return "wish/getWishList"; 
	}
	
	//품목 삭제
	@RequestMapping("/deleteWish.do")
	public String deleteWish(@RequestParam("prdctNo") String prdctNo, @RequestParam("prdctDetailNo") int prdctDetailNo) {
	      wishService.deleteWish(prdctNo, prdctDetailNo);
	      
	      return "redirect:/wish/getWishList.do";
	   }
	
	//품목 추가
	@PostMapping("/insertWish.do")
	@ResponseBody
	public int insertWish(WishVO wishVO, HttpSession session) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		wishVO.setUserId(loginUser.getUserId());
	      int result = wishService.insertWish(wishVO);
	      
	      return result;
	   }
}

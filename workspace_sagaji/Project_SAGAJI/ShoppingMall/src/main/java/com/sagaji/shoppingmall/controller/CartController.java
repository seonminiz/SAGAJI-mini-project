package com.sagaji.shoppingmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sagaji.shoppingmall.service.cart.CartService;
import com.sagaji.shoppingmall.vo.CartVO;
import com.sagaji.shoppingmall.vo.UserVO;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartService cartService;
	
	//카트 목록 화면으로 이동
	 @GetMapping(value="/getCartList.do") 
	 public String getCartListView(Model model, HttpSession session) {
		 UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		 
		 if(loginUser == null) {
			 return "redirect:/user/login.do";
		 }
		 
		 List<Map<String, Object>> cartList =cartService.getCartList(loginUser.getUserId());
		 String totalPrice = cartService.getCartTotalPrice(loginUser.getUserId());
		 
		 model.addAttribute("cartList", cartList);
		 model.addAttribute("totalPrice", totalPrice);
		 
		 return "cart/getCartList";
	 
	 }

	//목록가져오는 로직처리(Ajax)
	@PostMapping(value="/getCartList.do", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String getCartList() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> cartList = cartService.getCartList(null);
		
		returnMap.put("cartList", cartList);
		
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(returnMap);
		
		return jsonStr;
	}
	
	//카트에 품목 삭제
	@RequestMapping("/deleteCart.do")
	public String deleteCart(@RequestParam("prdctNo") String prdctNo, @RequestParam("prdctDetailNo") int prdctDetailNo) {
	      cartService.deleteCart(prdctNo, prdctDetailNo);
	      
	      return "redirect:/cart/getCartList.do";
	   }
	
	//카트에 품목 추가
	@PostMapping("/insertCart.do")
	@ResponseBody
	public int insertCart(CartVO cartVO, HttpSession session) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		cartVO.setUserId(loginUser.getUserId());
	      int result = cartService.insertCart(cartVO);
	      
	      return result;
	   }
	
}

package com.sagaji.shoppingmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sagaji.shoppingmall.service.product.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ProductService productService;
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
//	
//	/**
//	 * Simply selects the home view to render by returning its name.
//	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	
	// 메인 화면으로 이동(main.jsp)
	@GetMapping("/")
	public String main(Model model) {
		// 인기제품 TOP5 조회
		List<Map<String, Object>> popularProductList = productService.getPopularProductList();
		
		// 신제품 조회
		List<Map<String, Object>> newProductList = productService.getNewProductList();
		
		model.addAttribute("popularProductList", popularProductList);
		model.addAttribute("newProductList", newProductList);
		
		return "main/main";
	}
}

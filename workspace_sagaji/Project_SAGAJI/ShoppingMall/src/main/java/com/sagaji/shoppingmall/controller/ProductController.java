package com.sagaji.shoppingmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sagaji.shoppingmall.service.product.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	// 메뉴 리스트에서 선택된 카테고리별 제품 리스트 조회
	@RequestMapping("/getCategoryProductList.do")
	public String getCategoryProductList(@RequestParam("categoryCd") int categoryCd, Model model) {
		// 카테고리별 리스트 조회
		List<Map<String, Object>> cateProductList = productService.getCategoryProductList(categoryCd);
		
		// 카테고리 조회
		Map<String, Object> categroyMap = productService.getCategoryInfo(categoryCd);
		
		// 화면단으로 넘겨줄 조회 데이터 셋팅
		model.addAttribute("categoryProductList", cateProductList);
		model.addAttribute("categoryInfo", categroyMap);

		return "category/getCategoryList";
	}
	
	// 카테고리 리스트 조회
	@PostMapping(value="/getCategoryList.do", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String getCategoryList() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> categoryList = productService.getCategoryList();
		
		returnMap.put("categoryList", categoryList);
		
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(returnMap);
		
		return jsonStr;
	}
	
	// 검색어 입력에 따른 조회
	// 제품명, 카테고리명으로만 검색
	@PostMapping(value="/getSearchList.do", produces="application/text; charset=UTF-8")
	public String getSearchList(@RequestParam("searchKeyword") String searchKeyword, Model model) {
		// 검색어에 해당하는 조회 결과값 가져오기
		List<Map<String, Object>> productList = productService.getProductList(searchKeyword);
		
		model.addAttribute("productList", productList);
		model.addAttribute("searchKeyword", searchKeyword);
		
		// 제품리스트 조회 화면으로 이동
		return "product/getProductList";
	}

		// 제품 등록
		@RequestMapping("/insertProduct.do")
		public String insertProduct(@RequestParam Map<String, Object> paramMap)  {
			System.out.println("test=============="+paramMap);
					
			//제품등록
			productService.insertProduct(paramMap);
					
			//제품등록상세
			productService.insertProductDetail(paramMap);
				
				
			//System.out.println();
			//return "redirect://product/getCategoryProductList.do";
			return "redirect://localhost:8099";
		}
		
		// 제품 수정
		@RequestMapping("/updateProduct.do")
		public String updateProduct(@RequestParam Map<String, Object> paramMap)  {
			System.out.println("test=============="+paramMap);
					
			//제품수정
			productService.updateProduct(paramMap);
					
			//제품 수정 상세
			productService.updateProductDetail(paramMap);
				
				
			//System.out.println();
			//return "redirect://product/getCategoryProductList.do";
			return "redirect:getProductInfo.do?prdctNo=" + paramMap.get("prdctNo") + "&prdctDetailNo=" + paramMap.get("prdctDetailNo");
		}
		
		// 제품 등록
		@RequestMapping("/insertProductDetail.do")
		public String insertProductDetail(@RequestParam Map<String, Object> paramMap)  {
			System.out.println("test=============="+paramMap);
					
			//제품등록상세
			productService.insertProductDetail(paramMap);
				
				
			//System.out.println();
			//return "redirect://product/getCategoryProductList.do";
			return "redirect://localhost:8099";
		}
		
		// 제품 상세 조회
		@RequestMapping("/getProductInfo.do")
		public String getProductInfo(@RequestParam Map<String, Object> paramMap, Model model )  {
			System.out.println("test=============="+paramMap);
		
			Map<String, Object> infoMap = productService.getProductInfo(paramMap);
			
			model.addAttribute("infoMap", infoMap);
			
			return "product/productInfo";
		}
		
		
		@PostMapping("/useYnProduct.do")
		public String deleteProduct(@RequestParam Map<String, Object> paramMap) {
			
		Map<String, Object> map = new HashMap<>();
			
		// 제품 삭제
		productService.useYnProduct(map);
		return "product/productList";
		
		}
		
		
		@RequestMapping("/getCategoryProductDetail.do")
		public String getCategoryProductDetail(Model model) {

		return "product/insertProduct";
		}
		
		/*
		 * // 제품 수정
		 * 
		 * @RequestMapping("/getUpdateDetail.do") public String
		 * updateProduct(@RequestParam Map<String, Object> paramMap, Model model) {
		 * paramMap.put("prdctNo", "PRDCT20221128_12");
		 * 
		 * // 카테고리 조회 Map<String, Object> categroyMap =
		 * productService.getUpdateDetail(paramMap); model.addAttribute("categroyMap",
		 * categroyMap); return "product/updateProduct"; }
		 * 
		 * 
		 * 
		 * @PostMapping("/noCheck.do")
		 * 
		 * @ResponseBody public int noCheck(@RequestParam Map<String, Object> paramMap)
		 * throws JsonProcessingException {
		 * 
		 * int idCnt = productService.noCheck(paramMap);
		 * 
		 * 
		 * return idCnt; }
		 */

		// 제품 수정
		@RequestMapping("/getUpdateDetail.do")
		public String getUpdateDetail(@RequestParam Map<String, Object> paramMap, Model model) {
				//System.out.println("test================="+paramMap);	
			Map<String, Object> categoryMap = productService.getUpdateDetail(paramMap);
			model.addAttribute("categoryMap", categoryMap);
			return "product/updateProduct";
		}
		
		
		
		@PostMapping("/noCheck.do")
		@ResponseBody
		public int noCheck(@RequestParam Map<String, Object> paramMap) throws JsonProcessingException {
			
		int idCnt = productService.noCheck(paramMap);
		
		
		return idCnt;
		}
	}

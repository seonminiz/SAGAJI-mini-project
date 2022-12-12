package com.sagaji.shoppingmall.service.product;

import java.util.List;
import java.util.Map;

public interface ProductService {
	// 카테고리에 해당하는 제품 리스트 조회
	List<Map<String, Object>> getCategoryProductList(int categoryCd);
	
	// 카테고리 정보 조회
	Map<String, Object> getCategoryInfo(int categoryCd);
	
	// 카테고리 리스트 조회
	List<Map<String, Object>> getCategoryList();
	
	// 인기제품 TOP5 조회
	List<Map<String, Object>> getPopularProductList();
	
	// 신제품 조회
	List<Map<String, Object>> getNewProductList();
	
	// 제품 리스트 조회
	List<Map<String, Object>> getProductList(String searchKeyword);

	//제품저장
	public void insertProduct(Map<String,Object> map);
	
	//제품저장상세 ,  옵션 추가
	public void insertProductDetail(Map<String,Object> map);
	
	//제품 수정
	public void updateProduct(Map<String,Object> map);
	
	//제품수정상세
	public void updateProductDetail(Map<String,Object> map);
	
	//제품 삭제
	public void useYnProduct(Map<String,Object> map);
	
	//제품 번호 체크
	public int noCheck(Map<String,Object> map);
	
	//제품상세 업데이트 화면
	public Map<String, Object> getUpdateDetail(Map<String, Object> map);
	
	//제품 상세화면
	public Map<String, Object> getProductInfo(Map<String, Object> map);
	
}

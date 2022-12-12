package com.sagaji.shoppingmall.service.question;

import java.util.List;
//import java.util.Map;

import com.sagaji.shoppingmall.vo.QuestionVO;

public interface QuestionService {
	
	
	//게시글 등록
	void insertQuestion(QuestionVO questionVO);
	
	//게시글 목록 조회
    List<QuestionVO> getQuestionList();
	
	//게시글 상세 조회
	QuestionVO getQuestion(int questionNo);

	
	
	//게시글 수정
	void updateQuestion(QuestionVO questionVO);
	
	//게시글 삭제
	void deleteQuestion(int questionNo);
	


}

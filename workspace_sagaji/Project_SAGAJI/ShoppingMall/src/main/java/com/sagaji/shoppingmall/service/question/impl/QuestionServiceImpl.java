package com.sagaji.shoppingmall.service.question.impl;

import java.util.List;
//import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sagaji.shoppingmall.service.question.QuestionService;
import com.sagaji.shoppingmall.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionDAO questionDAO;
	
	@Override
	public void insertQuestion(QuestionVO questionVO) {
		questionDAO.insertQuestion(questionVO);
	}
	
//	
	@Override
	public List<QuestionVO> getQuestionList() {
		return questionDAO.getQuestionList();
	}
//	
	@Override
	public QuestionVO getQuestion(int questionNo) {
		return questionDAO.getQuestion(questionNo);
	}
//	
//	@Override
//	public void updateBoardCnt(int boardNo) {
//		questionDAO.updateBoardCnt(boardNo);
//	}
//	
	@Override
	public void updateQuestion(QuestionVO questionVO) {
		questionDAO.updateQuestion(questionVO);
	}
	
	@Override
	public void deleteQuestion(int questionNo) {
		questionDAO.deleteQuestion(questionNo);
	}
	
//	@Override
//	public int getBoardTotalCnt(Map<String, String> paramMap) {
//		return questionDAO.getBoardTotalCnt(paramMap);
//	}


}

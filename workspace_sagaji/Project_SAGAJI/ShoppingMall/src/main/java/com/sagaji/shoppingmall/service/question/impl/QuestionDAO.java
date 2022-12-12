package com.sagaji.shoppingmall.service.question.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.sagaji.shoppingmall.vo.QuestionVO;

@Repository
public class QuestionDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertQuestion(QuestionVO questionVO) {
		mybatis.insert("QuestionDAO.insertQuestion", questionVO);
	}

	public List<QuestionVO> getQuestionList() {
		
		return mybatis.selectList("QuestionDAO.getQuestionList");
	}
	
	
	

	public QuestionVO getQuestion(int questionNo) {
		return mybatis.selectOne("QuestionDAO.getQuestion", questionNo);
	}


	public void updateQuestion(QuestionVO questionVO) {
		mybatis.update("QuestionDAO.updateQuestion", questionVO);
	}
	
	public void deleteQuestion(int questionNo) {
		mybatis.delete("QuestionDAO.deleteQuestion", questionNo);
	}

}

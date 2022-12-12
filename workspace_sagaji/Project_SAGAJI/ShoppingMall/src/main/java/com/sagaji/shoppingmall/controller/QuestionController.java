package com.sagaji.shoppingmall.controller;

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


import com.sagaji.shoppingmall.service.question.QuestionService;
import com.sagaji.shoppingmall.vo.QuestionVO;
import com.sagaji.shoppingmall.vo.UserVO;

/*import com.ezen.springboard.service.board.BoardService;
import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.PageVO;
import com.ezen.springboard.vo.UserVO;
com.sagaji.shoppingmall. 경로로 수정해야됨*/
@Controller
@RequestMapping("/question")
public class QuestionController {

	@Autowired
	private QuestionService QuestionService;

	
	//게시글 목록 화면으로 이동
	@RequestMapping("/getQuestionList.do")
	public String getBoardList(Model model) {
		
		List<QuestionVO> QuestionList = QuestionService.getQuestionList();
		
		model.addAttribute("QuestionList", QuestionList);
		
		return "question/getQuestionList";
	}
		
	// 게시글 등록 화면으로 이동
	@GetMapping("/insertQuestion.do")
	public String insertQuestionView(HttpSession session) {
		// 로그인한 유저의 정보가 세션에 없을 때 로그인 화면으로 이동
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/user/login";
		}

		return "question/getQuestion";
	}

	// 게시글 등록
	@PostMapping("/insertQuestion.do")
	public String insertQuestion(QuestionVO questionVO) {
		System.out.println(questionVO.getUserId());
		QuestionService.insertQuestion(questionVO);

		// 등록 후 게시글 목록으로 이동
		return "redirect:/question/getQuestionList.do";
	}

	//게시글 상세 조회
		@RequestMapping("/getQuestion.do")
		public String getQuestion(@RequestParam("questionNo") int questionNo, Model model) {
			QuestionVO question = QuestionService.getQuestion(questionNo);
			
			model.addAttribute("question", question);
			
			return "question/detailQuestion";
		} 
	

	
	//게시글 수정
	@PostMapping("/updateQuestion.do")
	public String updateQuestion(QuestionVO questionVO) {
		QuestionService.updateQuestion(questionVO);
		System.out.println(questionVO);
		return "redirect:/question/getQuestion.do?questionNo=" + questionVO.getQuestionNo();
	}
	
	//게시글 삭제
	@RequestMapping("/deleteQuestion.do")
	public String deleteQuestion(@RequestParam("questionNo") int questionNo) {
		QuestionService.deleteQuestion(questionNo);
		
		return "redirect:/question/getQuestionList.do";
	}
	
	
	

}

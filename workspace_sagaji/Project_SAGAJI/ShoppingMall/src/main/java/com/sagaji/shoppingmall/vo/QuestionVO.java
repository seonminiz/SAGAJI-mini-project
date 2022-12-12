package com.sagaji.shoppingmall.vo;



import java.sql.Date;

public class QuestionVO {
	
	/*
	 * CREATE TABLE T_SGJ_QUESTION ( 
	 * QUESTION_NO INT PRIMARY KEY, 
	 * QUESTION_TITLE VARCHAR(150) NOT NULL, 
	 * QUESTION_CONTENT VARCHAR(1500) NOT NULL,
	 * QUESTION_RGST_DATE DATETIME NOT NULL DEFAULT NOW(),
	 * QUESTION_STATE VARCHAR(20) NOT NULL DEFAULT '접수중',
	 * QUESTION_ANSWER VARCHAR(1500) NULL,
	 * USER_ID VARCHAR(30) NOT NULL, 
	 * QUESTION_SECRET_YN CHAR(1) NULL DEFAULT 'N' );
	 */
	
	private int questionNo;
	private String questionTitle;
	private String questionContent;
	private Date questionRgstDate;
	private Date questionModfDate;
	private String questionState;
	private String questionAnswer;
	private String userId;
	private String questionSecretYn;
	
	
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public Date getQuestionRgstDate() {
		return questionRgstDate;
	}
	public void setQuestionRgstDate(Date questionRgstDate) {
		this.questionRgstDate = questionRgstDate;
	}
	
	public Date getQuestionModfDate() {
		return questionModfDate;
	}
	public void setQuestionModfDate(Date questionModfDate) {
		this.questionModfDate = questionModfDate;
	}
	public String getQuestionState() {
		return questionState;
	}
	public void setQuestionState(String questionState) {
		this.questionState = questionState;
	}
	public String getQuestionAnswer() {
		return questionAnswer;
	}
	public void setQuestionAnswer(String questionAnswer) {
		this.questionAnswer = questionAnswer;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQuestionSecretYn() {
		return questionSecretYn;
	}
	public void setQuestionSecretYn(String questionSecretYn) {
		this.questionSecretYn = questionSecretYn;
	}
	@Override
	public String toString() {
		return "QuestionVO [questionNo=" + questionNo + ", questionTitle=" + questionTitle + ", questionContent="
				+ questionContent + ", questionRgstDate=" + questionRgstDate + ", questionModfDate=" + questionModfDate
				+ ", questionState=" + questionState + ", questionAnswer=" + questionAnswer + ", userId=" + userId
				+ ", questionSecretYn=" + questionSecretYn + "]";
	}
}

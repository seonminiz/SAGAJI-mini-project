package com.sagaji.shoppingmall.vo;

import java.sql.Date;

public class UserVO {

	/*
	 * CREATE TABLE T_SGJ_USER ( USER_ID VARCHAR(30) PRIMARY KEY, USER_PW
	 * VARCHAR(45) NOT NULL, USER_NM VARCHAR(30) NOT NULL, USER_TEL VARCHAR(20) NOT
	 * NULL, USER_EMAIL VARCHAR(30) NOT NULL, USER_ADDR1 VARCHAR(200) NOT NULL,
	 * USER_ADDR2 VARCHAR(200) NOT NULL, USER_TYPE VARCHAR(5) NOT NULL DEFAULT
	 * 'USER', USER_RGST_DATE DATETIME NOT NULL DEFAULT NOW(), USER_MODF_DATE
	 * DATETIME NOT NULL DEFAULT NOW(), USER_USE_YN CHAR(1) NOT NULL DEFAULT 'Y' );
	 * 
	 */

	private String userId;
	private String userPw;
	private String userNm;
	private String userTel;
	private String userEmail;
	private String userAddr1;
	private String userAddr2;
	private String userType;
	private Date userRgstDate;
	private Date userModfDate;
	private String userUseYn;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}
	

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddr1() {
		return userAddr1;
	}

	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}

	public String getUserAddr2() {
		return userAddr2;
	}

	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Date getUserRgstDate() {
		return userRgstDate;
	}

	public void setUserRgstDate(Date userRgstDate) {
		this.userRgstDate = userRgstDate;
	}

	public Date getUserModfDate() {
		return userModfDate;
	}

	public void setUserModfDate(Date userModfDate) {
		this.userModfDate = userModfDate;
	}

	public String getUserUseYn() {
		return userUseYn;
	}

	public void setUserUseYn(String userUseYn) {
		this.userUseYn = userUseYn;
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userNm=" + userNm + ", userTel=" + userTel
				+ ", userEmail=" + userEmail + ", userAddr1=" + userAddr1 + ", userAddr2=" + userAddr2 + ", userType="
				+ userType + ", userRgstDate=" + userRgstDate + ", userModfDate=" + userModfDate + ", userUseYn="
				+ userUseYn + "]";
	}

}

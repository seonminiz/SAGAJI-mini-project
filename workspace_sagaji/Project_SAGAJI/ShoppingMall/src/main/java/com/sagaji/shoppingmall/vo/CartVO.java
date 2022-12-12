package com.sagaji.shoppingmall.vo;

import java.sql.Date;

public class CartVO {
	private String userId;
	private String prdctNo;
	private int prdctDetailNo;
	private int cartCnt;
	private Date cartRgstDate;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPrdctNo() {
		return prdctNo;
	}
	public void setPrdctNo(String prdctNo) {
		this.prdctNo = prdctNo;
	}
	public int getPrdctDetailNo() {
		return prdctDetailNo;
	}
	public void setPrdctDetailNo(int prdctDetailNo) {
		this.prdctDetailNo = prdctDetailNo;
	}
	public int getCartCnt() {
		return cartCnt;
	}
	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
	}
	public Date getCartRgstDate() {
		return cartRgstDate;
	}
	public void setCartRgstDate(Date cartRgstDate) {
		this.cartRgstDate = cartRgstDate;
	}
	
	
	@Override
	public String toString() {
		return "CartVO [userId=" + userId + ", prdctNo=" + prdctNo + ", prdctDetailNo=" + prdctDetailNo + ", cartCnt="
				+ cartCnt + ", cartRgstDate=" + cartRgstDate + "]";
	}
	
	
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 본인들이 맡은 페이지 스타일 -->
<style>
	#container { width: 1500px; margin: 0 auto;}
    /* 위시리스트 */
    h1 { text-align: left;}
    /* 위시리스트 비우기 버튼 */
    #wishClear {
      border: 0;
      width: 150px; height: 50px;
      border-radius: 30px;
      background-color: lightgray;
      font-weight: bold;
      margin-left: 700px;
      margin-right: 500px;
      margin-bottom: -10px;
    }

    /* 테이블1 - 위시리스트 제품 */
    #T1 { 
      width: 700px; height: 180px;
      border-collapse: collapse;
      margin-left: 150px;
      float: left;
      margin-right: 100px;
    }
    /* th */
    .h { text-align: left;}
    /* td */
    .d { text-align: left;}
    /* 상품 이미지 */
    #prdcImg { width: 170px; height: 170px;}
    /* 제품 삭제 버튼 */
    #delBtn {
      border: 0;
      width: 60px; height: 30px;
      border-radius: 30px;
      background-color: lightgray;
    }

    /* 테이블2 - 위시리스트 요약 */
    #T2 {
      width: 400px; height: 180px;
      border-collapse: collapse;
      margin-right: 150px;
      float: left;
    }
    /* 장바구니에 모든 제품 추가 버튼 위 선 */
    #hr1 {
      height: 2px;
      background-color: black;
    }
    /* 장바구니에 모든 제품 추가 버튼 */
    #addBtn {
      border: 0;
      width: 380px; height: 100px;
      background-color: #0058A3;
      color: white;
      font-weight: bold;
      font-size: large;
      margin-left: 10px;
    }
    #T2 th { text-align: right;}
    #T2 td { text-align: center;}
</style>

<!-- 세혁님 디자인 페이지 -->
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

<!-- 각자 디자인한 UI -->
<div id="container">
    <h1>위시리스트</h1>
    <button id="wishClear">위시리스트 비우기</button>
    <br><br>
    <table id="T1">
      <tr>
        <th rowspan="3" id="prdcImg"><img src="images/침대.png" id="prdcImg"></th>
        <th class="h">&emsp;제품이름</th>
        <td class="d">RISBYN 리스뷘</td>
        <th>\24,900</th>
      </tr>
      <tr>
        <th class="h">&emsp;제품 설명</th>
        <td class="d">펜던트전등갓, 양파 모양/화이트</td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td>&emsp;<button id="delBtn">삭제</button></td>
      </tr>
      <tr>
        <td colspan="4"><hr></td>
      </tr>
    </table>
    

    <table id="T2">
      <tr>
      	<th>위시리스트 요약</th>
      </tr>
      <tr>
        <th>정가</th>
        <td>\255,400</td>
      </tr>
      <tr>
        <td colspan="2"><hr id="hr1"></td>
      </tr>
      <tr>
        <td colspan="2"><button id="addBtn">장바구니에 모든 제품 추가&emsp;<img src="images/cart.png" width="40px"></button></td>
      </tr>
    </table>
  </div>

<!-- 세혁님 디자인 페이지 -->
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

<!-- 각자 스크립트 작성 부분 -->
<script>
	$(function() {
		
	});
</script>
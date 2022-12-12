<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 본인들이 맡은 페이지 스타일 -->
<style>
	#container { width: 1500px; margin: 0 auto;}
    /* 주문내역 */
    h1 { text-align: left;}
    /* 테이블 - 이미지, 상품정보 */
    #T1 { 
      width: 800px; height: 180px;
      border-collapse: collapse;
      margin-left: 150px;
      float: left;
    }
    .h { width: 150px; text-align: left;}
    .d { text-align: left;}

    /* 테이블 - 총 금액, 수량, 버튼2개 */
    #T2 {
      width: 400px; height: 180px;
      border-collapse: collapse;
      margin-right: 150px;
      float: left;
    }

    /* 배송조회 버튼 */
    #delvyTr {
      border: 0;
      width: 150px; height: 60px;
      background-color: #0058A3;
      color: white;
      font-weight: bold;
      border-radius: 30px;
      margin-right: 20px;}
    /* 주문취소 버튼 */
    #orderCancel { 
      border: 0;
      width: 150px; height: 60px;
      background-color: #0058A3;
      color: white;
      font-weight: bold;
      border-radius: 30px;
    }
    hr {clear:both;}
</style>

<!-- 세혁님 디자인 페이지 -->
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

<!-- 각자 디자인한 UI -->
<div id="container">
    <h1>주문내역</h1>
    <br>
    <form id="searchForm" action="/cart/orderList.do" method="post">
    <table id="T1">
      <tr>
        <th rowspan="4" width="170px" height="170px">제품 이미지</th>
        <th class="h">&emsp;주문번호</th>
        <td class="d"><!-- 202211251234567890 --></td>
      </tr>
      <tr>
        <th class="h">&emsp;의자 외 1건</th>
        <td class="d"></td>
      </tr>
      <tr>
        <th class="h">&emsp;등록일자</th>
        <td class="d"><!--  --></td>
      </tr>
    </table>

    <table id="T2">
      <tr>
        <th id="prddcTotalP" height="35%"><!-- \149,000 --></th>
      </tr>
      <tr>
        <th height="25%"><label>수량: </label><!-- 30개 --></th>
      </tr>
      <tr>
        <th height="40%">
          <button id="delvyTr">배 송 조 회</button>
          <button id="orderCancel">주 문 취 소</button>
        </th>
      </tr>
    </table>
    &emsp;
    <hr>
    </form>
  </div>

<!-- 세혁님 디자인 페이지 -->
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

<!-- 각자 스크립트 작성 부분 -->
<script>
	$(function() {
		
	});
</script>
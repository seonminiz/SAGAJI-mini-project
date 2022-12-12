<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jstl --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- fmt --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 상세 정보 - SAGAJI </title>
<style>
  #container{
    /* 페이지 영역 */
    margin: 50px 20px 20px 130px;
    width: 1100px;
    border: 1px solid black;
    padding-left: 100px;
  }
  #mainimg{
    /* 메인 이미지 영역 */
    width: 500px; height: 450px;
    float: left;
    margin: 50px 70px 50px 10px;
    border: 0.5px solid gray;
  }
  #subimg{
    /* 옵션 이미지 영역 */
    border: 0.5px solid gray;
    margin: 5px 5px 5px 5px;
    width: 50px; height: 50px;

  }
  .p1{
    /* 제품 정보 영역 */
    margin: 80px;
    
  }
  .p2{
    /* 하단 제품 소개글 영역 */
    padding-left: 10px;
    width: 500px;
    clear: both;
  }
  #sub{
    /* 메뉴 이름 왼쪽 여백 */
    margin-left: 120px;
    
  }
  #btn{
    border-radius: 50px;
    width: 200px;
    height: 40px;
    border: 0px;
    background-color: #0058A3;
    color: white;
  }
  .main-prd-disc-cart{
  width: 10px; 
  height: 10px;
  }
</style>

<!-- 헤더 페이지 -->
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

<!-- 각자 디자인한 UI -->
  <div id="container">
      <img id="mainimg" src="${pageContext.request.contextPath}/images/${infoMap.IMG}" > 
      
      <p class="p1">
        <h2>${infoMap.PRDCT_NM }</h2>
        <h3>${infoMap.PRDCT_INFO }</h3>
        <h2>￦ ${infoMap.PRDCT_PRICE }</h2>
        <h2>옵션</h2>
        <h4>사이즈: ${infoMap.PRDCT_SIZE }</h4>
        <h4>색상: 
        	<c:choose>
        		<c:when test="${infoMap.PRDCT_COLOR eq 'A0001' }">
        			브라운
        		</c:when>
        		<c:when test="${infoMap.PRDCT_COLOR eq 'A0002' }">
        			블랙
        		</c:when>
        		<c:when test="${infoMap.PRDCT_COLOR eq 'A0003' }">
        			화이트
        		</c:when>
        		<c:otherwise>
        			색깔없음
        		</c:otherwise>
        	</c:choose>
        </h4>
        <h4>재질: 
        	<c:choose>
        		<c:when test="${infoMap.PRDCT_MATERIAL eq 'B0001' }">
        			목재
        		</c:when>
        		<c:when test="${infoMap.PRDCT_MATERIAL eq 'B0002' }">
        			메탈
        		</c:when>
        		<c:when test="${infoMap.PRDCT_MATERIAL eq 'B0003' }">
        			원목
        		</c:when>
        		<c:otherwise>
        			재질없음
        		</c:otherwise>
        	</c:choose>
        </h4>
        <!--  <img id="subimg" src="img/sub1.PNG"> <img id="subimg" src="img/sub2.PNG"> <img id="subimg" src="img/sub3.PNG"><br> -->
        <button id="btn">구매하기</button>
        
       &nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/heart-empty.png" class="prd-heart-img" width="35" height="35" >
       &nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/cart.png" class="prd-cart-img" onclick="insertCart('${pop.prdctNo}', '${pop.prdctDetailNo }')" width="40" height="40">
	   
	  
      <p class="p2">
        ${infoMap.PRDCT_INFO }
      </p>
      <br>
		 <c:if test="${loginUser.userType eq 'ADMIN'}">
			<a href="/product/getUpdateDetail.do?prdctNo=${infoMap.PRDCT_NO }">제품 수정</a>
		 </c:if>

         
  </div>
<!-- 푸터 페이지 -->
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
    <script>
         
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- jstl --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- fmt --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- functions --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    #product-container {
      margin-left: 90px;
      margin-right: 50px;
      padding: 10px 50px;
    }

    #product-container h1 {
      margin-bottom: 40px;
    }

    #main-page-wrapper {
      margin-left: 90px;
      margin-right: 50px;
      padding: 10px 50px;
    }

    .main-prd {
      width: 100%;
      position: relative;
      margin: 50px auto;
      overflow: hidden;   
      white-space: nowrap;
      cursor: pointer;
    }

    .main-prd, #top-prd {
      height: 400px;
    }

    .main-prd {
      height: 600px;
    }

    #top-prd .main-prd-img {
      width: 250px;
      height: 300px;
    }

    .main-prd-img {
      width: 450px;
      height: 500px;
    }

    .main-prd-info {
      display: inline-block;
      overflow: auto;
      padding-right: 45px;
    }

    .prd-nm {
        font-size: 20px;
    }

    .prd-size {
      font-size: 12px;
    }

    .main-prd-disc p {
      margin-block-start: 0.2em;
      margin-block-end: 0.2em;
    }

    .prd-heart-img {
      width: 20px;
      height: 20px;
      margin-right: 10px;
      margin-bottom: 3px;
      cursor: pointer;
    }

    .prd-cart-img {
      width: 30px;
      height: 30px;
      cursor: pointer;
    }

    .main-prd-disc-wrapper .main-prd-disc-amount {
      float: left;
    }

    .main-prd-disc-wrapper .main-prd-disc-cart {
      float: right;
    }

    .main-prd-disc-amount, .main-prd-disc-cart {
      display: inline-block;
    }
    
    #product-container h1 {
    	margin-bottom: 20px;
    }
    
    #product-container p {
    	margin-top: 0;
    	padding-top: 0;
    	color: gray;
    }
</style>

<%-- 헤더 페이지 --%>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>

<div id="product-container">
	<c:choose>
	    <c:when test="${fn:length(productList) == 0}">
	        <h1>"${searchKeyword}"에 대한 검색 결과가 없습니다.</h1>
	        <p>다른 검색어를 사용하여 다시 시도해주세요.</p>
	    </c:when>
	    <c:otherwise>
	    	<h1>"${searchKeyword}"와(과) 일치하는 항목 표시</h1>
	    	<p><fmt:formatNumber value="${fn:length(productList)}" pattern="#,###" />건의 제품을 찾았습니다.</p>
	    </c:otherwise>
	</c:choose>
    <hr/>
    
	<%-- 제품 리스트 --%>
    <div class="main-prd-wrapper">
   		<c:forEach items="${productList}" var ="prd" varStatus="status">
   			<c:if test="${status.count % 5 eq 1 }">
   				<c:out value="<div class='main-prd' id='top-prd'>" escapeXml="false"/>
   			</c:if>
			<div class="main-prd-info">
            	<img src="${pageContext.request.contextPath }/images/${prd.prdctImageNm}${prd.prdctImageType}" data-imgnm="${prd.prdctImageNm}"  data-ext="${prd.prdctImageType}" class="main-prd-img">
            	<div class="main-prd-disc">
            		<p class="prd-nm">${prd.prdctNm}</p>
            		<p class="prd-size">${prd.prdctSize}</p>
            		<div class="main-prd-disc-wrapper">
              			<div class="main-prd-disc-amount">
                 			<p><fmt:formatNumber value="${prd.prdctPrice}" pattern="#,###"/></p>
              			</div>
              			<div class="main-prd-disc-cart">
                			<img src="${pageContext.request.contextPath }/images/heart-empty.png" class="prd-heart-img">
               				<img src="${pageContext.request.contextPath }/images/cart.png" class="prd-cart-img">
              			</div>
            		</div>
          		</div>
        	</div>       
			<c:if test="${status.count % 5 eq 0 }">
				<c:out value="</div>" escapeXml="false"/>
			</c:if>
		</c:forEach>
    </div>
</div>

<%-- 푸터 페이지 --%>
<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>

<script>
	$(function() {
		// 이미지 hover 처리
		// 이미지 hover 시, 이미지명'-hover'.확장자 파일 보임
		// 이미지 hover 안할 시, 이미지명.확장자 파일 보임
		$(".main-prd-img").hover(function(){
		    $(this).attr("src", "${pageContext.request.contextPath}/images/" + $(this).data("imgnm") + "-hover" + $(this).data("ext"));
		}, function(){
		    $(this).attr("src", "${pageContext.request.contextPath}/images/" + $(this).data("imgnm") + $(this).data("ext"));
		});
		
		// 상품 찜목록 저장
		$(".prd-heart-img").on("click", function(){
		    // 찜목록 수정처리 필요
		    if($(this).attr("src").endsWith("empty.png")){
		        // 찜 저장처리
		        $(this).attr("src", "${pageContext.request.contextPath}/images/heart-fill.png");
		    }else{
		        // 찜 해제처리
		        $(this).attr("src", "${pageContext.request.contextPath}/images/heart-empty.png");
		    }
		});
		
		// 장바구니 저장
		$(".prd-cart-img").on("click", function(){
		
		});
		
		// 상품 상세 조회
		$(".main-prd-info").on("click",function() {
			
	    });
	    
	    $("div#top-prd").on("click",function() {
	    	var sPrdctNo = $(this).data("prdctno");
	    	var sPrdctDetailNo = $(this).data("prdctdetailno");
	    	
	    	location.href = "/product/getProductInfo.do?prdctNo="+sPrdctNo+"&prdctDetailNo="+sPrdctDetailNo; 
			
	    });
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jstl --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- fmt --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #category-container {
      margin-left: 90px;
      margin-right: 50px;
      padding: 10px 50px;
    }

    #category-container h1 {
      margin-bottom: 40px;
    }

    #option-wrapper {
      display: flex;
      align-items: center;
      margin-bottom: 30px;
      font-size: 0.9rem;
      position: relative;
      /* 
        화면 겹침 순서
        -> 혹시 모르기에 큰 값으로 설정해둠.
        -> header-menuList: 9999 / header-transparent-background: 8888
      */
      z-index: 7777;
    }

    .option-detail-wrapper {
      width: 100px;
      height: 40px;
      margin-right: 10px;
      line-height: 40px;
      text-align: center;
      background-color: #f3f1f1;
      border-radius: 20px;
      position: relative;
    }

    .option-detail-wrapper:hover {
      background-color: #DFDFDF;
    }

    .option-text {
      margin-right: 10px;
    }

    /* V 아이콘 크기 */
    .downImg {
      width: 20px;
      height: 14px;
    }

    /* 옵션 클릭 시, drop-down되는 옵션 리스트 */
    .option-detail-radio {
      width: 200px;
      height: 150px;
      margin-top: 15px;
      display: none;
      background-color: white;
      border-radius: 10px;
      border: none;
      box-shadow: 0 0 8px #B0B0B0;
      text-align: left;
      position: absolute;
    }

    .option-list-wrapper {
      display: flex;
      align-items: center;
    }

    .option-list-field {
      margin-left: 25px;
      padding-left: 0;
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
</style>

<%-- 헤더 페이지 --%>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>

  <div id="category-container">
  	<c:choose>
		<c:when test="${categoryInfo.categoryCd != 1}">
			<h1>${categoryInfo.categoryNm}</h1>
		</c:when>
		<c:otherwise>
			<h1>모든 제품</h1>
		</c:otherwise>
	</c:choose>
    <div id="option-wrapper">
      <div class="option-detail-wrapper">
        <div class="option-detail-field">
          <span class="option-text">정렬</span>
          <img src="${pageContext.request.contextPath }/images/down.png" class="downImg">
        </div>
        <div id="option-sort-down" class="option-detail-radio">
          <div class="option-list-wrapper">
            <ul class="option-list-field">
              <li><label for="highPrice">높은 가격 순</label>&emsp;<input type="radio" name="sort" id="highPrice" value="#"></li>
              <li><label for="lowPrice">낮은 가격 순</label>&emsp;<input type="radio" name="sort" id="lowPrice" value="#"></li>
              <li><label for="sales">판매 순</label>&emsp;&emsp;&emsp;<input type="radio" name="sort" id="sales" value="#"></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="option-detail-wrapper">
        <div class="option-detail-field">
          <span class="option-text">사이즈</span>
          <img src="${pageContext.request.contextPath }/images/down.png" class="downImg">
        </div>
        <div id="option-size-down" class="option-detail-radio">
          <div class="option-list-wrapper">
            <ul class="option-list-field">
              <li><label for="sSize">S</label>&nbsp;&emsp;<input type="radio" name="size" id="sSize" value="#"></li>
              <li><label for="mSize">M</label>&emsp;<input type="radio" name="size" id="mSize" value="#"></li>
              <li><label for="lSize">L</label>&nbsp;&emsp;<input type="radio" name="size" id="lSize" value="#"></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="option-detail-wrapper">
        <div class="option-detail-field">
          <span class="option-text">색상</span>
          <img src="${pageContext.request.contextPath }/images/down.png" class="downImg">
        </div>
        <div id="option-color-down" class="option-detail-radio">
          <div class="option-list-wrapper">
            <ul class="option-list-field">
              <li><label for="brown">브라운</label>&emsp;<input type="radio" name="color" id="brown" value="#"></li>
              <li><label for="black">블랙&emsp;&emsp;</label><input type="radio" name="color" id="black" value="#"></li>
              <li><label for="white">화이트</label>&emsp;<input type="radio" name="color" id="white" value="#"></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="option-detail-wrapper">
        <div class="option-detail-field">
          <span class="option-text">소재</span>
          <img src="${pageContext.request.contextPath }/images/down.png" class="downImg">
        </div>
        <div id="option-material-down" class="option-detail-radio">
          <div class="option-list-wrapper">
            <ul class="option-list-field">
              <li><label for="lumber">목재</label>&emsp;<input type="radio" name="material" id="lumber" value="#"></li>
              <li><label for="metal">메탈</label>&emsp;<input type="radio" name="material" id="metal" value="#"></li>
              <li><label for="hardwood">원목</label>&emsp;<input type="radio" name="material" id="hardwood" value="#"></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="option-detail-wrapper">
        <div class="option-detail-field">
          <span class="option-text">가격</span>
          <img src="${pageContext.request.contextPath }/images/down.png" class="downImg">
        </div>
        <div id="option-price-down" class="option-detail-radio">
          <div class="option-list-wrapper">
            <ul class="option-list-field">
              <li><label for="rangeFirst">￦0 - 19,999</label>&emsp;&emsp;&emsp;<input type="radio" name="price" id="rangeFirst" value="#"></li>
              <li><label for="rangeSecond">￦20,000 - 39,999</label>&ensp;<input type="radio" name="price" id="rangeSecond" value="#"></li>
              <li><label for="rangeThird">￦40,000 - 59,999</label>&ensp;<input type="radio" name="price" id="rangeThird" value="#"></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <hr/>
	<%-- 제품 리스트 --%>
    <div class="main-prd-wrapper">
   			<c:forEach items="${categoryProductList}" var ="cate" varStatus="status">
   				<c:if test="${status.count % 5 eq 1 }">
   					<c:out value="<div class='main-prd' id='top-prd'>" escapeXml="false"/>
   				</c:if>
			    	<div class="main-prd-info">
			          <img src="${pageContext.request.contextPath }/images/${cate.prdctImageNm}${cate.prdctImageType}" data-imgnm="${cate.prdctImageNm}"  data-ext="${cate.prdctImageType}" class="main-prd-img">
			          <div class="main-prd-disc">
			            <p class="prd-nm">${cate.prdctNm}</p>
			            <p class="prd-size">${cate.prdctSize}</p>
			            <div class="main-prd-disc-wrapper">
			              <div class="main-prd-disc-amount">
			                  <p><fmt:formatNumber value="${cate.prdctPrice}" pattern="#,###"/></p>
			              </div>
			              <div class="main-prd-disc-cart">
			                <img src="${pageContext.request.contextPath }/images/heart-empty.png" class="prd-heart-img">
			                <img src="${pageContext.request.contextPath }/images/cart.png" class="prd-cart-img" onclick="insertCart('${cate.prdctNo}', '${cate.prdctDetailNo }')">
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
	// 각 옵션 클릭 시, 옵션 리스트 열기
	$(".option-detail-field").on("click", function() {
	  let detail = $(this).closest(".option-detail-wrapper");
	
	  // 보임여부 및 아이콘 기본 설정으로 초기화
	  $(".option-detail-radio").css("display", "none");
	
	  // 현재 클릭된 옵션은 제외하고 down 아이콘으로 설정
	  $(".option-detail-field").not(this).closest(".option-detail-wrapper").find(".downImg").attr("src", "${pageContext.request.contextPath}/images/down.png");
	
	  // 닫힘/열림에 따른 리스트 목록 보이기
	  if(detail.find(".downImg").attr("src") == "${pageContext.request.contextPath}/images/up.png") {
	    detail.find(".downImg").attr("src", "${pageContext.request.contextPath}/images/down.png");
	    detail.find(".option-detail-radio").css("display", "none");
	  } else { 
	    detail.find(".downImg").attr("src", "${pageContext.request.contextPath}/images/up.png");
	    detail.find(".option-detail-radio").css("display", "block");
	  }
	});
	
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
	function insertCart(prdctNo, prdctDetailNo) {
		console.log('111111');
    	//로그인 체크
    	//로그인 안한 사람은 로그인페이지로
    	const loginUserId = '${loginUser.userId}';
    	//if(loginUserId != null && loginUserId != '') => ajax 실행
    	//else => window.location.href = "/user/login.do";
    	if(loginUserId != null && loginUserId != '') {
    		console.log(loginUserId);
    		$.ajax({
    			url: "/cart/insertCart.do",
    			type: "post",
    			data: {
    				prdctNo: prdctNo,
    				prdctDetailNo: prdctDetailNo
    			},
    			success: function(obj) {
    				if(obj == 1) {
    					alert("장바구니에 등록했습니다.");
    				} else {
    					alert("장바구니 등록에 실패했습니다. 관리자에게 문의해주세요.");
    				}
    			},
    			error: function(e) {
    				console.log(e);
    			}
    		});
    	} else {
    		window.location.href = "/user/login.do";
    		
    	}
    	
    	/* $.ajax({
			url: "/cart/insertCart.do",
			type: "post",
			data: {
				prdctNo: prdctNo,
				prdctDetailNo: prdctDetailNo
			},
			success: function(obj) {
				if(obj == 1) {
					alert("장바구니에 등록했습니다.");
				} else {
					alert("장바구니 등록에 실패했습니다. 관리자에게 문의해주세요.");
				}
			},
			error: function(e) {
				console.log(e);
			}
		}); */
	}
	
	// 상품 상세 조회
	$(".main-prd-info").on("click",function(){
	
	});
</script>
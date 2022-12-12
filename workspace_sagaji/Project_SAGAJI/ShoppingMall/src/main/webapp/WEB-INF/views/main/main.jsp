<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jstl --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- fmt --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
   #main-page-wrapper {
       margin-left: 90px;
       margin-right: 50px;
       padding: 10px 50px;
   }

   .main-prd-title {
       font-size: 30px;
       font-weight: bold;
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

   .main-prd, #new-prd {
       height: 600px;
   }

   #top-prd .main-prd-img {
       width: 250px;
       height: 300px;
   }

   #new-prd .main-prd-img {
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

   .new-prd-controller #prev {
       position: absolute;
       top: 50%;
   }

   .new-prd-controller #next {
       position: absolute;
       top: 50%;
       left: 96%;
   }

   .prd-slide-img {
       width: 50px;
       height: 50px;
   }
   
   #main-new-wrapper {
   	   height: 50px;
   	   display: flex;
   	   align-items: center;
   }
   
   #main-new-img {
   	   width: 45px;
   	   height: 45px;
	   margin-left: 10px;
   	   padding-top: 5px;
   }
</style>

<%-- 헤더 페이지 --%>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>

<%-- 메인 페이지 시작 --%>
<div id="main-page-wrapper">
  <%-- 인기제품 --%>
  <div class="main-prd-wrapper">
    <div class="main-prd-title" id="main-popular">
      <p>인기제품 TOP5</p>
    </div>
    <div class="main-prd" id="top-prd">
    	<c:forEach items="${popularProductList}" var="pop">
    		<div class="main-prd-info" id="top-sub">
    			<div id="imgTopArea">
    				<img src="${pageContext.request.contextPath}/images/${pop.prdctImageNm}${pop.prdctImageType}" 
		        	data-imgnm="${pop.prdctImageNm}" data-ext="${pop.prdctImageType}" data-prdctno="${pop.prdctNo}" data-prdctdetailno="${pop.prdctDetailNo}"  class="main-prd-img" />
    			</div>
		        <div class="main-prd-disc">
		          <p class="prd-nm">${pop.prdctNm}</p>
		          <p class="prd-size">${pop.prdctSize}</p>
		          <div class="main-prd-disc-wrapper">
		            <div class="main-prd-disc-amount">
		                <p>￦<fmt:formatNumber value="${pop.prdctPrice}" pattern="#,###"/></p>
		            </div>
		            <div class="main-prd-disc-cart">
		              <img src="${pageContext.request.contextPath}/images/heart-empty.png" class="prd-heart-img">
		              <img src="${pageContext.request.contextPath}/images/cart.png" class="prd-cart-img" onclick="insertCart('${pop.prdctNo}', '${pop.prdctDetailNo }')">
		            </div>
		          </div>
		        </div>
	    	</div>
    	</c:forEach>
    </div>
  </div>


  <%-- 신제품 --%>
  <div class="main-prd-wrapper">
      <div class="main-prd-title" id="main-new">
      	<div id="main-new-wrapper">
      		<p>신제품</p>
      		<img src="${pageContext.request.contextPath}/images/new.png" id="main-new-img">
      	</div>
      </div>
      <div class="main-prd" id="new-prd">
          <div id="new-prd-slide">
          	<c:forEach items="${newProductList}" var="newList">
              <div class="main-prd-info" id="new_sub">
                  <div id="imgNewArea">
                  	<img src="${pageContext.request.contextPath}/images/${newList.prdctImageNm}${newList.prdctImageType}" 
                  	data-imgnm="${newList.prdctImageNm}" data-ext="${newList.prdctImageType}" data-prdctno="${newList.prdctNo}" data-prdctdetailno="${newList.prdctDetailNo}" class="main-prd-img">
                  </div>
                  
                  <div class="main-prd-disc">
                      <p class="prd-nm">${newList.prdctNm}</p>
                      <p class="prd-size">${newList.prdctSize}</p>
                      <div class="main-prd-disc-wrapper">
                          <div class="main-prd-disc-amount">
                              <p>￦<fmt:formatNumber value="${newList.prdctPrice}" pattern="#,###"/></p>
                          </div>
                          <div class="main-prd-disc-cart">
                              <img src="${pageContext.request.contextPath}/images/heart-empty.png" class="prd-heart-img">
                              <img src="${pageContext.request.contextPath}/images/cart.png" class="prd-cart-img" onclick="insertCart('${newList.prdctNo}', '${newList.prdctDetailNo }')">
                          </div>
                      </div>
                  </div>
              </div>
              </c:forEach>
          </div>
          <%-- 슬라이드 --%>
          <p class="new-prd-controller">
              <span id="prev" style="display: none;"><img src="${pageContext.request.contextPath}/images/slide-prev.png" class="prd-slide-img"></span>  
              <span id="next" style="display: none;"><img src="${pageContext.request.contextPath}/images/slide-next.png" class="prd-slide-img"></span>
          </p>
      </div>
  </div>
</div>
<%-- 메인 페이지 종료 --%>

<%-- 메인 페이지 관련 스크립트 --%>
<script>
	$(function() {
	    // 신상품 슬라이드처리
	    const slides = document.querySelector("#new-prd"); //전체 슬라이드 컨테이너
	    const slideImg = document.querySelectorAll("#new-prd .main-prd-info"); //모든 슬라이드들
	    let currentIdx = 0; // 현재 슬라이드 index
	    const slideCount = slideImg.length; // 슬라이드 개수
	    const prev = document.querySelector(".new-prd-controller #prev"); //이전 버튼
	    const next = document.querySelector(".new-prd-controller #next"); //다음 버튼
	    var prevDisplay = "none";
	    var nextDisplay = "block";
		
	    prev.addEventListener("click", function() {
	
	        if(currentIdx > 0){
	            currentIdx--;
	            $("#new-prd .main-prd-info").eq(currentIdx).css("display","inline-block");
	        }
	
	        // 첫 화면일 경우 이전 버튼 비활성화
	        if(currentIdx == 0){
	            prevDisplay = "none";
	        }
	        nextDisplay = "block";
	        next.style.display = nextDisplay;
	        prev.style.display = prevDisplay;
	    });
	
	    next.addEventListener("click", function() {
	        if (currentIdx <= slideCount - 4) {
	            $("#new-prd .main-prd-info").eq(currentIdx).css("display", "none");
	            currentIdx++;
	        }
	        prevDisplay = "block";
	        next.style.display = nextDisplay;
	        prev.style.display = prevDisplay;
	
	        // 마지막 화면일 경우 다음 버튼 비활성화
	        if(currentIdx == slideCount - 4) {
	            nextDisplay = "none";
	        }
	    });
	
	    // 슬라이드 화면 hover 처리
	    $("#new-prd").hover(function() {
	        // hover 시
	        next.style.display = nextDisplay;
	        prev.style.display = prevDisplay;
	    }, function() {
	        // hover 해제 시
	        next.style.display = "none";
	        prev.style.display = "none";
	    });
	
	    // 이미지 hover 처리
	    // 이미지 hover 시, 이미지명'-hover'.확장자 파일 보임
	    // 이미지 hover 안할 시, 이미지명.확장자 파일 보임
	    $(".main-prd-img").hover(function() {
	        $(this).attr("src", "${pageContext.request.contextPath}/images/" + $(this).data("imgnm") + "-hover" + $(this).data("ext"));
	    }, function() {
	        $(this).attr("src", "${pageContext.request.contextPath}/images/" + $(this).data("imgnm") + $(this).data("ext"));
	    });
	
	    // 상품 찜목록 저장
	    $(".prd-heart-img").on("click", function() {
	        // 찜목록 수정처리 필요
	        if($(this).attr("src").endsWith("empty.png")){
	            // 찜 저장처리
	            $(this).attr("src", "${pageContext.request.contextPath}/images/heart-fill.png");
	        } else {
	            // 찜 해제처리
	            $(this).attr("src", "${pageContext.request.contextPath}/images/heart-empty.png");
	        }
	    });
	
	    // 장바구니 저장
	    /* $(".prd-cart-img").on("click", function(){
			$.ajax({
				url: "/cart/insertCart.do",
				type: "post",
				data: {
					prdctNo: 
				}
			});
	    }); */
	
	    // 상품 상세 조회
	    $(".main-prd-info").on("click",function() {
	
	    });
	    
	    $("div#top-sub #imgTopArea img").on("click",function() {
	    	var sPrdctNo = $(this).data("prdctno");
	    	var sPrdctDetailNo = $(this).data("prdctdetailno");
	    	
	    	location.href = "/product/getProductInfo.do?prdctNo="+sPrdctNo+"&prdctDetailNo="+sPrdctDetailNo; 
			
	    });
	    
	    // 신상품 상세 조회
	    $(".main-prd-title").on("click",function() {
	
	    });
	    
	    $("div#new_sub #imgNewArea img").on("click",function() {
	    	var sPrdctNo = $(this).data("prdctno");
	    	var sPrdctDetailNo = $(this).data("prdctdetailno");
	    	
	    	location.href = "/product/getProductInfo.do?prdctNo="+sPrdctNo+"&prdctDetailNo="+sPrdctDetailNo; 
			
	    });
	    
	    
	    
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
</script>

<%-- 푸터 페이지 --%>
<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신규 제품 등록 - SAGAJI</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap');
    body {
        font-family: 'Noto Sans KR', sans-serif;
        box-sizing: border-box;
        margin: 0;
    }

    /* ========== 영역 ========== */
     #container{
    /* 페이지 영역 */
    margin: 50px 20px 20px 130px;
    width: 1100px;
    border: 1px solid black;
    padding-left: 200px;
  }
  #sub{
    /* 메뉴 이름 왼쪽 여백 */
    margin-left: 120px;
  }
  #prdct{
    /* 드롭다운 메뉴 영역 */
    margin-left: 7px;
    width: 250px;
    height: 28px;
  }
  #btn{
    float: right;
    margin-right: 650px;
    width: 100px;
    height: 40px;
    border: 0px;
    background-color: #0058A3;
    color: white;
  }
</style>
<%-- 헤더 페이지 --%>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>

<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <div id="container">
    	<form id="productForm" action="/product/insertProduct.do" method="post">
		    <h1 style="margin-left: 10px;">신규 제품 등록</h1>
		    <br>
		    <!-- <h2 id="sub">등록일 <input id="insert" name="prdctDate" type="text" style="margin-left: 40px; width: 200px; height: 23px"></h2> -->
		    <h2 id="sub">제품 번호 <input id="prdctNo" name="prdctNo" type="text" style="margin-left: 7px; width: 400px; height: 23px">
		    	<button type="button" class="btn1" id="btnNoCheck">
                	<span class="btn_inner">중복체크</span>
                </button>
            </h2>
          
		    <div class="dropdown">    
		      <h2 id="sub">제품 목록
		          <select id="prdct" name="prdctCategoryCd">
		            <option value="none" hidden>제품 카테고리를 선택하세요.</option>
		            <option value="2">옷장</option>
		            <option value="3">테이블</option>
		            <option value="4">침대</option>
		            <option value="5">가구</option>
		            <option value="6">소파</option>
		          </select>
		      </h2>
		    </div>
		    <h2 id="sub">제품 이름 <input id="insert" name="prdctNm" type="text" style="margin-left: 7px; width: 200px; height: 23px"></h2> 
		    <h2 id="sub">제품 사이즈
		    <label>
		      <input type="radio" name="prdctSize" value="S" checked />
		      <span>S</span>
		    </label>
		    <label>
		      <input type="radio" name="prdctSize" value="M" style="margin-left: 39px;"/>
		      <span>M</span>
		    </label>
		    <label>
		      <input type="radio" name="prdctSize" value="L" style="margin-left: 30px;"/>
		      <span>L</span>
		    </label>
		    </h2>
		    <h2 id="sub" >제품 색상
		      <label style="margin-left: 23px;">
		        <input type="radio" name="prdctColor" value="A0001" checked />
		        <span>브라운</span>
		      </label>
		      <label>
		        <input type="radio" name="prdctColor" value="A0002" />
		        <span>블랙</span>
		      </label>
		      <label>
		        <input type="radio" name="prdctColor" value="A0003" />
		        <span>화이트</span>
		      </label>
		      </h2>
		    <h2 id="sub">제품 소재
		      <label style="margin-left: 23px;">
		        <input type="radio" name="prdctMaterial" value="B0001" checked />
		        <span>목재</span>
		      </label>
		      <label>
		        <input type="radio" name="prdctMaterial" value="B0002" />
		        <span>메탈</span>
		      </label>
		      <label>
		        <input type="radio" name="prdctMaterial" value="B0003" />
		        <span>원목</span>
		      </label>
		      </h2> 
		      <h2 id="sub">가격 <input id="insert" type="text" name="prdctPrice" style="margin-left: 65px; width: 200px; height: 23px"></h2> 
		      <h2 id="sub">재고 <input id="insert" type="text" name="prdctRemain" style="margin-left: 65px; width: 200px; height: 23px"></h2>
		      <h2 id="sub" >상세 내용 <input id="insert" type="text" name="prdctInfo" style="margin-left: 7px; width: 500px; height: 80px"></h2> 
		      <h2 id="sub">첨부파일 <input id="insert" type="text" name="prdctPhoto" style="margin-left: 17px; width: 300px; height: 23px">
		        <button style="height: 30px;">첨부파일</button>
		      </h2>
		      <br>
		      <button id="btn" type="submit">등록하기</button>
		      <br><br><br>
		  </form>
	  </div>
    
    <script>
    
	    $( document ).ready(function() {
	    	var checkNo = false;
	    	$("#btn").attr("disabled", false);
	    	//id 중복체크
			$("#btnNoCheck").on("click", function() {				
				$.ajax({
					url: "/product/noCheck.do",
					type: "post",
					data: $("#productForm").serialize(),
					success: function(obj) {
						console.log(obj);
						if(obj == 1) {
							alert("중복된 번호입니다.");
							$("#prdctNo").focus();
						} else {
							alert("사용 가능한 제품번호 입니다.")
						}
					},
					error: function(e) {
						console.log(e);
					}
				})
			});
	    	
	    });
	    
	   
	
        
    </script>
</body>

<%-- 푸터 페이지 --%>
<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
</html>
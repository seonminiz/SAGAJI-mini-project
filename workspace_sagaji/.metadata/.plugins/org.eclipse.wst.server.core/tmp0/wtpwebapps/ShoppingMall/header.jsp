<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jstl --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SAGAJI KOREA | 사가지 코리아</title>
  <style>
    /* 공통 */
    /* 구글 웹 폰트 사용 - Noto Sans Korean */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

    html, body {
      width: 100%;
      height: 100%;
      margin: 0;
      padding: 0;
      position: relative;

      /* 구글 웹 폰트 사용 - Noto Sans Korean */
      font-family: 'Noto Sans KR', sans-serif;
    }

    #top {
      width: 100%;
      height: 38px;
      margin: 0px;
      padding: 0px;
      background-color: black;
    }

    #header-container {
      margin: 0 auto;
      padding: 10px 50px;
    }

    header {
      display: flex; 
      margin-top: 20px;
    }

    header a {
      text-decoration: none;
		  color: black;
    }

    #menuImg-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 40px;
      height: 40px;
    }

    #menuImg-wrapper:hover {
      background-color: #f3f1f1;
      border-radius: 50%;
    }

    #menu {
      margin-top: -2px;
      margin-left: 8px;
      font-size: 0.9rem;
    }

    #main-header-search {
      display: flex;
      align-items: center;
    }

    #main-header-search a {
      text-decoration: none;
		  color: black;
    }

    /* 로고 영역*/
    #main-header-search #logo-wrapper {
      margin-left: 60px;
      margin-right: 40px;
    }

    /* 돋보기 아이콘 및 검색어 입력 영역*/
    #main-header-search #search-wrapper {
      width: 1000px;
      height: 55px;
      display: flex;
      align-items: center;
      padding-left: 15px;
      background-color: #f3f1f1;
      border-radius: 20px;
    }

    #main-header-search #search-wrapper:hover {
      background-color: #DFDFDF;
    }

    #search-wrapper #searchKeyword {
      width: 920px;
      height: 30px;
      margin: 10px;
      border:none;
      background-color: #f3f1f1;
      background: transparent;
      /* input 테그 클릭 시, 기본적으로 생기는 테두리 제거 */
      outline: none;
      /* input 태그 자동완성 선택 시, 배경색 변경되는 부분 막기 */
      
    }

    #main-header-login {
      width: 200px;
      height: 50px;
      display: flex;
      justify-content: center;
      align-items: center;
      margin-left: 60px;
    }

    #main-header-login #personImg {
      margin-right: 10px;
    }

    #main-header-login:hover {
      background-color: #f3f1f1;
      border-radius: 20px;
    }

    /* SAGAJI 로고 크기 */
    .logoImg {
      width: 90px;
      height: 36px;
    }

    /* 메뉴, 돋보기, 사람모양 아이콘 크기 */
    #menuImg, #searchImg, #personImg {
      width: 24px;
      height: 24px;
    }

    ul, li {
		  list-style: none;
	  }

    .listField, .main-nav-field, .detail-nav-field {
      margin-left: 0;
      padding-left: 0;
    }

    nav #nav-wrapper {
      margin-left: 90px;
      margin-right: 50px;
    }

    nav a {
      text-decoration: none;
		  color: black;
    }

    nav #main-nav {
      float: left;
    }

    /* 
      모든 제품, 신제품, SAGAJI 인기제품 배치
      문의사항, 주문조회, 내 정보 배치
    */
    .main-nav-field, .detail-nav-field {
      display: flex;
		  justify-content: space-between;
    }

    .main-nav-field li {
      margin-right: 35px;
    }

    /* nav항목들 hover 시, 밑줄 효과 */
    .main-nav-field li a:hover, .detail-nav-field li a:hover {
      text-decoration: underline;
    }

    .detail-nav-field li {
      margin-left: 35px;
    }

    nav #detail-nav {
      float: right;
    }

    nav hr {
      clear: both;
    }

    /* 로그인 영역, nav항목들 글씨 설정 */
    #main-header-login, .main-nav-field, .detail-nav-field {
      font-size: 0.9rem;
      font-weight: bold;
    }

    /* 메뉴 클릭 시, 나타나는 메뉴 리스트 영역 */
    #menuList {
      width: 480px;
      height: 100%;
      padding-top: 30px;
      position: absolute;
      background-color: white;
      display: none;
      /* 
        화면 겹침 순서
        -> 혹시 모르기에 큰 값으로 설정해둠.
        -> 가장 맨 앞의 화면
      */
      z-index: 9999; 
    }

    /* X 아이콘 크기 */
    #xImg {
      width: 20px;
      height: 20px;
    } 

    #imgWrapper {
      display: flex;
      align-items: center;
    }

    #xImg-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 40px;
      height: 40px;
      margin-left: 60px;
    }

    #imgWrapper #xImg-wrapper:hover {
      background-color: #f3f1f1;
      border-radius: 50%;
    }

    #imgWrapper .logoImg {
      margin-left: 50px;
    }

    #listWrapper {
      float: left;
      margin-top: 40px;
      margin-left: 150px;
    }

    .listField {
      margin-left: 0;
      padding-left: 0;
    }

    .listField a {
      text-decoration: none;
      color: black;
    }

    .listField li {
      margin-bottom: 10px;
      font-weight: bold;
    }

    .listField li:nth-child(1) {
      font-size: 2.2rem;
      margin-bottom: 15px;
    }

    .listField li:hover {
      text-decoration: underline;
    }

    /* 메뉴 아이콘 클릭 시, 배경 투명하게 설정 */
    #transparent-background {
      width: 100%;
      height: 100%;
      background-color: #C0C0C0;
      position: absolute;
      opacity: 0.5;
      display: none;
      /* 
        화면 겹침 순서
        -> 혹시 모르기에 큰 값으로 설정해둠. 
      */
      z-index: 8888; 
    }
  </style>
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
</head>
<body>
  <div id="transparent-background"></div>
  <div id="menuList">
    <div id="imgWrapper">
      <div id="xImg-wrapper">
        <img src="${pageContext.request.contextPath}/images/x.png" id="xImg">
      </div>
      <img src="${pageContext.request.contextPath}/images/logo.png" class="logoImg">
    </div>
    <div id="listWrapper">
      <%-- 카테고리 리스트 출력하는 부분 --%>
      <ul class="listField">

      </ul>
    </div>
  </div>
  <div id="top"></div>
  <div id="header-container">
    <header>
        <div id="main-header-menu">
          <div id="menuImg-wrapper">
            <a href="#"><img src="${pageContext.request.contextPath}/images/menu.png" id="menuImg"></a>
          </div>
          <div id="menu">
            <a href="#">메뉴</a>
          </div> 
        </div>
        <div id="main-header-search">
          <div id="logo-wrapper">
            <a href="#"><img src="${pageContext.request.contextPath}/images/logo.png" class="logoImg"></a>
          </div>
          <div id="search-wrapper">
            <img src="${pageContext.request.contextPath}/images/search.png" id="searchImg">
            <input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색어 입력">
          </div>
        </div>
        <div id="main-header-login">
          <img src="${pageContext.request.contextPath}/images/person.png" id="personImg">
          <a href="/user/login.do">로그인 또는 가입하기</a>
        </div>
    </header>
    <nav>
      <div id="nav-wrapper">
        <div id="main-nav">
          <ul class="main-nav-field">
            <li>
              <a href="#">모든 제품</a>
            </li>
            <li>
              <a href="#">신제품</a>
            </li>
            <li>
              <a href="#">SAGAJI 인기제품</a>
            </li>
          </ul>
        </div>
        <div id="detail-nav">
          <ul class="detail-nav-field">
            <li>
              <a href="#">문의사항</a>
            </li>
            <li>
              <a href="#">주문조회</a>
            </li>
            <li>
              <a href="#">내 정보</a>
            </li>
          </ul>
        </div>
        <hr/>
      </div>
    </nav>
  </div>
  <script>
    $(function() {
		// 메뉴 아이콘 클릭 시
		$("#menuImg").on("click", function() {
		  $("#transparent-background").css("display", "block");
		  $("#menuList").css("display", "block");
		  $("#menuList").css("overflow", "scroll");
		  $("html").css("overflow", "hidden");
		  /* 메뉴 리스트 이외에 마우스 포인터 먹지 않게 설정 */
		  $("#header-container").css("pointer-events", "none");
		});
		
		// X 아이콘 클릭 시
		$("#xImg").on("click", function() {
		  $("#transparent-background").css("display", "none");
		  $("#menuList").css("display", "none");
		  $("html").css("overflow", "auto");
		  $("#header-container").css("pointer-events", "auto");
		});
		
		// 메뉴 리스트 영역 이외에 다른 영역 클릭 시, 메인 페이지로 돌아옴
		$("#transparent-background").on("click", function() {
		  $("#xImg").trigger("click");
		});
      
      	// 카테고리 리스트 조회
		$.ajax({
			url:"/product/getCategoryList.do",
			type: "post",
			success: function(obj) {
				console.log(obj);
				// JSON 형태로 변환하여 키를 통해 값을 꺼냄
				let data = JSON.parse(obj);
				
				let htmlStr = "";
				
				for(let i=0; i<data.categoryList.length; i++) {
					htmlStr += "<li>";
					htmlStr += "<a href='/product/getCategoryProductList.do?categoryCd=" + data.categoryList[i].categoryCd + 
								"'>" + data.categoryList[i].categoryNm + "</a>";
					htmlStr += "</li>";
				}
				
				// ul에 직접 만들어준 li 생성
				$(".listField").append(htmlStr);
			},
			error: function(e) {
				console.log(e);
			}
		});
      	
      	// 헤더의 로고 이미지 클릭 시, main 화면으로 이동
      	$(".logoImg").on("click", function() {
      		location.href="/";
      	});
    });
  </script>
</body>
</html>
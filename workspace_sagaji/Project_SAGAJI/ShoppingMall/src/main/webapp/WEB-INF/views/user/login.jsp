<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - SAGAJI</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap');
    body {
        font-family: 'Noto Sans KR', sans-serif;
        box-sizing: border-box;
        margin: 0;
    }

    /* ========== 영역 ========== */
    .form-wrapper {
        line-height: 1.5;
        scroll-behavior: smooth;
        box-sizing: inherit;
        outline: none;
    }
    /* 왼쪽사이드 */
    .section1 { 
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        float: left;
        width: 300px;
        min-height: 100vh;
        padding: 0 80px;
        background-color: #0058A3;
        scroll-behavior: smooth;
    }
    /* 오른쪽사이드 */
    .section2 {
        display: flex;
        /* flex-direction: column; */
        /* justify-content: space-between; */
        float: right; 
        width: calc(100% - 620px);
        min-height: 100vh;
        padding: 0 80px;
        background-color: white;
        scroll-behavior: smooth;
    }


    /* ========== section1 - 왼쪽사이드 ========== */
    a {
        text-decoration: none;
        color: white;
    }
    .back {
        margin: 0;
        font-size: 2em;
        font-weight: 700;
    }
    .logo {
        display: inline-flex;
        padding: 0 0 0 54px;
        color: white;
        font-size: 1.2em;
        text-align: center;
    }
    .title{
        color: yellow;
        text-align: center;
    }
    .copyright {
        color: white;
    }

    /* ========== section2 - 오른쪽사이드 ========== */
    .content {
        width: 700px;
        margin: auto;
    }
    .label_wrapper1 {
        margin-top: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .label_wrapper2 {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    /* input-text */
    .input_wrapper {
        position: relative;
        display: flex;
        width: 100%;
        align-items: center;
    }
    
    .input input {
        flex-grow: 1;
        border: 0;
        padding: 0;
        padding-inline-start: 0.5rem;
        padding-inline-end: 0.5rem;
        font-size: 1rem;
        line-height: 1.5;
        height: 3rem;
        overflow: hidden;
        order: 3;
        background: #fff;
        outline: none;
    }
    .input_border {
        position: absolute;
        top: 0;
        bottom: 0;
        display: block;
        width: 100%;
        border: 1px solid #929292;
        border-radius: 4px;
        pointer-events: none;
    }
    /* border_error  ->  border: 1px solid #e00751; */
    

    /* 버튼 */
    .btn2 {
        width:100%;
        margin-top: 50px;
        min-height: 4rem;
        border: none;
        border-radius: 64px;
        background: #0058A3;;
        color: white;
        font-size: 1.5em;
        font-weight: 700;
        cursor: pointer;
    }

    .btn_inner {
        border-radius: 64px;
        justify-content: center;
    
    }
</style>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>

</head>
<body>
	<div class="form-wrapper">
        <!-- ★action 수정하기 -->
        <form id="loginForm" action="/user/login.do" method="post">
            <input type="hidden" id="joinMsg" value="${joinMsg }">
    
            <!-- ========== 왼쪽사이드 ========== -->
            <div class="section1">
                <!-- 메인페이지 버튼, 로고 (★href 메인페이지로 입력) -->
                <div>
                    <a href="javascript:history.back();" class="back">←</a>
                    <a href="/" class="logo"><h1>SAGAJI</h1></a>
                </div>
    
                <!-- 타이틀: 로그인 -->
                <div class="title">
                    <h1>로그인</h1>
                </div>
    
                <!-- copyright 내용 -->
                <div class="copyright">
                    <p>ⓒ Inter SAGAJI MALL Systems 2022</p>
                </div>
            </div>
            
            <!-- ========== 오른쪽사이드 ========== -->
            <div class="section2">
                <div class="content">
    
                    <!-- userId -->
                    <div>
                        <div class="label_wrapper1"><label for="userId">아이디</label></div>
                        <div class="input  label_wrapper2">
                            <div class="input_wrapper">
                                <input type="text" name="userId" id="userId" required placeholder="아이디를 입력하세요.">
                                <span class="input_border"></span>
                            </div>
                        </div>
                    </div>
    
                    <!-- userPw1 -->
                    <div>
                        <div class="label_wrapper1"><label for="userPw">비밀번호</label></div>
                        <div class="input  label_wrapper2">
                            <div class="input_wrapper">
                                <input type="password"  name="userPw" id="userPw" required placeholder="비밀번호를 입력하세요.">
                                <span class="input_border"></span>
                            </div>
                        </div>
                    </div>
                    
    
                    <!-- login button -->
                    <div>
                        <button type="button" class="btn2" id="btnLogin">
                        <span class="btn_inner">로그인</span>
                        </button>
                    </div>

                    <!-- join button -->
                    <div>
                        <button type="button" onclick = "location.href='/user/join.do'" class="btn2" id="btnJoin" style=" margin-top: 18px; border: 1px solid #0058A3; background-color: white; color: #0058A3; font-weight: 700;">
                        <a href="/user/join.do" style= "color: #0058A3;">회원가입</a>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
	
	<script>
		$(function() {
			//로그인 성공 시 메시지 출력
			if($("#joinMsg").val() != "" && $("#joinMsg").val() != null) {
				alert($("#joinMsg").val());
			}
			
			var pwValidation = false;
			$("#pwValidation").hide();
			
			//로그인 시 아이디나 비밀번호가 틀렸을 경우에
			//대비하여 폼 서브밋 대신 ajax로 처리
			$("#btnLogin").on("click", function() {
				$.ajax({
					url: "/user/login.do",
					type: "post",
					data: $("#loginForm").serialize(),
					success: function(obj) {
						console.log(obj);
						//id 체크
						if(obj == "idFail") {
							alert("존재하지 않는 아이디입니다.");
							$("#userId").focus();
							return;
						}
						
						//pw 체크
						if(obj =="pwFail") {
							alert("비밀번호가 틀렸습니다. 비밀번호를 확인해주세요.");
							$("#userPw").focus();
							return;
						}
						
						//로그인 처리
						location.href="/";
					},
					error: function(e) {
						console.log(e);
					}
				});
			});
			
		});
	
	</script>
</body>
</html>
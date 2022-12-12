<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 - SAGAJI</title>
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
    .btn1 {
        width:100px;
        min-height: 3rem;
        border: none;
        border-radius: 64px;
        background: #0058A3;;
        color: white;
        cursor: pointer;
    }
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <div class="form-wrapper">
        <form id="joinForm" action="/user/join.do" method="post">
            <input type="hidden" id="joinMsg" value="${joinMsg}">
    
            <!-- ========== 왼쪽사이드 ========== -->
            <div class="section1">
                <!-- 메인페이지 버튼, 로고  -->
                <div>
                    <a href="javascript:history.back();" class="back">←</a>
                    <a href="/" class="logo"><h1>SAGAJI</h1></a>
                </div>
    
                <!-- 타이틀: 회원가입 -->
                <div class="title">
                    <h1>회원가입</h1>
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
                            </div>&emsp;
    
                            <div>
                                <button type="button" class="btn1" id="btnIdCheck">
                                <span class="btn_inner">중복체크</span>
                                </button>
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
                    <p id="pwValidation" style="color: red; font-size: 0.8rem;">
                        비밀번호는 영문자, 숫자, 특수문자 조합의 9자리 이상으로 설정해주세요.
                    </p>
    
                    <!-- userPw12 -->
                    <div>
                        <div class="label_wrapper1"><label for="userPw2">비밀번호 재확인</label></div>
                        <div class="input  label_wrapper2">
                            <div class="input_wrapper">
                                <input type="password"  name="userPw2" id="userPw2" required placeholder="비밀번호를 한 번 더 입력하세요.">
                                <span class="input_border"></span>
                            </div>
                        </div>
                    </div>
                    <p id="pwCheckResult" style="font-size: 0.8rem;"></p>
    
                    <!-- userNm -->
                    <div>
                        <div class="label_wrapper1"><label for="userNm">이름</label></div>
                        <div class="input  label_wrapper2">
                            <div class="input_wrapper">
                                <input type="text"  name="userNm" id="userNm" required placeholder="이름을 입력하세요.">
                                <span class="input_border"></span>
                            </div>
                        </div>
                    </div>
    
                    <!-- userEmail -->
                    <div>
                        <div class="label_wrapper1"><label for="userEmail">이메일</label></div>
                        <div class="input  label_wrapper2">
                            <div class="input_wrapper">
                                <input type="email"  name="userEmail" id="userEmail" required placeholder="이메일을 입력하세요.">
                                <span class="input_border"></span>
                            </div>
                        </div>
                    </div>
    
                    <!-- userAddr1 -->
                    <div>
                        <div class="label_wrapper1"><label for="userAddr2">주소</label></div>
                        <div class="input  label_wrapper2">
                            <div class="input_wrapper">
                                <input type="text"  name="userAddr1" id="userAddr1"  required laceholder="도로명주소" style="background: #cfcfcf;" readonly>
                                <span class="input_border"></span>
                            </div>&emsp;
    
                            <div>
                                <button type="button" class="btn1" id="btnAddrCheck" onclick="daumPostcode()" value="우편번호 찾기">
                                <span class="btn_inner">주소찾기</span>
                                </button>
                            </div>
                        </div>
                    </div>
    
                    <!-- userAddr2 -->
                    <div>
                        <div class="label_wrapper1"></div>
                        <div class="input  label_wrapper2">
                            <div class="input_wrapper">
                                <input type="text"  name="userAddr2" id="userAddr2" required placeholder=" 상세주소를 입력하세요.">
                                <span class="input_border"></span>
                            </div>
                        </div>
                    </div>
    
                    <!-- userTel -->
                    <div>
                        <div class="label_wrapper1"><label for="userTel">휴대전화</label></div>
                        <div class="input  label_wrapper2">
                            <div class="input_wrapper">
                                <input type="text"  name="userTel" id="userTel" placeholder="숫자만 입력하세요.">
                                <span class="input_border"></span>
                            </div>
                        </div>
                    </div>
    
                    <!-- join button -->
                    <div>
                        <button type="submit" class="btn2" id="btnJoin">
                        <span class="btn_inner">회원가입</span>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    <script>
        $(function() {
			//회원가입 성공 시 메시지 출력
            if($("#joinMsg").val() != "" && $("#joinMsg").val() != null) {
				alert($("#joinMsg").val());
			}
			

			var checkId = false;
			var pwValidation = false;
			var pwCheck = false;
			
			$("#pwValidation").hide();
			$("#pwCheckResult").hide();

            /* ========== userId ========== */
            //id 유효성검사
			
			//id 중복체크
			$("#btnIdCheck").on("click", function() {				
				$.ajax({
					url: "/user/idCheck.do",
					type: "post",
					data: $("#joinForm").serialize(),
					success: function(obj) {
						console.log(obj);
						
						if(obj == 'duplicatedId') {
							alert("중복된 아이디입니다.");
							$("#userId").focus();
						} else {
							if(confirm("사용가능한 아이디입니다. " + $("#userId").val() + 
									"를(을) 사용하시겠습니까?")) {
								checkId = true;
								$("#btnIdCheck").attr("disabled", true);
							}
						}
					},
					error: function(e) {
						console.log(e);
					}
				})
			});
			
			// 중복체크 후 id를 변경했을 때
			$("#userId").on("change", function() {
				checkId = false;
				$("#btnIdCheck").attr("disabled", false);
			});
			
            /* ========== userPw1 ========== */
			//비밀번호 유효성 검사
			function validatePassword(character) {
				return /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{9,}$/.test(character);
			}
			
			//비밀번호 입력될때마다 유효성 검사
			$("#userPw").on("change", function() {
				//비밀번호 유효성 처리
				if(!validatePassword($("#userPw").val())) {
					pwValidation = false;
					$("#pwValidation").show();
					$("#userPw").focus();
				} else {
					pwValidation = true;
					$("#pwValidation").hide();
				}
				
                 /* ========== userPw2 ========== */
				//비밀번호 확인까지 입력한 후 다시 비밀번호 재설정
				if($("#userPw").val() == $("#userPw2").val()) {
					pwCheck = true;
					$("#pwCheckResult").css("color", "green");
					$("#pwCheckResult").text("비밀번호가 일치합니다.");
				} else {
					pwCheck = false;
					$("#pwCheckResult").css("color", "red");
					$("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
				}
			});
			

            /* ========== userPw2 ========== */
			//비밀번호 확인란 입력할 때 일치여부 체크
			$("#userPw2").on("change", function() {
				$("#pwCheckResult").show();
				
				if($("#userPw").val() == $("#userPw2").val()) {
					pwCheck = true;
					$("#pwCheckResult").css("color", "green");
					$("#pwCheckResult").text("비밀번호가 일치합니다.");
				} else {
					pwCheck = false;
					$("#pwCheckResult").css("color", "red");
					$("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
				}
			});

            
            /* ========== join_submit ========== */
            //회원가입 진행
			$("#joinForm").on("submit", function(e) {
				//아이디 중복체크가 안됐거나 중복된 아이디를 사용했을 때
				if(!checkId) {
					alert("아이디 중복체크를 진행하세요.");
					$("#userId").focus();
					e.preventDefault();
					return;
				}
				
				//비밀번호 유효성 검사가 틀렸을 때
				if(!pwValidation) {
					alert("비밀번호는 영문자, 숫자, 특수문자 조합의 9자리 이상으로 설정하세요.");
					$("#userPw").focus();
					e.preventDefault();
					return;
				}
				
				//비밀번호와 비밀번호 확인이 일치하지 않을 때
				if(!pwCheck) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#userPw2").focus();
					e.preventDefault();
					return;
				}
			});
            // 회원가입 성공 후 alert창 
/* 			$("#joinForm").on("submit", function(){
				if(!checkId || !pwValidation || !pwCheck) {
			
				} else {
					alert("회원가입에 성공했습니다. 로그인해주세요.");
					}
			}); */
		});	

        /* ========== userAddr1 API 연동 ========== */
        function daumPostcode() {
	       	new daum.Postcode({
	                   oncomplete: function(data) {
	                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                       // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                       var roadAddr = data.roadAddress; // 도로명 주소 변수
	                       var extraRoadAddr = ''; // 참고 항목 변수
	
	                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                           extraRoadAddr += data.bname;
	                       }
	                       // 건물명이 있고, 공동주택일 경우 추가한다.
	                       if(data.buildingName !== '' && data.apartment === 'Y'){
	                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                       }
	                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                       if(extraRoadAddr !== ''){
	                           extraRoadAddr = ' (' + extraRoadAddr + ')';
	                       }
	
	                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                       document.getElementById("userAddr1").value = roadAddr;
	                   }
	               }).open();
          }
    </script>
</body>
</html>
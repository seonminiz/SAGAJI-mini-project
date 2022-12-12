<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 - SAGAJI</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap')
	;

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
/* 오른쪽사이드 */
.section2 {
	display: flex;
	min-height: 100vh;
	padding: 0 80px;
	background-color: white;
	scroll-behavior: smooth;
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
	width: 100px;
	min-height: 3rem;
	border: none;
	border-radius: 64px;
	background: #0058A3;
	color: white;
	cursor: pointer;
}

.btn_inner {
	border-radius: 64px;
	justify-content: center;
}
table {
      width: 100%;
      border: 1px solid #444444;
      border-collapse: collapse;
      text-align: center;
    }
    td {
      height: 40px;
      border: 1px solid #444444;
      border-collapse: collapse;
      text-align: center;} 
    th {
      border: 1px solid #444444;
      padding: 10px;
    }
/* 테이블 */
table {
  width: 100%;
  border: 1px solid #444444;
  border-collapse: collapse;
  text-align: center;
}
td {
  height: 40px;
  border: 1px solid #444444;
  border-collapse: collapse;
  text-align: center;} 
th {
  border: 1px solid #444444;
  padding: 10px;
}
</style>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<!-- header 페이지 -->
	<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

	<!-- my_info 페이지 -->
	<div class="form-wrapper">
		<!-- ★action 수정하기 -->
		<form id="userInfoForm" name="userInfoForm" method="post">

			<input type="hidden" id="insertMsg" value="${insertMsg }">

			<!-- ========== 오른쪽사이드 ========== -->
			<div class="section2">
				<div class="content">
					<h1 style="margin-bottom: 100px; font-size: 3em;">회원정보 수정</h1>
					<!-- userId -->
					<div>
						<div class="label_wrapper1">
							<label for="userId">아이디</label>
						</div>
						<div class="input  label_wrapper2">
							<div class="input_wrapper">
								<input type="text" name="userId" id="userId"
									value="${userInfo.userId}" style="background: #cfcfcf;"
									readonly> <span class="input_border"></span>
							</div>
						</div>
					</div>

					<!-- userPw -->
					<div>
						<div class="label_wrapper1">
							<label for="userPw">비밀번호</label>
						</div>
						<div class="input  label_wrapper2">
							<div class="input_wrapper">
								<input type="password" name="userPw" id="userPw" value="${userInfo.userPw}"
									required placeholder="비밀번호를 입력하세요."> <span
									class="input_border"></span>
							</div>
						</div>
					</div>
					<p id="pwValidation" style="color: red; font-size: 0.8rem;">
						비밀번호는 영문자, 숫자, 특수문자 조합의 9자리 이상으로 설정해주세요.</p>

					<!-- userPw2 -->
					<div>
						<div class="label_wrapper1">
							<label for="userPw2">비밀번호 재확인</label>
						</div>
						<div class="input  label_wrapper2">
							<div class="input_wrapper">
								<input type="password" name="userPw2" id="userPw2" value="${userInfo.userPw}"
									required placeholder="비밀번호를 한 번 더 입력하세요."> <span
									class="input_border"></span>
							</div>
						</div>
					</div>
					<p id="pwCheckResult" style="font-size: 0.8rem;"></p>

					<!-- userNm -->
					<div>
						<div class="label_wrapper1">
							<label for="userNm">이름</label>
						</div>
						<div class="input  label_wrapper2">
							<div class="input_wrapper">
								<input type="text" name="userNm" id="userNm"
									value="${userInfo.userNm}" required placeholder="이름을 입력하세요.">
								<span class="input_border"></span>
							</div>
						</div>
					</div>

					<!-- userEmail -->
					<div>
						<div class="label_wrapper1">
							<label for="userEmail">이메일</label>
						</div>
						<div class="input  label_wrapper2">
							<div class="input_wrapper">
								<input type="email" name="userEmail" id="userEmail"
									value="${userInfo.userEmail}" required
									placeholder="이메일을 입력하세요."> <span class="input_border"></span>
							</div>
						</div>
					</div>

					<!-- userAddr1 -->
					<div>
						<div class="label_wrapper1">
							<label for="userAddr2">주소</label>
						</div>
						<div class="input  label_wrapper2">
							<div class="input_wrapper">
								<input type="text" name="userAddr1" id="userAddr1"
									value="${userInfo.userAddr1}" required placeholder="도로명주소"
									style="background: #cfcfcf;" readonly> <span
									class="input_border"></span>
							</div>
							&emsp;

							<div>
								<button type="button" class="btn1" id="btnAddrCheck"
									onclick="daumPostcode()" value="우편번호 찾기">
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
								<input type="text" name="userAddr2" id="userAddr2"
									value="${userInfo.userAddr2}" required
									placeholder=" 상세주소를 입력하세요."> <span class="input_border"></span>
							</div>
						</div>
					</div>

					<!-- userTel -->
					<div>
						<div class="label_wrapper1">
							<label for="userTel">휴대전화</label>
						</div>
						<div class="input  label_wrapper2">
							<div class="input_wrapper">
								<input type="text" name="userTel" id="userTel"
									value="${userInfo.userTel}" placeholder="숫자만 입력하세요.">
								<span class="input_border"></span>
							</div>
						</div>
					</div>
					<!-- userRgstDate : 가입일자 -->
					<div>
						<div class="label_wrapper1">
							<label for="userRgstDate">가입일자</label>
						</div>
						<div class="input  label_wrapper2">
							<div class="input_wrapper">
								<input type="text" name="userRgstDate" id="userRgstDate"
									value="${userInfo.userRgstDate}" style="background: #cfcfcf;"
									readonly> <span class="input_border"></span>
							</div>
						</div>
					</div>
					
					<!-- ========== 관리자 로인후 노출되는 페이지 -->
					<!-- userUseYn : Y 또는 N -->
					<!-- userType : USER 또는 ADMIN -->
					<div>
						<div class="label_wrapper1">
							<label for="userRgstDate" >내정보는 관리자 권한으로 데이터를 수정할 수 있습니다.</label>
						</div>
					</div>
					<table>
					    <tr>
					      <th>사용권한</th>
					      <th>사용여부</th>
					    </tr>
					    <tr>
					      <td>
					        <input type="radio" name="userType" id="USER" value="USER"><label for="USER">사용자</label>
					        <input type="radio" name="userType" id="ADMIN" value="ADMIN"><label for="ADMIN">관리자</label>
					      </td>
					      <td>
					        <input type="radio" name="userUseYn" id="Y" value="Y"><label for="Y">사용중</label>
					        <input type="radio" name="userUseYn" id="N" value="N"><label for="N">미사용중</label>
					      </td>
					    </tr>
					  </table>
					<div style="float: right; margin-top: 32px;">
						<!-- update button -->
						<button type="submit" class="btn1" id="btnUpdateUser"
							value="updateUser">
							<span class="btn_inner">회원정보 수정</span>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- footer 페이지 -->
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

	<script>
		$(function() {
			var pwValidation = false;
			var pwCheck = false;

			$("#pwValidation").hide();
			$("#pwCheckResult").hide();

			/* ========== userPw ========== */
			//비밀번호 유효성 검사
			function validatePassword(character) {
				return /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{9,}$/
						.test(character);
			}
			//비밀번호 입력될때마다 유효성 검사
			$("#userPw").on("change", function() {
				//비밀번호 유효성 처리
				if (!validatePassword($("#userPw").val())) {
					pwValidation = false;
					$("#pwValidation").show();
					$("#userPw").focus();
				} else {
					pwValidation = true;
					$("#pwValidation").hide();
				}
				/* ========== userPw2 ========== */
				//비밀번호 확인까지 입력한 후 다시 비밀번호 재설정
				if ($("#userPw").val() == $("#userPw2").val()) {
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

				if ($("#userPw").val() == $("#userPw2").val()) {
					pwCheck = true;
					$("#pwCheckResult").css("color", "green");
					$("#pwCheckResult").text("비밀번호가 일치합니다.");
				} else {
					pwCheck = false;
					$("#pwCheckResult").css("color", "red");
					$("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
				}
			});
			/* ========== updateUser_submit ========== */
			// 내정보수정 진행
			$("#btnUpdateUser").click("submit", function(e) {
				//비밀번호 유효성 검사가 틀렸을 때
				if (!pwValidation) {
					alert("비밀번호는 영문자, 숫자, 특수문자 조합의 9자리 이상으로 설정하세요.");
					$("#userPw").focus();
					e.preventDefault();
					return;
				}

				//비밀번호와 비밀번호 확인이 일치하지 않을 때
				if (!pwCheck) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#userPw2").focus();
					e.preventDefault();
					return;
				}
				
				document.userInfoForm.action = " ${path}/admin/updateUserInfo.do";
				document.userInfoForm.submit();
				if (pwValidation && pwCheck) {
					alert("내정보를 수정하였습니다. 다시 로그인해주시길 바랍니다.");
				}
				
				
			});
		});

		/* ========== userAddr1 API 연동 ========== */
		function daumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
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
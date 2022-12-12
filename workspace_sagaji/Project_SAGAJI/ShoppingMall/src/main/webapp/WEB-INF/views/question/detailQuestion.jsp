<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 사항 상세</title>
<script src="/JS/jquery-3.6.1.min.js"></script>
<!-- jstl이나 fmt를 쓴다면 작성해야 하는 부분 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');

#container {
	font-family: 'Noto Sans KR', sans-serif;
	width: 1500px;
	margin: 100px 200px 200px 400px;
}

#b {
	width: 1100px;
	
	position: relative;
}

#regdate {
	float: right;
	margin-right: 20px;
}

#questionRgstDate, #questionModfDate, #userId, #id  {
	height: 25px;
}

#questionTitle, #questionContent, #questionAnswer {
	width: 90%;
	border-width: 2px;
}

#file {
	width: 70%;
	border-width: 2px;
}

#questionTitle, #questionContent, #file {
	border-width: 2px;
	height: 25px;
}

#questionContent {
	height: 400px;
}

#questionAnswer {
	height: 200px;
}

#btn {
	display: flex;
	float: right;
}

#modifybtn {
	background-color: #0058A3;
	color: white;
	border-radius: 5px;
	border-style: none;
	font-size: 16px;
	height: 30px;
	float: right;
	margin-right: 20px;
}

#deletebtn, #listbtn {
	background-color: lightgray;
	border-radius: 5px;
	border-style: none;
	font-size: 16px;
	height: 30px;
	float: right;
	margin-right: 20px;
}

#wrapper {
	position: absolute;
	top: -50px;
	left: 800px;
}

#file_warrap {
	display: flex;
	align-items: center;
	width: 100%;
	margin-bottom: 40px;;
}

#file_warrap p {
	width: 80px;
	margin-right: 10px;
	font-weight: bold;
}
</style>
</head>


<body>


	

		<!-- 세혁님 디자인 페이지 -->
		<!-- header 부분 -->
		<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>


		<div id="container">
		<!--각자 디자인한 UI-->
		<h1>
			<b>&emsp; 문의사항 상세</b>
		</h1>

		<br> <br>

		<div id="b">
			<form id="updateForm" action="/question/updateQuestion.do" method="post">
				<div id="wrapper">
					<input type="hidden" name="questionNo" id="questionNo" value="${question.questionNo}">
					<b id="regdate">등록 일자&emsp;<input type="text" name="questionRgstDate" id="questionRgstDate" value="${question.questionRgstDate}" readonly></b><br>
					<br> <b id="modifydate">수정 일자&emsp;<input type="text" name="questionModfDate" id="questionModfDate" value="${question.questionModfDate}" readonly></b>
				</div>
				<b id="id">아이디&emsp;&emsp;&emsp;<input type="text" name="userId" id="userId" value="${question.userId}" readonly></b> 
				<br> 
				<br> 
				<b>제목</b>&emsp;&emsp;&emsp;&ensp;
				
				<input type="text" name="questionTitle" id="questionTitle" value="${question.questionTitle}">
				<br>
				 <br>
				  <b>내용</b>
				&emsp;&emsp;&emsp;&nbsp;
				<input type="text" name="questionContent" id="questionContent" value="${question.questionContent}">
				<br> <br>
				 
				<b>답변내용</b>&ensp;&emsp;
				<input type="text" name="questionAnswer" id="questionAnswer" value="${question.questionAnswer}" readonly>
					 <br><br>
					 
				<!-- 관리자가 아니면 작성불가-->
	
				<br><br>
				<div id="file_warrap">
					<p>첨부파일</p><input type="text" id="file"> <input type="file"
						id="btnAtt" name="uploadFiles" multiple="multiple">
				</div>

				<div id="btn">
					<button id="modifybtn" type="submit">수정하기</button> 
					<a href="/question/deleteQuestion.do?questionNo=${question.questionNo}&userId=${question.userId}"><button id="deletebtn" type="button">삭제하기</button></a> 
					<a href="/question/getQuestionList.do"><button id="listbtn" type="button">목록</button></a>
				</div>
			</form>
		</div>
	</div>



	<!-- 세혁님 디자인 페이지 -->
	<!-- footer 부분 -->
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

	<!-- 담당 스크립트 작성 부분 -->
	<script>
	

	$(function() {
		//세션, 리퀘스트 스코프에 담겨진 데이터를 빼오는 방식
		const loginUserId = '${loginUser.userId}';
		
		//게시글 작성자와 로그인 유저가 다르면 게시글 수정 못하게 설정
		if(loginUserId == 'admin') {
			
			$("#questionAnswer").attr("readonly", false);
		
		}		
	});
	</script>







</body>
</html>
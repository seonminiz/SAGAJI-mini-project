<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questions_list</title>

<script src="/JS/jquery-3.6.1.min.js"></script>
<!-- jstl이나 fmt를 쓴다면 작성해야 하는 부분 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap')	;

#container {
	font-family: 'Noto Sans KR', sans-serif;
	width: 1500px;
	margin: 0 auto;
}

#b {
	
	box-sizing: inherit;
	/* width: 1000px; */
	margin-left: 10px;
	padding: 0 200px;
}

.btnQna {
	width:80px; 
	height: 30px; 
	background-color: #0058A3; 
	text-align: center; 
	border-radius: 10px; 
	line-height: 28px; 	
	float: right;
}

table {
	border: 1px solid;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
	margin-bottom: 200px;
}

td {
	border: 1px solid;
	border-collapse: collapse;
}

tr {
	height: 35px;
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
			<b>&emsp; 문의사항 목록</b>
		</h1>
		<br><br>
		

		<div id="b">


			<input type="radio" name="select" id="all" > 전체글 보기 <input type="radio" name="select" id="my" > 내가 쓴 문의 사항 보기 
			<div class="btnQna"><a style="color:white; text-decoration: none;" href="/question/insertQuestion.do">문의 등록</a></div>


			<br> <br>

	
			<table>
				<tr style="background-color: lightgray;">
					<td width="5%">NO.</td>
					<td width="65%">제목</td>
					<td width="10%">작성일자</td>
					<td width="10%">작성자</td>
					<td width="10%">답변상태</td>
				</tr>

				<c:forEach items="${QuestionList}" var="question"> 
				<tr>
					<td> ${question.questionNo}</td>
					<c:choose>
						<c:when test="${question.questionSecretYn == 'Y' }">
							<c:if test="${loginUser.userId == question.userId }">
								<td><a href="/question/getQuestion.do?questionNo=${question.questionNo}" > ${question.questionTitle}</a></td>
							</c:if>
							<c:if test="${loginUser.userId != question.userId }">
								<td><img src="${pageContext.request.contextPath }/images/lock.jpg" alt="사진자리"> 비밀글입니다.</td>
							</c:if>
						</c:when>
						<c:otherwise>
							<td><a href="/question/getQuestion.do?questionNo=${question.questionNo}" > ${question.questionTitle}</a></td>
						</c:otherwise>
					</c:choose>
					<td> ${question.questionRgstDate}</td>
					<td> ${question.userId}</td>
					<c:choose>
						<c:when test="${question.questionAnswer eq null }">
							<td> ${question.questionState}</td>
						</c:when>
						<c:otherwise>
							<td> 답변완료</td>
						</c:otherwise>	
					</c:choose>
				</tr>
				</c:forEach>

				
			</table>

		</div>
	</div>






	<!-- 세혁님 디자인 페이지 -->
		<!-- footer 부분 -->
		<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>




		<script>
			/* $(function() {
					/* $(".pagination a").on("click", function(e) {
						e.preventDefault();
						
						$("input[name='pageNum']").val($(this).attr("href"));
						$("#searchForm").submit();
					});
					
					$("#btnSearch").on("click", function() {
						$("input[name='pageNum']").val(1);
						
						$("#searchForm").submit();
					}); */
					
					let sendData = {"questionNo" : "${questionNo}" }
					$("#my").on("click", function(e) {
						alert("my 버튼 눌림");
						$.ajax({
							url:"/question/getQuestionList.do",
							type: "post",
							data: sendData,
							success: function(obj) {
								
							},
							error(function(e) {
								console.log(e);
							})
						})
					})
				}); */
							
				</script>



</body>
</html>
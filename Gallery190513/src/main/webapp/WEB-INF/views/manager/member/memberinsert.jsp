<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html;charset=utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 추가</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 
<style type="text/css">
body {
font-size:18px;
font-family: 'Nanum Gothic', sans-serif;
	line-height: 30px;
}

.main {
	position: relative;
	top: 60px;
}

.tail {
	position: relative;
top:100px;
}
.main{
 	padding: 40px 0;
}
.main input,
.main input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}
input{
height: 25px;
width: 250px;

}
select{
height: 25px;
}
.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 400px;
    padding: 10px 40px;
	background: rgb(228, 194, 194);
	    color: black;
    text-shadow: none;
	-webkit-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
	-moz-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
	box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
	
}
span.input-group-addon i {
    color: #009edf;
    font-size: 17px;
}

</style>
</head>
<body>
<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
	</div>

	<div class="main">

<h1 align="center">회원추가</h1>
		<div class="container">
			<div class="main">
				<div class="main-center">
					
					<form action="managerinsertMember.do" method="post" autocomplete="off">
					<input type="hidden" value="회원번호" />
						<div class="form-group">
							<label for="email">아이디</label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> 
									<input type="email" name="m_id" pattern="[a-zA-Z0-9]+[@]naver.com"
				placeholder="네이버이메일을 입력하세요" autocomplete="off" required="required"
				style="width: 250px" /><br>
							</div>
						</div>

						<div class="form-group">
							<label for="name">이름</label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> 
									<input type="text" name="m_name" placeholder="이름을 입력하세요" required
				autocomplete="off" /><br>
							</div>
						</div>

						<div class="form-group">
							<label for="address">주소</label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> 
									<input type="text" name="m_address" placeholder="주소를 입력하세요" required
				autocomplete="off" /><br>
							</div>
						</div>

						<div class="form-group">
							<label for="tel">전화번호</label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> 
									<input type="tel" name="m_tel" placeholder="전화번호를 입력하세요" required
				autocomplete="off" /><br>
							</div>
						</div>

						<div class="form-group">
							<label for="grade">등급</label>
								<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<select name="m_grade">
				<option value="1">회원</option>
				<option value="0">관리자</option>
				<option value="2">작가</option>
				<option value="3">갤러리주</option>
				<option value="4">작가 승인대기</option>
				<option value="5">갤러리주 승인대기</option>
				<option value="6">작가, 갤러리주</option>
				<option value="7">작가(대기),갤러리주</option>
				<option value="8">작가,갤러리주(대기)</option>
				<option value="9">작가(대기),갤러리주(대기)</option>
			</select> <br>
						</div></div>
						<br>
		
						<button type="submit">회원추가</button>

					</form>
				</div>
				<!--main-center"-->
			</div>
			<!--main-->
		</div>
		<!--container-->


<!-- 		<h1>회원추가</h1> -->
<!-- 		<form action="managerinsertMember.do" method="post" autocomplete="off"> -->
<!-- 			<input type="hidden" value="회원번호" /> -->
<!-- 			<labal for="id">아이디</labal> -->
<!-- 			<input type="email" name="m_id" pattern="[a-zA-Z0-9]+[@]naver.com" -->
<!-- 				placeholder="네이버이메일을 입력하세요" autocomplete="off" required="required" -->
<!-- 				style="width: 250px" /><br> -->
<!-- 			<labal for="name">이름</labal> -->
<!-- 			<input type="text" name="m_name" placeholder="이름을 입력하세요" required -->
<!-- 				autocomplete="off" /><br> -->
<!-- 			<labal for="address">주소</labal> -->
<!-- 			<input type="text" name="m_address" placeholder="주소를 입력하세요" required -->
<!-- 				autocomplete="off" /><br> -->
<!-- 			<labal for="tel">전화번호</labal> -->
<!-- 			<input type="tel" name="m_tel" placeholder="전화번호를 입력하세요" required -->
<!-- 				autocomplete="off" /><br> -->
<!-- 			<labal for="grade">등급</labal> -->
<!-- 			<select name="m_grade"> -->
<!-- 				<option value="1">회원</option> -->
<!-- 				<option value="0">관리자</option> -->
<!-- 				<option value="2">작가</option> -->
<!-- 				<option value="3">갤러리주</option> -->
<!-- 				<option value="4">작가 승인대기</option> -->
<!-- 				<option value="5">갤러리주 승인대기</option> -->
<!-- 				<option value="6">작가, 갤러리주</option> -->
<!-- 				<option value="7">작가(대기),갤러리주</option> -->
<!-- 				<option value="8">작가,갤러리주(대기)</option> -->
<!-- 				<option value="9">작가(대기),갤러리주(대기)</option> -->
<!-- 			</select> <br> -->


<!-- 			<!-- <input type="text" name="m_grade" value="1" required/> --> 


<!-- 			<input type="submit" value="회원추가" /> -->
<!-- 		</form> -->
	</div>
	<div class="tail" >
		<jsp:include page="/WEB-INF/views/tail.jsp" />
	</div>


</body>
</html>
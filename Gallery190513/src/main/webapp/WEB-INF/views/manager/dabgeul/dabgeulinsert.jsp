<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답글추가하기</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style>
.maincontainer {
font-size:18px;
font-family: 'Nanum Gothic', sans-serif;
	position: relative;
/* 	top: 50px; */
	border: 2px solid red;
	/*         text-align:center; */
	height: 300px;
	width: 400px;
}

h1 {
	margin: auto;
}

.row {
	height: 90px;
	width: 396px;
	background-color: rgb(228, 194, 194);
}

.main {
	position: relative;
	top: 60px;
}

.tail {
	position: relative;
	top: 100px;
}
</style>

</head>
<body>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main" align="center">
<div class="maincontainer" align="center">
		<div class="row">
			<h1>
				<i class="fa fa-lock" aria-hidden="true"></i> 답글추가하기
			</h1>

		</div>
		<br />
		<br />
	<form action="managerinsertDabgeul.do" method="post" autocomplete="off">
	
	전시번호:<input type="text" name="e_no" autocomplete="off"/><br>
	답글내용:<input type="text" name="d_content" autocomplete="off"/><br>
	작성회원번호:<input type="text" name="m_no" autocomplete="off"/><br>
	작성회원이름:<input type="text" name="m_name" autocomplete="off"/><br>
	
	<input type="submit" value="답글추가"/>
	
	</form>
</div>
</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 추가하기</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style>
.maincontainer {
font-size:18px;
font-family: 'Nanum Gothic', sans-serif;
border:2px solid red;
  width:400px;
}

    h1{
        margin:auto;
    }
 .row{
        height:90px;
        width:400px;
        background-color:rgb(228, 194, 194);
    }

.main{
position:relative;
top:60px;
}
.tail{
position:relative;
top:100px;
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
				<i class="fa fa-lock" aria-hidden="true"></i> 메시지 작성
			</h1>

		</div>
		<br />
		<br />
	
	<form action="managerinsertRequest.do" method="post" autocomplete="off">
<!-- 		요청번호:<input type="text" name="r_no" autocomplete="off" /><br> -->
		보낸회원번호:<input type="text" name="r_send" autocomplete="off"/><br><br>
		보낸회원이름:<input type="text" name="r_sendname" autocomplete="off"/><br><br>
		받는회원번호:<input type="text" name="r_receive" autocomplete="off" /><br><br>
		받는회원이름:<input type="text" name="r_receivename" autocomplete="off"/><br><br>
		요청글제목:<input type="text" name="r_title" autocomplete="off"/><br><br>
		글내용:<input type="text" name="r_content" autocomplete="off"/><br><br>
		
		수락여부:<input type="text" name="r_agree" value="3" readonly="readonly"/><br><br>
	
	<input type="submit" value="작성완료"/><br>
	
	
	</form>
	<br>
	</div>
	</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
</body>
</html>
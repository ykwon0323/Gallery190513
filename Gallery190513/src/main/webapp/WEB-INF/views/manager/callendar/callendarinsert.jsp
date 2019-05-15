<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정추가</title>
<style>
.container {
border:2px solid red;
width:600px;

}
 h1{
        margin:auto;
    }
    .row{
        height:100px;
        width:600px;
        background-color:rgb(228, 194, 194);
    }
.main{
position:relative;
top:50px;
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
<div class="container" align="center">
<div class="row">
			<h1>
				<i class="fa fa-lock" aria-hidden="true"></i> 일정추가하기
			</h1>

		</div>
		<br />
		<br />

	<form action="managerinsertCallendar.do" method="post" autocomplete="off">
	<input type="hidden" name="c_no" value="0"/>
	전시제목:<input type="text" name="c_title" placeholder="전시제목입력" required="required" autocomplete="off"/><br><br>
	전시내용:<input type="text" name="c_content" placeholder="전시내용을 입력" required="required" autocomplete="off"/><br><br>
	시작일:<input type="text" name="c_start" placeholder="날짜 입력" required="required" autocomplete="off"/><br><br>
<!-- 	<select onchange="document.getElementByName('c_start').value=this.opthons[this.selectedIndex].value" > -->
<!-- 			<option>년도</option> -->
<!-- 			<option>2019</option> -->
<!-- 			<option>2018</option> -->
<!-- 		</select> -->
<!-- 		<select onchange="document.getElementByName('c_start').value=this.opthons[this.selectedIndex].value"> -->
<!-- 			<option>월</option> -->
<!-- 			<option>1</option> -->
<!-- 			<option>2</option> -->
<!-- 		</select> -->
<!-- 		<select onchange="document.getElementByName('c_start').value=this.opthons[this.selectedIndex].value"> -->
<!-- 			<option>일</option> -->
<!-- 			<option>1</option> -->
<!-- 			<option>2</option> -->
<!-- 		</select><br> -->
	종료일:<input type="text" name="c_end" placeholder="날짜 입력" required="required" autocomplete="off" /><br><br>
<!-- 		<select onchange="document.getElementByName('c_end').value=this.opthons[this.selectedIndex].value"> -->
<!-- 			<option>년도</option> -->
<!-- 			<option>2019</option> -->
<!-- 			<option>2018</option> -->
<!-- 		</select> -->
<!-- 		<select onchange="document.getElementByName('c_start').value=this.opthons[this.selectedIndex].value"> -->
<!-- 			<option>월</option> -->
<!-- 			<option>1</option> -->
<!-- 			<option>2</option> -->
<!-- 		</select> -->
<!-- 		<select onchange="document.getElementByName('c_start').value=this.opthons[this.selectedIndex].value"> -->
<!-- 			<option>일</option> -->
<!-- 			<option>1</option> -->
<!-- 			<option>2</option> -->
<!-- 		</select><br> -->
		
	갤러리번호:<input type="text" name="g_no" placeholder="갤러리번호" required="required" autocomplete="off"/><br><br>
	
	<input type="submit" value="일정추가"/><br>
	</form>
	<br>
	</div>
	</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
</body>
</html>
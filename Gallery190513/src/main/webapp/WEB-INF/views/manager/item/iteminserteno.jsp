<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 
<style>
.maincontainer {
font-size:18px;
font-family: 'Nanum Gothic', sans-serif;
background-color:rgb(228, 194, 194);
border:2px solid red;
width:500px;
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
<%
ItemDto itemDto=(ItemDto)request.getAttribute("itemDto");
%>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main" align="center">
	<div class="maincontainer" align="center">
	<h1>작품추가</h1>
	<form action="managerinsertItem1.do" method="post" autocomplete="off">
	
	전시번호:<input type="text" name="e_no" placeholder="전시번호를 입력하세요"
				autocomplete="off" value="<%=itemDto.getE_no()%>" required/><br><br>
	작품이름:<input type="text" name="i_name" placeholder="작품이름을 입력하세요" required  autocomplete="off"/><br><br>
	작품설명:<textarea name="i_explain" placeholder="작품설명을 입력하세요" 
			autocomplete="off" required rows="10" cols="60"></textarea><br><br>
	작품이미지:<input type="file" placeholder="작품이미지를 등록하세요" id="input_img" required 
	id="input_img" onchange="LoadImg()" name="i_img"/><br><br>	
	가격:<input type="text" placeholder="작품의 가격을 입력하세요" required name="i_price" autocomplete="off"/><br><br>
	작가번호:<input type="text" placeholder="작가 번호를 입력하세요" name="a_no" required autocomplete="off"/><br><br>
	<input type="hidden" name="m_no" value="0"/><br>
	
	<input type="submit" value="작품추가"/>
	<br><br>
	</form>
	</div>
	</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>

	<script type="text/javascript">
	function LoadImg(){
		var files=document.getElementById('input_img').files[0];
		var reader= new FileReader();
		reader.onload=(function(theFile){
			return function(e)
			{
				var img_view=['<img src="',e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
				document.getElementById('list').innerHTML=img_view;
			};
		})(files);
		reader.readAsDataURL(files);
		
	}
	</script>
	
</body>
</html>
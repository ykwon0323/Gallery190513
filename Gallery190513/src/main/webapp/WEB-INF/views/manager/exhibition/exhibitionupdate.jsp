<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시정보수정</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 
<style>
.maincontainer {
font-size:18px;
font-family: 'Nanum Gothic', sans-serif;
 width:600px;
}
table{
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
<%
ExhibitionDto exhibitionDto=(ExhibitionDto)request.getAttribute("exhibitionDto");
%>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main" align="center">
	<div class="maincontainer" align="center">
	<h1>전시정보수정</h1>
	<form action="managerupdateExhibition.do" method="post" enctype="Multipart/form-data">
	<table border="1">
	<tr>
		<th>전시번호</th>
		<td><input type="text" name="e_no" value="<%=exhibitionDto.getE_no()%>" readonly="readonly"/></td>
	</tr>
		
	<tr>
		<th>전시제목</th>
		<td><input type="text" name="e_title" value="<%=exhibitionDto.getE_title()%>"/></td>
	</tr>
	<tr>
		<th>전시설명</th>
		<td>
		<textarea rows="10" cols="60" name="e_explain"><%=exhibitionDto.getE_explain()%></textarea>
		
		</td>
	</tr>
	<tr>
		<th>작가번호</th>
		<td><input type="text" name="a_no" value="<%=exhibitionDto.getA_no()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>작가이름</th>
		<td><input type="text" name="a_name" value="<%=exhibitionDto.getA_name()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>전시사진</th>
		<td>
		<input type="file" name="e_img"/>
			<a href="exhibitionupload/<%=exhibitionDto.getE_img()%>"><c:out value="${exhibitionDto.e_img}"/></a>
		</td>
		
	</tr>
	</table>
	<br>
	<input type="submit" value="수정완료"/>
	</form>
	<br>
	</div>
</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
</body>
</html>
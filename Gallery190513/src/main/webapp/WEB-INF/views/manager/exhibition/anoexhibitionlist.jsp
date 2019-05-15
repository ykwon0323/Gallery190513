<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가의 전시 리스트</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 
<style>
table{
font-size:18px;
font-family: 'Nanum Gothic', sans-serif;
border: solid 1px #DDEEEE;
border-collapse: collapse;
border-spacing: 0;
font: normal 15px;
}
h1{
font-family: 'Nanum Gothic', sans-serif;
}
th{
background-color:rgb(241, 187, 180);;
border: solid 1px #DDEEEE;
 color: #336B6B;
font-size:20px;
}
td{
 background-color:  white;
border-left: none;
border-right:none;
text-align: center;
}
.main{
position:relative;
top:50px;
}
.tail{
position:relative;
top:150px;
}
</style>

</head>
<body>
<%
	List<ExhibitionDto>list=(List<ExhibitionDto>)request.getAttribute("list");
%>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main" align="center">


	<h1>작가 전시리스트</h1>
	<table border="1">
	<col width="60px;">
		<col width="150px;">
		<col width="60px;">
		<col width="200px;">
		<col width="400px;">
		<col width="80px;">
		<col width="60px;">
	
	<tr>
	<th>작가번호</th>
		<th>작가이름</th>
		<th>전시번호</th>
		<th>전시제목</th>
		<th>전시설명</th>
		
		<th>전시사진</th>
		<th>조회수</th>
		<th>삭제</th>
	</tr>
	
	<%
	for(int i=0; i<list.size(); i++){
		ExhibitionDto exhibitionDto=list.get(i);
	%>
	
	<tr>
		<td><%=exhibitionDto.getA_no()%></td>
		<td><%=exhibitionDto.getA_name()%></td>
		<td><%=exhibitionDto.getE_no()%></td>
		<td><a href="managerselectExhibition.do?e_no=<%=exhibitionDto.getE_no()%>"><%=exhibitionDto.getE_title()%></a></td>
		<td><%=exhibitionDto.getE_explain()%></td>
		
		
		<td><a href="exhibitionupload/<%=exhibitionDto.getE_img()%>"><%=exhibitionDto.getE_img()%></a></td>
		<td><%=exhibitionDto.getE_click()%></td>
		<td><a href="managerdeleteExhibition.do?e_no=<%=exhibitionDto.getE_no()%>">[삭제]</a></td>
	</tr>
	
	<%} %>
	
	</table>
	</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
</body>
</html>
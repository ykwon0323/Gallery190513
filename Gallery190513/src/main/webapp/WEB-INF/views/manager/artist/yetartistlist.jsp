<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%ArtistDto artistDto = (ArtistDto)request.getAttribute("artistDto"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>승인안된 작가목록</title>
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
top:60px;
}
.tail{
position:relative;
top:150px;
}
</style>

</head>
<body>
<% 
	List<ArtistDto>list=(List<ArtistDto>)request.getAttribute("list");// Object타입에 저장되도록 설계
%>


<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main" align="center">


<h1>작가승인대기 목록</h1>
	<table border="1">
	<col width="60px;">
      <col width="150px;">
      <col width="400px;">
      <col width="400px;">
      <col width="300px;">
      <col width="60px;">
      <col width="60px;">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>개인전</th>
			<th>단체전</th>
			<th>수상경력</th>
			<th>등급</th>
			<th>승인</th>
			<th>삭제</th>
		</tr>
		<%
		for(int i=0; i<list.size(); i++){
			 artistDto=list.get(i);
	%>
	<tr>
		<td><%=artistDto.getA_no()%></td>
		<td><a href="managerselectArtist.do?a_no=<%=artistDto.getA_no()%>"><%=artistDto.getA_name()%></a></td>
		<td><%=artistDto.getA_solo()%></td>
		<td><%=artistDto.getA_Squard()%></td>
		<td><%=artistDto.getA_career()%></td>
		<td>
		<%if(artistDto.getA_state()==1){%>
			미승인
		<%}%>
		</td>
		<td><a href="managerArtistStateUpdate.do?a_no=<%=artistDto.getA_no()%>">[승인]</a></td>
		<td><a href="managerdeleteArtist.do?a_no=<%=artistDto.getA_no()%>">[삭제]</a></td>
		
	<% }%>
		</table>
	
</div>

<div class="tail" >
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
	
</body>
</html>

<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@page import="com.hk1.gallery.dto.RequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 목록 보기</title>
<style>
table{
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
a:hover{
color:threedlightshadow;
}
.main{
position:relative;
top:0px;
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

<div class="main">
<%
List<RequestDto>list=(List<RequestDto>)request.getAttribute("list");
%>
	<h1 align="center">메시지 목록보기</h1>
	<div id="button" style="padding-left:430px;">
	<input type="button" value="메시지 추가" onclick="location.href='managerinsertRequestform.do'"/>
	</div>
	<table border="1" align="center">
	<col width="80px;">
	<col width="80px;">
	<col width="130px;">
	<col width="80px;">
	<col width="130px;">
	<col width="250px;">
	<col width="150px;">
	<col width="80px;">
	<col width="80px;">
	<tr>
		<th>요청번호</th>
		<th>보낸회원번호</th>
		<th>보낸회원이름</th>
		<th>받는회원번호</th>
		<th>받는회원이름</th>
		<th>요청글제목</th>
		<th>보낸날짜</th>
		<th>수락여부</th>
		<th>삭제</th>
	</tr>
	
	<%
	for(int i=0; i<list.size();i++){
		RequestDto requestDto=list.get(i);
		
	%>
	<tr>
		<td><%=requestDto.getR_no()%></td>
		<td><%=requestDto.getR_send()%></td>
		<td><%=requestDto.getR_sendname()%></td>
		<td><%=requestDto.getR_receive()%></td>
		<td><%=requestDto.getR_receivename()%></td>
		<td><a href="managerselectRequest.do?r_no=<%=requestDto.getR_no()%>"><%=requestDto.getR_title()%></a></td>
		
		<td>
		<fmt:formatDate value="<%=requestDto.getR_regdate()%>" pattern="yyyy년MM월dd일"/>
		
		</td>
		<td><%=requestDto.getR_agree()%></td>
		<td><a href="managerdeleteRequest.do?r_no=<%=requestDto.getR_no()%>">[삭제]</a></td>
	</tr>
	
	
	<%} %>
	</table>
	</div>

<div class="tail" >
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
</body>
</html>
<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 목록</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 
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
font-family: 'Nanum Gothic', sans-serif;
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
<% 
   List<GalleryDto>list=(List<GalleryDto>)request.getAttribute("list");// Object타입에 저장되도록 설계
%>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main">

<h1 align="center">갤러리 목록</h1>
<div id="button" style="padding-left:350px;">
<input type="button" value="갤러리추가" onclick="location.href='managerinsertGalleryform.do'">
<a href="managerselectyetGalleryList.do?g_state=1">미승인 갤러리 목록</a>
</div>
<table border="1" align="center">
		<col width="60px;">
		<col width="60px;">
		<col width="100px;">
		<col width="180px;">
		<col width="100px;">
		<col width="100px;">
		<col width="100px;">
		<col width="100px;">
		<col width="100px;">
		<col width="200px;">
		<col width="60px;">
		<col width="60px;">
		
      <tr>
         <th>번호</th>
         <th>소유주번호</th>
         <th>갤러리이름</th>
         <th>갤러리주소</th>
         <th>전화번호</th>
         <th>내부사진1</th>
         <th>내부사진2</th>
         <th>내부사진3</th>
         <th>내부사진4</th>
         <th>소갯말</th>
         <th>승인상태</th>
         <th>승인</th>
         <th>삭제</th>
      </tr>
      
   <%
   for(int i=0; i<list.size(); i++){
      GalleryDto galleryDto=list.get(i);
         
   %>
   <tr>
      <td><%=galleryDto.getG_no()%></td>
      <td><a href="managerselectMember1.do?m_no=<%=galleryDto.getM_no()%>"><%=galleryDto.getM_no()%></a></td>
      <td><a href="managerselectGallery.do?g_no=<%=galleryDto.getG_no()%>"><%=galleryDto.getG_name()%></a></td>
      <td><%=galleryDto.getG_adress()%></td>
      <td><%=galleryDto.getG_tel()%></td>
      <td><a href="galleryupload/<%=galleryDto.getG_img1()%>" id="img">내부사진1</a></td>
      <td><a href="galleryupload/<%=galleryDto.getG_img2()%>" id="img">내부사진2</a></td>
      <td><a href="galleryupload/<%=galleryDto.getG_img3()%>" id="img">내부사진3</a></td>
      <td><a href="galleryupload/<%=galleryDto.getG_img4()%>" id="img">내부사진4</a></td>
      <td><%=galleryDto.getG_intro()%></td>
      <td>
      <%if(galleryDto.getG_state()==1){%>
         미승인
      <%}else if(galleryDto.getG_state()==3){%>
         승인
      <%}%>
      </td>
      <td><a href="managerGalleryStateUpdate.do?m_no=<%=galleryDto.getM_no()%>">[승인]</a></td>
      <td><a href="managerdeleteGallery.do?g_no=<%=galleryDto.getG_no()%>">[삭제]</a></td>
   </tr>
      
      <%} %>
</table>
</div>

<div class="tail"  >
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
   
   
</body>

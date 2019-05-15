<%@page import="com.hk1.gallery.dto.ArtistDto"%> 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가목록</title>
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
<% 
   List<ArtistDto>list=(List<ArtistDto>)request.getAttribute("list");// Object타입에 저장되도록 설계
%>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main">

   <h1 align="center">작가목록</h1>
   
   <div id="button" style="padding-left:220px;">
   <input type="button" value="작가추가" onclick="location.href='managerinsertArtistform.do'">
   <a href="managerselectyetArtistList.do?a_state=1">미승인 작가목록</a>
   </div>
   
   <table border="1" align="center">
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
         ArtistDto artistDto=list.get(i);
         
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
      <%}else if(artistDto.getA_state()==2){%>
         승인
      <%}%>
      
      
      </td>
      <td><a href="managerArtistStateUpdate.do?a_no=<%=artistDto.getA_no()%>">[승인]</a></td>
      <td><a href="managerdeleteArtist.do?a_no=<%=artistDto.getA_no()%>">[삭제]</a></td>
   </tr>
   <%}%>
   
      </table>
      

   </div>

<div class="tail" >
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
   
   
   

   
</body>
</html>
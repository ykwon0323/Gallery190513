<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원등급 변경</title>
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
top:100px;
}
</style>

</head>
<body>
<body>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<%
List<MemberDto>list=(List<MemberDto>)request.getAttribute("list");
%>
<div class="main" align="center">
   <h1>회원등급변경</h1>
   <table border="1">
      <col width="60px;">
      <col width="150px;">
      <col width="150px;">
      <col width="400px;">
      <col width="200px;">
      <col width="200px;">
      <col width="60px;">
   <tr>
      <th>번호</th>
      <th>아이디</th>
      <th>이름</th>
      <th>주소</th>
      <th>전화번호</th>
      <th>회원등급</th>
      <th>승인</th>
      <th>삭제</th>
   </tr>
   
   <%for(int i=0; i<list.size(); i++){
      MemberDto memberDto=list.get(i);
      %>
   <tr>
      <td><%=memberDto.getM_no()%></td>
      <td><%=memberDto.getM_id()%></td>
      <td><a href="managerselectMember1.do?m_no=<%=memberDto.getM_no()%>"><%=memberDto.getM_name()%></a></td>
      <td><%=memberDto.getM_address()%></td>
      <td><%=memberDto.getM_tel()%></td>
      <td>
      
      <% if(memberDto.getM_grade()==4){%>
            작가(대기)(4)-->작가(2)
      <%}else if(memberDto.getM_grade()==5){%>
            갤러리주(대기)(5)-->갤러리주(3)
      <%}else if(memberDto.getM_grade()==7){%>
            작가(대기),갤러리주(7)-->작가,갤러리주(6)
      <%}else if(memberDto.getM_grade()==8){%>
            작가,갤러리주(대기)(8)-->작가,갤러리주(6)
      <%}else if(memberDto.getM_grade()==9){%>
            작가(대기),갤러리주(대기)-->작가,갤러리주(대기)(8)
                        --->작가(대기),갤러리주(7)
                        --->작가, 갤러리(6)
      <%} %>
      
      
      
      
      </td>
     <td><a href="managergradeupdate.do?m_no=<%=memberDto.getM_no()%>&m_grade=<%=memberDto.getM_grade()%>">[승인]</a></td>
      <td><a href="managerdeleteMember.do?m_no=<%=memberDto.getM_no()%>">[삭제]</a></td>
   </tr>
   
   <%} %>
   </table>
   </div>
 <div class="tail" >
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>  
   
</body>
</html>
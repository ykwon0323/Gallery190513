<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@page import="com.hk1.gallery.dto.ArtistDto"%>

<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%GalleryDto galleryDto = (GalleryDto)request.getAttribute("galleryDto");%>
<%ArtistDto artistDto = (ArtistDto)request.getAttribute("artistDto");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
a:hover{
color:threedlightshadow;
}
.main{
position: relative;
top:0px;
}
.tail{
position: relative;
top:100px;
}
/* .main{ */
/* background-image:url(logo/logo2.png); */
/* opacity:0.2; */
/* } */

</style>
</head>
<body>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>


<div class="main" >
<!-- <img class="mainlogo" src="logo/logo2.png" alt="logo" -->
<!-- style="opacity:0.2"/> -->
<% 
	List<MemberDto> list=(List<MemberDto>)request.getAttribute("list");// Object타입에 저장되도록 설계
%>
	<h1 align="center">회원목록</h1>
	<form action="managerselectMemberList.do" method="post">
	<div id="button" style="padding-left:350px;">
	<input type="button" value="회원추가" onclick="location.href='managerinsertmemberform.do'" >
	<input type="button" value="미승인회원" onclick="location.href='managerselectCheckMemberList.do'">
	</div>
	
	<table border="1" align="center">
		<col width="45px;">
		<col width="150px;">
		<col width="150px;">
		<col width="400px;">
		<col width="200px;">
		<col width="150px;">
		<col width="60px;">
		<col width="60px;">
	
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>등급</th>
		<th>승인</th>
		<th>삭제</th>
	</tr>
		
	<%
		for(int i=0; i<list.size();i++){
			MemberDto memberDto=list.get(i);
			%>
			<tr>
				<td><%=memberDto.getM_no()%></td>
				<td><a href="managerselectMember1.do?m_no=<%=memberDto.getM_no()%>"><%=memberDto.getM_id()%></a></td>
				<td><%=memberDto.getM_name()%></td>
				<td><%=memberDto.getM_address()%></td>
				<td><%=memberDto.getM_tel()%></td>
				<td>
				<%if(memberDto.getM_grade()==1){%>
					회원
				<%}else if(memberDto.getM_grade()==0){%>
					관리자
				<%}else if(memberDto.getM_grade()==2){%>
					작가
				<%}else if(memberDto.getM_grade()==3){%>
					갤러리주
				<%}else if(memberDto.getM_grade()==4){%>
					<a href="managerMemberlistselectArtist.do?m_no=<%=memberDto.getM_no()%>"
					target="_blank" >
<!-- 					onclick="window.open(this.href,'_blank',width=800,height=300)"> -->
					작가(대기)</a>
<!-- 					<div style="width:500; height:500;"></div> -->
	
					
				<%}else if(memberDto.getM_grade()==5){%>
					<a href="managerMemberlistselectGallery.do?m_no=<%=memberDto.getM_no()%>"
					target="_blank">갤러리주(대기)</a>
				<%}else if(memberDto.getM_grade()==6){%>
					작가, 갤러리주
				<%}else if(memberDto.getM_grade()==7){%>
					<a href="managerMemberlistselectArtist.do?m_no=<%=memberDto.getM_no()%>"
					target="_blank">작가(대기)</a>,갤러리주
				<%}else if(memberDto.getM_grade()==8){%>
					작가,<a href="managerMemberlistselectGallery.do?m_no=<%=memberDto.getM_no()%>"
					target="_blank">갤러리주(대기)</a>
				<%}else if(memberDto.getM_grade()==9){%>
					<a href="managerMemberlistselectBoth.do?m_no=<%=memberDto.getM_no()%>" target="_blank">작가(대기),갤러리주(대기)</a>
				<%} %>
				</td>
				<td><a href="managergradeupdate.do?m_no=<%=memberDto.getM_no()%>&m_grade=<%=memberDto.getM_grade()%>">[승인]</a></td>
				<td><a href="managerdeleteMember.do?m_no=<%=memberDto.getM_no()%>">[삭제]</a></td>
			</tr>
	<%
	}
	%>
	</table>
	</form>
</div>
	<script type="text/javascript">
	pop(){
		window.open(this.href,'_blank',width=800, height=500);
		
	}
	
	</script>


<div class="tail" >
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
</body>
</html>
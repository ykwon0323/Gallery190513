<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
ul {list-style-type:none;margin:50px;padding:0}
li {
display:inline;
padding-right:50px;
}
.managermenu{
position: absolute;
left: 230px;
}
.main{
position: relative;
top:0px;
}
.tail{
position: relative;
top: 100px;
}
.mainlogo2{
width:1000px;
opacity: 0.7!important;
}

</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />


<div class="main" align="center">

<h1>환영</h1>
<img class="mainlogo2" src="logo/logo2.png" alt="logo"/>
</div>


<div class="tail" >
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>

</body>
</html>
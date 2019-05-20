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
/* .mainlist {list-style-type:none;margin:50px;padding:0} */
/* .managermenu ul li { */
/* display:inline;  */
/* padding-right:50px; */
/* } */
/* .managermenu{ */
/* position: absolute; */
/* top:0px; */
/* left: 230px; */

/* } */
/* .managermenu li ul{ */

/* display:none; */
/* } */
/* .managermenu li:hover ul{ */

/* display:block; */
/* } */
/* main Styles */

html { box-sizing: border-box; } 

*, *:before, *:after { box-sizing: inherit; }

body {
  background: #fafafa;
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  margin: 0;
}

a { text-decoration: none; }

.container {
  width: 1500px;
  margin: auto;
}



/* Navigation Styles */

nav { 
	background: #030a0e; 
    position: absolute;
    left: 250px;
    top: 30px;
}

nav ul {
  font-size: 0;
  margin: 0;
  padding: 0;
}

nav ul li {
  display: inline-block;
  position: relative;
}

nav ul li a {
  color: #fff;
  display: block;
  font-size: 14px;
  padding: 15px 14px;
  transition: 0.3s linear;
}

nav ul li:hover { background: #c5ccce; }

nav ul li ul {
  border-bottom: 5px solid #2ba0db;
  display: none;
  position: absolute;
  width: 200px;
}

nav ul li ul li {
  border-top: 1px solid #444;
  display: block;
}

nav ul li ul li:first-child { border-top: none; }

nav ul li ul li a {
  background: #373737;
  display: block;
  padding: 10px 14px;
}

nav ul li ul li a:hover { background: #126d9b; }

nav .fa.fa-angle-down { margin-left: 6px; }




</style>
</head>
<body>

<!-- 			<div class="mainHeader" style="position: fixed; background-color: white;"> -->
			<div class="mainLogo" style="position: relative; left: 80px; top: 10px; /*z-index: 99*/">
			<a href="index.jsp"><img alt="index.jsp" src="logo/newLogo1.png" width="150" height="auto" ></a> </div>
<!-- <!-- 			<div class="login_wrapper" style="position: absolute; right: 50px; top: 10px; z-index: 99;"> --> 
<%-- 		<%if(loginMember==null){ %> --%> 
<!-- <!-- 			<button style=" width: 80px; height: 40px;" class="btn btn-outline-success" onclick="location.href='loginform.do'" >LOGIN</button> -->
			
<%-- 			<%}else{ %> --%>
<%-- 			<button class="btn btn-outline-danger"  onclick="location.href='logout.do'" ><span><%=loginMember.getM_name()%>님 </span> --%>
<!-- <!-- 			<span >LOGOUT</span></button> --> 
<%-- 			<%} %> --%>
<!-- <!-- 			</div> --> 

<!-- </div> -->

<nav>
  <div class="container">
    <ul>
        <li><a href="managerselectMemberList.do">MEMBER</a></li>
        <li><a href="managerselectArtistList.do">ARTIST</a></li>
        <li><a href="managerselectGalleryList.do">GALLERY</a></li>
        <li><a href="managerselectItemList.do">ITEM</a></li>
        <li><a href="managerselectExhibitionList.do">EXHIBITION</a></li>
        <li><a href="managerselectCallendarList.do">CALENDAR</a></li>
        <li><a href="managerselectRequestList.do">REQUEST</a></li>
        <li><a href="managerselectDabgeulList.do">DABGEUL</a></li>
        <li><a href="managerselectKyungmaeList1.do">경매목록</a></li>
      <li> <a href="#">승인<i class='fa fa-angle-down'></i></a>
        <ul>
            <li><a href="managerselectCheckMemberList.do">회원등급변경</a></li>	
            <li><a href="managerselectyetArtistList.do?a_state=1">작가승인</a></li>
            <li><a href="managerselectyetGalleryList.do?g_state=1">갤러리승인</a></li>
<!--             <li><a href="#">d</a></li> -->
        </ul>
      </li>
      
    </ul>
  </div>
</nav>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script>
$('nav li').hover(
  function() {
	  $('ul', this).stop().slideDown(300);
  },
	function() {
    $('ul', this).stop().slideUp(300);
  }
);
</script>

<!-- <div class="managermenu"> -->
<!-- <ul class="mainlist"> -->
<!-- 	<li><a href="managerselectMemberList.do">MEMBER</a></li> -->
<!-- 	<li><a href="managerselectArtistList.do">ARTIST</a></li> -->
<!-- 	<li><a href="managerselectGalleryList.do">GALLERY</a></li> -->
<!-- 	<li><a href="managerselectItemList.do">ITEM</a></li> -->
<!-- 	<li><a href="managerselectExhibitionList.do">EXHIBITION</a></li> -->
<!-- 	<li><a href="managerselectCallendarList.do">CALENDAR</a></li> -->
<!-- 	<li><a href="managerselectRequestList.do">REQUEST</a></li> -->
<!-- 	<li><a href="managerselectDabgeulList.do">DABGEUL</a></li> -->
<!-- 	<li><a href="managerselectKyungmaeList1.do">경매목록</a></li> -->
<!-- 	<li><a href="#" class="upgrade">승인</a> -->
<!-- 		<ul class="mini"> -->
<!-- 		<li><a href="managerselectCheckMemberList.do">회원등급변경</a></li>	 -->
<!-- 		<li><a href="managerselectyetArtistList.do?a_state=1">작가승인</a></li> -->
<!-- 		<li><a href="managerselectyetGalleryList.do?g_state=1">갤러리승인</a></li> -->
<!-- 		</ul>	 -->
<!-- 	</li> -->
		
<!-- </ul> -->
	
<!-- </div> -->





</body>
</html>

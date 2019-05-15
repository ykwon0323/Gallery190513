<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%GalleryDto galleryDto=(GalleryDto)request.getAttribute("galleryDto"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 추가하기</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 
<style>
.container {
font-family: 'Nanum Gothic', sans-serif;
background-color:rgb(228, 194, 194);
border:2px solid red;
/*         text-align:center; */
        
        height:600px;
        width:500px;
}
.main{
position:relative;
top:50px;
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

<div class="main" align="center">

<div class="container" align="center">
   <h1>갤러리 추가</h1>
   <form action="managerinsertGallery.do" method="post" enctype="multipart/form-data" autocomplete="off">
<!--    갤러리번호:<input type="hidden" placeholder="갤러리 번호" name="g_no" autocomplete="off" /><br> -->
   소유주번호:<input type="text" placeholder="소유주 번호" name="m_no" autocomplete="off" required="required"/><br><br>
   갤러리 이름:<input type="text" placeholder="갤러리 이름" name="g_name" autocomplete="off" required="required"/><br><br>
   갤러리 주소:<input type="text" placeholder="갤러리 주소" name="g_adress" autocomplete="off" required="required"/><br><br>
   전화번호:<input type="text" placeholder="전화번호" name="g_tel" autocomplete="off" required="required"/><br><br>
   내부 이미지1: <input multiple="multiple"  type="file" placeholder="내부이미지1" name="file" required="required"/><br><br>
   내부 이미지2: <input multiple="multiple"  type="file" placeholder="내부이미지2" name="file" required="required"/><br><br>
   내부 이미지3: <input multiple="multiple"  type="file" placeholder="내부이미지3" name="file" required="required"/><br><br>
   내부 이미지4: <input multiple="multiple"  type="file" placeholder="내부이미지4" name="file" required="required"/><br><br>
   갤러리 소개:<input type="text" placeholder="갤러리 소개" name="g_intro" autocomplete="off" required="required"/><br><br>
   승인상태:
   <select name="g_state">
      <option value="1">미승인</option>
      <option value="3">승인</option>
   </select>
   <br>
   <br>
   <input type="submit" value="갤러리 추가"/>   
   
   </form>
   </div>
   </div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
   
</body>
</html>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방구석갤러리</title>
</head>
<body style="margin:0; padding: 0;">

<iframe src="index.do" style="width: 100%;
							  height: 100%;
							  overflow-x:hidden;
							  overflow-y:scroll;
							  border: none; ">
<!-- <form name=sendForm action="index.do" method="post">
	</form>
<script  type="text/javascript">
	window.onload = function(){
		

		 document.sendForm.submit();  
	}

</script> -->
</iframe>



</body>
</html>
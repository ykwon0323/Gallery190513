<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%ArtistDto artistDto=(ArtistDto)request.getAttribute("artistDto");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가상세보기</title>
<style>
table{
background-color: rgb(243, 202, 197);
}
tr{
height:50px;
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

<div class="main" align="center">


<h1>작가 상세보기</h1>
	<table border="1">
		<col width="150px;">
		<col width="400px;">
		
	<tr>
		<th>번호</th>
		<td>${artistDto.a_no}</td>
	</tr>
	
	
	<tr>
		<th>이름</th>
		<td>${artistDto.a_name}</td>
	</tr>
	
	<tr>
		<th>개인전</th>
		<td id="solo"></td>
	</tr>
	
	<tr>
		<th>단체전</th>
		<td id="squard"></td>
	</tr>
	
	<tr>
		<th>수상경력</th>
		<td id="career"></td>
	</tr>
	
	<tr>
		<th>등급</th>
		<td>
		<%if(artistDto.getA_state()==1){%>
			미승인
		<%}else if(artistDto.getA_state()==2){%>
			승인
		<%}%>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<button onclick="updateForm(${artistDto.a_no})">수정</button>
			<button onclick="delArtist(${artistDto.a_no})">삭제</button>
			<button onclick="artistlist()">작가목록</button>
		</td>
	</tr>
	</table>
	
	
	</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>

<script type="text/javascript">
//Mozilla, Opera, Webkit 
if (document.addEventListener) {
	document.addEventListener("DOMContentLoaded", function () {
		document.removeEventListener("DOMContentLoaded", arguments.callee, false);
		domReady();
	}, false);


} 

// Internet Explorer
else if (document.attachEvent) {
	document.attachEvent("onreadystatechange", function () {
		if (document.readyState === "complete") {
			document.detachEvent("onreadystatechange", arguments.callee);
			domReady();
		}
	});
}

//DOM이 모두 로드 되었을 때
function domReady () {
	//처리할 내용
	
	document.getElementById('solo').innerHTML = convertingStringtoArray("${artistDto.a_solo}");
	document.getElementById('squard').innerHTML = convertingStringtoArray("${artistDto.a_Squard}");
	document.getElementById('career').innerHTML = convertingStringtoArray("${artistDto.a_career}");
}
// jquery
// 	$('td') td태그
// 	$('.tag') tag라는 class를 가진 엘리먼트 , 근데 얘는 중복이 가능
// 	$('#tag') tag라는 id를 가진 엘리먼트 , 근데 id는 한개만 선언이 가능함 중복불가
// 	$('name=tag') tag라는 name을 가진 엘리먼트, 얘도 중복가능


	function updateForm(a_no){
		location.href="managerartistupdateform.do?a_no="+a_no;
	}
	function delArtist(a_no){
		location.href="managerdeleteArtist.do?a_no="+a_no;
	}
	function artistlist(){
		location.href="managerselectArtistList.do";
	}
	
	function convertingStringtoArray(data) {
		return data.replace(/,/g, '<br/>');
// 		return data.replaceAll(',', '<br/>');
	}

</script>
</body>

</html>
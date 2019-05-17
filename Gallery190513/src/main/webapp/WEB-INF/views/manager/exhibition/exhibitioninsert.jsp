<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시추가하기</title>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 
<style>
.maincontainer {
font-size:18px;
font-family: 'Nanum Gothic', sans-serif;
border:2px solid red;
width:700px;
 width:400px;
}
 h1{
        margin:auto;
    }
#e_img{
	width:200px;
	height:200px; 
}
.row{
        height:90px;
        width:396px;
        background-color:rgb(228, 194, 194);
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
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main" align="center">
<div class="maincontainer" align="center">
	<div class="row">
			<h1>
				<i class="fa fa-lock" aria-hidden="true"></i> 전시추가하기
			</h1>

		</div>
		<br />
		<br />
	<form action="managerinsertExhibition.do" method="post" enctype="Multipart/form-data" autocomplete="off">
<!-- 	<input type="hidden" name="e_no" value=""/> -->
	전시제목:<input type="text" placeholder="제목을 입력하세요" name="e_title" required="required" autocomplete="off"/><br><br>
	전시설명:<textarea name="e_explain" rows="10" cols="40" placeholder="전시설명을 입력하세요" required="required" autocomplete="off"></textarea><br><br>
	작가번호:<input type="text"  name="a_no" placeholder="작가번호 입력란입니다" required="required" autocomplete="off"/><br><br>
	작가이름:<input type="text"  name="a_name" placeholder="작가이름입력란입니다" required="required" autocomplete="off"/><br><br>
	<input type="hidden" name="e_click" value="0"/>
	전시사진:<input type="file" multiple="multiple" name="e_img" id="e_img1" placeholder="사진을 올려주세요" 
	required="required" onchange="LoadImg()"/><br><br><!-- <input type="button" value="파일추가" onclick="add_exhibition()"><br> -->
	<div id="list"></div><br>
	
<!-- 	<div id="add" style="display:none">	 -->
<!-- 	<input type="file" multiple="multiple" name="file" id="e_img2" onchange="LoadImg1()"> -->
<!-- 	<input type="button" value="파일삭제" onclick="remove_exhibition(this)"><br> -->
<!-- 	<div id="list1"></div> -->
<!-- 	</div> -->
<!-- 	<div id="field"> -->
<!-- 	</div> -->
	
	<input type="submit" value="전시추가"/><br><br>
	</form>
	<br>
	</div>
	</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	<script type="text/javascript"> 
	function LoadImg(){
 		var files=document.getElementById('e_img1').files[0];
 		var reader= new FileReader();
 		reader.onload=(function(theFile){
 			return function(e){
 				var img_view=['<img id="e_img" src="',e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
 				document.getElementById('list').innerHTML=img_view;
 			};
 		})(files);
 		reader.readAsDataURL(files);
 	}
	
// 	//실행안됨..
// 	function LoadImg1(){
// 		var files=document.getElementById('e_img2').files[0];
// 		var reader= new FileReader();
// 		reader.onload=(function(theFile){
// 			return function(e){
// 				var img_view=['<img src="',e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
// 				document.getElementById('list1').innerHTML=img_view;
// 			};
// 		})(files);
// 		reader.readAsDataURL(files);
// 	}

// 	function add_exhibition(){
// 		var div = document.createElement('div');
// 		var addFiletag=
// 			'<input type="file" multiple="multiple" name="file" id="e_img2" onchange="LoadImg1()">'
// 		 	+'<input type="button" value="파일삭제" onclick="remove_exhibition(this)"><br>'
// 		 	+'<div id="list1"></div>';
// // 		div.innerHTML = document.getElementById('add').innerHTML;
// 		div.innerHTML =addFiletag;
// 		document.getElementById('field').appendChild(div);
// 	}
// 	function remove_exhibition(obj){
// 		document.getElementById('field').removeChild(obj.parentNode);
// 	}
	
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작품 추가</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 
<style>
.maincontainer {
font-size:18px;
font-family: 'Nanum Gothic', sans-serif;
border:2px solid red;
width:500px;
}
.row{
        height:100px;
        width:500px;
        background-color:rgb(228, 194, 194);
    }
     h1{
        margin:auto;
    }
#preview{
	width:200px;
	height:200px;
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
				<i class="fa fa-lock" aria-hidden="true"></i> 작품 추가
			</h1>

		</div>
		<br><br>
	<form action="managerinsertItem.do" method="post" enctype="Multipart/form-data" autocomplete="off">
	<label for="e_no">전시번호:</label>
	<input type="text" name="e_no" placeholder="전시번호를 입력하세요" required="required" autocomplete="off"/><br><br>
	<label for="i_name">작품이름:</label>
	<input type="text" name="i_name" placeholder="작품이름을 입력하세요" required="required" autocomplete="off"/><br><br>
	<label for="i_explain">작품설명 :</label>
	<textarea name="i_explain" placeholder="작품설명을 입력하세요" required="required"
		autocomplete="off" rows="10" cols="60"></textarea><br><br>
	<label for="n">작품이미지 :</label>
	<pre class="brush:html"></pre><input type="file" placeholder="작품이미지를 등록하세요" name="i_img" required="required" id="input_img" 
	name="i_img" onchange="LoadImg()"/><br>
	<div id="list" ></div>
	<label for="i_price">가격:</label>
	<input type="text" name="i_price" placeholder="작품의 가격을 입력하세요" required="required" autocomplete="off"/><br><br>
	<label for="a_no">작가번호:</label>
	<input type="text" name="a_no" placeholder="작가 번호를 입력하세요" required="required" autocomplete="off"/><br><br>
	<input type="hidden" name="m_no" value="0"/><br><br>
	
	<input type="submit" value="작품추가"/>
	</form>
	</div>
	</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
	<script type="text/javascript">
	function LoadImg(){
		var files=document.getElementById('input_img').files[0];
		var reader= new FileReader();
		reader.onload=(function(theFile){
			return function(e)
			{
				var img_view=['<img id="preview" src="',e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
				document.getElementById('list').innerHTML=img_view;
			};
		})(files);
		reader.readAsDataURL(files);
		
	}
	
	</script>
</body>
</html>
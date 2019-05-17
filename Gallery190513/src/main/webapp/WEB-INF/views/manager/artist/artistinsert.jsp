<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html;charset=utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가 추가</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 
<style>
.main {
font-size:18px;
font-family: 'Nanum Gothic', sans-serif;
	position: relative;
	top: 60px;
}

.maincontainer {
	position: relative;
/* 	top: 50px; */
	border: 2px solid red;
	/*         text-align:center; */
	height: 500px;
	width: 400px;
}

h1 {
	margin: auto;
}

.row {
	height: 90px;
	width: 396px;
	background-color: rgb(228, 194, 194);
}

.tail {
	position: relative;
	top: 100px;
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
					<i class="fa fa-lock" aria-hidden="true"></i> 작가 추가
				</h1>

			</div>
			<br /> <br />

			<form action="managerinsertArtist.do" method="post"
				autocomplete="off">

				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user-tie"></i></span>
					</div>
					<label for="no">번호</label> <input type="text"
						placeholder="회원번호를 입력하세요" name="a_no" required="required"
						autocomplete="off" /><br>
				</div>
				<br />


				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fa fa-key icon"></i></span>
					</div>
					<label for="name">이름</label> <input type="text"
						placeholder="이름을 입력하세요" name="a_name" required="required"
						autocomplete="off" /><br>
				</div>
				<br />



				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fa fa-key icon"></i></span>
					</div>
					<label for="solo">개인전</label> <input type="text"
						placeholder="개인전 경력을 입력하세요" name="a_solo" required="required"
						autocomplete="off" /> <input type="hidden" value="\n" /> <input
						type="button" value="추가 " onclick="add_item()"><br>
					<div id="field"></div>


				</div>
				<br />



				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fa fa-key icon"></i></span>
					</div>
					<label for="squard">단체전</label> <input type="text"
						placeholder="단체전 경력을 입력하세요" name="a_Squard" required="required"
						autocomplete="off" /> <input type="button" value=" 추가 "
						onclick="add_item2()"><br>
					<div id="field2"></div>
				</div>
				<br />


				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fa fa-key icon"></i></span>
					</div>
					<label for="solo">경력</label> <input type="text"
						placeholder="경력란입니다" name="a_career" required="required"
						autocomplete="off" /> <input type="button" value=" 추가 "
						onclick="add_item3()"><br>
					<div id="field3"></div>
				</div>
				<br />



				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fa fa-key icon"></i></span>
					</div>
					<label for="state">등급</label> <select name="a_state">
						<option value="1">작가 미승인</option>
						<option value="2">작가 승인</option>
					</select>
				</div>
				<br /> <input type="submit" value="추가완료" /> <br /> <br>
				<center>
					<div style="border: 1px solid black; height: 1px; width: 300px;"></div>
				</center>
				<br />
			</form>
		</div>
	</div>


	<div class="tail">
		<jsp:include page="/WEB-INF/views/tail.jsp" />
	</div>


	<script type="text/javascript">
		function add_item() {
			// pre_set 에 있는 내용을 읽어와서 처리..
			var div = document.createElement('div');
			var addFiletag =

			'<input id="add" type="text" name="a_solo" value="" autocomplete="off" style="width:200px">'
					+ '<input type="button" value="추가 " onclick="add_item()">'

					+ '<input type="button" value="삭제" onclick="remove_item(this)">'

			div.innerHTML = addFiletag;
			document.getElementById('field').appendChild(div);
		}

		function remove_item(obj) {
			// obj.parentNode 를 이용하여 삭제
			document.getElementById('field').removeChild(obj.parentNode);
		}

		function add_item2() {
			// pre_set 에 있는 내용을 읽어와서 처리..
			var div2 = document.createElement('div');
			var addFiletag = '<input type="text" name="a_Squard" value="" autocomplete="off" style="width:200px">'
					+ '<input type="button" value=" 추가 " onclick="add_item2()">'
					+ ' <input type="button" value="삭제" onclick="remove_item2(this)">'
			div2.innerHTML = addFiletag;
			document.getElementById('field2').appendChild(div2);
		}

		function remove_item2(obj) {
			// obj.parentNode 를 이용하여 삭제
			document.getElementById('field2').removeChild(obj.parentNode);
		}

		function add_item3() {
			// pre_set 에 있는 내용을 읽어와서 처리..
			var div3 = document.createElement('div');
			var addFiletag = '<input type="text" name="a_career" value="" autocomplete="off" style="width:200px">'
					+ '<input type="button" value=" 추가 " onclick="add_item3()">'
					+ '<input type="button" value="삭제" onclick="remove_item3(this)">'

			div3.innerHTML = addFiletag;
			document.getElementById('field3').appendChild(div3);
		}

		function remove_item3(obj) {
			// obj.parentNode 를 이용하여 삭제
			document.getElementById('field3').removeChild(obj.parentNode);
		}
	</script>










	<!-- 	<div class="main" align="center"> -->

	<!-- 		<h1>작가 추가</h1> -->

	<!-- 		<form action="managerinsertArtist.do" method="post" autocomplete="off"> -->

	<!-- 			<label for="no">번호</label> <input type="text" -->
	<!-- 				placeholder="회원번호를 입력하세요" name="a_no" required="required" -->
	<!-- 				autocomplete="off" /><br> <label for="name">이름</label> <input -->
	<!-- 				type="text" placeholder="이름을 입력하세요" name="a_name" -->
	<!-- 				required="required" autocomplete="off" /><br> <label for="solo">개인전</label> -->
	<!-- 			<input type="text" placeholder="개인전 경력을 입력하세요" name="a_solo" -->
	<!-- 				required="required" autocomplete="off" /> <input type="hidden" -->
	<!-- 				value="\n" /> <input type="button" value="추가 " onclick="add_item()"><br> -->


	<!-- 			<!-- <div id="add" style="display:none"> -->
	<!-- 			<!-- <input type="text" name="a_solo" value="" style="width:200px"><br> <input type="button" value="삭제" onclick="remove_item(this)"> -->
	<!-- 			<!-- </div> -->
	<!-- 			<div id="field"></div> -->


	<!-- 			<label for="squard">단체전</label> <input type="text" -->
	<!-- 				placeholder="단체전 경력을 입력하세요" name="a_Squard" required="required" -->
	<!-- 				autocomplete="off" /> <input type="button" value=" 추가 " -->
	<!-- 				onclick="add_item2()"><br> -->
	<!-- 			<!-- <div id="add2" style="display:none"> -->
	<!-- 			<!-- <input type="text" name="a_squard" value="" style="width:200px"> <input type="button" value="삭제" onclick="remove_item2(this)"> -->
	<!-- 			<!-- </div> -->
	<!-- 			<div id="field2"></div> -->
	<!-- 			<label for="solo">경력</label> <input type="text" placeholder="경력란입니다" -->
	<!-- 				name="a_career" required="required" autocomplete="off" /> <input -->
	<!-- 				type="button" value=" 추가 " onclick="add_item3()"><br> -->
	<!-- 			<!-- <div id="add3" style="display:none"> -->
	<!-- 			<!-- <input type="text" name="a_career" value="" style="width:200px"> <input type="button" value="삭제" onclick="remove_item3(this)"> -->
	<!-- 			<!-- </div> -->
	<!-- 			<div id="field3"></div> -->

	<!-- 			<label for="state">등급</label> <select name="a_state"> -->
	<!-- 				<option value="1">작가 미승인</option> -->
	<!-- 				<option value="2">작가 승인</option> -->
	<!-- 			</select> <br> <input type="submit" value="추가완료" /> -->

	<!-- 		</form> -->

	<!-- 	</div> -->

	<!-- 	<div class="tail" > -->
	<%-- 		<jsp:include page="/WEB-INF/views/tail.jsp" /> --%>
	<!-- 	</div> -->


	<!-- 	<script type="text/javascript"> -->
	<!-- // function add_item(){ -->
	<!-- //     // pre_set 에 있는 내용을 읽어와서 처리.. -->
	<!-- //     var div = document.createElement('div'); -->
	<!-- //     var addFiletag= -->


	<!-- //     	'<input id="add" type="text" name="a_solo" value="" autocomplete="off" style="width:200px">' -->
	<!-- //     	+'<input type="button" value="추가 " onclick="add_item()">' -->

	<!-- // 		+'<input type="button" value="삭제" onclick="remove_item(this)">' -->

	<!-- //     div.innerHTML = addFiletag; -->
	<!-- //     document.getElementById('field').appendChild(div); -->
	<!-- // } -->

	<!-- // function remove_item(obj){ -->
	<!-- //     // obj.parentNode 를 이용하여 삭제 -->
	<!-- //     document.getElementById('field').removeChild(obj.parentNode); -->
	<!-- // } -->

	<!-- // function add_item2(){ -->
	<!-- //     // pre_set 에 있는 내용을 읽어와서 처리.. -->
	<!-- //     var div2 = document.createElement('div'); -->
	<!-- //     var addFiletag= -->
	<!-- //     	'<input type="text" name="a_Squard" value="" autocomplete="off" style="width:200px">' -->
	<!-- //     	+'<input type="button" value=" 추가 " onclick="add_item2()">' -->
	<!-- //     	 +' <input type="button" value="삭제" onclick="remove_item2(this)">' -->
	<!-- //     div2.innerHTML = addFiletag; -->
	<!-- //     document.getElementById('field2').appendChild(div2); -->
	<!-- // } -->

	<!-- // function remove_item2(obj){ -->
	<!-- //     // obj.parentNode 를 이용하여 삭제 -->
	<!-- //     document.getElementById('field2').removeChild(obj.parentNode); -->
	<!-- // } -->

	<!-- // function add_item3(){ -->
	<!-- //     // pre_set 에 있는 내용을 읽어와서 처리.. -->
	<!-- //     var div3 = document.createElement('div'); -->
	<!-- //     var addFiletag= -->
	<!-- //     	'<input type="text" name="a_career" value="" autocomplete="off" style="width:200px">' -->
	<!-- //     	+'<input type="button" value=" 추가 " onclick="add_item3()">' -->
	<!-- //     	+'<input type="button" value="삭제" onclick="remove_item3(this)">' -->

	<!-- //     div3.innerHTML = addFiletag; -->
	<!-- //     document.getElementById('field3').appendChild(div3); -->
	<!-- // } -->

	<!-- // function remove_item3(obj){ -->
	<!-- //     // obj.parentNode 를 이용하여 삭제 -->
	<!-- //     document.getElementById('field3').removeChild(obj.parentNode); -->
	<!-- // } -->

	<!-- </script> -->

</body>
</html>
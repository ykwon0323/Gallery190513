<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%
MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); 

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="login/css/updateMemberForm.css">
<style>
	
	.heading-section span {
	font-size: 16px;
	display: block;
	margin-bottom: 5px;
	text-transform: uppercase;
	color: #e2c0bb;
	letter-spacing: 2px;
	text-align: center !important;
	margin: 0;
	padding: 0;
}

.heading-section h2 {
	font-size: 40px;
	font-weight: 600;
	line-height: 1.2;
	color: inherit;
	margin-top: 8px;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	text-align: center !important;
}

.heading-section p {
	font-family: -apple-system, BlinkMacSystemFont;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<%-- <jsp:include page="privateGnb.jsp" />	 --%>

<%-- 	<div id="updateMemberForm">
	<form action="updateMember.do" method="post">
		<input type="hidden" name="m_no" value="<%=loginMember.getM_no() %>">
		<input type="hidden" name="m_grade" value="<%=loginMember.getM_grade()%>">
		<div>
			<h5>※가입하신 E-mail은 수정하실 수 없습니다</h5>
			<span>가입 E-mail </span>
			<input type="text" name="m_id" value="<%=loginMember.getM_id()%>" readonly>
		</div>
		<div>
			<span>이름 </span>
			<input type="text" name="m_name" value="<%=loginMember.getM_name()%>" >
		</div>
		<div>
			<span>주소 </span>
			<input type="text" name="m_address"  value="<%=loginMember.getM_address()%>">
		</div>
		<div>
			<span>휴대폰번호 </span>
			
			<input type="text" name="m_tel1" maxlength="3" value="<%=(loginMember.getM_tel()).substring(0, 3) %>">
			<input type="text" name="m_tel2" maxlength="4" value="<%=(loginMember.getM_tel()).substring(3, 7) %>">
			<input type="text" name="m_tel3" maxlength="4" value="<%=(loginMember.getM_tel()).substring(7, 11) %>">
		</div>
		<div>
			<input type="submit" value="수정완료">
		</div>
	</form>
</div> --%>
<div style="padding-top: 3%;">
	<div class="row justify-content-center pb-5" >
          <div class="col heading-section text-center ftco-animate" style="z-index:;">
          	<span class="subheading">My Information</span>

           <img alt="로고" src="logo/newLogo1.png" width="10%">

           

            <p>Your information to protect you</p>
          </div>
        </div>
</div>
<div id="updateMemberForm">
	<h3>회원정보(상세·수정)</h3>
	<p>등록된 정보를 확인 후 수정하실 수 있습니다.</p>
	
	<form action="updateMember.do" method="post" name="updateMemberForm">
		<div id="updateMemberForm_updateMemberForm">
			<input type="hidden" name="m_no" value="<%=loginMember.getM_no() %>">
			<input type="hidden" name="m_grade" value="<%=loginMember.getM_grade()%>">
			<div>
				<span>가입 E-mail </span>
				<input type="text" name="m_id" value="<%=loginMember.getM_id()%>" readonly required="required">
				<p>가입시 사용된 이메일은 변경 불가합니다</p>
			</div>
			<div>
				<span>이름 </span>
				<input type="text" name="m_name" value="<%=loginMember.getM_name()%>" pattern="[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,6}" required="required">
				<p>한글 2~6자리</p>
			</div>
			<div>
				<span>주소 </span>
				<input type="text" name="m_address"  style="font-size: 90%;" required="required"  value="<%=loginMember.getM_address()%>">
				<p>예시)서울 영등포구 양산로 53 (양평동3가 월드메르디앙비즈센터) 4층 일부 </p>
			</div>
			<div>
				<span>휴대폰번호 </span>
				<input type="text" name="m_tel1"  maxlength="3" pattern="[0-9]{3}" value="<%=(loginMember.getM_tel()).substring(0, 3) %>" style="width: 33%;" required="required">
				
				<input type="text" name="m_tel2"  maxlength="4" pattern="[0-9]{3,4}" value="<%=(loginMember.getM_tel()).substring(3, 7) %>"  style="width: 33%;" required="required">
				
				<input type="text" name="m_tel3"  maxlength="4" pattern="[0-9]{4}" value="<%=(loginMember.getM_tel()).substring(7, 11) %>"  style="width: 33%;" required="required">
			<p>앞자리 중간자리 뒷자리</p>
			</div>

		</div>

			

			<footer>
				<input type="submit" value="수정완료" id="updateMemberForm_updateMemberForm_submitButton"  
					
						onclick="successUpdateMember();">
			</footer>
		</form>


</div><!-- updateMemberForm End -->
<script type="text/javascript">
	function successUpdateMember(){
		var m_name =document.getElementsByName("m_name")[0].value;
		var m_address =document.getElementsByName("m_address")[0].value;
		var m_tel1 =document.getElementsByName("m_tel1")[0].value;
		var m_tel2 =document.getElementsByName("m_tel2")[0].value;
		var m_tel3 =document.getElementsByName("m_tel3")[0].value;
		if(m_name==""){
			alert("이름은 공백일 수 없습니다");
		}else if(m_address==""){
			alert("주소는 공백일 수 없습니다");
		}else if(m_tel1==""){
			alert("휴대전화 앞자리는 공백일 수 없습니다");
		}else if(m_tel2==""){
			alert("휴대전화 중간자리는 공백일 수 없습니다");
		}else if(m_tel3==""){
			alert("휴대전화 끝자리는 공백일 수 없습니다");
		}else{
			alert("회원님의 개인정보가 수정되었습니다"); 
			 document.updateMemberForm.submit();  
		}
		
		 
 		
	}

</script>






<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>
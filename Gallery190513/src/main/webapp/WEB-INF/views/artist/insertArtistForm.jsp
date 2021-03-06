<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%
MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); 
int m_grade =loginMember.getM_grade();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style type="text/css">
	
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

<script type="text/javascript">
$(function() {
	$(".solo").click(function() {
		$("#plussolo").append("<br/><input type='text' name='solo'>");
	});
	
	$(".squard").click(function() {
		$("#plussquard").append("<br/><input type='text' name='squard'>");
	});
	
	$(".career").click(function() {
		$("#pluscareer").append("<br/><input type='text' name='career'>");
	});
	
	
});



</script>
<link rel="stylesheet" href="artist/css/insertArtistForm.css">
</head>
<body style="overflow-x:hidden;">

<jsp:include page="/WEB-INF/views/header.jsp" />

<div class="row justify-content-center pb-5" style="padding-top: 2%;">
			<div class="col heading-section text-center ftco-animate"
				style="z-index: 99;">
				<span class="subheading">Best ARTIST</span> <img alt="로고"
					src="logo/newLogo1.png" width="10%">
				<p></p>
				<p>A place to invite new and creative artists</p>
			</div>
		</div>



<div id="insertArtistForm">
		<h3>작가 신청</h3>
			<p>1. 경력사항을 작성 합니다. </p>
			<p>2. [매니저 검토 & 승인]  </p>
			<p>3. [승인완료] 작가로 활동 가능합니다. </p>
		<form action="insertartist.do" method="get">
			<div id="insertArtistForm_table">
				<div class="insertArtistForm_tr">
					<div class="insertArtistForm_cell_title">
						<h5>개인전 경력 </h5>
					</div>
					<div class="insertArtistForm_cell_text">
						<span id="plussolo"><input type="text" name="solo" id="solo" ></span>
						<span><input type="button" value="경력추가" class="solo" id="soloPlusbutton"> </span>
					</div>
				</div>
				
				<div class="insertArtistForm_tr">
					<div class="insertArtistForm_cell_title">
						<h5>단체전</h5>
					</div>
					<div class="insertArtistForm_cell_text">
						<span id="plussquard">  <input type="text" name="squard" ></span>
						<span><input type="button" value="경력추가" class="squard" id="squardPlusbutton"> </span>
					</div>
				</div>
				
				<div class="insertArtistForm_tr">
					<div class="insertArtistForm_cell_title">
						<h5>수상경력 </h5>
					</div>
					<div class="insertArtistForm_cell_text">
						<span id="pluscareer"> <input type="text" name="career" ></span>
						<span><input type="button" value="경력추가" class="career" id="careerPlusbutton"> </span>
					</div>
				</div>
			</div><!-- insertArtistForm_table END -->
			<div id="insertArtistForm_submit_div">
				<input type="submit" value="작가신청" id="insertArtistForm_submit_button">
			</div>
			
			
			
			<input type="hidden" name="a_state" value="1" >
			<input type="hidden" name="a_no" value="<%=loginMember.getM_no() %>" > <!-- 세션값 가져오기 -->
			<input type="hidden" name="a_name" value="<%=loginMember.getM_name() %>" > <!-- 세션값 가져오기 -->
			<input type="hidden" name="m_grade" value="4" >
			<input type="hidden" name="m_no" value="<%=loginMember.getM_no() %>">
			<input type="hidden" name="m_id" value="<%=loginMember.getM_id()%>">
			<input type="hidden" name="m_name" value="<%=loginMember.getM_name() %>">
			<input type="hidden" name="m_address" value="<%=loginMember.getM_address() %>">
			<input type="hidden" name="m_tel" value="<%=loginMember.getM_tel() %>">
			
			


		
		
		</form>
</div><!-- insertArtistForm END -->

<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>
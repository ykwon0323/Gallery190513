<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%List<ItemDto> myItemList =(List<ItemDto>) request.getAttribute("myItemList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매목록</title>
<link rel="stylesheet" href="login/css/myItemList.css">
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
<<<<<<< HEAD
<div id="myItemList">
	<div class="row justify-content-center pb-5" >
=======
	<
	<div class="row justify-content-center pb-5"  style="margin-bottom: -5%; padding-top: 2%;">
>>>>>>> branch 'master' of https://github.com/ykwon0323/Gallery190513.git
          <div class="col heading-section text-center ftco-animate" style="z-index:;">
<<<<<<< HEAD
          	<span class="subheading">My Art Collection</span>
          <!--   <h2 class="mb-4">방구석 갤러리</h2> -->
           <img alt="로고" src="logo/newLogo1.png" width="10%">
            <p></p>
=======
          	<span class="subheading">My Item</span>
            <img alt="로고" src="logo/newLogo1.png" width="10%">
            <p></p>
            <p>List of works you have purchased</p>
>>>>>>> branch 'master' of https://github.com/ykwon0323/Gallery190513.git
          </div>
        </div>
	
	
		<h3>작품 구매목록</h3>
			
		<%if(myItemList.size()==0){ %>
			<div id="myItemList_noItem">
				<h5>구매완료 된 작품이 없습니다</h5>
				<h6>작품 구매절차</h6>
				<h6>1. 보고싶은 전시를 감상합니다</h6>
				<h6>2. 마음에 드는 작품 구매버튼 클릭</h6>
				<h6>3. 경매를 통해 구매 완료!</h6>
			</div>
		<%}else{ %>
		<p>회원님께서 구매하신 작품 목록 입니다.</p>
			<p>전시의 감동을 다시 한번 느끼고싶으시다면?<br> [전시감상]을 클릭해주세요<p>
		<div id="myItemList_table">
			<div style="display: table-row-group;
						width: 100%;
						background-color: white; ">
				<div style="text-align: center;
							display: table-cell;
							width: 50%;
							padding-bottom:2%;">
					<span style="font-size: 120%;
								 font-weight: bold;
								 font-color:rgb(150,150,150);">작품</span>
								
				</div>
				<div  style=" display: table-cell;
								width: 50%;
								text-align: center;
								padding-bottom: 2%;">
					<span style="font-size: 120%;
								 font-weight: bold; 
								  font-color:rgb(150,150,150);">구매정보</span>
								
								
				</div>
			</div>
			
		<% for(int i= 0 ; i<myItemList.size();i++){%>
			<div class="myItemList_tr">
				<div class="myItemList_cell_img">
					<img src="itemupload/<%=myItemList.get(i).getI_img()%>" width="50%" 
					style="
					<%if(i%7==0){ %>border:30px solid rgb(215,0,15);<%}
					else if(i%7==1){ %>border:30px solid rgb(129,130,174);<%}
					else if(i%7==2){ %>border:30px solid rgb(134,157,117);<%}
					else if(i%7==3){ %>border:30px solid rgb(234,85,4);<%}
					else if(i%7==4){ %>border:30px solid rgb(24,121,114);<%}
					else if(i%7==5){ %>border:30px solid rgb(113,141,96);<%}
					else if(i%7==6){ %>border:30px solid rgb(190,45,86);<%}%> box-shadow:10px 10px 30px rgba(26,26,26,0.7);border-radius: 5px;">
				</div>
				<div class="myItemList_cell_explain">
					<div class="myItemList_cell_explain_box">
						<span class="myItemList_cell_explain_upLine_first">작품명 </span><span class="myItemList_cell_explain_upLine_title"> <%=myItemList.get(i).getI_name()%></span><br>
						<span  class="myItemList_cell_explain_downLine_first">구매가격 </span><span class="myItemList_cell_explain_downLine_title"> <%=myItemList.get(i).getI_price()%>￦</span><br>
							<div class="myItemList_cell_explain_moveForm">
							<form action="detailExhibition.do" method="post">
								<input type="hidden" value=<%=myItemList.get(i).getE_no()%> name="e_no">
							<input type="submit" value="전시감상">
						</form>
					</div>
					</div>
				</div>
				
			</div>
		
		<%} //for END%>
			</div>
		<%}//else END%>
		
	</div><!-- myItemList END -->



<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>
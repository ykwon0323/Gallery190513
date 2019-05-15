<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<style>
#tail{
	margin: 0;
	padding: 0;
	background-color: rgb(40,40,40);
	width:100%;
	
	position: inherit;
	left: 0;
	bottom: 0;
	
}
#tail_navi {
	
	width:70%;
	margin-left: 15%;
	margin-right: 15%;
}
#tail_navi div{
	margin:0;
	width: 25%;
	text-align: center;
	font-weight: bold;
	font-size: 100%;
	color: white;
	text-decoration: none;
	float: left;
	padding-top: 2%;
	padding-bottom:1.5%;
	border-bottom: 2px solid rgba(255,255,255,0.3);

}
#tail_navi a{
margin:0;
	
	text-align: center;
	font-weight: bold;
	font-size: 100%;
	color: white;
	text-decoration: none;
	
}
#tail_navi a:hover{
	margin:0;
	
	text-align: center;
	font-weight: bold;
	font-size: 100%;
	color: rgb(204,255,102);
	text-decoration: none;
	

}


#tail_text_table{
	width: 70%;
	margin-left: 15%;
	margin-right: 15%;
	display: table;
	padding-top:1%;
	padding-bottom: 2%;
}
#tail_text_tr{
	display:table-row-group;
	width: 100%;
}
#tail_logo{
	display:table-cell;
	width: 45%;
	margin: 0 ;
	margin-left: 25%;
		
	
}
#tail_logo img{
	width: 100%;
	padding-left: 40%;
	padding-right:40%; 

	
}
#tail_logo p{
margin:0;
	width: 100%;
	text-align: center;;
	font-size:80%;
	color: white;
	padding-top:5%;

}

#tail_info{
	display:table-cell;
	width:55%;
	vertical-align: middle;
	padding-left: 5%;
	border-left: 2px solid rgba(255,255,255,0.3);
	
}
#tail_info p{
	margin:0;
	width: 100%;
	text-align: left;
	font-size:80%;
	color: white;
}
</style>


<div id="tail">


	<div id="tail_navi">
			<div>
			<a href="exhibitionlist.do">전시</a>	
			</div>
			<div>
			<a href="artistlist.do">작가</a>
			</div>
			<div>
			<a href="gallerylist.do">갤러리</a>
			</div>
			<div>
			<a href="kyungmaelist.do">경매</a>
			</div>
	</div>
	<div id="tail_text_table">
		<div id="tail_text_tr">
			<div id="tail_logo">
				<img alt="로고" src="logo/newLogo2.png"width="20%">
				<p>ⓒ2019- Extreme Manual All rights reserved.</p>
				
			</div>
			<div id="tail_info">
			
				 <p>상호명 : WEB-GALLERY</p>
			
				<p>소재지 : 서울시 영등포구 월드메리디앙 비즈센터 401호 3강의실  1조 테이블</p>
			
				<p>팀원 : 김태익 서윤정 이민규 조용권 </p>
				
				<p>문의안내 : 1577-1577</p>
				<p style="text-align: right;">무단전재 및 재배포 금지</p>
			
				
			</div>
		</div>
	</div>
	
	
</div>
<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.KyungmaeDto"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%List<KyungmaeDto> nowKyungmaeList =(List<KyungmaeDto>) request.getAttribute("nowKyungmaeList"); %>
<%List<KyungmaeDto> onKyungmaeList =(List<KyungmaeDto>) request.getAttribute("onKyungmaeList"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경매목록</title>
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
<link rel="stylesheet" href="kyungmae/css/kyungmaeList.css">

<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
<script>
var regDate0 = "";
var regDate1 = "";
var regDate2 = "";

var stTime ;

var edTime0 ;
var edTime1 ;
var edTime2 ;

var RemainTime0 ; 
var RemainTime1 ;
var RemainTime2 ;

$(document).ready(function(){
	nowkyungmaeList_size =  document.getElementById("nowkyungmaeList_size").value;
	if(nowkyungmaeList_size>=3){
		 regDate0 = document.getElementById("kyungmaeList_nowKyungmaeList_regdate_0").value+" 24:00:00 ";
		 regDate1 = document.getElementById("kyungmaeList_nowKyungmaeList_regdate_1").value+" 24:00:00 ";
		 regDate2 = document.getElementById("kyungmaeList_nowKyungmaeList_regdate_2").value+" 24:00:00 ";

		 stTime = new Date().getTime();

		 edTime0 = new Date(regDate0).getTime();
		 edTime1 = new Date(regDate1).getTime();
		 edTime2 = new Date(regDate2).getTime();

		 RemainTime0 = edTime0 - stTime; 
		 RemainTime1 = edTime1 - stTime;
		 RemainTime2 = edTime2 - stTime;
		
		tid=setInterval('msg_time(3)',1000);
	}
	if(nowkyungmaeList_size==2){
		regDate0 = document.getElementById("kyungmaeList_nowKyungmaeList_regdate_0").value+" 24:00:00 ";
		 regDate1 = document.getElementById("kyungmaeList_nowKyungmaeList_regdate_1").value+" 24:00:00 ";
		 stTime = new Date().getTime();
		 edTime0 = new Date(regDate0).getTime();
		 edTime1 = new Date(regDate1).getTime();
		 RemainTime0 = edTime0 - stTime; 
		 RemainTime1 = edTime1 - stTime;
		 tid=setInterval('msg_time(2)',1000);
	}
	if(nowkyungmaeList_size==1){
		regDate0 = document.getElementById("kyungmaeList_nowKyungmaeList_regdate_0").value+" 24:00:00 ";
		 stTime = new Date().getTime();
		 edTime0 = new Date(regDate0).getTime();
		 RemainTime0 = edTime0 - stTime; 
		
		 tid=setInterval('msg_time(1)',1000);
	}
	
});

function msg_time(branch){
	if(branch==3){
	var hours0 = Math.floor((RemainTime0 % (1000 * 60 * 60 * 24)) / (1000*60*60));
	var miniutes0 = Math.floor((RemainTime0 % (1000 * 60 * 60)) / (1000*60));
	var seconds0 = Math.floor((RemainTime0 % (1000 * 60)) / 1000);
	
	var hours1 = Math.floor((RemainTime1 % (1000 * 60 * 60 * 24)) / (1000*60*60));
	var miniutes1 = Math.floor((RemainTime1 % (1000 * 60 * 60)) / (1000*60));
	var seconds1 = Math.floor((RemainTime1 % (1000 * 60)) / 1000);

	var hours2 = Math.floor((RemainTime2 % (1000 * 60 * 60 * 24)) / (1000*60*60));
	var miniutes2 = Math.floor((RemainTime2 % (1000 * 60 * 60)) / (1000*60));
	var seconds2 = Math.floor((RemainTime2 % (1000 * 60)) / 1000);
	
	if(hours0<10){
		hours0 = '0'+hours0;
		hours1 = '0'+hours1;
		hours2 = '0'+hours2;
	}

	if(miniutes0<10){
		miniutes0 = '0'+miniutes0;
		miniutes1 = '0'+miniutes1;
		miniutes2 = '0'+miniutes2;
	}

	if(seconds0<10){
		seconds0 = '0'+seconds0;
		seconds1 = '0'+seconds1;
		seconds2 = '0'+seconds2;
	}
	
	 m0 = hours0 + ":" +  miniutes0 + ":" + seconds0 ;
	 m1 = hours1 + ":" +  miniutes1 + ":" + seconds1 ;
	 m2 = hours2 + ":" +  miniutes2 + ":" + seconds2 ;
			
	 
	 document.all.timer0.innerHTML = m0;
	 document.all.timer1.innerHTML = m1;
	 document.all.timer2.innerHTML = m2;
	 
	 if(RemainTime0<0){
		 document.all.timer0.innerHTML = "경매가 종료되었습니다";
		 $(".kyungmaeList_updateKyungmae_submit").css("display","none");
		
	 }else{
		 RemainTime0 = RemainTime0 -1000;
	 }
	 if(RemainTime1<0){
		 document.all.timer1.innerHTML = "경매가 종료되었습니다";
		 $(".kyungmaeList_updateKyungmae_submit").css("display","none");
	 }else{
		 RemainTime1 = RemainTime1 -1000;
	 }
	 if(RemainTime2<0){
		 document.all.timer2.innerHTML = "경매가 종료되었습니다";
		 $(".kyungmaeList_updateKyungmae_submit").css("display","none");
	 }else{
		 RemainTime2 = RemainTime2 -1000;
	 }
	}if(branch==2){
		var hours0 = Math.floor((RemainTime0 % (1000 * 60 * 60 * 24)) / (1000*60*60));
		var miniutes0 = Math.floor((RemainTime0 % (1000 * 60 * 60)) / (1000*60));
		var seconds0 = Math.floor((RemainTime0 % (1000 * 60)) / 1000);
		
		var hours1 = Math.floor((RemainTime1 % (1000 * 60 * 60 * 24)) / (1000*60*60));
		var miniutes1 = Math.floor((RemainTime1 % (1000 * 60 * 60)) / (1000*60));
		var seconds1 = Math.floor((RemainTime1 % (1000 * 60)) / 1000);

		if(hours0<10){
			hours0 = '0'+hours0;
			hours1 = '0'+hours1;
			
		}

		if(miniutes0<10){
			miniutes0 = '0'+miniutes0;
			miniutes1 = '0'+miniutes1;
			
		}

		if(seconds0<10){
			seconds0 = '0'+seconds0;
			seconds1 = '0'+seconds1;
		}
		
		 m0 = hours0 + ":" +  miniutes0 + ":" + seconds0 ;
		 m1 = hours1 + ":" +  miniutes1 + ":" + seconds1 ;
		
				
		 
		 document.all.timer0.innerHTML = m0;
		 document.all.timer1.innerHTML = m1;
		
		 
		 if(RemainTime0<0){
			 document.all.timer0.innerHTML = "경매가 종료되었습니다";
			 $(".kyungmaeList_updateKyungmae_submit").css("display","none");
			
		 }else{
			 RemainTime0 = RemainTime0 -1000;
		 }
		 if(RemainTime1<0){
			 document.all.timer1.innerHTML = "경매가 종료되었습니다";
			 $(".kyungmaeList_updateKyungmae_submit").css("display","none");
		 }else{
			 RemainTime1 = RemainTime1 -1000;
		 }
		
		
	}if(branch==1){
		var hours0 = Math.floor((RemainTime0 % (1000 * 60 * 60 * 24)) / (1000*60*60));
		var miniutes0 = Math.floor((RemainTime0 % (1000 * 60 * 60)) / (1000*60));
		var seconds0 = Math.floor((RemainTime0 % (1000 * 60)) / 1000);
		
		
		
		if(hours0<10){
			hours0 = '0'+hours0;
			
		}

		if(miniutes0<10){
			miniutes0 = '0'+miniutes0;
			
		}

		if(seconds0<10){
			seconds0 = '0'+seconds0;
		
		}
		
		 m0 = hours0 + ":" +  miniutes0 + ":" + seconds0 ;
	
				
		 
		 document.all.timer0.innerHTML = m0;
	
		 
		 if(RemainTime0<0){
			 document.all.timer0.innerHTML = "경매가 종료되었습니다";
			 $(".kyungmaeList_updateKyungmae_submit").css("display","none");
			
		 }else{
			 RemainTime0 = RemainTime0 -1000;
		 }
		
	}
}

//경매 관련 스크립트
function insertKyungmaeButton(i_no){
	
	var aa= window.open('insertKyungmaeform.do?i_no='+i_no,'window팝업','width=500, height=600,menubar=no,status=no,toolbar=no');
}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
		
		
		<div class="row justify-content-center pb-5" style="padding-top: 2%;">
			<div class="col heading-section text-center ftco-animate"
				style="z-index: -1;">
				<span class="subheading">Best Auction</span> <img alt="로고"
					src="logo/newLogo1.png" width="10%">
				<p></p>
				<p>A place to buy new and creative artists</p>
			</div>
		</div>

			<div id="kyungmaelist"  >

		

		<div id="kyungmaeList_nowKyungmaeList">	
						<input type="hidden" id="nowkyungmaeList_size" value=<%=nowKyungmaeList.size()%>>
						<%//오늘 마감 경매 하나라도 있을때 (대)
							if(nowKyungmaeList.size()!=0){
								//오늘 마감 경매 3개 이상 일때(중)
								if(nowKyungmaeList.size()>=3){
									%>
									<div id="kyungmaeList_nowKyungmaeList_over3_table">
									<div id="kyungmaeList_nowKyungmaeList_over3_row">
							   		 <%//오늘 마감 경매 3개 이상 일때 for문
										for(int i = 0; i<3 ; i++) {%>
										
										<div class="kyungmaeList_nowKyungmaeList_over3_cell" 
										style="background: url('itemupload/<%=nowKyungmaeList.get(i).getI_img()%>') no-repeat center center ; background-size: cover; "
										>
										
												<p id="timer<%=i%>" 
												style="text-align: center;
														font-weight: bold;
														font-size: 350%;
														color: red;
														width:80%;
														margin: 0 auto;
														background-color: rgba(255,255,255,0.9);'">

												</p>
												
													<h4><%=nowKyungmaeList.get(i).getI_name()%></h4>
													<h5><%=nowKyungmaeList.get(i).getK_first_price()%>￦</h5>
													<input type="hidden"  id="kyungmaeList_nowKyungmaeList_regdate_<%=i%>" value="<%=nowKyungmaeList.get(i).getK_regdate()%>">
													<%if(loginMember!=null){ %>
													<input type="button" value="구매하기" onclick="insertKyungmaeButton(<%=nowKyungmaeList.get(i).getI_no()%>)">
													<%}else{ %>
													<form action="loginform.do" method="post">
														<input type="submit" value="로그인">
													</form>
												
												<%} %>
												
										</div>
								
											<%} //오늘 마감 경매 3개 이상 일때 for문 END%> 
												</div><!-- kyungmaeList_nowKyungmaeList_over3_row END -->
												</div><!-- 	kyungmaeList_nowKyungmaeList_over3_table END -->
								<%}//오늘 마감 경매 3개 이상 일때 END (중)%>
									<%//오늘 마감 경매 3개 이하 일때 (중)
									  if(nowKyungmaeList.size()<3){ %>
									  <div id="kyungmaeList_nowKyungmaeList_less3_table">
									  <div id="kyungmaeList_nowKyungmaeList_less3_row" >
									  		
									   <%//오늘 마감 경매 3개이하 일때 for문
										for(int i = 0; i<nowKyungmaeList.size() ; i++) {%>
										
										<div class="kyungmaeList_nowKyungmaeList_less3_cell" 
										<%if(nowKyungmaeList.size()==1){%>style="width:auto; height:100;background: url('itemupload/<%=nowKyungmaeList.get(i).getI_img()%>') no-repeat center center ; background-size: cover;"<%}%>
									  	<%if(nowKyungmaeList.size()==2){%>style="width:50%; height:100;background: url('itemupload/<%=nowKyungmaeList.get(i).getI_img()%>') no-repeat center center ; background-size: cover;"<%}%>>
										
												<p id="timer<%=i%>" 
												style="text-align: center;
														font-weight: bold;
														font-size: 350%;
														color: red;
														width:80%;
														margin: 0 auto;
														background-color: rgba(255,255,255,0.9);">

												</p>
												
													<h4><%=nowKyungmaeList.get(i).getI_name()%></h4>
													<h5><%=nowKyungmaeList.get(i).getK_first_price()%>￦</h5>
													<input type="hidden"  id="kyungmaeList_nowKyungmaeList_regdate_<%=i%>" value="<%=nowKyungmaeList.get(i).getK_regdate()%>">
													<%if(loginMember!=null){ %>
													<input type="button" value="구매하기" onclick="insertKyungmaeButton(<%=nowKyungmaeList.get(i).getI_no()%>)">
													<%}else{ %>
													<form action="loginform.do" method="post">
														<input type="submit" value="로그인">
													</form>
												
												<%} %>
												
										</div>
										
									<%}%><!-- 3개이하일때 for문 끝 -->
									</div><!-- kyungmaeList_nowKyungmaeList_less3_row END -->
										</div><!-- kyungmaeList_nowKyungmaeList_less3_table  END-->
									
									
									   <%}//오늘 마감 경매 3개 이하 일때 END(중)%>
										
								<%}//오늘 마감 경매 하나라도 있을때 END (대)
								else{%>
								
								<%}%>
				</div><!-- kyungmaeList_nowKyungmaeList END -->
			
				<div id="kyungmaeList_onKyungmaeList" >
					<h3>진행중인 모든 경매</h3>
					<%if(onKyungmaeList.size()!=0) {
						%>
						<div id="kyungmaeList_onKyungmaeList_table">
						<% 
						for(int i =0 ; i<onKyungmaeList.size() ; i++){
						%>
							<%if(i==0||i%2==0) {%>
							<div class="kyungmaeList_onKyungmaeList_tr">
							<%} %>
							<div class="kyungmaeList_onKyungmaeList_cell" style="width:50%; height:100;background: url('itemupload/<%=onKyungmaeList.get(i).getI_img()%>') no-repeat center center ; background-size: cover;">
							<p>Until . <%=onKyungmaeList.get(i).getK_regdate()%></p>
							<h4><%=onKyungmaeList.get(i).getI_name() %></h4>
							<h5><%=onKyungmaeList.get(i).getK_first_price()%>￦</h5>
							
							<%if(loginMember!=null){ %>
								<input type="button" value="구매하기" onclick="insertKyungmaeButton(<%=onKyungmaeList.get(i).getI_no()%>)"
								 class="kyungmaeList_updateKyungmae_submit">
								<%}else{ %>
								<form action="loginform.do" method="post">
									
									<input type="submit" value="로그인">
								</form>
								<%} %>
							</div><!-- cell END -->
							<%if(i==onKyungmaeList.size()-1||i%2==1){ %>
							
								<%if(i==onKyungmaeList.size()-1){%>
								</div>
								<div id="kyungmaeList_onKyungmaeList_cell_finish">
									
									<span  style="padding: 0; font-size:800%;font-weight: bold;">끄</span>
									<img src="kyungmae/images/gif_106.gif" width="50%">
									<span  style="padding: 0; font-size: 800%;font-weight: bold;">읕</span>
								</div>
								<%}else{ %>
							</div>
							<%}} %>
							
						<%}//for문 END%>
						
						</div>
						
						<%}//if문 END
						else{%>				
						<h3>현재 진행중인 경매가 없습니다.</h3>
					<%}%>
					
					
					
					
					
					
				</div><!-- kyungmaeList_onKyungmaeList END -->
				
				
				
			</div><!-- kyungmaelist END -->

<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>
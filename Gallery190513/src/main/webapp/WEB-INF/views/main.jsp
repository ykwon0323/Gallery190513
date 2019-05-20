<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.KyungmaeDto"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%List<KyungmaeDto> nowKyungmaeList =(List<KyungmaeDto>) request.getAttribute("nowKyungmaeList"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>realMain</title>
<link rel="stylesheet" href="Main/css/main.css">
</head>
<jsp:include page="/WEB-INF/views/header.jsp" />
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
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
	/*  document.all.timer_0.innerHTML = m0; */
	
	 
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

$( document ).ready( function() {
    $('h2.fadeIn1').slideDown( 2000 );
    $('h2.fadeIn2').fadeIn( 2200 );
    $('h2.fadeIn3').slideDown( 2400 );
    $('h2.fadeIn4').fadeIn( 5000 );
    $('h2.fadeIn5').slideDown( 2800 );
    $('h2.fadeIn6').fadeIn( 3000 );
    $('#main_scroll_button').fadeIn(3400 );
    
  } );



</script>
<body>	
	<div id="main_up_button">
		<a href="#main_event_textBox"><img alt="up" src="Main/images/upgif.gif" width="4%" style="opacity: 0.5;"></a>
	</div>
	
	<div id="main">
		<div id="main_event_textBox">
		<!-- 	<div id="main_event_watch">
						<a href="#kyungmaeList_nowKyungmaeList"><span id="timer_0"></span></a>
					</div> -->
			<div id="main_event_textBox_table">
				<div id="main_event_textBox_tr">
					<div class="main_event_text_cell">
						<h2 class="fadeIn1">아</h2>
					    <h2 class="fadeIn1">몰</h2>
					    <h2 class="fadeIn1">라</h2>
					    
					    <h2 class="fadeIn2"  style="color: white;">집</h2>
					    <h2 class="fadeIn2">이</h2>
					    <h2 class="fadeIn2">최</h2>
					    <h2 class="fadeIn2">고</h2>
					    <h2 class="fadeIn2">야</h2>
					</div>
					<div class="main_event_text_cell">
					<h2 class="fadeIn3">느</h2>
				    <h2 class="fadeIn3">그</h2>
				    <h2 class="fadeIn3">집</h2>
				    <h2 class="fadeIn3">말</h2>
				    <h2 class="fadeIn3">고,</h2>
				    
				    <h2 class="fadeIn4"style="color: white;">우</h2>
				    <h2 class="fadeIn4"style="color: white;">리</h2>
				    <h2 class="fadeIn4"style="color: white;">집</h2>
					</div>
					<div class="main_event_text_cell">
						<h2 class="fadeIn5">세</h2>
					    <h2 class="fadeIn5">상</h2>
					    <h2 class="fadeIn5">가</h2>
					    <h2 class="fadeIn5">장</h2>
											
					    <h2 class="fadeIn6"style="color: white;">아</h2>
					    <h2 class="fadeIn6"style="color: white;">늑</h2>
					    <h2 class="fadeIn6"style="color: white;">한</h2>
					    <h2 class="fadeIn6"style="color: white;">곳</h2>
					</div>
					<div class="main_event_text_cell">
						<h2 class="fadeIn6">상</h2>
					    <h2 class="fadeIn6">상</h2>
					  
					   
					</div>
					<div class="main_event_text_cell">
						<h2 class="fadeIn5">가</h2>
						 <h2 class="fadeIn6">의</h2>
					</div>
					
					<div class="main_event_text_cell">
						<h2 class="fadeIn4">장</h2>
						<h2 class="fadeIn6">날</h2>
					</div>
					
					<div class="main_event_text_cell">
						<h2 class="fadeIn3"style="color: white;">편</h2>
						<h2 class="fadeIn6">개</h2>
					</div>
					
					<div class="main_event_text_cell">
						<h2 class="fadeIn3"style="color: white;">안</h2>
						<h2 class="fadeIn6">쫙</h2>
					</div>
					
					<div class="main_event_text_cell">
						<h2 class="fadeIn3"style="color: white;">한</h2>
					</div>
					
					<div class="main_event_text_cell">
							<h2 class="fadeIn3">나</h2>
							<h2 class="fadeIn4">의</h2>
							
							<br>
							<br>
							<br>
						
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<h2 class="fadeIn4" style="color: white;">#</h2>
							<h2 class="fadeIn4" style="color: white;">방</h2>
							<h2 class="fadeIn4" style="color: white;">구</h2>
							<h2 class="fadeIn4" style="color: white;">석</h2>
					
							
					</div>
					
	
				</div>	
			</div>
				<div id="main_scroll_button">
					<img alt="up" src="Main/images/scrolgif.gif" width="4%" style="opacity: 0.7;">
				</div>
			
		</div><!-- main_event_textBox END-->
		<div id="main_information">
			<h2 style="	width:100%;
		
						font-size: 500%;
						font-weight: normal;
						text-align: center;
						padding-bottom: 1.5%;">
						방·갤 이용안내</h2>
			<div id="main_information_table">
				
				<div class="main_information_tr">
					<div class="main_information_div_text" >
						<h3>세상편한 작품 감상</h3>
						<p>누구 눈치볼 것 없이 방구석에서 
						<span style="color:red; border-bottom: 3px solid rgba(250, 30, 4,1); padding-bottom: 3px;">세상가장 편한자세로
						 </span> 작품을 감상합니다</p>
					</div>
					<div class="main_information_div_img">
						<img alt="편한작품감상사진" src="Main/images/watching.jpg" width="100%">
					</div>
				</div>
				<div class="main_information_tr">
					<div class="main_information_div_img">
						<img alt="작가사진" src="Main/images/artist.jpg" width="100%" >
						
					</div>
					<div class="main_information_div_text" >
						<h3>간편한 작가 데뷔</h3>
						<p>계약, 거래
						 <span style="color:red; border-bottom: 3px solid rgba(250, 30, 4,1); padding-bottom: 3px;">
						 복잡할 것 없이</span>  세상에 자신의 전시를 보여주세요!</p>
					</div>
				
				</div>
				<div class="main_information_tr">
					<div class="main_information_div_text">
						<h3>#성공적 .갤러리</h3>
						<p>방구석 여론을 통합하여 
						 <span style="color:red; border-bottom: 3px solid rgba(250, 30, 4,1); padding-bottom: 3px;">
						 신인작가 발굴,트랜드 분석,갤러리 홍보효과 </span>GET!</p>
					</div>
					<div class="main_information_div_img">
						<img alt="갤러리사진" src="Main/images/gallery.jpg" width="100%">
					</div>
				</div>
				<div class="main_information_tr">
						<div class="main_information_div_img" style="background-color: rgba(140, 183, 247,0.5); text-align: center; padding:10px;" >
						<img alt="경매사진" src="Main/images/kyungmae.png" width="70%">
					</div>
					<div class="main_information_div_text">
						<h3>#onAir Auction</h3>
						<p>
						 <span style="color:red; border-bottom: 3px solid rgba(250, 30, 4,1); padding-bottom: 3px;">
						실시간</span>으로 제공되는 경매서비스를 통해 당신만의 작품을 GET! </p>
					</div>
				
				</div>
				
			</div><!-- information table END -->
		
		</div><!-- main_information END -->
		
		<!-- hot 경매 테이블  -->
		
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
														font-family: 'a스피드';
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
		
		<!-- 서비스 소개 -->
		
		
		
		
		
		
	</div>
	
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>

</html>
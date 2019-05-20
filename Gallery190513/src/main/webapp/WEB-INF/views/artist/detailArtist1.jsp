<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%ArtistDto artistDto = (ArtistDto)request.getAttribute("artistDto"); %>
	<%List<ItemDto> ilist =(List<ItemDto>)request.getAttribute("itemDto"); %>
	<%List<ExhibitionDto> elist =(List<ExhibitionDto>)request.getAttribute("exhibitionDto"); %>
	<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link rel="stylesheet" href="A_detail/css/bootstrap.css">
        <link rel="stylesheet" href="A_detail/css/magnific-popup.css">
        <link rel="stylesheet" href="A_detail/css/style.css">
        <link rel="stylesheet" href="A_detail/css/responsive.css" />
   		<script src="A_detail/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Hi+Melody|Poor+Story|Sunflower:300" rel="stylesheet">
   
		
<title>상세보기</title>


<style type="text/css">
	
	.exhibition_containerDetail:hover #exhibitioning{
		color:red;
		
	}
	
	
	.exhibition_container{
		display: none;
	}
	.artist_container{
		display: none;
		border: 2px solid black;
		border-radius: 20px;
		width: 450px;
    	height: auto;
    	margin: auto;
    		background-image: url("logo/car.jpg");
		background-color: #ffffff;
        background-color: rgba( 255, 255, 255, 1.0 );
    	
}
	.artist_container:after{
	
        
	}
	div.alldetail_container{
		   width:100%;
    		margin: 0 auto;
    		font-family: 'Poor Story', cursive;
    	font-weight: bold;
    } 
    
    div.alldetail_container h4{
    	    width: 25%;
    font-weight: bold;
    padding-bottom: 10px;
    border-bottom: 3px solid rgb(26,26,26);
    color: rgb(50,50,50);
    }
       
.heading-section span{

	font-size: 16px;
    display: block;
    margin-bottom: 5px;
    text-transform: uppercase;
    color: #e2c0bb;
    letter-spacing: 2px;
    text-align: center!important;
      margin: 0;
    padding: 0;
    
}

.heading-section h2{
font-size: 40px;
    font-weight: 600;
line-height: 1.2;
    color: inherit;
    margin-top:8px;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    text-align: center!important;

}

.heading-section p{
   font-family: -apple-system,BlinkMacSystemFont;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;

}
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

function detail_itme() {
	var item = document.getElementById("item_container").style.display="block";
	var exhibition = document.getElementById("exhibition_container").style.display="none";
	var artist = document.getElementById("artist_container").style.display="none";
}

function detail_exhibition(){
	
	var item = document.getElementById("item_container").style.display="none";
	var exhibition = document.getElementById("exhibition_container").style.display="block";
	var artist = document.getElementById("artist_container").style.display="none";
}

function detail_artist(){
	var item = document.getElementById("item_container").style.display="none";
	var exhibition = document.getElementById("exhibition_container").style.display="none";
	var artist = document.getElementById("artist_container").style.display="block";
}

/* function pop(r_send,a_no,r_name,a_name) {
	var a = a_name;
	var aa = window.open('insertrequestform.do?r_send='+r_send+'&r_receive='+a_no+'&r_sendname='+r_name
	+'&r_receivename='+a_name,'window팝업','width=500, height=600, menubar=no, status=no, toolbar=no');
	

} */


</script>



</head>
<jsp:include page="/WEB-INF/views/header.jsp" />
<body style="overflow-x:hidden;">


<div class="alldetail_container"  style="width: 1200px; text-align: center;">

    <div class="row justify-content-center pb-5" >
          <div class="col heading-section text-center ftco-animate" style="z-index:;">
          	<span class="subheading">Best Artist</span>
            <h2 class="mb-4">방구석 갤러리</h2>
            <p>A place to introduce new and creative artists</p>
          </div>
        </div>

<h4><%=artistDto.getA_name() %>&nbsp&nbsp&nbsp작가</h4>
<%-- <span>	<%if(loginMember==null||loginMember.getM_grade()!=3){ %>
	<span></span>
	<%}else if(loginMember.getM_grade()==3){ %>
		<input type="button" value="전시 요청" 
		onclick="pop('<%=loginMember.getM_no()%>','<%=artistDto.getA_no() %>','<%=loginMember.getM_name() %>','<%=artistDto.getA_name() %>')" >
		<%} %></span> --%>

<div class="detail_container">
	<div class="artist_nav" style="margin-bottom: 75px;">
	<h3 style="font-weight: bold;">
		<span style=" color: black;" onclick="detail_itme()">작품&nbsp|</span>
		<span style=" color: black;" onclick="detail_exhibition()">전시&nbsp|</span>
		<span style=" color: black;" onclick="detail_artist()">이력</span>
	</h3>
	</div>
	<div class="item_container" id="item_container">
		
                <!-- Gallery container-->
              
		
		<div class="main-gallery roomy-80" style="overflow:hidden; padding-top: 25px;">
		<div class="grid text-center">
		<%for(ItemDto itemDto: ilist){ %>
			  
                                <div class="grid-item transition metal ium">
                                  	 <img alt="작품사진" src="itemupload/<%=itemDto.getI_img()%>" >
                                    <div class="grid_hover_area text-center">
                                        <div class="grid_hover_text m-top-110">
                                            <h6 class="text-white">작품명</h6>
                                            <h3 class="text-white"><em><%=itemDto.getI_name() %></em></h3>
                                            <a href="itemupload/<%=itemDto.getI_img()%>" class="popup-img text-white m-top-40">View<i class="fa fa-long-arrow-right"></i></a>
                                        </div>
                                    </div><!-- End off grid Hover area -->
                                </div><!-- End off grid item -->
		
			<%-- <div style="float: left: ;">
			<img alt="작품사진" src="itemupload/<%=itemDto.getI_img()%>" width="30%" ><br/>
			<span>작품명: <%=itemDto.getI_name()%></span>
			</div> --%>
		
		<%} %>
	</div>
	</div>
	</div>
	
	
	<div class="exhibition_container" id="exhibition_container"">
		
		<%for(ExhibitionDto exhibitionDto : elist){ %>
		<div class="exhibition_containerDetail" style="
					width:80%;
					float:; 
					border: 2px solid black;
					border-radius: 15px;
					overflow: hidden;
					margin: auto;   
					margin-bottom: 20px;
					max-height: 250px;">
		
		<span><img alt="작가대표이미지" src="exhibitionupload/<%=exhibitionDto.getE_img()%>" width="300px;" style="min-height: 250px; max-height: 250px; float: left;" ></span>
		<p style="font-size: 25px; font-weight: bold; margin-top: 20px;">전시 제목<p>
		<p style="font-size: 35px; font-weight: bold; margin-top: 60px"><%=exhibitionDto.getE_title() %></p>
		<p id="exhibitioning" style="font-size: 25px; font-weight: bold; margin-top: 60px">전시중 
		<a href="detailExhibition.do?e_no=<%=exhibitionDto.getE_no()%>"><img alt="전시회가기 아이콘" src="requestupload/gogoex.png" width="80px;"> </a></p>
		
		</div>
	<%} %>
	</div>
	
	<div class="artist_container" id="artist_container" style="margin-top: 50px; ">
		<div class="bgImage">
		<h3>개인</h3><p><%=artistDto.getA_solo() %></p><br/><br/>
		<h3>단체</h3><p><%=artistDto.getA_Squard() %></p><br/><br/>
		<h3>커리어</h3><p><%=artistDto.getA_career() %></p>
		</div>
	</div>
	</div>
	</div>

<jsp:include page="/WEB-INF/views/tail.jsp" />	
<!-- JS includes -->

      
        <script src="A_detail/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="A_detail/js/isotope.min.js"></script>
        <script src="A_detail/js/jquery.magnific-popup.js"></script>
        <script src="A_detail/js/slick.min.js"></script>
        <script src="A_detail/js/jquery.collapse.js"></script>
        <script src="A_detail/js/plugins.js"></script>
        <script src="A_detail/js/main.js"></script>
        
     
      


</body>

</html>
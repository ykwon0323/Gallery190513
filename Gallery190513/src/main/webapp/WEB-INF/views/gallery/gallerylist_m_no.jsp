<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@page import="com.hk1.gallery.dto.DabgeulDto"%>
<%@page import="java.util.List"%>    
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>




<!DOCTYPE html>
<html>
<head>


<% List<GalleryDto>list =(List<GalleryDto>)request.getAttribute("list"); %>



<title>갤러리 리스트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Hi+Melody|Poor+Story|Sunflower:300" rel="stylesheet">
    
        <link rel="stylesheet" href="boot_g/list/css/magnific-popup.css">
    <link rel="stylesheet" href="boot_g/list/css/animate.css">
    <link rel="stylesheet" href="boot_g/list/css/style.css">
    
    <style type="text/css">
    	  div.container h4{
    	    width: 25%;
    	font-weight: bold;
  	  padding-bottom: 10px;
  	  margin-bottom: 50px;
    	border-bottom: 3px solid rgb(26,26,26);
    	color: rgb(50,50,50);
    }
    </style>

</head>

<jsp:include page="/WEB-INF/views/header.jsp" />
<body>

	<div class="row justify-content-center pb-5"  style="padding-top: 2%;">
          <div class="col heading-section text-center ftco-animate" style="z-index: -1;">
          	<span class="subheading">Best Gallery</span>
            <img alt="로고"
					src="logo/newLogo1.png" width="10%">
				<p></p>
            <p>All the galleries you want</p>
          </div>
        </div>


    <div class="container">
    	
  <h4 style="width: 25%;
	font-family: inherit;
    font-weight: bold;
    padding-bottom: 10px;
    border-bottom: 3px solid rgb(26, 26, 26);
    text-align: center;
        line-height: 1.2;
            margin-bottom: .5rem;
                margin-top: 0;
                    margin: 0px 0px 10px;
                    font-family: 'Poor Story', cursive;
    font-size: 20px;
    color: rgb(50, 50, 50);">마이갤러리</h4>
    		<div class="row">
    			
    		<% 
		if(list.size()==0){
			%>

			<div class="col" style="text-align: center;">
			<h5>---등록된 갤러리가 없습니다.---</h5>
			</div>
			<% 

}else{
	for(GalleryDto dto:list){ %>
    		
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    				
    				
    				<!-- 이미지 부분  a 태그 안에는 디테일 페이지로 -->
    					<div class="img" style="width: 420px; height: 336px;">
    				<!-- 		<div class="vr"><span>뭐넣을지</span></div> -->
		    				<a href="selectGallery.do?g_no=<%=dto.getG_no()%>&g_return=one">
		    				<img class="img-fluid" alt="대표이미지" src="galleryupload/<%=dto.getG_img1()%>" style="width: 100%; height: 336px;">
		    				</a>
	    				</div>
	    				
	    				
	    				
	    				
	    				<div class="text">
	    					<!-- <h4 class="price">뭐넣을지1</h4>
	    					<span>15 Days Tour</span> -->
	    					<!-- 갤러리 이름부분 -->
	    					<h3><a href="selectGallery.do?g_no=<%=dto.getG_no()%>&g_return=one"><%=dto.getG_name()%></a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<!-- <span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span> -->
		    						
		    						<span><%=dto.getG_tel()%></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="deleteGallery.do?g_no=<%=dto.getG_no()%>">삭제</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="galleryupload/<%=dto.getG_img1()%>" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    		

		<%}}%>
	
    		

    
    		
    			</div>
    			
    			
    	<div class="row" style="margin-top: 30px; padding-bottom: 5%;">
  			<div style="margin: 0 auto;" >
  				<% int pagenum = (Integer)request.getAttribute("pagenum"); %>
	
		
		 	<%if(pagenum>1){
		 	for(int i =1; i<=pagenum;i++){%>
		 		
		 	<a href="selectM_noGalleryList.do?g_pcount=<%=i%>"><%=i%></a>
		 	
		 	<%}}%>
  			
  			</div>
  		</div>
    			
    			
    			
    	</div>



<%-- <div>




	<%
	
		for(GalleryDto dto:list){
			%>

<div id="Galletylist_Setion">
<div><img style="width: 100px; height: 100px;" alt="대표이미지" src="galleryupload/<%=dto.getG_img1()%>"></div>
<div><span>G_NO</span><a href="selectGallery.do?g_no=<%=dto.getG_no()%>&g_return=one"><%=dto.getG_no()%></a></div>
<div><span>M_NO</span><%=dto.getM_no()%></div>
<div><span>G_NAME</span><%=dto.getG_name()%></div>
<div><span>G_ADRESS</span><%=dto.getG_adress()%></div>
<div><span>G_TEL</span><%=dto.getG_tel()%></div>
<div><span>G_INTRO</span><%=dto.getG_intro()%></div>
<div><span>G_STATE</span><%=dto.getG_state()%></div>
<div><a href="deleteGallery.do?g_no=<%=dto.getG_no()%>">삭제</a></div>


</div>

			<% 
		}
	%>




</div> --%>






 <!-- loader -->
  

  <script src="boot_g/list/js/jquery.min.js"></script>
  <script src="boot_g/list/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="boot_g/list/js/jquery.waypoints.min.js"></script>
	<script src="boot_g/list/js/jquery.stellar.min.js"></script>
	<script src="boot_g/list/js/owl.carousel.min.js"></script>
	<script src="boot_g/list/js/jquery.magnific-popup.min.js"></script>
	<script src="boot_g/list/js/aos.js"></script>
	<script src="boot_g/list/js/scrollax.min.js"></script>
  <script src="boot_g/list/js/main.js"></script>




</body>
<jsp:include page="/WEB-INF/views/tail.jsp" />
</html>
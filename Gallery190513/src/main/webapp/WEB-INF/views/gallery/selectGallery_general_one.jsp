<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html;charset=utf-8");
%>
<%@page import="java.util.Calendar"%>
<%@page import="com.hk1.utils.Util"%>
<%@page import="com.hk1.gallery.dto.CallendarDto"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cute+Font" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
<!-- 폰트 끝 -->

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- 부트스트랩 끝 -->
  


<title>인덱스</title>

<style type="text/css">


.ud_img button{
background-color: white;
border-radius: 10px;
width: 49px;
	border: none;
color: #e2c0bb; font-family: 'Cute Font', cursive;"


}

.ud_img {
	display: inline-block;
	width: 150px;
	height: 150px;
}


.ud_img img{
	width: 150px;
	height: 150px;}
	
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
</head>

<script type="text/javascript">
$(document).ready(function(){
	

	var scroll = $("#s_l").offset().top;
	

		$(document).scrollTop(scroll-50);
		


});

	function imgup(a) {

		if (a == 1) {
			document.getElementById("gallery_img1").click();
		}
		if (a == 2) {
			document.getElementById("gallery_img2").click();
		}
		if (a == 3) {
			document.getElementById("gallery_img3").click();
		}
		if (a == 4) {
			document.getElementById("gallery_img4").click();
		}

	}

	function imageURL(input) {
		
		var pimg = $(input).prev().prev().find("img");
		
		//alert(pimg.prop("tagName"));
		
		if (input.files && input.files[0]) {

			var reader = new FileReader();

			reader.onload = function(e) {
				
				pimg.attr("src", e.target.result);

			}
			reader.readAsDataURL(input.files[0]);
		}

	}
</script>

<!-- 달력관련 -->
<%
	Calendar cal = Calendar.getInstance(); //calender 객체는 new를 사용하지 않는다
	int year = cal.get(Calendar.YEAR); // 현재 년도를 구함
	int month = cal.get(Calendar.MONTH) + 1; //현재 월을 구함 (0~11월)
%>

<jsp:include page="/WEB-INF/views/header.jsp" />
<body style="min-width: 1200px;">

<div id="s_l"></div>
	
	   <div class="justify-content-center pb-5" style="margin-top:10px; ">
          <div class="heading-section text-center ftco-animate" style="z-index: -1;">
          	<span class="subheading">Best Gallery</span>
            <h2 class="mb-4">방구석 갤러리</h2>
            <p>All the galleries you want</p>
          </div>
        </div>
	


	<div style="text-align: center; margin: 0 auto;">
	
		<h6 style="font-weight: bold;">
      <span onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=general_one'">
      안내&nbsp|</span>
      <span onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=general_two'">
      전시일정</span>

       </h6>

		
	</div>





		<div class="container" style="margin-top: 80px;">
		<div class="row">
		
		
		<div class="col-4 row" style="text-align: center;">
					
				<div class="row">
				<div class="w-100" style="margin: 2px;"></div>
				
						<div class="col">
				
						<div class="ud_img">
							<img alt="g_img1" src="galleryupload/${galleryDto.g_img1}">
					
						</div>
						</div>	

						<div class="col">
						<div class="ud_img">
							<img alt="g_img2"src="galleryupload/${galleryDto.g_img2}">
						
						</div>
						</div>
				</div>
				
				<div class="row">
						<div class="ud_img col">
							<div><img alt="g_img3"src="galleryupload/${galleryDto.g_img3}"></div> 
							

						</div>


						<div class="ud_img col">
							 <div><img alt="g_img4"src="galleryupload/${galleryDto.g_img4}"></div> 
							
						</div>
						
					</div>	
				
					</div>
		
		
		<div class="col-8">
		
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="galleryupload/${galleryDto.g_img1}" alt="" style="min-width:800px; max-height: 400px;">
    </div>

    <div class="item">
      <img src="galleryupload/${galleryDto.g_img2}" alt="" style="min-width:100%; max-height: 400px;">
    </div>

    <div class="item">
      <img src="galleryupload/${galleryDto.g_img3}" alt="" style="min-width:100%; max-height: 400px;">
    </div>
    
    <div class="item">
      <img src="galleryupload/${galleryDto.g_img4}" alt="" style="min-width:100%; max-height: 400px;">
    </div>
    
    
    
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
		
		
		
		
		
		
		</div>
	
		
		</div>
		
			
			

	
					<div class="row">

					<div class="col ml-auto" style="font-family: 'Noto Serif KR', serif; font-size: 15px;  color: black; ">

						<div class="section-title" style="margin-bottom: 20px; font-weight:100; color:black; 
						
						font-family: 'East Sea Dokdo', cursive; font-size: 60px;">
							<div>${galleryDto.g_name}</div>
						</div>

						<div class="w-100" style="margin: 2px;"></div>
						
						<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<span style="margin-right: 36px; font-size:40px; color: #e2c0bb; font-family: 'Cute Font', sans-serif;"> 갤러리 소개</span> 
							<div  style="border: none; line-height: 50px;">${galleryDto.g_intro}</div>
						
						
							<%-- <span>g_intro</span> <input type="text" name="g_intro"
								value="${galleryDto.g_intro}"> --%>
						</div>
						</div>
						
						
						<div class="w-100" style="margin: 40px;"></div>
						
						
						
						<div class="row">
						
						<div class="col-1"></div>
						<div class="col-10">
							<div style="border: none; font-size:15px;"><span style="margin-right: 10px; color: #e2c0bb;">Tel</span>${galleryDto.g_tel}</div>
						</div>
						</div>
						
						<div class="w-100" style="margin: 20px;"></div>
						
						
						<div class="row">
							<div class="col-1"></div>
							
							
							 <div class="col-10">
							 
							 <div style="border: none;"> ${galleryDto.g_adress}</div> 
							
							<%-- <input style="height: 100px;" type="text" name="g_adress" value="${galleryDto.g_adress}"> --%>
						</div>
						
						</div>
					
						



					</div>
					
					</div>
					
					
					
					<div class="w-100" style="margin: 80px;"></div>
					
					
					
					<div class="row">
					
					<div class="col-1"></div>
					
					
					<div class="col-10">
					
					
					
					<!-- 지도 관련 블락 처리 풀기 -->
	<div id="map" style="min-width: 100px; min-height: 250px;">
		 <!--  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d61a4dc1efe55edbdfac5ab744921183"></script>  -->
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new daum.maps.LatLng(37.5256170, 126.888900),
				level : 3

			};

			var map = new daum.maps.Map(container, options);

			// 마커가 표시될 위치입니다 
			var markerPosition = new daum.maps.LatLng(37.5256170, 126.888900);

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>



	</div>
					
					
					
					
					
					
					
					
					
					</div>
					
					<div class="col-1"></div>
					
					</div>
	
			
		</div>
					




	<jsp:include page="/WEB-INF/views/tail.jsp" />

</body>



</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
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
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="row justify-content-center pb-5" >
          <div class="col heading-section text-center ftco-animate" style="z-index:;">
          	<span class="subheading">My Login</span>
            <h2 class="mb-4">방구석 갤러리</h2>
            <p>Best Login in the room</p>
          </div>
        </div>


<h5 style="text-align: center;" >고객님의 가입절차 간소화를 위해 기존 NAVER ID로 가입가능합니다</h5>
 	<br />
 	<br />
 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login" style="width:100%; text-align: center; "></div>
   <script type="text/javascript">
  	var naver_id_login = new naver_id_login("hLTvPHLd1LLQ8ya4xFEp", "http://localhost:8888/gallery/callback.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 10,60);
  	naver_id_login.setDomain("http://localhost:8888/gallery");
  	naver_id_login.setState(state);
	/* naver_id_login.setPopup();  */
  	naver_id_login.init_naver_id_login();
  </script>
  
  
<jsp:include page="/WEB-INF/views/tail.jsp" />  
</body>
</html>
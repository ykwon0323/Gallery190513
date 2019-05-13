<%@page import="com.hk1.utils.Util" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.hk1.gallery.dto.RequestDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%PrintWriter pw = new PrintWriter(System.out);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Hi+Melody|Poor+Story|Sunflower:300" rel="stylesheet">

<title>받은 메시지함 페이지</title>
<%List<RequestDto> list = (List<RequestDto>)request.getAttribute("list"); %>
<style type="text/css">
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

	h4{
    	    width: 25%;
    font-weight: bold;
    padding-bottom: 10px;
    border-bottom: 3px solid rgb(26,26,26);
    color: rgb(50,50,50);
    }
    
    .container{
    	font-family: 'East Sea Dokdo', cursive;
		font-family: 'Hi Melody', cursive;
		font-family: 'Sunflower', sans-serif;
		font-family: 'Poor Story', cursive;
    	font-weight: bold;
    	
    }


</style>

<script type="text/javascript">
 
	function receivepop(r_no) {
		window.open('updateRequestForm.do?r_no='+r_no 
				,'window팝업','width=500, height=600, menubar=no, status=no, toolbar=no');
		
	}
	
	
</script>

</head>

<jsp:include page="/WEB-INF/views/header.jsp" />
<body>
<hr>

<div class="container">


	 <div class="row justify-content-center pb-5" >
          <div class="col heading-section text-center ftco-animate" style="z-index:;">
          	<span class="subheading">Best Message</span>
            <h2 class="mb-4">방구석 갤러리</h2>
            <p>Request to fulfill your dream</p>
          </div>
        </div>
       <h4>받은 메시지함</h4>
	<br/>
	<table class="table table-hover">
	<tr>
	<th style="text-align: center;">승낙결과</th><th style="text-align: center;">보낸 사람</th><th style="text-align: center;" width="20%">제목</th><th style="text-align: center;">보낸 날짜</th><th style="text-align: center;">삭제</th>
	</tr>

<% if(list.size()==0){
	%>
	<td>작성된 메세지가 없습니다</td>
	<% 
}	%>
	
	
	
	<%for(RequestDto dto : list){ %>
	

	<tr>
	<td style="text-align: center;"> <%if(dto.getR_agree()==1){%>
		<button disabled="disabled" class="btn btn-primary btn-sm"  >승인</button>
	
	<%}else if(dto.getR_agree()==2){%>
		<button disabled="disabled" class="btn btn-danger btn-sm"  >거절</button>
	<%}else if(dto.getR_agree()==3){%>
	<button disabled="disabled" class="btn btn-success btn-sm"   >대기중</button>
		<%}
		%></td>
		<td style="text-align: center;"> <%=dto.getR_receivename()%></td>
		<td style="text-align: center;"><a href="" onclick="receivepop(<%=dto.getR_no()%>)"><%=dto.getR_title() %></a></td>
		<td style="text-align: center;"><fmt:formatDate value="<%= dto.getR_regdate() %>" pattern="yyyy년MM월dd일"/> </td>
		<td style="text-align: center;"><a href="deleteRequest.do?r_no=<%=dto.getR_no()%>">삭제</a></td>
	</tr>
	<%  }%>
	</table>
	
	
	<% if(list.size()!=0){
	%>
	
	    <div class="row" style="margin-top: 30px;">
  			<div style="margin: 0 auto;" >
  				<% int pagenum = (Integer)request.getAttribute("pagenum"); %>
				<% int r_recieve = list.get(0).getR_receive();%>
		
		 	<%for(int i =1; i<=pagenum;i++){%>
		 		
		 	<a href="selectRequestListReceive.do?r_pcount=<%=i%>&r_receive=<%=r_recieve%>"><%=i%></a>
		 	
		 	<%}%>
  			
  			</div>
  		</div>
	<%} %>

 </div>	






<%-- 
<h3>받은 메시지함</h3>

<%if(list.size()==0){ %>
	<h5>받은 메시지가 없습니다.</h5>
	<%} %>

<%for(RequestDto dto : list){ %>

	<span>승낙결과 : <%if(dto.getR_agree()==1){%>
		<button disabled="disabled" class="btn btn-primary btn-sm"  >승인&nbsp</button>
	
	<%}else if(dto.getR_agree()==2){%>
		<button disabled="disabled" class="btn btn-danger btn-sm" >거절</button>
	<%}else if(dto.getR_agree()==3){%>
	<button disabled="disabled" class="btn btn-success btn-sm"  >대기중</button>
		<%}
		%></span>
	<span>/보낸 사람: <%=dto.getR_sendname() %></span>
	<span> /제목 :<a href="" onclick="receivepop(<%=dto.getR_no()%>)"><%=dto.getR_title() %></a></span>
	<span>/보낸 날짜 :<fmt:formatDate value="<%= dto.getR_regdate() %>" pattern="yyyy년MM월dd일"/>  </span>
	<span><a href="deleteRequest.do?r_no=<%=dto.getR_no()%>"> /삭제</a></span>
	<br/>
<%} %> --%>

	



<jsp:include page="/WEB-INF/views/tail.jsp" />	
</body>
</html>
<%@page import="com.hk1.gallery.dto.RequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/sketchy/bootstrap.min.css" rel="stylesheet" integrity="sha384-N8DsABZCqc1XWbg/bAlIDk7AS/yNzT5fcKzg/TwfmTuUqZhGquVmpb5VvfmLcMzp" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지</title>
	<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo" rel="stylesheet">
<%RequestDto dto =(RequestDto)request.getAttribute("requestDto"); %>
<script type="text/javascript">
<%-- 	function messageclose() {
		opener.location.href="selectRequestListSend.do?r_send=<%=dto.getR_send()%>";
				self.close();
	}
  --%>

</script>


<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
		font-family: 'East Sea Dokdo', cursive;
		
		background-size: 1000px 470px;
		
		
	}
	
	
	
	.messagecontainer{
		margin-top: 50PX;
	}

	#content textarea{
		margin-left: auto;
		margin-right: auto;
		background-image: url("logo/back.jpg");
	}
	
	.messagecontainer input{
		font-size: 15px;
		font-weight: bold; 
	}
	
	messagecontainer label{
		font-size:11px;
		font-weight: bold; 
		
	}
	
		.messagelogo{
	margin-top:-30px;
	text-align: center;
    width: 100%;
    color: black;
    
	}	

</style>




</head>
<body>

<div class="messagecontainer" style="text-align: center;">
<div class="messagelogo">MESSAGE</div>
<div style="text-align: center;"><img alt="메시지 아이콘" src="requestupload/message_icon.png" width="50px" height="50px"> 
</div>
<br/>

<form action="updateRequest.do" method="get" >
<input type="hidden" value="<%=dto.getR_agree() %>" name="r_agree">
<input type="hidden" value="<%=dto.getR_no() %>" name="r_no">
<input type="hidden" value="<%=dto.getR_receive()%>" name="r_receive">
<input type="hidden" value="<%=dto.getR_send()%>" name="r_send">

<label style="margin-left: -40px;" for="receive">TO.&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><input  style="margin-left: 10px;" size="60;"  type="text" value="<%=dto.getR_receivename() %>" id="receive" name="r_receivename" readonly="readonly" class="btn btn-outline-primary"><br/> 
<label style="margin-left: -40px;" for="send">FROM.&nbsp</label><input  style="margin-left: 10px;" size="60;"  type="text" value="<%=dto.getR_sendname() %>" id="send" name="r_sendname" readonly="readonly" class="btn btn-outline-primary"> <br/>
<label style="margin-left: -40px;" for="title">TITLE.&nbsp</label><input  style="margin-left: 10px;" size="60;" type="text" name="r_title" id="title" value="<%=dto.getR_title() %>"  readonly="readonly" class="btn btn-outline-primary"> 
<div style="margin-top: 25px;" id="content"><br/>
<textarea  rows="8" cols="50" name="r_content" readonly="readonly" class="form-control" style="width: 450px;" ><%=dto.getR_content() %></textarea>
</div><br/>
<div>			<%if(dto.getR_agree()==1){ %>
				<button disabled="disabled" class="btn btn-outline-primary"  >승인</button>
				<%}else if(dto.getR_agree()==2){ %>
				<button disabled="disabled" class="btn btn-outline-danger" >거절</button>
				<%}else if(dto.getR_agree()==3){ %>
				<button disabled="disabled" class="btn btn-outline-success"  >대기중</button>
				<%} %>
</div>
<div style="position: absolute; right: 30px"><button onclick="self.close()" class="btn btn-outline-dark">메시지창 닫기</button> </div>



</form>

</div>




</body>
</html>
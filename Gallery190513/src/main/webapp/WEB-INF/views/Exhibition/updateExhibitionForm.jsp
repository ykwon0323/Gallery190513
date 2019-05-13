<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%ExhibitionDto exhibition =(ExhibitionDto) request.getAttribute("exhibitionDto"); %>
<%List<ItemDto> nowItemList =(List<ItemDto>) request.getAttribute("itemList"); %>
<%List<ItemDto> newItemList =(List<ItemDto>) request.getAttribute("myitemList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시수정</title>
<link rel="stylesheet" href="exhibition/css/updateExhibitionForm.css">

<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
</head>
<div id="updateExhibitionForm_body">
<div id="updateExhibitionForm_blackscreen">
	<h3 style="text-align: center;
				font-weight: bold;
				font-size: 200%;
				color: white;
				width: 100%;
				padding: 5%;">전시수정</h3>
<div id="updateExhibitionForm">
	
	
	
	<form action="updateExhibition.do" method="post" enctype="multipart/form-data">
	<div id="updateExhibitionForm_fileBox">
		<h3>전시 대표이미지 수정</h3>
			<div id="updateExhibitionForm_nowImgBox">
				<h5>현재 설정된 대표이미지</h5>
				<img alt="" src="exhibitionupload/<%=exhibition.getE_img()%>" width="30%">
			</div>
			
			
			
			
			<div id="updateExhibitionForm_changeImgBox">
				<h5>변경할 대표이미지 업로드</h5>
				
					<input type="hidden" name="e_img" value="<%=exhibition.getE_img()%>">
					<div id="updateExhibitionForm_fileupload_showbox" style="display:none;">
						<img id="updateExhibitionForm_fileupload_showbox_img" src="#" alt="미리보기이미지" width="30%">
					</div>
					<label for="updateExhibitionForm_fileupload">변경 이미지 업로드
						<input type="file" name="filename" id="updateExhibitionForm_fileupload">
					</label>
			</div>
		</div>
		
		<script type="text/javascript">
			$(function(){
				$("#updateExhibitionForm_fileupload").on('change',function(){
					readURL(this);
				});
			});
			
			function readURL(input){
				if(input.files&& input.files[0]){
					var reader = new FileReader();
					
					reader.onload = function(e){
						$("#updateExhibitionForm_fileupload_showbox").slideDown("slow");
						$("#updateExhibitionForm_fileupload_showbox_img").attr("src",e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
		</script>
	
		<div id="updateExhibitionForm_nowItemList">
			
			<h3>제거할 작품 선택</h3>
					<div id="updateExhibitionForm_nowItemList_table">
						<%if(nowItemList.size()==0){ %>
							<p">전시되고있는 작품이 없습니다</p>
						<%}else{%>
							<%for(int i = 0; i<nowItemList.size();i++){ %>
							<%if(i==0||i%4==0){%>
							<div class="updateExhibitionForm_nowItemList_tr">
							<%}//if문 END%>
							
							<div class="updateExhibitionForm_nowItemList_cell">
								<label for="updateExhibitionForm_nowItemList_checkbox_<%=i%>">
									<input type="checkbox" name="Deletei_no" value=<%=nowItemList.get(i).getI_no()%> 
											id="updateExhibitionForm_nowItemList_checkbox_<%=i%>"
											class="updateExhibitionForm_nowItemList_checkbox"
											onclick="updateExhibitionForm_nowItemList_checked(<%=i%>)">
								<img src="itemupload/<%=nowItemList.get(i).getI_img()%>" width="100%"
											id="updateExhibitionForm_nowItemList_img_<%=i%>"
											class="updateExhibitionForm_nowItemList_img">
								</label>
							</div>
							<%if(i%4==3||i==nowItemList.size()-1){%>
							</div>
							<%}//if문 END%>
							<%}//for문 END%>
						<%}//else문 END%>
					</div>
		</div>
		<script type="text/javascript">
			
				function updateExhibitionForm_nowItemList_checked(i){
					var ss = "updateExhibitionForm_nowItemList_checkbox_"+i;
					var s =document.getElementById(ss);
						if(s.checked){
							
							$("#updateExhibitionForm_nowItemList_img_"+i).css("opacity","0.8");
							$("#updateExhibitionForm_nowItemList_img_"+i).css("border","10px solid white");
							$("#updateExhibitionForm_nowItemList_img_"+i).css("box-shadow"," 0px 0px 100px rgba(199,178,153,1)");
						
						}else{
							$("#updateExhibitionForm_nowItemList_img_"+i).css("opacity","1");
							$("#updateExhibitionForm_nowItemList_img_"+i).css("border","none");
							$("#updateExhibitionForm_nowItemList_img_"+i).css("box-shadow"," none");
						
							
						}
					
				}
			</script>
			<div id="updateExhibitionForm_newItemList">
			
			<h3>추가할 작품 선택</h3>
					<div id="updateExhibitionForm_newItemList_table">
						<%if(newItemList.size()==0){ %>
							<p>추가 할 작품이 없습니다</p>
						<%}else{%>
							<%for(int i = 0; i<newItemList.size();i++){ %>
							<%if(i==0||i%4==0){%>
							<div class="updateExhibitionForm_newItemList_tr">
							<%}//if문 END%>
							<div class="updateExhibitionForm_newItemList_cell">
								<label for="updateExhibitionForm_newItemList_checkbox_<%=i%>">
									<input type="checkbox" name="Updatei_no" value=<%=newItemList.get(i).getI_no()%> 
											id="updateExhibitionForm_newItemList_checkbox_<%=i%>"
											class="updateExhibitionForm_newItemList_checkbox"
											onclick="updateExhibitionForm_newItemList_checked(<%=i%>)">
								<img src="itemupload/<%=newItemList.get(i).getI_img()%>" width="100%"
											id="updateExhibitionForm_newItemList_img_<%=i%>"
											class="updateExhibitionForm_newItemList_img">
								</label>
							</div>
							<%if(i%4==3){%>
							</div>
							<%}//if문 END%>
							<%}//for문 END%>
						<%}//else문 END%>
					</div>
		</div>
	<script type="text/javascript">
			
				function updateExhibitionForm_newItemList_checked(i){
					var zz = "updateExhibitionForm_newItemList_checkbox_"+i;
					var z =document.getElementById(z);
						if(z.checked){
							
							$("#updateExhibitionForm_newItemList_img_"+i).css("opacity","0.8");
							$("#updateExhibitionForm_newItemList_img_"+i).css("border","10px solid white");
							$("#updateExhibitionForm_newItemList_img_"+i).css("box-shadow"," 0px 0px 100px rgba(199,178,153,1)");
						
						}else{
							$("#updateExhibitionForm_newItemList_img_"+i).css("opacity","1");
							$("#updateExhibitionForm_newItemList_img_"+i).css("border","none");
							$("#updateExhibitionForm_newItemList_img_"+i).css("box-shadow"," none");
						
							
						}
					
				}
			</script>
	
		<div id="updateExhibitionForm_explain">
			
			
			<h3>전시설명</h3>
			<div id="updateExhibitionForm_explain_table">
				<div id="updateExhibitionForm_explain_tr">
					<h6>전시명</h6>
						<input type="text" name="e_title" value="<%=exhibition.getE_title()%>">
				</div>
				</div>
				<h5>전시설명</h5>
					<textarea rows="20" cols="100%" name="e_explain"><%=exhibition.getE_explain()%></textarea>
				<input type="hidden" name="a_no" value="<%=loginMember.getM_no()%>">
				<input type="hidden" name="a_name" value="<%=loginMember.getM_name()%>">
				<input type="hidden" name="e_no" value="<%=exhibition.getE_no()%>">
			<input type="submit" value="수정완료" id="updateExhibitionForm_explain_submit">
		
		</div>
		</form>
</div><!--updateExhibitionForm END  -->
</div><!--updateExhibitionForm_blackscreen END  -->
</div><!--updateExhibitionForm_body END  -->
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>
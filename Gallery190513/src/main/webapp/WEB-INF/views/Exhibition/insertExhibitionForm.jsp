<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<ItemDto> myItemList =(List<ItemDto>) request.getAttribute("myItemList"); %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시등록</title>

<link rel="stylesheet" href="exhibition/css/insertExhibitionForm.css">
</head>

<body style="overflow-x:hidden;">
<jsp:include page="/WEB-INF/views/header.jsp" />
<%-- <jsp:include page="/WEB-INF/views/login/privateGnb.jsp" />	 --%>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
    
    <div id="insertExhibitionForm_body">
    <div id="insertExhibitionForm_body_blackscreen">
    	<div id="insertExhibitionForm_body_title">
    		<h1>All are lunatics, but he who can analyze his delusion is called a philosopher</h1>
			<h2>모두가 광인이다. 그러나 자신의 망상을 분석할 수 있는 사람은 철학자로 불린다</h2>
				<p>Ambrose Bierce</p>
    	</div>
		<div id="insertExhibitionForm">
			<div id="insertExhibitionForm_informationBox">
			<h3>전시등록</h3>
				<p>1 . 전시 대표이미지 등록</p>
				<p>2 . 전시될 작품 선택(등록된 작품 중 전시중이지 않은 작품만 선택 가능합니다)</p>
				<p>3 . 전시 상세 설명 작성(전시명 , 전시 해석 작성)</p>
			</div>
		
			<form action="insertExhibition.do" method="post" enctype="multipart/form-data">
			<div id="insertExhibitionForm_fileinsert">
				<h3>전시 대표이미지 등록</h3>
					<p>전시 목록에 표시될 전시 대표 이미지를 등록해 주세요</p>
					<div id="insertExhibitionForm_fileupload_box">
						
							<div id="insertExhibitionForm_fileupload_showbox" style="display:none;">
								<img id="insertExhibitionForm_fileupload_showbox_img" src="#" alt="미리보기이미지" width="30%">
							</div>
							<label for="insertExhibitionForm_fileupload">대표이미지 업로드
							<input type="file" name="filename" required="required" id="insertExhibitionForm_fileupload">
						</label>
					</div>
				</div>
			<script type="text/javascript">
				$(function(){
					$("#insertExhibitionForm_fileupload").on('change',function(){
						readURL(this);
					});
				});
				
				function readURL(input){
					if(input.files&& input.files[0]){
						var reader = new FileReader();
						
						reader.onload = function(e){
							$("#insertExhibitionForm_fileupload_showbox").slideDown("slow");
							$("#insertExhibitionForm_fileupload_showbox_img").attr("src",e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
			</script>
			
			<div id="insertExhibitionForm_itemlist_body">
			
			<h3>작품선택</h3>
			<p>전시될 작품을 선택해 주세요</p>
			<p>등록된 작품 중 전시중이지 않은 작품만 선택 가능합니다</p>
			
			
			<div id="insertExhibitionForm_itemlist_box">
				<%if(myItemList.size()==0){ %>
					<h4 style="width: 100%; text-align: center;">※등록하신 작품이 없습니다.</h4>
				<%}else{ %>
					<div id="insertExhibitionForm_itemlist_box_table">
						<%for(int i=0 ; i < myItemList.size() ; i++) {%>
							<%if(i%4==0||i==0) {%>
								<div class="insertExhibitionForm_itemlist_box_tr">
								<%} %>
								<div id="insertExhibitionForm_itemlist_box_cell_<%=i%>"
									 class="insertExhibitionForm_itemlist_box_cell">
									<label for="insertExhibitionForm_itemlist_box_checkbox_<%=i%>">
										<input type="checkbox" name="i_no" value="<%=myItemList.get(i).getI_no()%>" 
																id="insertExhibitionForm_itemlist_box_checkbox_<%=i%>" 
																class="insertExhibitionForm_itemlist_box_checkbox"
																onclick="insertExhibitionForm_img_checked(<%=i%>);">
										<img alt="작품이미지" src="itemupload/<%=myItemList.get(i).getI_img()%>"
															width="100%;"
															
															id="insertExhibitionForm_itemlist_box_img_<%=i%>"
															class="insertExhibitionForm_itemlist_box_img">
									</label>
								</div>
							<%if(i%4==3&&i!=0) {%>
							</div>
							<%} %>
						<%} %>
					</div><!--insertExhibitionForm_itemlist_box_listtable END -->
					</div>
				<%} %>
				
			<script type="text/javascript">
			
				function insertExhibitionForm_img_checked(i){
					var ss = "insertExhibitionForm_itemlist_box_checkbox_"+i;
					var s =document.getElementById(ss);
					
					
					
					
						if(s.checked){
							
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("opacity","0.8");
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("border","10px solid white");
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("box-shadow"," 0px 0px 100px rgba(199,178,153,1)");
						
						}else{
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("opacity","1");
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("border","none");
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("box-shadow"," none");
						
							
						}
					
				}
			</script>
			
			</div><!-- insertExhibitionForm_itemlist_box END-->
		
			<div id="insertExhibitionForm_explain">
			<h3>전시설명</h3>
			<p>전시에 대한 해설을 작성해주세요</p>
				<div id="insertExhibitionForm_explain_box">
					<div id="insertExhibitionForm_explain_box_table">
					<div id="insertExhibitionForm_explain_box_tr">
					<h6>전시명  </h6>
						<input type="text" name="e_title" required="required"><br>
					</div>
					</div>
					<h5>전시설명</h5>
					<div id="insertExhibitionForm_explain_textarea">
						<textarea rows="10" cols="100%" name="e_explain" required="required"></textarea>
						<input type="hidden" name="a_no" value="<%=loginMember.getM_no()%>">
						<input type="hidden" name="a_name" value="<%=loginMember.getM_name()%>">
						</div>
					<div id="insertExhibitionForm_explain_submitButton_div" >
					<input type="submit" value="전시등록" id="insertExhibitionForm_submitButton">
					</div>
				</div>
			</div>
			
		</form>
	
				<script type="text/javascript">
			$("#insertExhibitionForm_submitButton").click(function(){
				var file = document.getElementById("insertExhibitionForm_fileupload_showbox_img");
				
				if($("input:checkbox[name=i_no]").is(":checked") == true) {
					if(file.naturalWidth==0){
						alert("(필수!)전시 대표이미지를 업로드 해주세요 !");
					}
				}else{
					alert("(필수!)작품은 한 개 이상 선택해 주셔야 합니다!")
				}
				
				
			});
			
			
			</script>	
				
	</div><!-- insertExhibitionForm End -->
	</div>
	</div>
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>
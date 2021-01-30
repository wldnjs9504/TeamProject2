<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%  String search = ""; 
    if( !search.equals("") || search != null){
    	search = request.getParameter("search");
    	}	
    if(search == null){
    	search = "";
    }
    String sorting = request.getParameter("sorting");
    System.out.println("sorting : " + sorting);
    System.out.println("@@@@@@@@@@@@"+search);
    %>
<div class="advanced-search">
	<form action="./ProductList.p?" method="get" name="searF"> 
	<input type="hidden" name="category" value="0">
	<!-- <select class="category-btn" name="sorting">
		<option value="num_desc" selected="selected">최근등록순</option>
		<option value="star_avg">별점순</option>
		<option value="price_high">가격높은순</option>
		<option value="price_low">가격낮은순</option>
		<option value="readcount">조회순</option>
	</select>  -->
	<div class="input-group">
	
	
	<%
	if(search.equals("") || search == null){
		%><input type="text" placeholder="What do you need?" name="search">
	<%}else{%><input type="text" placeholder="What do you need?" value="<%=search%>" name="search">
	<%}%>
		<!-- 수정 :  검색 아이콘이 너무 앞에 있음-->
	<button type="submit"><i class="ti-search"></i></button>
	</div>
	</form>
</div>
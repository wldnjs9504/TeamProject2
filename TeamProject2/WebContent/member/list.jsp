<%@page import="net.admin.product.db.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//request.setAttribute("ProductList", productList);
List productList = (List)request.getAttribute("productList");
%>
<h1>admin_goods_list.jsp</h1>
<h1>상품목록</h1>
<h3><a href="./ProductAdd.ap">상품등록</a></h3>
<table border="1">
<tr><td>번호</td><td>카테고리</td><td>사진</td><td>상품명</td>
   <td>가격</td><td>할인가</td><td>수량</td><td>수정/삭제</td></tr>
   <%
   for(int i=0;i<productList.size();i++){
	   ProductBean pb=(ProductBean)productList.get(i);
	   %>
<tr><td><%=pb.getP_num() %></td><td><%=pb.getCategory() %></td>
<td><img src="./upload/<%=pb.getImg_main() %>" width="50" height="50"></td><td><%=pb.getP_name() %></td><td><%=pb.getP_price() %></td>
<td><%=pb.getP_saleprice() %></td><td><%=pb.getP_count() %></td>
<td><a href="./GoodsModify.ag?num=<%=pb.getP_num()%>">수정</a>
    /<a href="./GoodsDelete.ag?num=<%=pb.getP_num()%>">삭제</a></td></tr>	   
	   <%
   }
   %>
</body>
</html>
<%@page import="net.order.db.orderBean"%>
<%@page import="java.util.List"%>
<%@page import="net.admin.product.db.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<!-- 헤더 -->
    <%@include file="../inc/header.jsp" %>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                        <span>관리자 주문 리스트</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
    
<%
//request.setAttribute("ProductList", productList);
List list = (List)request.getAttribute("list");
%>
    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>주문일시</th>
                                    <th>주문상태</th>
                                    <th>수정/삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                               <%
   								for(int i=0;i<list.size();i++){
	   							orderBean ob=(orderBean)list.get(i);
	   						   %>
                                <tr>
                                	<td class="cart-title">
                                        <h5><%= ob.getB_num() %></h5>
                                    </td>
                                    <td class="cart-title">
                                        <h5><%= ob.getId() %></h5>
                                    </td>
                                    <td class="cart-title">
                                        <h5><%= ob.getO_name()%></h5>
                                    </td>
                                    <td class="cart-title">
                                        <h5><%= ob.getB_date()%></h5>
                                    </td>
                                    <%
                                    String result= "";
                                    if(ob.getD_result()==0){
                                    	result = "주문완료";
                                    }else if(ob.getD_result()==1){
                                    	result = "결제완료";
                                    }else if(ob.getD_result()==2){
                                    	result = "배송준비";
                                    }else if(ob.getD_result()==3){
                                    	result = "배송완료";
                                    }                                    
                                    %>
                                    <td class="cart-title">
                                        <h5><%= result %></h5>
                                    </td>
                                    <td><a href="./AdminOrderDetail.ao?b_num=<%=ob.getB_num()%>&p_num=<%=ob.getP_num()  %> ">수정</a>
    								/<a href="./AdminOrderDeleteAction.ao?b_num=<%=ob.getB_num()%>" >삭제</a></td></tr>	   
                                <%
   								}
                                %>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- 푸터 -->
    <%@include file="../inc/footer.jsp" %>
</body>
</html>
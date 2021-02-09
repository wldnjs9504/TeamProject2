<%@page import="net.product.db.ProductBean"%>
<%@page import="net.order.db.orderBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>uR</title>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

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
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>회원정보</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

 	
    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
            	<div class="col-lg-2 col-md-6 col-sm-8 order-2 order-lg-1 products-sidebar-filter">
                    <div class="filter-widget">
                        <ul class="filter-catagories">
                        	<!-- 해당 페이지의 메뉴에만 class="check-menu" 적용 -->
                    		<li> <a href="./MemberInfo.me"> 내 정보 보기</a></li>
                     		<li> <a href="./passCheck.me"> 내 정보 변경</a></li>
                    		<li class="check-menu"> <a href="./MemberOrderList.me"> 주문 이력</a></li>
                    		<li> <a href="#"> 내 포인트 현황</a></li>
                    		<li> <a href="#"> 나의 리뷰</a></li>
                    		<li> <a href="#"> 고객센터</a></li>
                    		<li> <a href="./MemberDelete.me"> 회원탈퇴</a></li> 
                        </ul>                    	
                    </div>
                </div>

               <%
	List list = (List)request.getAttribute("list");
	orderBean ob=(orderBean)list.get(0);
 %>
 
           <h4>주문 정보 조회</h4>
                        <div class="row">
                        
                        	<div class="col-lg-12">
                                <div class="create-item">
                                        	주문 번호 : <%= ob.getB_num() %>
 				                           	<input type="hidden" value="<%= ob.getB_num() %>" name="b_num">
 				                           	<input type="hidden" value="<%= ob.getP_num() %>" name="p_num">
                                        <span class="checkmark"></span>
                                </div>
                            </div>
                            <br>
                            <br>
                            <br>
                            <div class="col-lg-6">
                                <label for="id">아이디</label>
                                <input type="text" id="id" name="id" value="<%= ob.getId() %>" readonly>
                            </div>
                            <div class="col-lg-6">
                                <label for="d_name">이름</label>
                                <input type="text" id="d_name" value="<%= ob.getD_name() %>" name="d_name" readonly>
                            </div>
                            <div class="col-lg-6">
                                <label for="o_email">이메일</label>
                                <input type="text" id="o_email" value="<%= ob.getO_email() %>" name="o_email" readonly>
                            </div>
                            <div class="col-lg-6">
                                <label for="d_phone">전화번호</label>
                                <input type="text" id="d_phone" value="<%= ob.getD_phone()  %>" name="d_phone" readonly>
                            </div>
                            <div class="col-lg-12">
                                <label for="d_adress">주소</label>
                                <input type="text" id="d_address" class="street-first" value="<%=ob.getD_address()  %>" name="d_address" readonly>
                                <input type="text" id="d_address2" class="street-first" value="<%=ob.getD_address2()  %>" name="d_address2" readonly>
                            </div>
                            <div class="col-lg-12">
                                <label for="d_message">배송시 요청 사항</label>
                                <input type="text" id="d_message" value="<%=ob.getD_message()  %>" name="d_message" readonly>
                            </div>
                        </div>
                    </div>
                    <%
                    ProductBean pb=(ProductBean)list.get(1);
                    String price = Integer.toString(pb.getP_saleprice());
					StringBuffer sb = new StringBuffer(price);
					String count = Integer.toString(ob.getB_count());
					StringBuffer sb1 = new StringBuffer(count);
					String price2 = Integer.toString(pb.getP_price());
					StringBuffer sb2 = new StringBuffer(price2);
					String point = Integer.toString(ob.getPoint());
					StringBuffer sb3 = new StringBuffer(point);
					String cost = Integer.toString(ob.getD_cost());
					StringBuffer sb4 = new StringBuffer(cost);
					String result = Integer.toString((ob.getB_count()*pb.getP_saleprice())-ob.getD_cost()-ob.getPoint());
					StringBuffer sb5 = new StringBuffer(result);
					
					String arr1[] = {price, count, price2, point, cost, result};
					StringBuffer arr2[] = {sb, sb1, sb2, sb3, sb4, sb5};
					
					for(int i=0; i<=5; i++){
						if(arr1[i].length()==4){
     	                    arr2[i].insert(1,',');
	   					}else if(arr1[i].length()==5){
	   						arr2[i].insert(2,',');	
	   					}else if(arr1[i].length()==6){
	   						arr2[i].insert(3,',');	
	  					}else if(arr1[i].length()==7){
	  						arr2[i].insert(1,',');	
	  						arr2[i].insert(4,',');	
	  					}else if(arr1[i].length()==8){
	  						arr2[i].insert(5,',');
	  						arr2[i].insert(2,',');
	   					}else if(arr1[i].length()==9){
	   						arr2[i].insert(6,',');
	   						arr2[i].insert(3,',');
	   					}
					}
                    %>
                    
                    <div class="col-lg-6">
                        <div class="place-order">
                            <h4>상품</h4>
                            <td class="cart-pic first-row"><img src="./upload/<%=pb.getImg_main() %>"  alt=""></td>
                            <div class="order-total">
                                <ul class="order-table">
                                	
                                    <li class="fw-normal">상품명 <span><%= pb.getP_name() %></span></li>
                                    <li class="fw-normal">가격 <span><%= sb2 %></span></li>
                                    <li class="fw-normal">할인된 가격 <span><%= sb %></span></li>
                                    <li class="fw-normal">수량 <span><%= sb1 %></span></li>
                                    <li class="fw-normal">사용된 포인트 <span>-<%= sb3 %>원</span></li>
                                    <li class="fw-normal">배송비 <span>-<%= sb4 %>원</span></li>
                                    <li class="total-price">최종금액 <span><%= sb5%>원</span></li>
                                </ul>
                    
                            </div>
                        </div>
                    </div>
 
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- 푸터 -->
    <%@include file="../inc/footer.jsp" %>
</body>
</html>
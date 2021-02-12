<%@page import="java.util.List"%>
<%@page import="net.product.db.ProductQnaBean"%>
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
    
<%
    int count = (Integer)request.getAttribute("count");
    %>
 	
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
                    		<li> <a href="./MemberOrderList.me"> 주문 이력</a></li>
                    		<li> <a href="#"> 내 포인트 현황</a></li>
                    		<li> <a href="./MemberReviewList.me"> 나의 리뷰</a></li>
                    		<li class="check-menu"> <a href="./MemberQnaList.me"> 상품 QnA</a></li>
                    		<li> <a href="./MemberDelete.me"> 회원탈퇴</a></li> 
                        </ul>                    	
                    </div>
                </div>

                <div class="col-lg-10 order-1 order-lg-2">
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="num">번호</th>
                                    <th class="subject">제목</th>
                                    <th class="date">작성일</th>
                                    <th class="result">답변 여부</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<!-- 문의 내역이 없을 경우 -->
                            	<%if(count==0){ %>
                            	<tr>
                            		<td colspan="5"><h2>문의 내역이 없습니다</h2></td>
                            	</tr>
                            	<%} %>                            
								<%
								List list = (List)request.getAttribute("list");
								for(int i=0;i<list.size();i++){
									ProductQnaBean qb=(ProductQnaBean)list.get(i);
								%>
                                <tr>
                                    <td class="num">
                                        <%= qb.getQ_num() %>
                                    </td>
                                	<td class="subject1">
                                        <a href="./Product.p?p_num=<%=qb.getP_num()%>#tab-3"><%= qb.getSubject() %></a>
                                    </td>
                                    <td class="date">
                                        <%= qb.getReg_date()%>
                                    </td>
                                    <td class="result">
                                    <%
                                    if(qb.getRe_result()==0){
                                    %>
                                    	답변 대기
                                    <%
                                    }else if(qb.getRe_result()==1){
                                    %>
                                    	답변 완료
                                    <%
                                    }
                                    %>
                                    </td>
    							</tr>	   
    							<%}%>
                            </tbody>
                        </table>
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
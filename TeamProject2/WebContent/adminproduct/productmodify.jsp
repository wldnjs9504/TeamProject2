<%@page import="net.admin.product.db.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

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
                    <div class="breadcrumb-text">
                        <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                        <a href="./ProductList.ap">관리자 상품 리스트</a>
                        <span>상품 수정</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->
	<%
	//request.setAttribute("ProductBean", pb);
	ProductBean pb = (ProductBean)request.getAttribute("pb");
	%>
    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>상품 수정 등록</h2>
                        <form action="./ProductModifyAction.ap" method="post">
                        	
                        	<input type="hidden" value="<%= pb.getP_num() %>" name="p_num">
                        		
                        	<div class="group-input">
                        		<label for="category">카테고리</label>
                        		<select name="category"  id="category">
                        		<option value="1" <%if(pb.getCategory()==1){%>selected<%}%>>피로/간</option>
                        		<option value="2" <%if(pb.getCategory()==2){%>selected<%}%>>수면/스트레스</option>
                        		<option value="3" <%if(pb.getCategory()==3){%>selected<%}%>>피부</option>
                        		<option value="4" <%if(pb.getCategory()==4){%>selected<%}%>>눈</option>
                        		<option value="5" <%if(pb.getCategory()==5){%>selected<%}%>>두뇌활동</option>
                        		<option value="6" <%if(pb.getCategory()==6){%>selected<%}%>>심장/혈관/혈당</option>
								</select>
							</div>
                            <div class="group-input">
                                <label for="p_name">상품명</label>
                                <input type="text" id="p_name" name="p_name" value="<%=pb.getP_name() %>">
                            </div>
                            <div class="group-input">
                                <label for="p_count">수량</label>
                                <input type="number" id="p_count" name="p_count" value="<%= pb.getP_count() %>">
                            </div>
                            <div class="group-input">
                                <label for="p_price">가격</label>
                                <input type="number" id="p_price" name="p_price" value="<%= pb.getP_price() %>">
                            </div>
                            <div class="group-input">
                                <label for="p_saleprice">할인가</label>
                                <input type="number" id="p_saleprice" name="p_saleprice" value="<%= pb.getP_saleprice() %>">
                            </div>
                            <button type="submit" class="site-btn register-btn">상품수정</button>
                            <button type="reset" class="site-btn register-btn">다시수정</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
    
    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Logo Section End -->

   <!-- 푸터 -->
    <%@include file="../inc/footer.jsp" %>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Fashi | Template</title>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
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
                        <a href="./shop.html">관리자 상품 리스트</a>
                        <span>상품 추가</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
            	<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <ul class="filter-catagories">
                        	<!-- 해당 페이지의 메뉴에만 class="check-menu" 적용 -->
                    		<li> <a href="#"> 회원 관리</a></li>
                     		<li class="check-menu"> <a href="#"> 상품 관리</a></li>
                     		<li> <a href="#"> 주문 관리</a></li>
                        </ul>                    	
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="register-product-form">
                        <h2>상품 등록</h2>
                        <form action="./ProductAddAction.ap" method="post" enctype="multipart/form-data">
	                 		<table>
	                 		  <tr>
	                 		    <th><label for="category">카테고리</label></th>
	                 		    <td>
	                        	  <select name="category" id="category">
									<option value="1">피로/간</option>
									<option value="2">수면/스트레스</option>
									<option value="3">피부</option>
									<option value="4">눈</option>
									<option value="5">두뇌활동</option>
									<option value="6">심장/혈관/혈당</option>
								  </select>                 		    
	                 		    </td>
	                 		    <th><label for="p_name">상품명</label></th>
	                 		    <td colspan="3"><input type="text" id="p_name" name="p_name"></td>
	                 		  </tr>
	                 		  <tr>
	                 		    <th><label for="p_price">가격</label></th>
	                 		    <td><input type="number" id="p_price" name="p_price" min=0></td>
	                 		    <th><label for="p_saleprice">할인가</label></th>
	                 		    <td><input type="number" id="p_saleprice" name="p_saleprice" min=0></td>
	                 		    <th><label for="p_count">수량</label></th>
	                 		    <td><input type="number" id="p_count" name="p_count" min=0></td>
	                 		  </tr>
	                 		  <tr>
	                 		    <th><label for="img_main">메인 이미지</label></th>
	                 		    <td colspan="5"><input type="file" id="img_main" name="img_main"></td>
	                 		  </tr>
	                 		  <tr>
	                 		    <th><label for="img_content">서브 이미지</label></th>
	                 		    <td colspan="5"><input type="file" id="img_content" name="img_content"></td>
	                 		  </tr>
	                 		</table>    
	                 		<div class="check-btn">
	                 			<input class="site-btn" type="submit" value="상품 등록">
	                 			<input class="site-btn" type="reset" value="다시 등록">
	                 		</div>   
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
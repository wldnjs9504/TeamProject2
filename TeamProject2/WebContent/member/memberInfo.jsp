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
                        <span>회원정보</span>
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
                    		<li class="check-menu"> <a href="#"> 내 정보 보기</a></li>
                     		<li> <a href="#"> 내 정보 변경</a></li>
                    		<li> <a href="#"> 주문 이력</a></li>
                    		<li> <a href="#"> 내 포인트 현황</a></li>
                    		<li> <a href="#"> 나의 리뷰</a></li>
                    		<li> <a href="#"> 고객센터</a></li>
                    		<li> <a href="#"> 회원탈퇴</a></li> 
                        </ul>                    	
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="member-info-form">
                        <h2>내 정보 보기</h2>
                        <form action="#">
                        	<!-- <input>대신 DB에서 실제 값 가져와서 넣기 -->
                        	<table>
                        	  <tr>
                        	    <th>아이디 *</th>
                        	    <td><%=id %></td>
                        	  </tr>
                        	  <tr>
                        	    <th>비밀번호</th>
                        	    <td><input type="password" name="pass" id="pass" value="" readonly/></td>
                        	  </tr>
                        	  <tr>
                        	    <th>이메일 *</th>
                        	    <td><input type="email" name="email" id="email" value="" readonly></td>
                        	  </tr>
                        	  <tr>
                        	    <th>주소</th>
                        	    <td>
                        	      <input type="text" name="postcode" id="postcode" value="" readonly>
                        	      <button class="site-btn post">찾기</button>
                        	      <input type="text" name="address" id="address" value="" readonly>
                        	      <input type="text" name="address2" id="address2" value="" readonly>
								</td>
                        	  </tr>
                        	  <tr>
                        	    <th>포인트</th>
                        	    <!-- 링크 클릭시 포인트 조회 페이지로 이동 -->
                        	    <td><a href="#">포인트</a></td>
                        	  </tr>
                        	</table>
						</form>
                   </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
    
    <!-- 푸터 -->
    <%@include file="../inc/footer.jsp" %>
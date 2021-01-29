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
                        <span>회원가입</span>
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
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>회원가입</h2>
                        <form action="#">
                            <div class="group-input">
                                <label for="username">아이디 *</label>
                                <input type="text" id="username">
                            </div>
                            <div class="group-input">
                                <label for="pass">비밀번호 *</label>
                                <input type="text" id="pass">
                            </div>
                            <div class="group-input">
                                <label for="con-pass">비밀번호 확인 *</label>
                                <input type="text" id="con-pass">
                            </div>
                            <div class="group-input">
                                <label for="email">이메일 *</label>
                                <input type="text" id="username">
                            </div>                            
                            <div class="group-input">
                                <label for="address">주소 *</label>
                                <input type="text" id="postcode" placeholder="우편번호">
                                <button class="site-btn post">찾기</button>
                                <input type="text" id="address1" placeholder="주소">
                                <input type="text" id="address2" placeholder="상세 주소">
                            </div>                            
                            <button type="submit" class="site-btn register-btn">회원가입</button>
                        </form>
                        <div class="switch-login">
                            <a href="<%=request.getContextPath() %>/member/login.jsp" class="or-login">Or Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
    
    <!-- 푸터 -->
    <%@include file="../inc/footer.jsp" %>
</body>
</html>
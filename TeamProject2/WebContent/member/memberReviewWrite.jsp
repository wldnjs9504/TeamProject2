<%-- <%@page import="net.order.db.orderBean"%> --%>
<%-- <%@page import="net.product.db.ProductBean"%> --%>
<%-- <%@page import="net.product.db.ReviewBean"%> --%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.product.db.ProductBean"%>
<%@page import="net.order.db.OrderBean"%>
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
<style type="text/css">
	html {overflow:hidden;} 
</style>   
</head>

<body>
    
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	int p_num = (Integer)request.getAttribute("p_num");
    %>
 	
    <!-- Shopping Cart Section Begin -->
    <section class="">
        <div class="container">
                <div class="col-lg-10 order-1 order-lg-2">
                    <div class="review-table">
                      <form action="./MemberReviewWriteAction.me?p_num=<%=p_num %>" method="post">
                        <input type="hidden" name="id" value="<%=id %>">
                        <input type="hidden" name="p_num" value="<%=p_num %>">
                        <table>
                          <tr>
                            <th class="r_star">고객 만족도</th>
                            <td>
                              <div class="rating">
                                <select id="r_star" name="r_star">
								  <option selected="selected">별점 주기</option>
								  <option value="5">★★★★★</option>
								  <option value="4">★★★★☆</option>
								  <option value="3">★★★☆☆</option>
								  <option value="2">★★☆☆☆</option>
								  <option value="1">★☆☆☆☆</option>
                                </select>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <th class="r_content">리뷰 작성</th>
                            <td><textarea id="r_content" name="r_content" placeholder="리뷰 내용을 작성해주세요"></textarea></td>
                          </tr>
                        </table>
                        <div class="check-btn">
                          <input class="site-btn review" type="submit" value="등록하기">
                          <input class="site-btn review" type="button" value="취소하기" onclick="window.close();">
                        </div>
                      </form>
					</div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

</body>
</html>
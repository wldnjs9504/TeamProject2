<%@page import="net.cart.db.CartDAO"%>
<%@page import="net.product.db.ReviewBean"%>
<%@page import="net.cart.db.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>uR</title>

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
    <!-- <style type="text/css">
    #qnaTable tr:HOVER{background-color: #FFFFD2; }
    #qnaTable td{text-overflow: :ellipsis; overflow: hidden;}
    #qnaTable {width:100%; border-spacing: 0; border-collapse: collapse; position:relative;}
    #qnaTable tr,td {border-top: 1px solid #D5D5D5;
    		border-bottom: 1px solid #D5D5D5;
    		background: white; border-top: 0; text-align: center; width: 50%;}
    #qnaTable th{border-top: 1px solid #D5D5D5;}
    #qnaTable tr{background: #EAEAEA; display:none;}
	#qnaTable tr.q_sub {display:table-row;}
	#qnaTable .q_sub a{
		position:absolute;
		width:100%;
		text-indent: -9999px;
		left:0;
		opacity:0;
		/* -ms-filter:alpha(opacity=0);
		filter:alpha(opacity=0); */
	}    
    
    </style> -->
    
    
</head>

	<%
	request.setCharacterEncoding("UTF-8");
%>




<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <%@include file="../inc/header.jsp" %>
    <input type="hidden" id="p_num" name="p_num" value="${pb.p_num }">
    <!-- Header End -->
	


	<c:set value="${requestScope.pb }" var="pb"/>
	<c:set value="${requestScope.star_avg }" var="star_avg" />
	<c:set value="${requestScope.review_count }" var="review_count"/>
	<c:set value="${pb.p_num }" var="p_num"/>
	
	
 <script type="text/javascript">
 
 //qna댓글작성 commentBtn  pb.p_num, ql.q_num, ql.id, #reply  필요
 /*  $(document).ready(function(){
	  $("#commentBtn").click(function(){
		  
		  var p_num = ${pb.p_num};
		  var q_num = $(ql.q_num);
		  var id = ${ql.id};
		  var reply = $("#reply").val();
		  
		  $.ajax({
			  type : "post",
			  url : "productQnaReviewAction.java",
			  data : {
				  "p_num" : p_num,
				  "q_num" : q_num,
				  "id" : id,
				  "reply" : reply
			  },
			  dateType : "json",
			  success : function(result){
				  $("#reply").val("");
			  },
			  error: function(){
				  alert("답글 입력 실패");
			  }
		  });}); }); */
 
 
 
 
 
 
 //qns 제목 토글적용
 $(document).ready(function(){
	 $(".q_sub a").click(function(){
		 $(this).parent().parent().nextUntil(".q_sub").toggle();
	      return false;
	 });
 });
 
 
	function goCart(){
	//var p_num = document.getElementById("p_num").value;
	var p_num = ${pb.p_num};
	var c_p_count = document.getElementById("c_p_count").value;
	
	
		/* 장바구니로  */
		var gocart = confirm("장바구니로 바로 가시겠습니까?");
		if(gocart == true){//카트추가 주소로 보내기
		//location.href="./ProductCartTest.p?c_p_count="+c_p_count+"&p_num="+p_num;
		location.href="./CartAdd.ba?c_p_count="+c_p_count+"&p_num="+p_num+"&back=0";
		}else{
		location.href="./CartAdd.ba?c_p_count="+c_p_count+"&p_num="+p_num+"&back=1";
			
		}
	}
	
	function goBuy(){
		//var p_num = document.getElementById("p_num").value;
		var p_num = ${pb.p_num};
		var c_p_count = document.getElementById("c_p_count").value;
		//alert("c_p_count : " + c_p_count + "& p_num : " + p_num);
		
		location.href="./CartAdd.ba?c_p_count="+c_p_count+"&p_num="+p_num+"&back=-1";
		//order 주소로 이동필요
			//location.href="./ProductCartTest.p?c_p_count="+c_p_count+"&p_num="+p_num;
			//location.href="./OrderStar.or?c_p_count="+c_p_count+"&p_num="+p_num;
			
		}
	
	// 수량 - 클릭시
	function countMinus(num){
		//var p_saleprice = document.getElementById("p_saleprice").value;
		var p_saleprice = ${pb.p_saleprice};
		var c_p_count = Number(document.getElementById("c_p_count").value) + num;
		
		if(c_p_count<1){
			count=1;
			alert("최소 1개이상 구매할 수 있는 상품입니다.");
			document.getElementById("c_p_count").value = 1;
		}
		
		document.getElementById("c_p_count").value = c_p_count;
		document.getElementById("totalPrice").value = p_saleprice * c_p_count;
		document.getElementById("totalPriceTxt").innerHTML = numberFormatWon( p_saleprice * c_p_count);
	}
	// 수량 + 클릭시
	function countPlus(num){
		//var p_saleprice = document.getElementById("p_saleprice").value;
		var p_saleprice = ${pb.p_saleprice};
		var c_p_count = Number(document.getElementById("c_p_count").value) + num;
		
		document.getElementById("c_p_count").value = c_p_count;
		document.getElementById("totalPrice").value = p_saleprice * c_p_count;
		document.getElementById("totalPriceTxt").innerHTML = numberFormatWon( p_saleprice * c_p_count);
	}
	// 숫자 포매팅
	function numberFormatWon(data) {

		   var str = data;
		   if(typeof data == 'number') {
		      str = str+'';
		   }

		   var n = (str.replace(/[^\d]+/g, '')).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		   return n;
		}
	
	function idcheck(){
		
		var id = <%=id%>;
		if(id == null){
			alert("로그인이 필요합니다");
			return false;
		}
	}
	

</script>



	
    <!-- 카테고리 분류 -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                        <c:if test="${pb.category == 1}"><a href="./ProductList.p?category=1">피로/간</a></c:if>
                        <c:if test="${pb.category == 2}"><a href="./ProductList.p?category=2">수면/스트레스</a></c:if>
                        <c:if test="${pb.category == 3}"><a href="./ProductList.p?category=3">피부</a></c:if>
                        <c:if test="${pb.category == 4}"><a href="./ProductList.p?category=4">눈</a></c:if>
                        <c:if test="${pb.category == 5}"><a href="./ProductList.p?category=5">두뇌활동</a></c:if>
                        <c:if test="${pb.category == 6}"><a href="./ProductList.p?category=6">심장/혈관/혈당</a></c:if>
                    	<span>상세보기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 분류 -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad page-details">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-12">
                    <div class="row">
                    
                    	<!-- 사진이미지 -->
                        <div class="col-lg-6">
                            <div class="product-pic-zoom">
                                <img class="product-big-img" src="img/product-single/product-1.jpg" alt="">
                                <div class="zoom-icon">
                                    <i class="fa fa-search-plus"></i>
                                </div>
                            </div>
                            <div class="product-thumbs">     <!--사진 넣은 후 img/${pb.img_main} 이렇게 바꾸기  -->
                                <div class="product-thumbs-track ps-slider owl-carousel">
                                    <div class="pt active" data-imgbigurl="img/product-single/product-1.jpg"><img
                                            src="img/product-single/product-1.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="img/product-single/product-2.jpg"><img
                                            src="img/product-single/product-2.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="img/product-single/product-3.jpg"><img
                                            src="img/product-single/product-3.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="img/product-single/product-3.jpg"><img
                                            src="img/product-single/product-3.jpg" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <!-- 사진이미지 -->
                        
                        <!--상세정보  -->
                        <div class="col-lg-6">
                            <div class="product-details">
                                <div class="pd-title">
                              	<!-- 카테고리 -->
                                    <h3>${pb.p_name }</h3> 
                                    <a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
                                </div>
                                <!-- 평균 별점  -->
                                <div class="pd-rating">
                                	<%@include file="./star_avg.jsp" %>
                                    <span>(${review_count})</span>
                                </div>
                                
                                <!-- 설명  -->
                                <div class="pd-desc">
                                    <p>Lorem ipsum dolor sit amet, consectetur ing elit, sed do eiusmod tempor sum dolor
                                        sit amet, consectetur adipisicing elit, sed do mod tempor</p>
                                    
                                 <!-- 가격  -->
                                    <h4><fmt:formatNumber value="${pb.p_saleprice}" pattern="#,###" />원 
                                    <span><fmt:formatNumber value="${pb.p_price}" pattern="#,###" />원</span></h4>
                                </div>
                                
                                <!-- 
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="135">
                                    </div>
                                    <a href="#" class="primary-btn pd-cart">Add To Cart</a>
                                </div>                               
                                 -->
                                
                                <div class="quantity">
                                    <div class="qty">  
                                    	<button class="minus qtybtn" onclick="countMinus(-1)"> - </button>
                                        <input type="text" value="1" id="c_p_count">
                                        <button class="plus qtybtn" onclick="countPlus(1)"> + </button>
                                    </div>
                                    
                                    <br>
                                   	<button class="primary-btn pd-cart" onclick="goCart();">장바구니</button>
                                   	<button class="primary-btn pd-cart" onclick="goBuy();">바로구매</button>
                                   <!--  <a href="#" class="primary-btn pd-cart" onclick="goCart();">Add To Cart</a> -->

                                   	<!-- <button class="primary-btn pd-cart" onclick="goCart();">Add To Cart</button> -->
                                </div>
                                
                                <!-- 총 금액 계산하기  -->
                                <br>
                                <!--  제품 기존가격(할인전)  -->
                              	<!-- <input type="hidden" id="p_price" value="${pb.p_price }"> --> 
                                <!-- 재고량 -->
                                <!--<input type="hidden" id="p_count" value="${pb.p_count }">  -->
                                <!-- <input type="hidden" id="p_saleprice" value="${pb.p_saleprice }"> -->
                                <!-- 제품 개당판매 가격 -->
                                
                                <!--제품 총 금액 수량따라 변경될 것-->
                                <input type="hidden" id="totalPrice" value="${pb.p_saleprice} }">
                                
                                <div  class="pd-desc">
                                <span >상품금액 합계 :
                                <span id="totalPriceTxt"><fmt:formatNumber pattern="#,###" >${pb.p_saleprice }</fmt:formatNumber></span> 원
                                </span>
                                </div> 
                                
                                
                                
                                
                                
                                
                                
                                <ul class="pd-tags">
                                    <li><span>CATEGORIES</span>
                                     <c:if test="${pb.category == 1}" >: 피로/간</c:if>
                                     <c:if test="${pb.category == 2}" >: 수면/스트레스</c:if>
                                     <c:if test="${pb.category == 3}" >: 피부</c:if>
                                     <c:if test="${pb.category == 4}" >: 눈</c:if>
                                     <c:if test="${pb.category == 5}" >: 두뇌활동</c:if>
                                     <c:if test="${pb.category == 6}" >: 심장/혈관/혈당</c:if></li>
                                    <!-- <li><span>TAGS</span>: Clothing, T-shirt, Woman</li> -->
                                </ul>
                                
                                
                                <div class="pd-share">
                                    <!-- <div class="p-code">Sku : 00012</div> -->
                                    <div class="pd-social">
                                        <a href="#"><i class="ti-facebook"></i></a>
                                        <a href="#"><i class="ti-twitter-alt"></i></a>
                                        <a href="#"><i class="ti-linkedin"></i></a>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>
                    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
                    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@  1  @@@@@@@@@@@@@@@@@@@-->
                    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
                    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
                    
                    <div class="product-tab">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#Tab-1" role="tab">DESCRIPTION</a>
                                </li>
                                <li> 
                                    <a data-toggle="tab" href="#Tab-2" role="tab">Customer Reviews (${review_count })</a>
                                </li>
                                <li> 
                                    <a data-toggle="tab" href="#Tab-3" role="tab" id="tab-3">Q & A</a>
                                </li>
                            </ul>
                        </div>
                        
                        <!-- DESCRIPTION -->
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="Tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-7">
                                            
                                            <!--<img src="img/${pb.img_content}" alt=""> -->
                                                <h5>Introduction</h5>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
                                                <h5>Features</h5>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
                                            </div>
                                            <div class="col-lg-5">
                                            	<!-- <img src="img/${pb.img_main}" alt=""> -->
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                                <!--@@@@@@@@@@@@@@@@@@@@@@@@@@  2  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                                <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->                               
                                
                                <!-- Customer Reviews (02)   -->
                                <div class="tab-pane fade" id="Tab-2" role="tabpanel">
                                    <div class="customer-review-option">
                                        <h4>${review_count } Comments</h4>
                                        <!--전체 리뷰 리스트 >>> -->

                                        <c:forEach items="${requestScope.reviewList }" var="reList">
                                        <c:set var="ri" value="${pageScope.reList }"/>
                                        <c:set var="r_star" value="${ri.r_star }"/>

	                                        <div class="comment-option">
	                                            <div class="co-item">
	                                                <!-- <div class="avatar-pic">
	                                                    <img src="img/product-single/avatar-1.png" alt="">
	                                                </div> -->
	                                                <div class="avatar-text personal-rating">
						                                <div class="rating">
	                                                		<%@include file="./star.jsp" %>
	                                   							 <span>(${r_star})</span>
						                                </div>
	                                                    <h5>${ri.id }  <fmt:formatDate value="${ri.r_date }" dateStyle="short"/></h5>
	                                                    <div class="at-reply">${ri.r_content }</div>
	                                                </div>
	                                            </div>
	                                        </div>
                                        </c:forEach>
                                           <!-- <<< 전체 리뷰 리스트  --> 




									
                                          <!-- 내별점>>>  -->  
                                        <div class="personal-rating">
                                        <%
                                        ReviewBean myReview = null;
                                        myReview = (ReviewBean)request.getAttribute("myReview");
                                        if(myReview != null){
                                        	System.out.println("V : myReview : " + myReview.toString());
                                        %>
                                          	  <h6>나의 별점  <fmt:formatDate value="${ri.r_date }" dateStyle="short"/></h6> 
                                            	<c:set var="my_star" value="${myReview.r_star }"/>
	                                           		 <div class="rating">
		                                            	<%@include file="./my_star.jsp" %>
		                       							 <span>(${my_star})</span>
	                                           		 </div>
	                                           	${myReview.r_content} 
	                                           	
                                          <%}%>
                                            
                                            
                                        </div>

                                        <!--<<< 내별점  -->  
                                     
                                    </div>
                                </div>
                                 <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                                <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@ 3  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                                <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  --> 
                                
                                
                                
                                
                                
                                
                                
                                <div class="tab-pane fade" id="Tab-3" role="tabpanel">
                                    <div class="customer-review-option">
                                    <!-- QnA 작성하기 -->
                                    <%-- 
                                    	<form action="./ProductQnaWriteAction.p?p_num=${pb.p_num}"  method="post" onsubmit="return idcheck()">
                                          <table class="p-catagory">
											<tr>
												<th>제목</th>
												<td><input type="text" name="subject" placeholder="제목을 입력하세요"></td>
											</tr>
											<tr>
												<th>문의사항</th>
												<td><textarea rows="" cols=""name="content" placeholder="내용을 입력하세요."></textarea></td>
											</tr>
                                          </table>
										  <input type="submit" value="문의하기">
                                        </form>
                                         --%>
                                        <div class="leave-comment">
                                        	<h4>Q & A</h4>
                                            <form action="./ProductQnaWriteAction.p?p_num=${pb.p_num}" method="post" class="comment-form" onsubmit="return idcheck()">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <input type="text" name="subject" placeholder="제목을 입력하세요">
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <textarea name="content" placeholder="내용을 입력하세요"></textarea>
	                                                    <button type="submit" class="site-btn">문의하기</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
										<!-- QnA 작성하기 -->
                                        
                                        
										<!-- QnA 불러오기 --> 
                                        <%
                                        int count = (int)request.getAttribute("count");
                                        if(id == null && count == 0){ %>
	                                		[문의하신 내용이 없습니다]
                                		<%}else if(!id.equals("admin") && count == 0){%>
                                			[문의하신 내용이 없습니다]
                            			<%}else if(count != 0 || id.equals("admin")){%>
                                		<br>
										<table id="QnA" border="1" class="qnaTable">
										  <c:forEach items="${requestScope.qnaList }" var="item">
											<c:set value="${pageScope.item }" var="ql" />
											<tr class="q_sub">
											  <td>
												<a href="#">[${ql.q_num }] 문의글 : <b>${ql.subject }</b></a>
											  </td>
											  <td class="date"><fmt:formatDate value="${ql.reg_date }" dateStyle="long"/>&nbsp;
												<c:if test="${ql.re_result ==0 }"><span>[답변등록 대기중]</span> </c:if>
												<c:if test="${ql.re_result ==1 }">[답변등록 완료] </c:if>			                                			
											  </td>
											</tr>
											<tr class="none">
											  <td colspan="2" class="content">${ql.content }</td>
											</tr>	
											<!-- 관리자일경우 -> 답글달기 칸보이게 -->
											<%if(id.equals("admin")){%>
											<tr class="none">	
											  <c:if test="${ql.re_result==0 }">
												<td colspan="2">
												  <form action="./ProductQnaReview.p?p_num=${pb.p_num }" method="post">
													<input type="hidden" name="q_num" value="${ql.q_num }">
													<input type="hidden" name="id" value="${ql.id}">
													<input type="text" name="reply" id="reply" placeholder="답변을 입력하세요">
													<input type="submit" class="site-btn reply" value="답글작성">
												  </form>
												</td>
											  </c:if>
											</tr>
											<%} %>
											<!-- 답글 달렸을 경우 답글 보이게  -->	
											<c:if test="${ql.re_result==1 }">
											  <tr class="none">
											    <td colspan="2" class="content"><img src="./product/re.gif">&nbsp; ${ql.reply }</td>
											  </tr>
											</c:if>
											<%-- 
											<!-- 관리자일경우 -> 답글달기 칸보이게 -->
											<%if(id.equals("admin")){%>
											<tr>	
											  <c:if test="${ql.re_result==0 }">
												<td colspan="2">
												  <form action="./ProductQnaReview.p?p_num=${pb.p_num }" method="post">
													<input type="hidden" name="q_num" value="${ql.q_num }">
													<input type="hidden" name="id" value="${ql.id}">
													<input type="text" name="reply" id="reply" placeholder="답변을 입력하세요">
													<input type="submit" class="site-btn reply" value="답글작성">
												  </form>
												</td>
					                              <!-- <div>
					                                <textarea rows="5" cols="20" id="reply"></textarea>
					                                <button >답글작성</button>
					                              </div> -->
											  </c:if>
											</tr>
											<%} %>
											 --%>
										  </c:forEach>
		                                </table>
		                                <%} %>
		                                <!-- <script type="text/css"> -->
										<!-- $(document).ready(function(){
										$(".none").css("display","none");
										});		 -->
										<!-- </script> -->
		                                
			                            <!-- <script type="text/javascript">
			                            	document.getElementsByClassName("none")[0].style.display = "none";
			                            	document.getElementsByClassName("none")[1].style.display = "none";
                               			 </script>	 -->	
                                	<!-- QnA 불러오기 -->
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->



	
	
    <!--추천상품: 있을때만 표시됨 >>>-->
    <div class="related-products spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                    	<c:if test="${requestScope.recomList.size() != 0}">
                        <h2>Related Products </h2>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="row">
            
            <!-- 제품1 -->
            <c:forEach items="${requestScope.recomList }" var="recom">
            <c:set value="${pageScope.recom }" var="rec"/>
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="img/${rec.img_main }" alt="">
                            <div class="sale">Sale</div>
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <!--  <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li> -->
                                 <li class="quick-view"><a href="./Product.p?p_num=${rec.p_num }">+ 상세보기</a></li>
                                <!--  <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li> -->
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">
                               <c:if test="${rec.category == 1 }">피로/간</c:if>
                               <c:if test="${rec.category == 2 }">수면/스트레스</c:if>
                               <c:if test="${rec.category == 3 }">피부</c:if>
                               <c:if test="${rec.category == 4 }">눈</c:if>
                               <c:if test="${rec.category == 5 }">두뇌활동</c:if>
                               <c:if test="${rec.category == 6 }">심장/혈관/혈당</c:if>
                            </div>
                            <a href="./Product.p?p_num=${rec.p_num }">
                                <h5>${rec.p_name }</h5>
                            </a>
                            <div class="product-price">
                                <fmt:formatNumber value="${rec.p_saleprice}" pattern="#,###" />원
                               	<span><fmt:formatNumber value="${rec.p_price}" pattern="#,###" />원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>   
            <!-- 제품1 -->   
            </div>
        </div>
    </div>
    <!-- <<< 추천상품-->


    <!-- 푸터 -->
    <%@include file="../inc/footer.jsp" %>

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/jquery.dd.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>
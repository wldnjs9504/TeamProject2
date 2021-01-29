<%@page import="net.product.db.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="./css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	
	<!-- 헤더 -->
    <%@include file="../inc/header.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                        <% 
                        int category =Integer.parseInt(request.getParameter("category"));
                        
                        //수정  -> 54~66 span 글씨색깔 좀더 진한 회색
                        if(category == 0){%>
                    		<span>전체</span>
                    	<%}if(category == 1){%>
                    		<span>피로/간</span>
	                	<%}if(category == 2){%>
	                    	<span>수면/스트레스</span>
	                	<%}if(category == 3){%>
	                    	<span>피부</span>
	                	<%}if(category == 4){%>
	                    	<span>눈</span>
	                    <%}if(category == 5){%>
	                    	<span>두뇌활동</span>
	                    <%}if(category == 6){%>
	                    	<span>심장/혈관/혈당</span>
	                	<%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
                
                
                <%
					// 로그인 제어 : 로그인이 되어있는 상태, 관리자만 볼 수 있음
			
				//if (id == null || !id.equals("admin")) {
				//	response.sendRedirect("./Main.me");
				//}
				
				// DAO 객체 생성
				// getMemberList() 메서드 호출 
				// -> 가변길이 배열 ArrayList (컬렉션)
				ArrayList productList = (ArrayList)request.getAttribute("productList");
				
				System.out.println("@"+productList);
				ProductBean pb = new ProductBean();
				String pbimg = "";
				
				String pageNum = (String)request.getAttribute("pageNum");	
				
				int count = (Integer)request.getAttribute("count");	
				int pageCount = (Integer)request.getAttribute("pageCount");	
				int pageBlock = (Integer)request.getAttribute("pageBlock");	
				int startBlock = (Integer)request.getAttribute("startBlock");	
				int endBlock =(Integer)request.getAttribute("endBlock");	
				int startPage = (Integer)request.getAttribute("startPage");	
				int pageSize = (Integer)request.getAttribute("pageSize");	
				int endPage = startPage + pageSize -1;
				if(endPage > count){
					endPage = count;
				}
				
				
				System.out.println("@@@@@@@@@@@@category = " + category);
				
				%>
                
          
                
                
                <div class="col-lg-12 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-7 col-md-7">
                                <div class="select-option">
                                    	<select class="sorting" id="orderBy" onchange="getSelectValue();">
                                    	<%
                                    	/* String odb = request.getParameter("odb"); */
                                    	String odb = (String)request.getAttribute("odb");
                                    	
                                    	if(odb.equals("num_desc")){%>
                                        	<option value="num_desc" selected="selected">최근등록순</option>
                                    	<%}else{
                                    		%><option value="num_desc">최근등록순</option><%
                                    	}%><%
                                    	if(odb.equals("star_avg")){%>
                                        	<option value="star_avg" selected="selected">별점순</option>
                                    	<%}else{
                                    		%><option value="star_avg">별점순</option><%
                                    	}%><%
                                    	if(odb.equals("price_high")){%>
                                        	<option value="price_high" selected="selected">가격높은순</option>
                                    	<%}else{
                                    		%><option value="price_high">가격높은순</option><%
                                    	}%><%
                                    	if(odb.equals("price_low")){%>
                                        	<option value="price_low" selected="selected">가격낮은순</option>
                                    	<%}else{
                                    		%><option value="price_low">가격낮은순</option><%
                                    	}%><%
                                    	if(odb.equals("readcount")){%>
                                        	<option value="readcount" selected="selected">조회순</option>
                                    	<%}else{
                                    		%><option value="readcount">조회순</option><%
                                    	}%>
                                        
                                        
                                        
                                        
                                    	</select>
                                   <!--  <select class="p-show">
                                        <option value="">Show:</option>
                                    </select> -->
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-5 text-right">
                            <!-- 수정 : 아래 P내용 좀더 진하고 굵은 색? -->
                                <p>Show &nbsp;<%= startPage %> ~ <%= endPage %> &nbsp; Of&nbsp; <%= count %> Product</p>
                            </div>
                        </div>
                    </div>
                    
                <script type="text/javascript">
                
	                function getSelectValue(){
	                	var selectedValue = document.getElementById("orderBy").value;
	                	
	                	/*  $.ajax("./ProductList.p?odb="+selectedValue,{
	            			//url: "ajaxString1.jsp",
	            			success: function(result){
	            				
	            			}
	            			
	            		});  */
	                	
	                	
	                	console.log(selectedValue);
	                	location.href="./ProductList.p?category="+<%=category%>+"&odb="+selectedValue;
	                	
	                }
                
                </script>
                    
                    
                    <div class="product-list">
                        <div class="row">
                        <%
                    	for(int i=0; i<productList.size(); i++){
        					pb = (ProductBean)productList.get(i);
        					pbimg = pb.getImg_main();
        				%>
                            <div class="col-lg-4 col-sm-6">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <img src="./img/products/<%=pbimg%>" alt="" width="">
                                        <!--270 * 330  -->
                                        <div class="sale pp-sale">Sale</div>
                                        <div class="icon">
                                            <i class="icon_heart_alt"></i>
                                        </div>
                                        <ul>
                                           <!--  <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li> -->
                                            <li class="quick-view"><a href="#">+ 상세보기</a></li>
                                           <!--  <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li> -->
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                        <div class="catagory-name">
                                        <!-- 수정 :  div class="catagory-name" 안에 내용 좀더 잘보이는 회색으로 -->
                                        <% if(pb.getCategory() == 1){%>피로/간<% }%>
                                        <% if(pb.getCategory() == 2){%>수면/스트레스<% }%>
                                        <% if(pb.getCategory() == 3){%>피부<% }%>
                                        <% if(pb.getCategory() == 4){%>눈<% }%>
                                        <% if(pb.getCategory() == 5){%>두뇌활동<% }%>
                                        <% if(pb.getCategory() == 6){%>심장/혈관/혈당<% }%>
                                        </div>
                                        <a href="#">
                                            <h5><%= pb.getP_name() %></h5>
                                        </a>
                                        <div class="product-price">
                                            $<%=pb.getP_saleprice() %>
                                            <span>$<%=pb.getP_price() %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <%
                            }
                            %>
                        </div>
                    </div>
                    <div class="loading-more">
                    <%
	//페이징 처리 (하단부)
	if(count != 0){
		//이전
		if(startBlock > pageBlock){
			%>
			<a href="./ProductList.p?pageNum=<%=startBlock - pageBlock %>&odb=<%=odb%>"> [이전]</a>
			<%
		}
		
		//페이지숫자
		for(int i=startBlock;i<= endBlock; i++){
			%>
			<a href="./ProductList.p?pageNum=<%=i%>&odb=<%=odb%>">[<%=i %>]</a>
			<%			
		}
		//다음
		if(endBlock < pageCount){
		%>
		<a href="./ProductList.p?pageNum=<%= startBlock + pageBlock%>&odb=<%=odb%>"> [다음]</a>
		<%
		}
		
	}
	
	%>
                    
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->

    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="./img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="./img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="./img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="./img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="./img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Logo Section End -->
 
    <!-- 푸터 -->
    <%@include file="../inc/footer.jsp" %>

    <!-- Js Plugins -->
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/jquery-ui.min.js"></script>
    <script src="./js/jquery.countdown.min.js"></script>
    <script src="./js/jquery.nice-select.min.js"></script>
    <script src="./js/jquery.zoom.min.js"></script>
    <script src="./js/jquery.dd.min.js"></script>
    <script src="./js/jquery.slicknav.js"></script>
    <script src="./js/owl.carousel.min.js"></script>
    <script src="./js/main.js"></script>
</body>
</html>
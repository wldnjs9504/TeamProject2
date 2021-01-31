<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
%>
<header class="header-section">
	<div class="header-top">
		<div class="container">
			<div class="ht-right">
				<a href="./AdminMenu.ao" class="login-panel"><i class="fa fa-user"></i>관리자 메뉴</a>
				<!-- model2 링크로 변경할 것 -->
			<%if(id == null || id.isEmpty()) { %>
				<a href="<%=request.getContextPath() %>/member/join.jsp" class="login-panel"><i class="fa fa-user"></i>Join</a>
				<a href="<%=request.getContextPath() %>/member/login.jsp" class="login-panel"><i class="fa fa-user"></i>Login</a>
			<%}else if(id.equals("admin")){	%>
				<a href="<%=request.getContextPath() %>/member/logout.jsp" class="login-panel"><i class="fa fa-user"></i>Logout</a>
				<!-- id 클릭시 관리자 페이지로 이동. jsp 페이지명 변경될 수 있음 -->
				<a href="<%=request.getContextPath() %>/admin/admin.jsp" class="login-panel">관리자</a>님 환영합니다.
			<%}else{ %>
				<a href="<%=request.getContextPath() %>/member/logout.jsp" class="login-panel"><i class="fa fa-user"></i>Logout</a>
				<!-- id 클릭시 회원정보 페이지로 이동 -->			
				<a href="<%=request.getContextPath() %>/member/info.jsp" class="login-panel">id</a>님 환영합니다.
			<%} %>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="inner-header">
			<div class="row">
				<div class="col-lg-2 col-md-2">
					<div class="logo">
						<a href="<%=request.getContextPath() %>/index.jsp">
							<img src="<%=request.getContextPath() %>/img/logo_sample1.png" alt="logo">
						</a>
					</div>
				</div>
				
				<!-- 검색창  -->
				<div class="col-lg-7 col-md-7">
					<form action="<%=request.getContextPath() %>/ProductList.p?category=0/board/board.jsp" method="get">
						<%@include file="search.jsp" %>
					</form>
				</div>
				<!-- 검색창  -->
				
				<div class="col-lg-3 text-right col-md-3">
					<ul class="nav-right">
						<li class="heart-icon">
							<a href="#">
								<i class="icon_heart_alt"></i>
								<span>1</span>
							</a>
						</li>
						<li class="cart-icon">
							<a href="#">
								<i class="icon_bag_alt"></i>
								<span>3</span>
							</a>
							<div class="cart-hover">
								<div class="select-items">
									<table>
										<tbody>
											<tr>
												<td class="si-pic"><img src="<%=request.getContextPath() %>/img/select-product-1.jpg" alt=""></td>
												<td class="si-text">
													<div class="product-selected">
														<p>$60.00 x 1</p>
														<h6>Kabino Bedside Table</h6>
													</div>
												</td>
												<td class="si-close">
													<i class="ti-close"></i>
												</td>
											</tr>
											<tr>
												<td class="si-pic"><img src="<%=request.getContextPath() %>/img/select-product-2.jpg" alt=""></td>
												<td class="si-text">
													<div class="product-selected">
														<p>$60.00 x 1</p>
														<h6>Kabino Bedside Table</h6>
													</div>
												</td>
												<td class="si-close">
													<i class="ti-close"></i>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="select-total">
									<span>total:</span>
									<h5>$120.00</h5>
								</div>
								<div class="select-button">
									<a href="#" class="primary-btn checkout-btn">CHECK OUT</a>
								</div>
							</div>
						</li>
						<li class="cart-price">$150.00</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="nav-item">
		<div class="container">
			<nav class="nav-menu mobile-menu">
				<ul>
					<li id="m01"><a href="./ProductList.p?category=0">전체</a></li>
					<li id="m01"><a href="./ProductList.p?category=1">피로/간</a></li>
					<li id="m02"><a href="./ProductList.p?category=2">수면/스트레스</a></li>
					<li id="m03"><a href="./ProductList.p?category=3">피부</a></li>
					<li id="m04"><a href="./ProductList.p?category=4">눈</a></li>
					<li id="m05"><a href="./ProductList.p?category=5">두뇌활동</a></li>
					<li id="m06"><a href="./ProductList.p?category=6">심장/혈관/혈당</a></li>
				</ul>
			</nav>
			<div id="mobile-menu-wrap"></div>
		</div>
	</div>
</header>
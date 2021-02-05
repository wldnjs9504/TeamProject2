<%@page import="net.cart.db.CartBean"%>
<%@page import="java.awt.List"%>
<%
//OrderStarAction에 저장한 정보를 가져오기
//장바구니정보 저장된 거 가져오기
List CartList = (List) request.getAttribute("CartList");
//장바구니에 저장된 상품정보 정보저장된 거 가져오기
List productList = (List) request.getAttribute("productList");
//구매회원정보 저장된 거 가져오기
MemberBean mb = (MemberBean) request.getAttribute("memberbean");


%>
<table border="1">
<caption>주문상세내역</caption>
	<tr>
		<th>사진</th>
		<th>상품명</th>
		<th>수량(단위: 개)</th>
		<th>색상</th>
		<th>사이즈</th>
		<th>가격(단위: 원)</th>
	</tr>
<%
for(int i=0; i<cartList.size(); i++){
	CartBean cb = (CartBean) cartList.get(i);
	ProductBean pb = (ProductBean) productList.get(i);
%>
	<tr>
		<td><img src="./upload/<%=pb.getImage().split(",")[0]%>" height="100px"></td>
		<td><%=pb.getName() %></td>
		<td><%=pb.getC_p_count() %></td>
		<td><%=pb.getPrice() %></td>
	</tr>
<%} %>
</table>

<hr>
<fieldset>
<legend>주문자정보</legend>
<%

%>
<form action="./OrderAdd.or" method="post"></form>
	구매자 이름 : <input type="text" name="name" value="<%=mb.getName() %>" readonly><br>
	구매자 연락처 : <input type="text" name="tel" value=""><br>
	구매자 이메일  : <input type="text" name="email" value="<%=mb.getEmail()%>" readonly><br>
	<h2>배송지정보</h2>
		받는 사람 이름 : <input type="text" name="o_receive_name" value=""><br>
		받는 사람 연락처 : <input type="text" name="o_receive_phone" value=""><br>
		배송지 주소 : <input type="text" name="o_receive_addr1" value=""><br>
		나머지 주소 : <input type="text" name="o_receive_addr2" value=""><br>
		기타 요청사항 : <input type="text" name="o_memo" value=""><br>
	<h2>결제정보</h2>
	    <input type="radio" name="o"> 신용카드
       	<input type="radio" name="o"> 온라인입금
       	<input type="radio" name="o"> 휴대폰 결재
       	<input type="radio" name="o"> 문화상품권<br>
       	입급자명 (온라인 입금전용): <input type="text" name="o_trade_payer" value="<%=mb.getName()%>"> <br>
	<hr>
	<input type="submit" class="btn" value="결제하기">
	<input type="reset" class="btn" value="초기화">
</fieldset>
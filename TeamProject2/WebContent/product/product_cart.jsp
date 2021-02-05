<%@page import="net.cart.db.CartBean"%>
<%@page import="java.awt.List"%>
<%
//한글처리
request.setCharacterEncoding("UTF-8");

//List가 null인경우 처리
boolean listIsNull = (boolean) request.getAttribute("CartListNull");
if(listIsNull){ //전달된 리스트정보가 null인 경우
	%>
  <table border="1">
   <caption><%=session.getAttribute("id") %>님의 장바구니</caption>
	<tr>
	   <th>번호</th>
	   <th>사진</th>
	   <th>상품명</th>
	   <th>크기</th>
	   <th>색상</th>
	   <th>수량</th>
	   <th>가격</th>
	   <th>삭제</th>
	</tr> 
	<%
}else{ ////전달된 리스트정보가 null이 아닌 경우
	//basketList에서 구현한 정보를 전달받아서 처리
	List cartList = (List) request.getAttribute("cartList");
	List productList = (List) request.getAttribute("productList");
	CartBean cb = cartList.get(0);
%>
<!-- 장바구니 번호, 사진(대표이미지), 상품명, 사이즈,색상,수량,가격, 삭제 -->
 <table border="1">
   <caption><%=cb.getC_m_id() %>님의 장바구니</caption>
	<tr>
	   <th>번호</th>
	   <th>사진</th>
	   <th>상품명</th>
	   <th>크기</th>
	   <th>색상</th>
	   <th>수량</th>
	   <th>가격</th>
	   <th>삭제</th>
	</tr>
   <%
   //EL태그는 FOR문과 상관없이 <c:forEach> 사용해서 출력해야한다.
   for(int i=0; i<cartList.size(); i++){
	   CartBean cb = (CartBean) cartList.get(i);
	   ProductBean pb = (ProductBean) productList.get(i);
   %>
   <tr>
   	<!-- 순차 넘버링  -->
      <td><%=i+1%></td>
      <td><img src="./upload/<%=pb.getImage().split(",")[0] %>" height="100px"></td>
      <td><%=pb.getName() %></td>
      <td><%=cb.getC_p_count() %></td>
      <td><%=pb.getPrice() %></td>
      <td>
	  	<input type="button" class="btn" value="[장바구니에서 삭제]" 
	  			onclick="location.href='./CartDelete.ba?b_num=<%=cb.getC_num()%>'">
      </td>
   </tr>
   <%
   	}
   } %>
 </table>
<input type="button" class="btn" value="[구매하기]" onclick="location.href='./OrderStar.or'">
<input type="button" class="btn" value="[계속 쇼핑하기]" onclick="location.href='./ProductList.go'">
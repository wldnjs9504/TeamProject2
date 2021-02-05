package net.cart.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cart.db.CartDAO;

public class CartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("M : CartListAction의 execute() 호출");
		// 로그인 정보 (로그인 처리필요)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(false);
			return forward;
		}
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		//BasketDAO 이용하여 장바구니 정보(옵션, 구매수량)+해당 상품정보(이름,이미지,가격) 가져오는 메서드 호출
		CartDAO cdao = new CartDAO();
		Vector totalData = cdao.getCartList(id);
		
		//저장
		request.setAttribute("cartList", totalData.get(0));
		request.setAttribute("productList", totalData.get(1));
		

		//페이지이동
		forward.setPath("./product/product_cart.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
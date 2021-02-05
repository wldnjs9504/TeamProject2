package net.cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.cart.db.CartDAO;

public class CartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("M : CartDeleteAction의 execute() 호출");
		//전달정보 저장
//		int b_num = request.getParameter("b_num");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		//BoardDAO객체생성 deleteBoard
		CartDAO cdao = new CartDAO();
		cdao.deleteCart(b_num);
		System.out.println("M: 장바구니에서 삭제 완료");
		
		//장바구니list로 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./cartList.ba");
		forward.setRedirect(true);
		return forward;
	}
}
package net.order.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cart.db.CartBean;
import net.cart.db.CartDAO;
import net.member.db.MemberDAO;

public class OrderStarAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("M : OrderStarAction의 execute() 호출");
		// 로그인 정보 (로그인 처리필요)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./Login.me");
			forward.setRedirect(true);
			return forward;
		}
		//장바구니정보 저장
		CartDAO cdao = new CartDAO();
		ArrayList<CartBean> cartList = cdao.getCartList(id);

		//구매회원정보 저장 
		MemberDAO mdao = new MemberDAO();
		//MemberBean mb = mdao.getMember(id); 한 줄에 처리
		request.setAttribute("memberBean", mdao.getMember(id));
		request.setAttribute("cartList", cartList);
		//페이지이동
		forward.setPath("./product/product_buy.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
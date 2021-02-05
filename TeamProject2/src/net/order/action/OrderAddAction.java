package net.order.action;


import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cart.db.CartDAO;
import net.cart.db.CartBean;
import net.order.db.orderBean;
import net.order.db.OrderDAO;
import net.product.db.ProductBean;

public class OrderAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("M : OrderAddAction의 execute() 호출");
		// 로그인 정보 (로그인 처리필요)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달된 정보를 저장
		// 한글처리
		// OrderBean 객체 생성 -> 정보 저장
		orderBean ob =  new orderBean();
		ob.setId(id);
		ob.setB_name(request.getParameter("b_name")); //b_name이 없음. b_num을 넘기는것인지??
		ob.setD_name(request.getParameter("d_name"));
		ob.setD_phone(request.getParameter("d_phone"));
		ob.setD_address(request.getParameter("d_address"));
		ob.setD_address2(request.getParameter("d_address2"));
		ob.setD_message(request.getParameter("d_message"));

		
		CartDAO cdao = new CartDAO();
		Vector data = cdao.getCartList(id);
		
		// 장바구니 정보
		List<CartBean> cartList = (List<CartBean>) data.get(0);
		
		// 상품정보 
		List<ProductBean> productList = (List<ProductBean>) data.get(1);
		
		// 결재 모듈(카카오,아임포트,U+) 추가영역
		System.out.println("M : 결제모듈 성공");
		
		// OrderDAO 객체 생성 - addOrder(주문정보,장바구니정보,상품정보)
		OrderDAO odao = new OrderDAO();
		odao.addOrder(ob, cartList, productList);
		System.out.println("M : team1_order 테이블에 저장완료");
		
		//구매확정 메일이나 문자 , 카톡메세지 등을 유저에게 보내는 추가영역
		System.out.println("M : 구매확정 내역 전송 완료");
		
		//상품정보 수정 - 구매 수량만큼 구매갯수 차감
		ProductDAO pdao = new ProductDAO(); 
		pdao.updateAmount(cartList);
		
		//장바구니 비우기(삭제)
		cdao.deleteCart(id);
		
		//페이지이동
		forward.setPath("./OrderList.or");
		forward.setRedirect(true);
		return forward;
	}

}
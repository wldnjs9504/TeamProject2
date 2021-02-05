package net.order.action;


import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cart.db.CartDAO;
import net.cart.db.CartBean;
import net.order.db.OrderBean;
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
		OrderBean ob =  new OrderBean();
		ob.setId(id);
		ob.setB_num(Integer.parseInt(request.getParameter("b_num")));
		ob.setO_name(request.getParameter("o_name"));
		ob.setO_phone(request.getParameter("o_phone"));
		ob.setO_email(request.getParameter("o_email"));
		ob.setP_num(Integer.parseInt(request.getParameter("p_num")));
		ob.setB_count(Integer.parseInt(request.getParameter("b_count")));
		ob.setPoint(Integer.parseInt(request.getParameter("point")));
		ob.setD_cost(Integer.parseInt(request.getParameter("d_cost")));
		ob.setD_result(Integer.parseInt(request.getParameter("d_result")));
		ob.setD_name(request.getParameter("d_name"));
		ob.setD_phone(request.getParameter("d_phone"));
		ob.setD_postcode(Integer.parseInt(request.getParameter("postcode")));
		ob.setD_address(request.getParameter("d_address"));
		ob.setD_address2(request.getParameter("d_address2"));
		ob.setD_message(request.getParameter("d_message"));
		ob.setPayment(Integer.parseInt(request.getParameter("payment")));
		
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
		ProductDAO pdao = new ProductDAO(); //해당하는 ProductDAO에 아래 updateAmount 넘기기
		pdao.updateAmount(cartList); //product테이블의 p_count(재고) - p_order의 b_count(실제 구매 수량) 하는 형식으로 제품 재고 update할 것
		
		//장바구니 비우기(삭제)
		cdao.deleteCart(id); //b_num값 넘기는지?
		
		//페이지이동
		forward.setPath("./OrderList.or");
		forward.setRedirect(true);
		return forward;
	}

}
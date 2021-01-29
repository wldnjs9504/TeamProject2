package net.admin.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.order.db.AdminOrderDAO;
import net.order.db.orderBean;

public class AdminOrderModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminOrderModifyAction");
		request.setCharacterEncoding("UTF-8");

		
		System.out.println("문제 없음");
		orderBean ob = new orderBean();
		System.out.println("문 제 없음");
		System.out.println("문제 없음");
		
		ob.setD_result(Integer.parseInt(request.getParameter("d_result")));
		ob.setB_num(Integer.parseInt(request.getParameter("b_num")));
		
		System.out.println(ob);

		AdminOrderDAO odao = new AdminOrderDAO();

		odao.updateOrder(ob);

		ActionForward forward = new ActionForward();
		forward.setPath("./AdminOrderList.ao");
		forward.setRedirect(true);
		return forward;
	}
}

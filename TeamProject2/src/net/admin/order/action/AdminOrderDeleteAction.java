package net.admin.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.order.db.AdminOrderDAO;
import net.admin.product.db.ProductBean;
import net.admin.product.db.ProductDAO;

public class AdminOrderDeleteAction implements Action {

	@Override
	public net.admin.order.action.ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("AdminOrderDeleteAction");
		
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		AdminOrderDAO odao = new AdminOrderDAO();
		odao.deleteOrder(b_num);
		
		//페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminOrderList.ao");
		forward.setRedirect(true);
		
		return forward;
		
		
	}
}

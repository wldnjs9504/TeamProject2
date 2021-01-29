package net.admin.order.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.order.db.AdminOrderDAO;

public class AdminOrderDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminOrderDetailAction");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		
		AdminOrderDAO adao = new AdminOrderDAO();
		
		System.out.println("문제없음");
		List list = adao.getAdminOrderDetail(b_num, p_num);
		System.out.println("문제 없음");
		
		request.setAttribute("list", list);
		System.out.println("문제없음");
		
		ActionForward forward = new ActionForward();
		forward.setPath("./adminorder/adminordermodify.jsp");
		forward.setRedirect(false);
		return forward;
	}
}

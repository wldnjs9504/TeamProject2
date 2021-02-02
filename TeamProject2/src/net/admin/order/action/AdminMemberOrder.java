package net.admin.order.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.order.db.AdminOrderDAO;

public class AdminMemberOrder implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("AdminMemberOrder");
		
		String id = request.getParameter("id");
		
		//객체 생성
		AdminOrderDAO adao = new AdminOrderDAO();
		
		//List
		List list = adao.getAdminOrderList(id);
		
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./adminorder/adminmemberorder.jsp");
		return forward;
		
	}
		

}

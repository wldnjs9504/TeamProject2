package net.admin.order.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.order.db.AdminOrderDAO;

public class AdminOrderList implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		//관리자 세션 제어
		
		//객체 생성
		AdminOrderDAO adao = new AdminOrderDAO();
		
		//List
		List list = adao.getAdminOrderList();
		
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./adminorder/adminorderlist.jsp");
		return forward;
		
	}

}

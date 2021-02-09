package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class MemberOrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("action-detail");

		int b_num = Integer.parseInt(request.getParameter("b_num"));
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		
		MemberDAO mdao = new MemberDAO();
		
		List list = mdao.getmemberOrderDetail(b_num, p_num);
		
		request.setAttribute("list", list);
			
		ActionForward forward = new ActionForward();
		forward.setPath("./member/memberOrderDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}

package net.admin.order.action;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class AdminOrderFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//媛��긽二쇱냼 媛��졇�삤湲�
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		//媛��긽二쇱냼 泥섎━
		Action action = null;
		ActionForward forward = null;
		if(command.equals("/AdminOrderList.ao")) {
			//AdminOrderListAction 
			action = new AdminOrderList();
			try {
				forward=action.execute(request, response);
				forward.setPath("./adminorder/adminorderlist.jsp");
				forward.setRedirect(false);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AdminOrderDetail.ao")){
			//  AdminOrderDetailAction
			action=new AdminOrderDetailAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/AdminOrderModifyAction.ao")) {
			//AdminOrderModifyAction
			action = new AdminOrderModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AdminOrderDeleteAction.ao")){
			action = new AdminOrderDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AdminMenu.ao")){
			forward = new ActionForward();
			forward.setPath("./adminorder/adminmenu.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/AdminMember.ao")) {
			action = new AdminMemberAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AdminMemberOrder.ao")) {
			action = new AdminMemberOrder();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		//�럹�씠吏� �씠�룞
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dis = 
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}

		
		
	}
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	
	
	
}

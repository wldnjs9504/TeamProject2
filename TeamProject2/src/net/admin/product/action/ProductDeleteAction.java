package net.admin.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.product.db.ProductDAO;

public class ProductDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("ProductDeleteAction");
		
		
		
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		
		
		ProductDAO pdao = new ProductDAO();
		
		pdao.deleteProduct(p_num);
		
		//페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./ProductList.ap");
		forward.setRedirect(true);
		return forward;
	}

}

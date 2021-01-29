package net.admin.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.product.db.ProductBean;
import net.admin.product.db.ProductDAO;

public class ProductModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("ProductModifyAction");
		request.setCharacterEncoding("UTF-8");
		
		
		System.out.println("여기까지 이상 없음");
		ProductBean pb = new ProductBean();
		System.out.println("여기까지 이상 없음");
		System.out.println(pb);
		
		pb.setP_num(Integer.parseInt(request.getParameter("p_num")));
		pb.setP_count(Integer.parseInt(request.getParameter("p_count")));
		pb.setCategory(Integer.parseInt(request.getParameter("category")));
		pb.setP_price(Integer.parseInt(request.getParameter("p_price")));
		pb.setP_saleprice(Integer.parseInt(request.getParameter("p_saleprice")));
		pb.setP_name(request.getParameter("p_name"));
		
		
		System.out.println("여기까지 이상 없음");
		System.out.println(pb);
		
		ProductDAO pdao = new ProductDAO();
		pdao.productModify(pb);
		
		//페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./ProductList.ap");
		forward.setRedirect(true);

		return forward;
		
	}

}

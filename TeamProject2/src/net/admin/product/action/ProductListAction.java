package net.admin.product.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.product.db.ProductBean;
import net.admin.product.db.ProductDAO;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductListAction");
		ProductDAO pdao = new ProductDAO();
		//리스트 목록 띄우기
		List productList = pdao.getProductList();
		//productList에 저장
		request.setAttribute("productList", productList);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./adminproduct/list.jsp");
		forward.setRedirect(false);
		return forward;
		
		
	}

}

package net.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.ProductDAO;

public class ProductDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("ProductDeleteAction");
		
		
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(p_num > 0) {
			out.print("<script>");
			out.print("  if (confirm('정말 삭제하시겠습니까?') == true){ ");
			ProductDAO pdao = new ProductDAO();
			pdao.deleteProduct(p_num);
			out.print("  location.href=\'./ProductList.ap'; ");
			out.print("  }else{  ");
			out.print("  history.back(); ");
			out.print("  }  ");
			out.print("</script>");
			out.close();
			return null;
		}
		
		System.out.println(p_num);
		ProductDAO pdao = new ProductDAO();
		pdao.deleteProduct(p_num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ProductList.ap");
		forward.setRedirect(true);
		return forward;
		
		
		//페이지 이동
		
	}
}

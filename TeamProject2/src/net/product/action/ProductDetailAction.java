package net.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.product.db.ProductBean;
import net.product.db.ProductDAO;

public class ProductDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("M: ProductDetailAction_execute() 실행");
		
		ProductDAO pdao = new ProductDAO();
		
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		
			//제품정보 저장
			//pdao.getProduct(p_num) 제품상세정보
			ProductBean pb = pdao.getProduct(p_num);
			//productBean  저장
			request.setAttribute("pb", pb);
			 
			//pdao.getStarAvg(p_num) 별점계산
			double star_avg = pdao.getStarAvg(p_num);
			request.setAttribute("star_avg", star_avg);
			
			//pdao.getReviewCount(p_num) 리뷰수 계산
			int review_count = pdao.getReviewCount(p_num);
			request.setAttribute("review_count", review_count);
		
		
			//QnA정보 들고오기
		
		
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./product/product.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}
}


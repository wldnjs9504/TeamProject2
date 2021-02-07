package net.product.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.product.db.ProductBean;
import net.product.db.ProductDAO;
import net.product.db.ProductQnaBean;
import net.product.db.ProductQnaDAO;
import net.product.db.ReviewBean;

public class ProductDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("M: ProductDetailAction_execute() 실행");
		
		ProductDAO pdao = new ProductDAO();
		
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		//id저장	
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		
		
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
			
			//review list 들고오기
			ArrayList<ReviewBean> reviewList = pdao.getReviewList(p_num);
			request.setAttribute("reviewList", reviewList);
		
			//QnA list 들고오기
			//QnA 갯수
			ProductQnaDAO pqdao = new ProductQnaDAO();
			int count = pqdao.getQnaCount(p_num, id); //QnA총 갯수
			//int pageCount = 5; //보여줄 QnA갯수
			//QnaList 저장 (QnA리스트, 리스트 전체수, ) 
			
			if(id != null) {
			if(count != 0 || id.equals("admin")) {
				ArrayList<ProductQnaBean> qnaList = pqdao.getQnaList(p_num, id);
				request.setAttribute("qnaList", qnaList);
			}}
			request.setAttribute("count", count);
			//request.setAttribute("pageCount", pageCount);
			
		
		
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./product/product.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}
}


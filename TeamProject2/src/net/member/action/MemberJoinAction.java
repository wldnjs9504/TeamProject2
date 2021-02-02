package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberJoinAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       
        // 한글처리 
        request.setCharacterEncoding("UTF-8");
        
        MemberBean mb = new MemberBean();
        
        mb.setId(request.getParameter("id"));
        mb.setPass(request.getParameter("pass"));
        mb.setEmail(request.getParameter("email"));
        mb.setPostcode(Integer.parseInt(request.getParameter("postcode")));
        mb.setAddress1(request.getParameter("address1"));
        mb.setAddress2(request.getParameter("address2"));
          
        // DB 처리 (DAO 객체 생성)
        MemberDAO mdao = new MemberDAO();  
        
        // 회원가입 메서드 구현 
        mdao.insertMember(mb);        
              
        ActionForward forward = new ActionForward();
        forward.setPath("./Login.me");
        forward.setRedirect(true);	
		
        return forward;
	}

}

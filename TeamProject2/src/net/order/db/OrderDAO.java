package net.order.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context; //import 추가
import javax.naming.InitialContext; //import 추가
import javax.sql.DataSource;

import net.cart.db.CartBean;
import net.product.db.ProductBean;

public class OrderDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	// 디비 연결
	private void getCon() throws Exception{
		// 커넥션 풀
		//context.xml추가
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/model2DB");
		con = ds.getConnection();
		System.out.println("DAO : 디비연결 완료 "+con);
	}//end of getCon()
	
	//주문등록하기
	public void addOrder(orderBean ob, List<CartBean> cartList, List<ProductBean> productList) {
		int b_num = 0; //일련번호
		int trade_num = 0; //주문번호

		//주문번호 계산시 사용
		//Calendar new로 객체생성은 할 수 없고 getInstance()로 만들어져있는 객체를 가져와다가 활용해야한다 
		//이를 싱글톤패턴이라고 부른다
		Calendar cal = Calendar.getInstance(); //시스템날짜
		//날짜 정보를 포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		try{
			getCon();
			//주문테이블(itwillbs_order) 번호 계산하기
			sql = "selct max(o_num) from team1_order";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				b_num = rs.getInt(1)+1;
			}
			trade_num = b_num;
			System.out.println("trade_num= "+trade_num);
			System.out.println("b_num= "+b_num);

			//전달정보 사용해서 데이터베이스에 추가
			for(int i=0; i<cartList.size(); i++){
				CartBean cb = (CartBean) cartList.get(i);
				ProductBean pb = (ProductBean) productList.get(i);

				sql = "insert into order values(?,?,?,?,?,"
						+ "?,?,?,?,?,"
						+ "?,?,?,?,?,"
						+ "?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, b_num);
				pstmt.setString(2, ob.getId());
				pstmt.setInt(3, cb.getP_num());				
//				pstmt.setString(4, pb.getName());
				pstmt.setString(4, pb.getP_name());
				pstmt.setInt(5, cb.getC_count());
				pstmt.setString(6, ob.getO_email());
				pstmt.setString(7, ob.getO_phone());
				pstmt.setDate(8, ob.getB_date());
				pstmt.setInt(9, ob.getPoint());

				pstmt.setInt(10, ob.getD_cost());
				pstmt.setInt(11, ob.getD_result());

				pstmt.setString(12, ob.getD_name());
				pstmt.setString(13, ob.getD_address());
				pstmt.setString(14, ob.getD_address2());
				pstmt.setString(15, ob.getD_phone());
				pstmt.setString(16, ob.getD_message());
//				pstmt.setInt(17, cb.getC_count() * pb.getPrice());
				pstmt.setInt(17, cb.getC_count() * pb.getP_price());
				
				pstmt.setInt(18, ob.getD_postcode());
				pstmt.setInt(19, ob.getPayment());
				pstmt.executeUpdate();

				b_num++; //일련번호를 증가시킴
				//한 사람의 장바구니에 있는 모든 주문을 입력하기 전까지 계속해서 1씩 증가시킴
				//유저가 바뀌는 경우  sql구문(max(o_num))이 시작번호를 계산한다
			}		
			System.out.println("DAO: 주문성공");
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}//end of addOrder()
	
	// 디비 자원해제
	public void closeDB(){
		try {
			if(rs != null) {rs.close();	}
			if(pstmt != null) {pstmt.close();	}
			if(con != null) {con.close(); }
		}
		catch (SQLException e) {
			e.printStackTrace();
		} 
	}//end of closeDB()
}
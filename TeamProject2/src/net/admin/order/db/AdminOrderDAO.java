package net.admin.order.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.admin.product.db.ProductBean;
import net.order.db.orderBean;

public class AdminOrderDAO {

	// DB에 관련된 모든 처리를 하는 객체
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 디비 연결 - 커넥션 풀을 사용해서 디비 연결
	private Connection getCon() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/team1");
		con = ds.getConnection();

		return con;
	}

	// 디비 자원해제
	public void closeDB() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//getAdminOrderList()
	public List getAdminOrderList() {
		List list = new ArrayList();
		
		try {
			getCon();
			sql = "select * from p_order order by b_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("문제없음");
			while(rs.next()) {
				orderBean ob = new orderBean();
				ob.setB_count(rs.getInt("b_count"));
				ob.setB_date(rs.getDate("b_date"));
				ob.setB_num(rs.getInt("b_num"));
				ob.setD_address(rs.getString("d_address"));
				ob.setD_address2(rs.getString("d_address2"));
				ob.setD_cost(rs.getInt("d_cost"));
				ob.setD_message(rs.getString("d_message"));
				ob.setD_name(rs.getString("d_name"));
				ob.setD_phone(rs.getString("d_phone"));
				ob.setId(rs.getString("id"));
				ob.setO_email(rs.getString("o_email"));
				ob.setO_name(rs.getString("o_name"));
				ob.setO_phone(rs.getString("o_phone"));
				ob.setP_num(rs.getInt("p_num"));
				ob.setPayment(rs.getInt("payment"));
				ob.setPoint(rs.getInt("point"));
				ob.setD_result(rs.getInt("d_result"));
				list.add(ob);
			}
			System.out.println("문제없음");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return list;
	}
	//getAdminOrderList()
	
	//getAdminOrderDetail(b_num)
	public List getAdminOrderDetail(int b_num, int p_num) {
		List list = new ArrayList();
		
		try {
			con = getCon();
			sql = "select * from p_order po join product p where po.p_num = p.p_num and po.p_num=? and po.b_num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, p_num);
			pstmt.setInt(2, b_num);
			
			rs = pstmt.executeQuery();
			
			System.out.println("문제 없음");
			while(rs.next()) {
				orderBean ob = new orderBean();
				ProductBean pb = new ProductBean();
				ob.setB_count(rs.getInt("b_count"));
				ob.setB_date(rs.getDate("b_date"));
				ob.setB_num(rs.getInt("b_num"));
				ob.setD_address(rs.getString("d_address"));
				ob.setD_address2(rs.getString("d_address2"));
				ob.setD_cost(rs.getInt("d_cost"));
				ob.setD_message(rs.getString("d_message"));
				ob.setD_name(rs.getString("d_name"));
				ob.setD_phone(rs.getString("d_phone"));
				ob.setId(rs.getString("id"));
				ob.setO_email(rs.getString("o_email"));
				ob.setO_name(rs.getString("o_name"));
				ob.setO_phone(rs.getString("o_phone"));
				ob.setP_num(rs.getInt("p_num"));
				ob.setPayment(rs.getInt("payment"));
				ob.setPoint(rs.getInt("point"));
				ob.setD_result(rs.getInt("d_result"));
				pb.setCategory(rs.getInt("category"));
				pb.setP_count(rs.getInt("p_count"));
				pb.setImg_content(rs.getString("img_content"));
				pb.setImg_main(rs.getString("img_main"));
				pb.setP_name(rs.getString("p_name"));
				pb.setP_num(rs.getInt("p_num"));
				pb.setP_price(rs.getInt("p_price"));
				pb.setP_saleprice(rs.getInt("p_saleprice"));
				pb.setPrice_count(rs.getInt("price_count"));
				list.add(ob);
				list.add(pb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return list;
	}
	//getAdminOrderDetail(b_num)
	
	//updateOrder(OrderBean ob)
	public void updateOrder(orderBean ob) {
		try {
			con = getCon();
			sql = "update p_order set d_result=? where b_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ob.getD_result());
			pstmt.setInt(2, ob.getB_num());
			
			pstmt.executeUpdate();
			System.out.println("수정 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정 실패");
		} finally {
			closeDB();
		}
		
	}
	//updateOrder(OrderBean ob)
	
	//deleteOrder(b_num)
	public void deleteOrder(int b_num) {
		
		try {
			con = getCon();
			sql = "delete from p_order where b_num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, b_num);
			
			pstmt.executeUpdate();
			System.out.println("삭제 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제 실패");
		} finally {
			closeDB();
		}
	}
	//deleteOrder(b_num)
	
}

package net.product.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductQnaDAO {
	
	// DB에 관련된 모든 처리를 하는 객체
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		// 디비연결 - 커넥션 풀을 사용해서 디비연결
		private Connection getCon() throws Exception {

			Context init = new InitialContext();// 커넥션풀 사용한거??
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/team1");
			con = ds.getConnection();

			return con;
		}

		// 디비자원해제
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
		
		//insertQna(ProductQnaBean pqb)
		public void insertQna(ProductQnaBean pqb) {
			
			int qno = 0;
			
			try {
				con = getCon();
				
				sql = "select max(q_num) from productqna ";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					qno =  rs.getInt(1) + 1;
				}
				
				System.out.println("글번호 : "+qno);
				
				sql = "insert into productqna (q_num,id,p_num,subject,content, "
						+ "re_result,reply, re_ref, re_lev, reg_date,    re_reg_date) "
						+ "values(?,?,?,?,?,?,?,?,?,now(),null)";
				
			} catch (Exception e1) {
				e1.printStackTrace();
				
			}finally {
				closeDB();
			}
			
			
			
		}
		
		//insertQna(ProductQnaBean pqb)
		
		

}

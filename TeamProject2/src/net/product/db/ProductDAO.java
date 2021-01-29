package net.product.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAO {
	
	//DB에 관련된 모든 처리를 하는 객체
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			//디비연결 - 커넥션 풀을 사용해서 디비연결
			private Connection getCon()	throws Exception{
				
				Context init = new InitialContext();//커넥션풀 사용한거??
				DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/team1");
				con = ds.getConnection();
				
				return con;
			}
			
			//디비자원해제
			public void closeDB() {
				try {
					if(rs != null) {rs.close();}
					if(pstmt != null) {pstmt.close();}
					if(con != null) {con.close();}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			public static void commit(Connection con) {
				try {
					con.commit();
					System.out.println("commit success");
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			public static void rollback(Connection con) {
				try {
					con.rollback();
					System.out.println("rollback success");
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//getProductList()
			public ArrayList<ProductBean> getProductList(String odb, int startPage, int pageSize , int category){
				
				ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
				try {
					con = getCon();
					if(category == 0) { //전체일때
						if(odb == null || odb == "" || odb.equals("all")) {
							sql = "select * from product limit ?,? ";
						}else if(odb.equals("num_desc")) {
							sql = "select * from product order by p_num desc limit ?,?";
						}else if(odb.equals("price_high")) {
							sql = "select * from product order by p_saleprice desc limit ?,?";
						}else if(odb.equals("price_low")) {
							sql = "select * from product order by p_saleprice asc limit ?,?";
						}else if(odb.equals("star_avg")) {
							sql = "select *,  avg(r.r_star) 'star_avg' from product p join review r  on p.p_num = r.p_num group by p.p_num "
									+ "order by avg(r.r_star) limit ?,?";
						}else if(odb.equals("readcount")) {
							sql = "select * from product order by readcount desc limit ?,?";
						}
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, startPage-1); //시작행 -1
						pstmt.setInt(2, pageSize); // 갯수
						
					}else {//다른 카테고리일 경우
						if(odb == null || odb == "" || odb.equals("all")) {
							sql = "select * from product "
									+ "where category = ? "
									+ "limit ?,? ";
						}else if(odb.equals("num_desc")) {
							sql = "select * from product "
									+ "where category = ? "
									+ "order by p_num desc "
									+ "limit ?,?";
						}else if(odb.equals("price_high")) {
							sql = "select * from product "
									+ "where category = ? "
									+ "order by p_saleprice desc "
									+ "limit ?,?";
						}else if(odb.equals("price_low")) {
							sql = "select * from product "
									+ "where category = ? "
									+ "order by p_saleprice asc "
									+ "limit ?,?";
						}else if(odb.equals("star_avg")) {
							sql = "select *,  avg(r.r_star) 'star_avg' "
									+ "from product p join review r  "
									+ "on p.p_num = r.p_num "
									+ "where category = ? "
									+ "group by p.p_num "
									+ "order by avg(r.r_star) "
									+ "limit ?,?";
						}else if(odb.equals("readcount")) {
							sql = "select * from product "
									+ "where category = ? "
									+ "order by readcount desc "
									+ "limit ?,?";
						}
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, category);
						pstmt.setInt(2, startPage-1); //시작행 -1
						pstmt.setInt(3, pageSize); // 갯수
						
					}
					
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						ProductBean pb = new ProductBean();
						pb.setCategory(rs.getInt("category"));
						pb.setImg_content(rs.getString("img_content"));
						pb.setImg_main(rs.getString("img_main"));
						pb.setP_count(rs.getInt("p_count"));
						pb.setP_name(rs.getString("p_name"));
						pb.setP_num(rs.getInt("p_num"));
						pb.setP_price(rs.getInt("p_price"));
						pb.setP_saleprice(rs.getInt("p_saleprice"));
						pb.setPrice_count(rs.getInt("price_count"));
						pb.setReadcount(rs.getInt("readcount"));
						if(odb.equals("star_avg")) {
							pb.setStar_avg(rs.getInt("star_avg"));
						}
						
						productList.add(pb);
					}
					System.out.println("DAO : ProductList저장 완료!");
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				return productList;
			}
			
			//getProductList()
			
			//getProductListCount()
			public int getProductListCount() {
				int result = 0;
				
				try {
					con = getCon();
					sql = "select count(*) from product";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						result = rs.getInt("count(*)");
					}
					System.out.println("DAO : 글 개수 계산완료 : " + result +"개");
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return result;
				
			}
			//getProductListCount()

}

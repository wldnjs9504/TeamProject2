package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	// DB에 관련된 모든 처리를 하는 객체
	Connection con = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	String sql ="";
	
	
	// 디비 연결 - 커넥션 풀을 사용해서 디비 연결
	private Connection getCon() throws Exception{
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/team1");
		con = ds.getConnection();
		
		return con;
	}
	
	// 디비 자원해제
	public void closeDB() {
		try {
			if(rs != null) { rs.close(); }
			if(pstmt != null) { pstmt.close(); }
			if(con != null) { con.close(); }			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// insertMember(mb)
	public void insertMember(MemberBean mb) {
		
		try {
			con = getCon();
		 
			sql = "insert into member values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getEmail());
			pstmt.setInt(4, mb.getPostcode());
			pstmt.setString(5, mb.getAddress1());
			pstmt.setString(6, mb.getAddress2());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
				
	}
	
	
	// loginCheck(id,pass)
	public int loginCheck(String id,String pass) {
		int result = -1;
		
		try {
			
			con = getCon();
			
			sql = "select pass from member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 회원이다
				if(pass.equals(rs.getString("pass"))) {
					//본인
					result = 1;
				}else {
					//본인x(비밀번호 오류)
					result = 0;
				}				
			}else {
				// 비회원이다
				result = -1;
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;
	}
	
	
	
	// getMember(id)
	public MemberBean getMember(String id) {
		MemberBean mb = null;
		
		try {
			con = getCon();
			
			sql="select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { 
				mb = new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setEmail(rs.getString("email"));
				mb.setPostcode(rs.getInt("postcode"));
				mb.setAddress1(rs.getString("address1"));
				mb.setAddress2(rs.getString("address2"));
				mb.setPoint(rs.getInt("point"));
				mb.setGrade(rs.getInt("grade"));
				mb.setTotalprice(rs.getInt("totalprice"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return mb;
	}
	
	
	
	// updateMember(UIMB)
	public int updateMember(MemberBean UIMB) {
	
		int result = -1;
		
		try {
			con = getCon();
			
			sql = "select pass from member where id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, UIMB.getId());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(UIMB.getPass().equals(rs.getString("pass"))) {
                   
					sql = "update member set postcode=?,address1=?,address2=? where id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, UIMB.getPostcode());
					pstmt.setString(2, UIMB.getAddress1());
					pstmt.setString(3, UIMB.getAddress2());
					pstmt.setString(4, UIMB.getId());
							
					result = pstmt.executeUpdate();
					
				}else {
					// 비밀번호 오류
					result = 0;
				}
			}else {
				// 비회원
				 result = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
		
	}	
	
	
	
	// deleteMember(id,pass)
	public int deleteMember(String id,String pass) {
		int result =-1;
		
		try {
			con = getCon();
			
			sql = "select pass from member where id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("pass"))) {
					
					sql = "delete from member where id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
							
					result = pstmt.executeUpdate();
					
				}else {
					// 비밀번호 오류
					result = 0;
				}
			}else {
				// 비회원
				result = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}

	
	//passCHeck
	public int passCheck(String id, String pass) {
		int result = -1;
		// 1 - 로그인성공, 0 - 비밀번호 오류, -1 - 아이디가 없음

		try {
			con = getCon();
			
			sql = "select pass from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {// 아이디 있을때
				if (pass.equals(rs.getString("pass"))) {// 비밀번호 일치 => 로그인상태
					System.out.println(" 로그인 성공! ");
					result = 1;
				} else {// 비밀번호 불일치 => 로그인 실패
					System.out.println(" 비밀번호 오류 ! ");
					result = 0;
				}
			} else {// 아이디가 없을때
				System.out.println(" 아이디 없음 ! ");
				result = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	
	
	//이메일 인증 메서드
		public int sendEmail(String to, String authNum) {
			String from = "rmedictest@naver.com";
			String subject = "이메일 인증";
			String content = "[" + authNum + "]";
			
			Properties p = new Properties(); // 정보를 담을 객체

			p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP

			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			// SMTP 서버에 접속하기 위한 정보들

			try {
				Authenticator auth = new SMTPAuthenticator();
				Session ses = Session.getInstance(p, auth);

				ses.setDebug(true);

				MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
				msg.setSubject(subject); // 제목

				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr); // 보내는 사람

				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

				msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

				Transport.send(msg); // 전송
				
				return 1;
			} catch (Exception e) {
				System.out.println("sendEmail()메서드에서 에러 : " + e);
				return 0;
			}
		}
	
	public String randomNum() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			int n = (int)(Math.random() * 10);
			sb.append(n);
		}
		return sb.toString();
	}
}

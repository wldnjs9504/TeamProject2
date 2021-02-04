package net.admin.order.db;

public class MemberBean {
	private String id;
	private String pass;
	private String email;
	private int postcode; 
	private String address1;
	private String address2;
	private int grade;
	private int totalprice;
	private int point;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pass=" + pass + ", email=" + email + ", postcode=" + postcode + ", address1="
				+ address1 + ", address2=" + address2 + ", grade=" + grade + ", totalprice=" + totalprice + ", point="
				+ point + "]";
	}
	
	
	
}

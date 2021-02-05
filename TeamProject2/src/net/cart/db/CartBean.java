package net.cart.db;

public class CartBean {
	
	private int c_num;
	private String id;
	private int p_num;
	private int c_count;
	

	public int getC_num() {
		return c_num;
	}


	public void setC_num(int c_num) {
		this.c_num = c_num;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getP_num() {
		return p_num;
	}


	public void setP_num(int p_num) {
		this.p_num = p_num;
	}


	public int getC_count() {
		return c_count;
	}


	public void setC_count(int c_count) {
		this.c_count = c_count;
	}

	@Override
	public String toString() {
		return "OrderBean [c_num=" + c_num + ", id =" + id + ", p_num=" + p_num + 
				", c_count =" + c_count + "]";
	}
	
}

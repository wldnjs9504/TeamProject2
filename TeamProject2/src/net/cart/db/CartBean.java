package net.cart.db;

import java.sql.Date;

public class CartBean {
	
	private int c_num;
	private String c_m_id;
	private int c_p_num;
	private int c_p_count;
	private Date c_date;
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_m_id() {
		return c_m_id;
	}
	public void setC_m_id(String c_m_id) {
		this.c_m_id = c_m_id;
	}
	public int getC_p_num() {
		return c_p_num;
	}
	public void setC_p_num(int c_p_num) {
		this.c_p_num = c_p_num;
	}
	public int getC_p_count() {
		return c_p_count;
	}
	public void setC_p_count(int c_p_count) {
		this.c_p_count = c_p_count;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

}

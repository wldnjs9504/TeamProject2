package net.cart.db;

import net.product.db.ProductBean;

public class CartBean {
	
	private int c_num;
	private String id;
	private int p_num;
	private int p_count;
	
	private ProductBean products;

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


	public int getP_count() {
		return p_count;
	}


	public void setP_count(int p_count) {
		this.p_count = p_count;
	}


	public ProductBean getProducts() {
		return products;
	}


	public void setProducts(ProductBean products) {
		this.products = products;
	}


	@Override
	public String toString() {
		return "OrderBean [c_num=" + c_num + ", id =" + id + ", p_num=" + p_num + 
				", p_count =" + p_count + "]";
	}
	
}

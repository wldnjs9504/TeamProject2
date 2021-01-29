package net.admin.order.db;

public class ProductBean {
	private int p_num;
	private int category;
	private String p_name;
	private int p_count;
	private int p_price;
	private int p_saleprice;
	private String img_main;
	private String img_content;
	private int price_count;
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_saleprice() {
		return p_saleprice;
	}
	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
	}
	public String getImg_main() {
		return img_main;
	}
	public void setImg_main(String img_main) {
		this.img_main = img_main;
	}
	public String getImg_content() {
		return img_content;
	}
	public void setImg_content(String img_content) {
		this.img_content = img_content;
	}
	public int getPrice_count() {
		return price_count;
	}
	public void setPrice_count(int price_count) {
		this.price_count = price_count;
	}
	@Override
	public String toString() {
		return "ProductBean [p_num=" + p_num + ", category=" + category + ", p_name=" + p_name + ", p_count=" + p_count
				+ ", p_price=" + p_price + ", p_saleprice=" + p_saleprice + ", img_main=" + img_main + ", img_content="
				+ img_content + ", price_count=" + price_count + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
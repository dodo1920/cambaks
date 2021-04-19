package com.cambak21.dto;

public class mallMainTopCountDTO {

	private int count;
	private int star;
	private int product_id;
	private String product_name;
	private int product_sellPrice;
	private String product_img1;
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_sellPrice() {
		return product_sellPrice;
	}
	public void setProduct_sellPrice(int product_sellPrice) {
		this.product_sellPrice = product_sellPrice;
	}
	public String getProduct_img1() {
		return product_img1;
	}
	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}
	@Override
	public String toString() {
		return "mallMainTopCountDTO [count=" + count + ", star=" + star + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", product_sellPrice=" + product_sellPrice + ", product_img1="
				+ product_img1 + "]";
	}
	
	
	
	
}

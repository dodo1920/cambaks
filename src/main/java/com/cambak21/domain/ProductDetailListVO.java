package com.cambak21.domain;

public class ProductDetailListVO {
	private int product_id;
	private String mainCategory_content;
	private String middleCategory_content;
	private String product_name;
	private int product_sellPrice;
	private String product_img1;
	private int product_prodAvgScore;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getMainCategory_content() {
		return mainCategory_content;
	}
	public void setMainCategory_content(String mainCategory_content) {
		this.mainCategory_content = mainCategory_content;
	}
	public String getMiddleCategory_content() {
		return middleCategory_content;
	}
	public void setMiddleCategory_content(String middleCategory_content) {
		this.middleCategory_content = middleCategory_content;
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
	public int getProduct_prodAvgScore() {
		return product_prodAvgScore;
	}
	public void setProduct_prodAvgScore(int product_prodAvgScore) {
		this.product_prodAvgScore = product_prodAvgScore;
	}
	
	@Override
	public String toString() {
		return "ProductDetailListVO [product_id=" + product_id + ", mainCategory_content=" + mainCategory_content
				+ ", middleCategory_content=" + middleCategory_content + ", product_name=" + product_name
				+ ", product_sellPrice=" + product_sellPrice + ", product_img1=" + product_img1
				+ ", product_prodAvgScore=" + product_prodAvgScore + "]";
	}
	
}

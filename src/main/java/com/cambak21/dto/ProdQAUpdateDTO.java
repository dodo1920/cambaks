package com.cambak21.dto;

public class ProdQAUpdateDTO {
	private int product_id;
	private int prodQA_no;
	private String prodQA_title;
	private String ProdQA_content;
	private String prodQA_img;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProdQA_no() {
		return prodQA_no;
	}
	public void setProdQA_no(int prodQA_no) {
		this.prodQA_no = prodQA_no;
	}
	public String getProdQA_title() {
		return prodQA_title;
	}
	public void setProdQA_title(String prodQA_title) {
		this.prodQA_title = prodQA_title;
	}
	public String getProdQA_content() {
		return ProdQA_content;
	}
	public void setProdQA_content(String prodQA_content) {
		ProdQA_content = prodQA_content;
	}
	public String getProdQA_img() {
		return prodQA_img;
	}
	public void setProdQA_img(String prodQA_img) {
		this.prodQA_img = prodQA_img;
	}
	
	@Override
	public String toString() {
		return "UpdateProdQADTO [product_id=" + product_id + ", prodQA_no=" + prodQA_no + ", prodQA_title="
				+ prodQA_title + ", ProdQA_content=" + ProdQA_content + ", prodQA_img=" + prodQA_img + "]";
	}
	
}

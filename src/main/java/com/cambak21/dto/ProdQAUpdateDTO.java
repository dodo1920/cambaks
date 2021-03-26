package com.cambak21.dto;

public class ProdQAUpdateDTO {
	private int product_id;
	private int prodQA_no;
	private String member_id;
	private String prodQA_title;
	private String prodQA_content;
	private String prodQA_img;
	private String prodQA_isSecret;
	private String prodQA_category;
	
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getProdQA_title() {
		return prodQA_title;
	}
	public void setProdQA_title(String prodQA_title) {
		this.prodQA_title = prodQA_title;
	}
	public String getProdQA_content() {
		return prodQA_content;
	}
	public void setProdQA_content(String prodQA_content) {
		this.prodQA_content = prodQA_content;
	}
	public String getProdQA_img() {
		return prodQA_img;
	}
	public void setProdQA_img(String prodQA_img) {
		this.prodQA_img = prodQA_img;
	}
	public String getProdQA_isSecret() {
		return prodQA_isSecret;
	}
	public void setProdQA_isSecret(String prodQA_isSecret) {
		this.prodQA_isSecret = prodQA_isSecret;
	}
	public String getProdQA_category() {
		return prodQA_category;
	}
	public void setProdQA_category(String prodQA_category) {
		this.prodQA_category = prodQA_category;
	}
	
	@Override
	public String toString() {
		return "ProdQAUpdateDTO [product_id=" + product_id + ", prodQA_no=" + prodQA_no + ", member_id=" + member_id
				+ ", prodQA_title=" + prodQA_title + ", prodQA_content=" + prodQA_content + ", prodQA_img=" + prodQA_img
				+ ", prodQA_isSecret=" + prodQA_isSecret + ", prodQA_category=" + prodQA_category + "]";
	}

}

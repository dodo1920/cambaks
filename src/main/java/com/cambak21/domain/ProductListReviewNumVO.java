package com.cambak21.domain;

public class ProductListReviewNumVO {
	private int product_id;
	private int prouctReview_count;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProuctReview_count() {
		return prouctReview_count;
	}
	public void setProuctReview_count(int prouctReview_count) {
		this.prouctReview_count = prouctReview_count;
	}
	
	@Override
	public String toString() {
		return "ProductListReviewNumVO [product_id=" + product_id + ", prouctReview_count=" + prouctReview_count + "]";
	}	
}

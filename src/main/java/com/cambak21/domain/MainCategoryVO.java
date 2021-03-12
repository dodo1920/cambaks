package com.cambak21.domain;

public class MainCategoryVO {
	private int mainCategory_id;
	private String mainCategory_content;
	
	public int getMainCategory_id() {
		return mainCategory_id;
	}
	public void setMainCategory_id(int mainCategory_id) {
		this.mainCategory_id = mainCategory_id;
	}
	public String getMainCategory_content() {
		return mainCategory_content;
	}
	public void setMainCategory_content(String mainCategory_content) {
		this.mainCategory_content = mainCategory_content;
	}
	
	@Override
	public String toString() {
		return "MainCategory [mainCategory_id=" + mainCategory_id + ", mainCategory_content=" + mainCategory_content
				+ "]";
	}
	
	
}

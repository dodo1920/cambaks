package com.cambak21.dto;

public class FindPwdDTO {
	private String member_id;
	private String member_mobile;
	private String member_password;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_mobile() {
		return member_mobile;
	}
	public void setMember_mobile(String member_mobile) {
		this.member_mobile = member_mobile;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	
	@Override
	public String toString() {
		return "FindPwdDTO [member_id=" + member_id + ", member_mobile=" + member_mobile + ", member_password="
				+ member_password + "]";
	}
	
}

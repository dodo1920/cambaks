package com.cambak21.domain;

public class FindIdVO {
	private String member_id;
	private String member_email;
	private String member_password;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	
	@Override
	public String toString() {
		return "FindIdVO [member_id=" + member_id + ", member_email=" + member_email + ", member_password="
				+ member_password + "]";
	}	
	
}

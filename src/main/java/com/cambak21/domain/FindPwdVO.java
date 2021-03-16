package com.cambak21.domain;

public class FindPwdVO {
	private String member_id;
	private String member_mobile;
	
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
	
	@Override
	public String toString() {
		return "FindPwdVO [member_id=" + member_id + ", member_mobile=" + member_mobile + "]";
	}
	
}

package com.cambak21.domain;

import java.util.Date;

public class DestinationVO {
	private int destination_no;
	private String member_id;
	private String destination_nickname;
	private String destination_address;
	private Date destination_updateDate;
	private String destination_toUser;
	private String destination_mobile;
	private int destination_zipCode;
	
	public int getDestination_no() {
		return destination_no;
	}
	public void setDestination_no(int destination_no) {
		this.destination_no = destination_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getDestination_nickname() {
		return destination_nickname;
	}
	public void setDestination_nickname(String destination_nickname) {
		this.destination_nickname = destination_nickname;
	}
	public String getDestination_address() {
		return destination_address;
	}
	public void setDestination_address(String destination_address) {
		this.destination_address = destination_address;
	}
	public Date getDestination_updateDate() {
		return destination_updateDate;
	}
	public void setDestination_updateDate(Date destination_updateDate) {
		this.destination_updateDate = destination_updateDate;
	}
	public String getDestination_toUser() {
		return destination_toUser;
	}
	public void setDestination_toUser(String destination_toUser) {
		this.destination_toUser = destination_toUser;
	}
	public String getDestination_mobile() {
		return destination_mobile;
	}
	public void setDestination_mobile(String destination_mobile) {
		this.destination_mobile = destination_mobile;
	}
	public int getDestination_zipCode() {
		return destination_zipCode;
	}
	public void setDestination_zipCode(int destination_zipCode) {
		this.destination_zipCode = destination_zipCode;
	}
	
	@Override
	public String toString() {
		return "DestinationVO [destination_no=" + destination_no + ", member_id=" + member_id
				+ ", destination_nickname=" + destination_nickname + ", destination_address=" + destination_address
				+ ", destination_updateDate=" + destination_updateDate + ", destination_toUser=" + destination_toUser
				+ ", destination_mobile=" + destination_mobile + ", destination_zipCode=" + destination_zipCode + "]";
	}
	
	
}

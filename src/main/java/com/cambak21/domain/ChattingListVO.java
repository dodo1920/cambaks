package com.cambak21.domain;

import java.util.Date;

public class ChattingListVO {
	private String member_id;
	private String chatting_content;
	private Date chatting_date;
	private String chatting_toUser;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getChatting_content() {
		return chatting_content;
	}

	public void setChatting_content(String chatting_content) {
		this.chatting_content = chatting_content;
	}

	public Date getChatting_date() {
		return chatting_date;
	}

	public void setChatting_date(Date chatting_date) {
		this.chatting_date = chatting_date;
	}

	public String getChatting_toUser() {
		return chatting_toUser;
	}

	public void setChatting_toUser(String chatting_toUser) {
		this.chatting_toUser = chatting_toUser;
	}

	@Override
	public String toString() {
		return "ChattingListVO [member_id=" + member_id + ", chatting_content=" + chatting_content + ", chatting_date="
				+ chatting_date + ", chatting_toUser=" + chatting_toUser + "]";
	}

	

}

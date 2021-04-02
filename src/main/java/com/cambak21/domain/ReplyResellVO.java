package com.cambak21.domain;

import java.util.Date;

public class ReplyResellVO {
	private int resellReplyBoard_no;
	private int resellBoard_no;
	private String member_id;
	private String resellReplyBoard_content;
	private Date resellReplyBoard_writeDate;
	private Date resellReplyBoard_updateDate;
	private int resellReplyBoard_ref;
	private int resellReplyBoard_step;
	private int resellReplyBoard_refOrder;
	
	public int getReplyResell_no() {
		return resellReplyBoard_no;
	}
	public void setReplyResell_no(int replyResell_no) {
		this.resellReplyBoard_no = replyResell_no;
	}
	public int getResellBoard_no() {
		return resellBoard_no;
	}
	public void setResellBoard_no(int resellBoard_no) {
		this.resellBoard_no = resellBoard_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getResellReplyBoard_content() {
		return resellReplyBoard_content;
	}
	public void setResellReplyBoard_content(String resellReplyBoard_content) {
		this.resellReplyBoard_content = resellReplyBoard_content;
	}
	public Date getResellReplyBoard_writeDate() {
		return resellReplyBoard_writeDate;
	}
	public void setResellReplyBoard_writeDate(Date resellReplyBoard_writeDate) {
		this.resellReplyBoard_writeDate = resellReplyBoard_writeDate;
	}
	public Date getResellReplyBoard_updateDate() {
		return resellReplyBoard_updateDate;
	}
	public void setResellReplyBoard_updateDate(Date resellReplyBoard_updateDate) {
		this.resellReplyBoard_updateDate = resellReplyBoard_updateDate;
	}
	public int getResellReplyBoard_ref() {
		return resellReplyBoard_ref;
	}
	public void setResellReplyBoard_ref(int resellReplyBoard_ref) {
		this.resellReplyBoard_ref = resellReplyBoard_ref;
	}
	public int getResellReplyBoard_step() {
		return resellReplyBoard_step;
	}
	public void setResellReplyBoard_step(int resellReplyBoard_step) {
		this.resellReplyBoard_step = resellReplyBoard_step;
	}
	public int getResellReplyBoard_refOrder() {
		return resellReplyBoard_refOrder;
	}
	public void setResellReplyBoard_refOrder(int resellReplyBoard_refOrder) {
		this.resellReplyBoard_refOrder = resellReplyBoard_refOrder;
	}
	@Override
	public String toString() {
		return "ReplyResellVO [resellReplyBoard_no=" + resellReplyBoard_no + ", resellBoard_no=" + resellBoard_no + ", member_id="
				+ member_id + ", resellReplyBoard_content=" + resellReplyBoard_content + ", resellReplyBoard_writeDate="
				+ resellReplyBoard_writeDate + ", resellReplyBoard_updateDate=" + resellReplyBoard_updateDate
				+ ", resellReplyBoard_ref=" + resellReplyBoard_ref + ", resellReplyBoard_step=" + resellReplyBoard_step
				+ ", resellReplyBoard_refOrder=" + resellReplyBoard_refOrder + "]";
	}
	
	
}

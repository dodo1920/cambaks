package com.cambak21.domain;

import java.util.Date;

public class RefundnExchangeVO {
	private int refundnExchange_no;
	private String refundnExchange_reason;
	private String refundnExchange_status;
	private Date refundnExchange_date;
	private String member_id;
	private int payment_no;
	
	public int getRefundnExchange_no() {
		return refundnExchange_no;
	}
	public void setRefundnExchange_no(int refundnExchange_no) {
		this.refundnExchange_no = refundnExchange_no;
	}
	public String getRefundnExchange_reason() {
		return refundnExchange_reason;
	}
	public void setRefundnExchange_reason(String refundnExchange_reason) {
		this.refundnExchange_reason = refundnExchange_reason;
	}
	public String getRefundnExchange_status() {
		return refundnExchange_status;
	}
	public void setRefundnExchange_status(String refundnExchange_status) {
		this.refundnExchange_status = refundnExchange_status;
	}
	public Date getRefundnExchange_date() {
		return refundnExchange_date;
	}
	public void setRefundnExchange_date(Date refundnExchange_date) {
		this.refundnExchange_date = refundnExchange_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	
	@Override
	public String toString() {
		return "RefundnExchangeVO [refundnExchange_no=" + refundnExchange_no + ", refundnExchange_reason="
				+ refundnExchange_reason + ", refundnExchange_status=" + refundnExchange_status
				+ ", refundnExchange_date=" + refundnExchange_date + ", member_id=" + member_id + ", payment_no="
				+ payment_no + "]";
	}
	
}

package com.cambak21.domain;

import java.util.Date;

public class BoardVO {

	private int board_no;
	private String member_id;
	private String board_title;
	private String board_category;
	private String board_content;
	private String board_img1;
	private String board_img2;
	private String board_img3;
	private String board_img4;
	private Date board_writeDate;
	private Date board_updateDate;
	private int board_likeCnt;
	private int board_viewCnt;
	private int camping_contentId;
	private String board_isDelete;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_img1() {
		return board_img1;
	}
	public void setBoard_img1(String board_img1) {
		this.board_img1 = board_img1;
	}
	public String getBoard_img2() {
		return board_img2;
	}
	public void setBoard_img2(String board_img2) {
		this.board_img2 = board_img2;
	}
	public String getBoard_img3() {
		return board_img3;
	}
	public void setBoard_img3(String board_img3) {
		this.board_img3 = board_img3;
	}
	public String getBoard_img4() {
		return board_img4;
	}
	public void setBoard_img4(String board_img4) {
		this.board_img4 = board_img4;
	}
	public Date getBoard_writeDate() {
		return board_writeDate;
	}
	public void setBoard_writeDate(Date board_writeDate) {
		this.board_writeDate = board_writeDate;
	}
	public Date getBoard_updateDate() {
		return board_updateDate;
	}
	public void setBoard_updateDate(Date board_updateDate) {
		this.board_updateDate = board_updateDate;
	}
	public int getBoard_likeCnt() {
		return board_likeCnt;
	}
	public void setBoard_likeCnt(int board_likeCnt) {
		this.board_likeCnt = board_likeCnt;
	}
	public int getBoard_viewCnt() {
		return board_viewCnt;
	}
	public void setBoard_viewCnt(int board_viewCnt) {
		this.board_viewCnt = board_viewCnt;
	}
	public int getCamping_contentId() {
		return camping_contentId;
	}
	public void setCamp_contentId(int camp_contentId) {
		this.camping_contentId = camp_contentId;
	}
	public String getBoard_isDelete() {
		return board_isDelete;
	}
	public void setBoard_isDelete(String board_isDelete) {
		this.board_isDelete = board_isDelete;
	}
	
	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", member_id=" + member_id + ", board_title=" + board_title
				+ ", board_category=" + board_category + ", board_content=" + board_content + ", board_img1="
				+ board_img1 + ", board_img2=" + board_img2 + ", board_img3=" + board_img3 + ", board_img4="
				+ board_img4 + ", board_writeDate=" + board_writeDate + ", board_updateDate=" + board_updateDate
				+ ", board_likeCnt=" + board_likeCnt + ", board_viewCnt=" + board_viewCnt + ", camp_contentId="
				+ camping_contentId + ", board_isDelete=" + board_isDelete + "]";
	}
	
	
	
	
}
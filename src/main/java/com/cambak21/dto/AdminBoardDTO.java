package com.cambak21.dto;

import java.util.Date;

public class AdminBoardDTO {

	private Date startDate;
	private Date endDate;
	private String board_category;	
	private String boardSearch;
	private String replySearch;
	
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoardSearch() {
		return boardSearch;
	}
	public void setBoardSearch(String boardSearch) {
		this.boardSearch = boardSearch;
	}
	public String getReplySearch() {
		return replySearch;
	}
	public void setReplySearch(String replySearch) {
		this.replySearch = replySearch;
	}
	@Override
	public String toString() {
		return "AdminBoardDTO [startDate=" + startDate + ", endDate=" + endDate + ", board_category=" + board_category
				+ ", boardSearch=" + boardSearch + ", replySearch=" + replySearch + "]";
	}
	
	
	
	
}

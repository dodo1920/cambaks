package com.cambak21.domain;

import java.util.Date;

public class OrderManagementSearchVO {
	private String checkOption;
	private String checkOptionSearch;
	private String searchDateRange = "all";
	private Date startDate;
	private Date endDate;
	private String productInfo;
	private String productInfoSearch;
	private boolean purchaseConfirmationBefore;
	private boolean purchaseConfirmation;
	private boolean orderDeliveryReady;
	private boolean orderOnDelivery;
	private boolean orderDeliveryCompleted;
	private boolean csCancelRequest;
	private boolean csCancelCompleted;
	private boolean csChangeRequest;
	private boolean csChangeCompleted;
	private boolean csReturnRequest;
	private boolean csReturnCompleted;
	private boolean csRefundRequest;
	private boolean csRefundCompleted;
	
	public String getCheckOption() {
		return checkOption;
	}
	public void setCheckOption(String checkOption) {
		this.checkOption = checkOption;
	}
	public String getCheckOptionSearch() {
		return checkOptionSearch;
	}
	public void setCheckOptionSearch(String checkOptionSearch) {
		this.checkOptionSearch = checkOptionSearch;
	}
	public String getSearchDateRange() {
		return searchDateRange;
	}
	public void setSearchDateRange(String searchDateRange) {
		this.searchDateRange = searchDateRange;
	}
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
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getProductInfoSearch() {
		return productInfoSearch;
	}
	public void setProductInfoSearch(String productInfoSearch) {
		this.productInfoSearch = productInfoSearch;
	}
	public boolean isPurchaseConfirmationBefore() {
		return purchaseConfirmationBefore;
	}
	public void setPurchaseConfirmationBefore(boolean purchaseConfirmationBefore) {
		this.purchaseConfirmationBefore = purchaseConfirmationBefore;
	}
	public boolean isPurchaseConfirmation() {
		return purchaseConfirmation;
	}
	public void setPurchaseConfirmation(boolean purchaseConfirmation) {
		this.purchaseConfirmation = purchaseConfirmation;
	}
	public boolean isOrderDeliveryReady() {
		return orderDeliveryReady;
	}
	public void setOrderDeliveryReady(boolean orderDeliveryReady) {
		this.orderDeliveryReady = orderDeliveryReady;
	}
	public boolean isOrderOnDelivery() {
		return orderOnDelivery;
	}
	public void setOrderOnDelivery(boolean orderOnDelivery) {
		this.orderOnDelivery = orderOnDelivery;
	}
	public boolean isOrderDeliveryCompleted() {
		return orderDeliveryCompleted;
	}
	public void setOrderDeliveryCompleted(boolean orderDeliveryCompleted) {
		this.orderDeliveryCompleted = orderDeliveryCompleted;
	}
	public boolean isCsCancelRequest() {
		return csCancelRequest;
	}
	public void setCsCancelRequest(boolean csCancelRequest) {
		this.csCancelRequest = csCancelRequest;
	}
	public boolean isCsCancelCompleted() {
		return csCancelCompleted;
	}
	public void setCsCancelCompleted(boolean csCancelCompleted) {
		this.csCancelCompleted = csCancelCompleted;
	}
	public boolean isCsChangeRequest() {
		return csChangeRequest;
	}
	public void setCsChangeRequest(boolean csChangeRequest) {
		this.csChangeRequest = csChangeRequest;
	}
	public boolean isCsChangeCompleted() {
		return csChangeCompleted;
	}
	public void setCsChangeCompleted(boolean csChangeCompleted) {
		this.csChangeCompleted = csChangeCompleted;
	}
	public boolean isCsReturnRequest() {
		return csReturnRequest;
	}
	public void setCsReturnRequest(boolean csReturnRequest) {
		this.csReturnRequest = csReturnRequest;
	}
	public boolean isCsReturnCompleted() {
		return csReturnCompleted;
	}
	public void setCsReturnCompleted(boolean csReturnCompleted) {
		this.csReturnCompleted = csReturnCompleted;
	}
	public boolean isCsRefundRequest() {
		return csRefundRequest;
	}
	public void setCsRefundRequest(boolean csRefundRequest) {
		this.csRefundRequest = csRefundRequest;
	}
	public boolean isCsRefundCompleted() {
		return csRefundCompleted;
	}
	public void setCsRefundCompleted(boolean csRefundCompleted) {
		this.csRefundCompleted = csRefundCompleted;
	}
	
	@Override
	public String toString() {
		return "OrderManagementSearchVO [checkOption=" + checkOption + ", checkOptionSearch=" + checkOptionSearch
				+ ", searchDateRange=" + searchDateRange + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", productInfo=" + productInfo + ", productInfoSearch=" + productInfoSearch
				+ ", purchaseConfirmationBefore=" + purchaseConfirmationBefore + ", purchaseConfirmation="
				+ purchaseConfirmation + ", orderDeliveryReady=" + orderDeliveryReady + ", orderOnDelivery="
				+ orderOnDelivery + ", orderDeliveryCompleted=" + orderDeliveryCompleted + ", csCancelRequest="
				+ csCancelRequest + ", csCancelCompleted=" + csCancelCompleted + ", csChangeRequest=" + csChangeRequest
				+ ", csChangeCompleted=" + csChangeCompleted + ", csReturnRequest=" + csReturnRequest
				+ ", csReturnCompleted=" + csReturnCompleted + ", csRefundRequest=" + csRefundRequest
				+ ", csRefundCompleted=" + csRefundCompleted + "]";
	}
	
}

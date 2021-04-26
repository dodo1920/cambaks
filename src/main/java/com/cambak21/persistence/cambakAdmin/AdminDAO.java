package com.cambak21.persistence.cambakAdmin;

import java.util.List;

import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;

public interface AdminDAO {

	

	
	// ======================================== 도연 ============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 대기 ==============================================================================
	
	public RevenueVO getDayRevenue() throws Exception;

	public List<RevenueVO> getPerDayRevenue(int dateVal) throws Exception;

	public List<RevenueVO> selectDate(String startDate, String endDate)throws Exception;

	public List<RevenueMonthVO> selectMothly(int revenueMonthly) throws Exception;

	public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception;

	public RevRefundVO thisMonthRevenue() throws Exception;

	public RevRefundVO prevMonthRevenue()throws Exception;

	public RevRefundVO thisMonthRefund() throws Exception;

	public RevRefundVO prevMonthRefund()throws Exception;

	public RevRefundVO thisWeekRevenue() throws Exception;

	public RevRefundVO prevWeekRevenue() throws Exception;

	public RevRefundVO thisWeekRefund() throws Exception;

	public RevRefundVO prevWeekRefund()throws Exception;

	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 승권 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 원영 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 정민 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 종진 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 효원 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}

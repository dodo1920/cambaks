package com.cambak21.service.cambakAdmin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.persistence.cambakAdmin.AdminDAO;

@Service
public class adminServiceImpl implements adminService {
	@Inject
	private AdminDAO dao;

	
	// ======================================== 도연 ============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//		---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 대기 ==============================================================================
		
	@Override
	public RevenueVO getDayRevenue() throws Exception {
		
		return dao.getDayRevenue();
	}


	@Override
	public List<RevenueVO> getPerDayRevenue(int dateVal) throws Exception {
		
		return dao.getPerDayRevenue(dateVal);
	}


	@Override
	public List<RevenueVO> selectDate(String startDate, String endDate) throws Exception {
		
		return dao.selectDate(startDate, endDate);
	}


	@Override
	public List<RevenueMonthVO> selectMonthly(int revenueMonthly) throws Exception {
		System.out.println("서비스 : " + revenueMonthly);
		return dao.selectMothly(revenueMonthly);
	}


	@Override
	public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception {
		
		System.out.println(dao.selectWeekly(revenueWeekly).toString());
		return dao.selectWeekly(revenueWeekly);
		
	}


	@Override
	public RevRefundVO thisMonthRevenue() throws Exception {
		
		return dao.thisMonthRevenue();
	}


	@Override
	public RevRefundVO prevMonthRevenue() throws Exception {
		// TODO Auto-generated method stub
		return dao.prevMonthRevenue();
	}


	@Override
	public RevRefundVO thisMonthRefund() throws Exception {
		// TODO Auto-generated method stub
		return dao.thisMonthRefund();
	}


	@Override
	public RevRefundVO prevMonthRefund() throws Exception {
		// TODO Auto-generated method stub
		return dao.prevMonthRefund();
	}


	@Override
	public RevRefundVO thisWeekRevenue() throws Exception {
		// TODO Auto-generated method stub
		return dao.thisWeekRevenue();
	}


	@Override
	public RevRefundVO prevWeekRevenue() throws Exception {
		// TODO Auto-generated method stub
		return dao.prevWeekRevenue();
	}


	@Override
	public RevRefundVO thisWeekRefund() throws Exception {
		// TODO Auto-generated method stub
		return dao.thisWeekRefund();
	}


	@Override
	public RevRefundVO prevWeekRefund() throws Exception {
		// TODO Auto-generated method stub
		return dao.prevWeekRefund();
	}
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 승권 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 원영 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 정민 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 효원 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}

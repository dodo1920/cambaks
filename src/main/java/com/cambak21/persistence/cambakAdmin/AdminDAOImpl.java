package com.cambak21.persistence.cambakAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession ses;
	
	private static String ns = "com.cambak21.mappers.cambakAdmin.adminMapper";
	
	// ======================================== 도연 ============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//		---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 대기 ==============================================================================
		
	@Override
	public RevenueVO getDayRevenue() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(ns + ".getDayRevenue");
	}

	@Override
	public List<RevenueVO> getPerDayRevenue(int dateVal) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(ns + ".getPerDayRevenue", dateVal);
	}

	@Override
	public List<RevenueVO> selectDate(String startDate, String endDate) throws Exception {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		
		return ses.selectList(ns + ".betweenDayRevenue", params);
	}

	@Override
	public List<RevenueMonthVO> selectMothly(int revenueMonthly) throws Exception {
		System.out.println("다오 : " + revenueMonthly);
		return ses.selectList(ns +".selectMonthly" , revenueMonthly);
		
	}

	@Override
	public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception {
		
		return ses.selectList(ns + ".selectWeekly", revenueWeekly);
	}

	@Override
	public RevRefundVO thisMonthRevenue() throws Exception {
		
		return ses.selectOne(ns + ".thisMonthRevenue");
		
	}

	@Override
	public RevRefundVO prevMonthRevenue() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(ns + ".prevMonthRevenue");
	}

	@Override
	public RevRefundVO thisMonthRefund() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(ns + ".thisMonthRefund");
	}

	@Override
	public RevRefundVO prevMonthRefund() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(ns + ".prevMonthRefund");
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

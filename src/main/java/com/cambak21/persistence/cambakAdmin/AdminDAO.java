package com.cambak21.persistence.cambakAdmin;

import java.util.List;

import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.ProductAnalysisVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueEachWeekVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.PagingCriteria;

public interface AdminDAO {

	

	
	// ======================================== 도연 ============================================================================
	
	public List<MemberVO> getMember() throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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

	public RevenueEachWeekVO selectEachWeek(int revenueWeekly)throws Exception;
	
	public RevenueEachWeekVO selectEachWeekRefund(int revenueWeekly)throws Exception;

	public List<ProductAnalysisVO> productAnalysis(int perDate)throws Exception;
	

	
	
//	---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 승권 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 원영 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 정민 ==============================================================================
	
	// 페이징 처리한 productList 출력
	public List<ProductsVO> prodList(PagingCriteria cri) throws Exception;
	
	// 게시물 총 개수 가져오기
	public int getTotalProdListCnt() throws Exception;
	
	// 검색된 게시글 총 개수 가져오기
	public int getTotalSearchProdListCnt(SearchCriteria scri) throws Exception;
	
	// 검색된 게시글 리스트 가져오기
	public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri) throws Exception;
	
	
	
	
	
	
//	---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 종진 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 효원 ==============================================================================
	
	public List<AdminOrderListVO> readOrderList(PagingCriteria cri) throws Exception;
	
	
	public int readOrderListNum() throws Exception;
	
	
	public int orderProductNum(int payment_no) throws Exception;

















































	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}

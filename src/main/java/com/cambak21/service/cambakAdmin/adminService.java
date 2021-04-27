package com.cambak21.service.cambakAdmin;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.MainCategoryVO;
import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;

import com.cambak21.util.PagingCriteria;

public interface adminService {

	
	// ======================================== 도연 ============================================================================
	public List<MemberVO> getMember() throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//		---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 대기 ==============================================================================
		
	public RevenueVO getDayRevenue() throws Exception;

	public List<RevenueVO> getPerDayRevenue(int dateVal)throws Exception;

	public List<RevenueVO> selectDate(String startDate, String endDate) throws Exception;

	public List<RevenueMonthVO> selectMonthly(int revenueMonthly) throws Exception;

	public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception;

	public RevRefundVO thisMonthRevenue() throws Exception;

	public RevRefundVO prevMonthRevenue() throws Exception;

	public RevRefundVO thisMonthRefund() throws Exception;

	public RevRefundVO prevMonthRefund() throws Exception;

	public RevRefundVO thisWeekRevenue() throws Exception;

	public RevRefundVO prevWeekRevenue() throws Exception;

	public RevRefundVO thisWeekRefund() throws Exception;

	public RevRefundVO prevWeekRefund() throws Exception;

		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 승권 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 원영 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 정민 ==============================================================================
		// 페이징 처리한 productList 출력
		public List<ProductsVO> prodList(PagingCriteria cri) throws Exception;
		
		// 게시물 총 개수
		public int getTotalProdListCnt() throws Exception;
		
		// 검색된 게시글 총 개수
		public int getTotalSearchProdListCnt(SearchCriteria scri) throws Exception;
		
		// 검색 게시글 목록 출력
		public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri) throws Exception;
		
		// ajax 방식으로 메인카테고리 목록 가져오기
		public List<MainCategoryVO> getMainCategories() throws Exception;
		
		
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 효원 ==============================================================================
		
		
		public Map<String, Object> readOrderList(PagingCriteria cri) throws Exception;

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
